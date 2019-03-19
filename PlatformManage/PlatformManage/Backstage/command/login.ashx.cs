using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using PlatformManage.Backstage.MySql_utils;

namespace PlatformManage.Backstage.cmd {
    class User {
        public string uname;
        public string pwd;
    }

    /// <summary>
    /// Summary description for login
    /// </summary>
    public class login : IHttpHandler {
        User user = new User();

        public void CheckUser(ref MySqlCmd.MySqlContext udata) {
            udata.context = "SELECT * FROM MANAGER WHERE `账号`=?account AND `密码`=?password\n" +
                "UNION\n" +
                "SELECT * FROM ROOT_MANAGER WHERE `账号`=?account AND `密码`=?password\n" +
                "UNION\n" +
                "SELECT * FROM USER_FORM WHERE `账号`=?account AND `密码`=?password";
            udata.comm = new MySqlCommand(udata.context, udata.conn);
            udata.comm.Parameters.AddWithValue("account", user.uname);
            udata.comm.Parameters.AddWithValue("password", user.pwd);
        }

        /// <summary>
        /// 检查用户身份
        /// </summary>
        /// <param name="sdata">由数据库返回出的身份数据</param>
        /// <returns></returns>
        public string CheckIdentity(string sdata) {
            Regex reg = new Regex("\"[(a-z)|(\u4e00-\u9fa5)]+\";");
            string[] res = new string[5];
            if (reg.IsMatch(sdata)) {
                res = reg.Replace(sdata, new MatchEvaluator(ResultConvert)).Split('"');
            }
            return res[0];
        }

        public string GetName(string sdata) {
            string[] res = sdata.Split('"');
            return res[3];
        }

        public string ResultConvert(Match match) {
            string res = match.Value;
            if (res != "") {
                res = res.Substring(1, res.Length - 3);
            }
            return res;
        }

        public void ProcessRequest(HttpContext context) {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

            user.uname = context.Request["uname"];
            user.pwd = context.Request["password"];

            MySqlCmd.MySqlContext udata = new MySqlCmd.MySqlContext();
            udata.conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            udata.status = MySqlRequest.SEARCH;
            udata.res = 0;
            udata.create_cmd = CheckUser;

            MySqlCmd.LoginCommand(ref udata);
            
            if (udata.res != 0) {
                string name = GetName(udata.context);
                string identify = CheckIdentity(udata.context);

                HttpCookie cookie = new HttpCookie("user_data");
                cookie["name"] = user.uname;
                cookie["identify"] = identify;
                cookie.Expires.AddHours(1.0);
                context.Response.AppendCookie(cookie);
                
                var res = new { msg = "1", data = name };
                
                PlatformManage.User._user.User_Account = user.uname;
                PlatformManage.User._user.User_Name = name;
                PlatformManage.User._user.Identify = identify;

                context.Response.Clear();
                context.Response.Write(jsSerializer.Serialize(res));
                context.Response.End();
            }
            else {
                var res = new { msg = "0", data = "not exists" };
                context.Response.Clear();
                context.Response.Write(jsSerializer.Serialize(res));
                context.Response.End();
            }
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}