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

        public static DataTable g_dt = null;
        private string[] display_columns = { "序号", "合同编号", "项目", "业主", "家装设计师", "木作设计师", "初测", "水电", "预定安装日期", "橱柜预定安装日期", "橱柜下单时间", "台面", "橱柜门板", "衣柜预定安装日期", "衣柜下单时间", "其他柜体", "水槽、电器", "五金配件", "合同确定时间", "实际安装时间", "安装遗留问题", "备注" };
        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `ITEMS` = \"" +
                                   search_string.Trim() + "\" OR `OWNERS` =\"" + search_string.Trim()
                                   + "\" OR `CONTRACT_NUMBERS` =\"" + search_string.Trim() + "\"";
            g_dt = UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns, select_string);
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            UtilityEventClass.UtilityPageIndexChanging(sender, e);
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }
    }
}