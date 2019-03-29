using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;

namespace PlatformManage {
    class User {
        private static User user;
        public static User _user {
            get {
                if (user != null)
                    return user;
                else {
                    user = new User();
                    return user;
                }   
            }
        }

        private int sequence;
        public int Sequence {
            get { return sequence; }
            set { sequence = value; }
        }

        private string user_account;
        public String Account {
            get { return user_account; }
            set { user_account = value; }
        }

        private string identify;
        public String Identify {
            get { return identify; }
            set { identify = value; }
        }

        private string user_name;
        public String Name {
            get { return user_name; }
            set { user_name = value; }
        }

        private string select_string;
        public String Select_string {
            get { return select_string; }
        }

        /// <summary>
        /// 查询项目表
        /// </summary>
        public void SetSelectString() {
            string select_string = "SELECT * FROM ORDER_FORM";
            if (this.identify != null && this.sequence != 0) {
                if (this.identify.Equals("2"))
                    select_string += " WHERE `SEQUENCES`=" + "\"" + this.sequence + "\"";
            }

            this.select_string = select_string;
        }
    };

    public class Global : System.Web.HttpApplication {

        protected void Application_Start(object sender, EventArgs e) {

        }

        protected void Session_Start(object sender, EventArgs e) {

        }

        protected void Application_BeginRequest(object sender, EventArgs e) {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) {

        }

        protected void Application_Error(object sender, EventArgs e) {

        }

        protected void Session_End(object sender, EventArgs e) {

        }

        protected void Application_End(object sender, EventArgs e) {

        }
    }
}