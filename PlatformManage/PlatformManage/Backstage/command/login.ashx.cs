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

        public int GetSequences(string sdata) {
            Regex reg = new Regex("\"[\\d]+\"$");
            Match mat = null;
            string[] res;

            if (reg.IsMatch(sdata))
                mat = reg.Match(sdata);
            res = mat.Value.Split('\"');
            int seq = Convert.ToInt32(res[1]);

            return seq;
        }

        /// <summary>
        /// 对字段序列化返回给前端
        /// </summary>
        /// <param name="context"></param>
        /// <param name="res"></param>
        private void ResponseToClient(HttpContext context, object res) {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            context.Response.Clear();
            context.Response.Write(jsSerializer.Serialize(res));
            context.Response.End();
        }

        /// <summary>
        /// 返回响应结果
        /// </summary>
        /// <param name="context">Http数据报对象</param>
        /// <param name="udata">数据库对象</param>
        public void ResultResponse(HttpContext context, MySqlCmd.MySqlContext udata) {
            if (udata.res != 0) {
                string name = GetName(udata.context);
                string identify = CheckIdentity(udata.context);
                int sequences = GetSequences(udata.context);

                HttpCookie cookie = new HttpCookie("user_data");
                cookie["name"] = user.uname;
                cookie["identify"] = identify;
                cookie.Expires.AddHours(1.0);
                context.Response.AppendCookie(cookie);
                
                PlatformManage.User._user.Account = user.uname;
                PlatformManage.User._user.Name = name;
                PlatformManage.User._user.Identify = identify;
                PlatformManage.User._user.Sequence = sequences;
                PlatformManage.User._user.SetSelectString();

                var res = new { msg = "1", data = name };
                ResponseToClient(context, res);
            }
            else {
                var res = new { msg = "0", data = "not exists" };
                ResponseToClient(context, res);
            }
        }

        public void ProcessRequest(HttpContext context) {
            user.uname = context.Request["uname"];
            user.pwd = context.Request["password"];

            MySqlCmd.MySqlContext udata = new MySqlCmd.MySqlContext();
            try {    
                udata.conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["MySqlConnectionString"].ToString());
                udata.status = MySqlRequest.SEARCH;
                udata.create_cmd = CheckUser;
                udata.res = 0;

                MySqlCmd.LoginCommand(ref udata);
            }
            catch(Exception ex) {
                var res = new { msg = "2", data = ex.Message };
                ResponseToClient(context, res);

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