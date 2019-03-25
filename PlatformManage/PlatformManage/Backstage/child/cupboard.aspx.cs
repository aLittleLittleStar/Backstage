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
    public partial class cupboard : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FilledCurrentDataGrid();
            }
        }

        private static DataTable g_dt = null;
        private string[] other_cabinet_column = { "序号", "合同编号", "项目", "业主", "橱柜预定安装日期", "橱柜下单时间", "台面", "橱柜门板" };
        protected void FilledCurrentDataGrid() {
            string select_string = PlatformManage.User._user.Select_string;

            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = other_cabinet_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
            g_dt = adapter.data_table;
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `ITEMS` = \"" +
                                   search_string + "\" OR `OWNERS` =\"" + search_string
                                   + "\" OR `CONTRACT_NUMBERS` =\"" + search_string + "\"";
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
            udata.context = "UPDATE ORDER_FORM SET `BOARD_RESERVE_TIME"
                            + "`=\"" + this.board_reserve_time.Value
                            + "\", `BOARD_ORDER_TIME"
                            + "`=\"" + this.board_order_time.Value
                            + "\", `TABLE_BOARD"
                            + "`=\"" + this.table_board.Value
                            + "\", `BOARD_DOOR_TABLE"
                            + "`=\"" + this.board_door_table.Value
                            + "\" WHERE `SEQUENCES`=\"" + this.sequences.Value + "\"";
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
            this.sequences.Value = g_dt.Rows[count].ItemArray[0].ToString();
            this.items.Value = g_dt.Rows[count].ItemArray[2].ToString();
            this.owners.Value = g_dt.Rows[count].ItemArray[3].ToString();
        }
    }
}