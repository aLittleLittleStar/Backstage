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
    class User2 {
        public string uname;
        public string pwd;
    }

    /// <summary>
    /// Summary description for login
    /// </summary>
    public class login : IHttpHandler {
        User2 user = new User2();

        public void CheckUser(ref MySqlCmd.MySqlContext udata) {
            udata.context = "SELECT * FROM MANAGER WHERE `account`=?account AND `password`=?password\n" +
                "UNION\n" +
                "SELECT * FROM ROOT_MANAGER WHERE `account`=?account AND `password`=?password\n" +
                "UNION\n" +
                "SELECT * FROM USER_FORM WHERE `account`=?account AND `password`=?password";
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
            Regex reg = new Regex("[(0-2)]");
            Match mat = null;
            string res;

            if (reg.IsMatch(sdata))
                mat = reg.Match(sdata);
            res = mat.Value;

            return res;
        }

        /// <summary>
        /// 获取用户姓名
        /// </summary>
        /// <param name="sdata">数据库返回的身份数据</param>
        /// <returns></returns>
        public string GetName(string sdata) {
            string[] res = sdata.Split('"');
            return res[1];
        }

        /// <summary>
        /// 返回响应结果
        /// </summary>
        /// <param name="context">Http数据报对象</param>
        /// <param name="udata">数据库对象</param>
        public void ResultResponse(HttpContext context, MySqlCmd.MySqlContext udata) {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

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
                PlatformManage.User._user.SetSelectString();

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

        public void ProcessRequest(HttpContext context) {
            user.uname = context.Request["uname"];
            user.pwd = context.Request["password"];

            MySqlCmd.MySqlContext udata = new MySqlCmd.MySqlContext();
            try {    
                udata.conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
                udata.status = MySqlRequest.SEARCH;
                udata.res = 0;
                udata.create_cmd = CheckUser;

                MySqlCmd.LoginCommand(ref udata);
            }
            catch(Exception ex) {
                JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

                var res = new { msg = "2", data = ex.Message };
                context.Response.Clear();
                context.Response.Write(jsSerializer.Serialize(res));
                context.Response.End();

                return;
            }

            ResultResponse(context, udata);
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}