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
        private string[] contract_column = { "序号", "项目", "业主", "备注" };
        private void Fill_Form(MySqlDataAdapter adapter) {
            DataSet ds = new DataSet();
            adapter.Fill(ds, "order_form");

            DataTable dt = ds.Tables["order_form"];
            DataTable view_dt = new DataTable();

            for (int i = 0; i < contract_column.Length; i++) {
                view_dt.Columns.Add(contract_column[i]);
            }

            DataRow new_row = null;
            foreach (DataRow row in dt.Rows) {
                new_row = view_dt.NewRow();
                for (int i = 0; i < contract_column.Length; i++) {
                    new_row[i] = row[contract_column[i]];
                }
                view_dt.Rows.Add(new_row);
            }

            g_dt = view_dt;
            this.GridView1.DataSource = view_dt;
            this.GridView1.DataBind();
        }

        protected void FilledCurrentDataGrid() {
            MySqlConnection conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_string = "SELECT * FROM ORDER_FORM";
            MySqlCmd.SetMySqlDataAdapter(select_string, conn, Fill_Form);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            MySqlConnection conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_string = "SELECT * FROM ORDER_FORM WHERE `" + Database.convert_columns_name("item") + "` = \"" +
                                   search_string + "\" OR `" + Database.convert_columns_name("owner") + "` =\"" + search_string + "\"";
            MySqlCmd.SetMySqlDataAdapter(select_string, conn, Fill_Form);
        }

        private static int page_count = 0;
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            this.GridView1.PageIndex = e.NewPageIndex;
            page_count = e.NewPageIndex;
            FilledCurrentDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            udata.context = "UPDATE ORDER_FORM SET `" + Database.convert_columns_name(this.contract_comment.ID)
                            + "`=\"" + this.contract_comment.Value + "\" WHERE `序号`=\"" + this.number.Value + "\"";
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
            this.item.Value = g_dt.Rows[count].ItemArray[1].ToString();
            this.owner.Value = g_dt.Rows[count].ItemArray[2].ToString();
            this.contract_comment.Value = g_dt.Rows[count].ItemArray[3].ToString();
        }
    }
}