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
    public partial class search : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        private static DataTable g_dt = null;
        private string[] other_cabinet_column = { "序号", "合同编号", "项目", "业主", "合同确定时间", "实际安装时间", "安装遗留问题", "备注" };
        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `" + Database.convert_columns_name("item") + "` = \"" +
                                   search_string.Trim() + "\" OR `" + Database.convert_columns_name("owner") + "` =\"" + search_string.Trim()
                                   + "\" OR `" + Database.convert_columns_name("confirm_number") + "` =\"" + search_string.Trim() + "\"";
            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = other_cabinet_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
            g_dt = adapter.data_table;
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }

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
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }
    }
}