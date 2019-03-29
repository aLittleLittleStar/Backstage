using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using PlatformManage.Backstage.MySql_utils;
using PlatformManage.Backstage.utils;

/// <summary>
/// 这是一个被设计为某些统一类型的方法的集合, 它提供了这些方法的统一模板.
/// 当有一些页面中有方法调用相同时, 请在这个类中添加方法进行调用, 减少代码的重复.
/// </summary>
namespace PlatformManage.Backstage.utils {
    public class UtilityEventClass {
        private static int page_count = 0;

        /// <summary>
        /// 此方法提供了一个统一的填充DataGridView对象的实现模板
        /// </summary>
        /// <param name="select_string">调用的MySql select syntax</param>
        /// <param name="grid_view">需要填充的GridView对象</param>
        /// <param name="columns">填充时构造的数据列名</param>
        /// <returns>返回一个DataTable对象</returns>
        public static DataTable UtilityFilledGridViewFunction (GridView grid_view, string[] columns, string select_string = null) {
            string select = null;
            if (select_string == null)
                select = PlatformManage.User._user.Select_string;
            else
                select = select_string;

            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter ();
            adapter.grid_view = grid_view;
            adapter.columns = columns;
            FormFillTools.FilledCurrentForm (WebConfigurationManager.ConnectionStrings["MySqlConnectionString"].ToString (),
                select, ref adapter);

            return adapter.data_table;
        }

        /// <summary>
        /// 此方法提供了一个统一的页面翻页效果实现模板
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void UtilityPageIndexChanging (object sender, GridViewPageEventArgs e) {
            GridView grid_view = (GridView) sender;
            if (e.NewPageIndex == -2) {
                TextBox txtBox = grid_view.BottomPagerRow.FindControl ("txtNewPageIndex") as TextBox;
                int txtPageIndex = Math.Abs (int.Parse (txtBox.Text.Trim ()));
                if (txtPageIndex > 0) {
                    grid_view.PageIndex = txtPageIndex - 1;
                } else {
                    grid_view.PageIndex = 0;
                }
            } else {
                grid_view.PageIndex = e.NewPageIndex;
            }
            page_count = grid_view.PageIndex;
        }

        /// <summary>
        /// 此方法提供了一个统一的选中行的实现模板
        /// 默认当前表格为7行数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <returns>选中的行数</returns>
        public static int UtilitySelectedIndexChanging (object sender, GridViewSelectEventArgs e) {
            return e.NewSelectedIndex + 7 * page_count;
        }

        /// <summary>
        /// 此方法提供了一个统一的提交按钮的实现模板
        /// </summary>
        /// <param name="create_cmd">自定义命令</param>
        public static void UtilitySubmitButtonClick (MySqlRequest req_type, MySqlCmd.CreateCommand create_cmd) {
            MySqlCmd.MySqlContext input_udata = new MySqlCmd.MySqlContext ();
            input_udata.conn = MySqlCmd.Connection (WebConfigurationManager.ConnectionStrings["MySqlConnectionString"].ToString ());
            input_udata.status = req_type;
            input_udata.create_cmd = create_cmd;
            input_udata.res = 0;

            MySqlCmd.SetMySqlCommand (ref input_udata);
        }
    }
}