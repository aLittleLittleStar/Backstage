using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace PlatformManage.Backstage.child {
    public partial class water_settings : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {

            }
        }

        protected void Update_OrderData() {
            MySqlCmd.MySqlCmd.MySqlContext input_udata = new MySqlCmd.MySqlCmd.MySqlContext();

        }

        protected void submit_button_Click(object sender, EventArgs e) {
            if (this.origin_date.Value != "") {
                //MySqlCmd.MySqlCmd.MySqlDateConvert(this.origin_date.Value);
            }
            else {
                return;
            }
        }
    }
}