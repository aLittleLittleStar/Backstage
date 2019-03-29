using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using PlatformManage.Backstage.MySql_utils;
using PlatformManage.Backstage.utils;

namespace PlatformManage.Backstage.child {
    public partial class cabinet_body : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FilledCurrentDataGrid();
            }
        }

        private static DataTable g_dt = null;
        private string[] display_columns = { "序号", "项目", "业主", "其他柜体" };
        protected void FilledCurrentDataGrid() {
            g_dt = UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `ITEMS` = \"" +
                                   search_string + "\" OR `OWNERS` =\"" + search_string + "\"";
            g_dt = UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns, select_string);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            UtilityEventClass.UtilityPageIndexChanging(sender, e);
            FilledCurrentDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            udata.context = "UPDATE ORDER_FORM SET `" + this.other_cabinet.ID
                            + "`=\"" + this.other_cabinet.Value + "\" WHERE `SEQUENCES`=\""
                            + this.sequences.Value + "\"";
        }

        protected void SubmitButton_Click(object sender, EventArgs e) {
            UtilityEventClass.UtilitySubmitButtonClick(MySqlRequest.UPDATE, create_cmd);
            FilledCurrentDataGrid();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e) {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "<script>document.getElementById(\"ShowButton\").click()</script>");
            int count = UtilityEventClass.UtilitySelectedIndexChanging(sender, e);

            this.sequences.Value = g_dt.Rows[count].ItemArray[0].ToString();
            this.contract_numbers.Value = g_dt.Rows[count].ItemArray[1].ToString();
            this.items.Value = g_dt.Rows[count].ItemArray[2].ToString();
            this.other_cabinet.Value = g_dt.Rows[count].ItemArray[3].ToString();
        }
    }
}