using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using PlatformManage.Backstage.MySql_utils;
using PlatformManage.Backstage.utils;
using System.Web.Configuration;

namespace PlatformManage.Backstage.child {
    public partial class contract_confirm : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FilledCurrentDataGrid();
            }
        }

        private static DataTable g_dt = null;
        private string[] contract_column = { "序号", "合同编号", "项目", "业主", "合同确认","合同编号" };
        protected void FilledCurrentDataGrid() {
            string select_string = PlatformManage.User._user.Select_string;

            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = contract_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
            g_dt = adapter.data_table;
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `ITEMS` = \"" +
                                   search_string + "\" OR `OWNERS` =\"" + search_string + "\"";
            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = contract_column;
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

        /// <summary>
        /// 自动生成项目编号
        /// </summary>
        /// <param name="number">项目序号</param>
        /// <returns></returns>
        private string create_contract_code(string number) {
            return "YS-" + DateTime.Today.Year + "-" + DateTime.Today.Month + "-" + DateTime.Today.Day + "-" + number;
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            udata.context = "UPDATE ORDER_FORM SET `CONTRACT_NUMBERS`=\"" + create_contract_code(this.sequences.Value)
                            + "\", `CONTRACT_AFFIRM"
                            + "`=\"" + this.contract_affirm.Value
                            + "\", `CONTRACT_AFFIRM_TIME`=\""
                            + DateTime.Now + "\" WHERE `SEQUENCES`=\"" + this.sequences.Value + "\"";
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
            this.contract_affirm.Value = g_dt.Rows[count].ItemArray[4].ToString();
        }
    }
}