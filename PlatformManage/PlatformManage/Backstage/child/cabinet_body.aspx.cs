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
        private string[] other_cabinet_column = { "序号", "项目", "业主", "其他柜体" };
        protected void FilledCurrentDataGrid() {
            string select_string = "SELECT * FROM ORDER_FORM";
            if (PlatformManage.User._user.Identify != null && PlatformManage.User._user.Identify.Equals("业主"))
                select_string += " WHERE `业主`=" + "\"" + PlatformManage.User._user.User_Name + "\"";
            else
                return;

            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = other_cabinet_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
            g_dt = adapter.data_table;
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `" + Database.convert_columns_name("item") + "` = \"" +
                                   search_string + "\" OR `" + Database.convert_columns_name("owner") + "` =\"" + search_string + "\"";
            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = other_cabinet_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
            g_dt = adapter.data_table;
        }

        private static int page_count = 0;
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            if (e.NewPageIndex == -2) {
                TextBox txtBox = this.GridView1.BottomPagerRow.FindControl("txtNewPageIndex") as TextBox;
                int txtPageIndex = Math.Abs(int.Parse(txtBox.Text.Trim()));
                if (txtPageIndex > 0) {
                    this.GridView1.PageIndex = txtPageIndex - 1;
                }
                else {
                    this.GridView1.PageIndex = 0;
                }
            }
            else {
                this.GridView1.PageIndex = e.NewPageIndex;
            }
            page_count = this.GridView1.PageIndex;
            FilledCurrentDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            udata.context = "UPDATE ORDER_FORM SET `" + Database.convert_columns_name(this.other_cabinet.ID)
                            + "`=\"" + this.other_cabinet.Value + "\" WHERE `序号`=\"" + this.number.Value + "\"";
        }

        protected void SubmitButton_Click(object sender, EventArgs e) {
            MySqlCmd.MySqlContext input_udata = new MySqlCmd.MySqlContext();
            input_udata.conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            input_udata.status = MySqlRequest.UPDATE;
            input_udata.create_cmd = create_cmd;

            MySqlCmd.SetMySqlCommand(ref input_udata);
            FilledCurrentDataGrid();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e) {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "<script>document.getElementById(\"ShowButton\").click()</script>");

            int count = e.NewSelectedIndex + 7 * page_count;
            this.number.Value = g_dt.Rows[count].ItemArray[0].ToString();
            this.confirm_number.Value = g_dt.Rows[count].ItemArray[1].ToString();
            this.item.Value = g_dt.Rows[count].ItemArray[2].ToString();
            this.other_cabinet.Value = g_dt.Rows[count].ItemArray[3].ToString();
        }
    }
}