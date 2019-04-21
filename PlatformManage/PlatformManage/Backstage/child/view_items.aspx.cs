using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using PlatformManage.Backstage.MySql_utils;
using PlatformManage.Backstage.utils;

namespace PlatformManage.Backstage.child
{
    public partial class view_items : System.Web.UI.Page
    {
        private string[] display_columns = { "序号", "合同编号", "项目", "业主", "家装设计师", "木作设计师", "初测", "水电", "预定安装日期", "橱柜预定安装日期", "橱柜下单时间", "台面", "橱柜门板", "衣柜预定安装日期", "衣柜下单时间", "其他柜体", "水槽、电器", "五金配件", "合同确定时间", "实际安装时间", "安装遗留问题", "备注" };
        private static DataTable g_dt = null;
        private static int sequences = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            FilledCurrentDataGrid();
        }
        
        protected void FilledCurrentDataGrid() {
            g_dt = UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns);
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            UtilityEventClass.UtilityPageIndexChanging(sender, e);
            FilledCurrentDataGrid();
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            udata.context = "DELETE FROM `user_form` WHERE user_form.sequences =\"" + sequences + "\";"
                            + "DELETE FROM `order_form` WHERE `SEQUENCES`=\"" + sequences + "\";"
                            + "ALTER TABLE order_form AUTO_INCREMENT=1";
        }

        protected void SubmitButton_Click(object sender, EventArgs e) {
            UtilityEventClass.UtilitySubmitButtonClick(MySqlRequest.DELETE, create_cmd);
            FilledCurrentDataGrid();
        }
        
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e) {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "<script>document.getElementById(\"ShowButton\").click()</script>");
            int count = UtilityEventClass.UtilitySelectedIndexChanging(sender, e);

            sequences = Convert.ToInt32(g_dt.Rows[count].ItemArray[0].ToString());
        }
    }
}
