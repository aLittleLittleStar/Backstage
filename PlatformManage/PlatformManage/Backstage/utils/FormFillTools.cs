using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using PlatformManage.Backstage.MySql_utils;

namespace PlatformManage.Backstage.utils {
    public class FormFillTools {
        private static FormFillTools instance;
        public static FormFillTools Instance {
            get {
                if (instance != null)
                    return instance;
                else {
                    instance = new FormFillTools();
                    return instance;
                }
            }
        }

        /// <summary>
        /// 填充表格
        /// </summary>
        /// <param name="select_string">数据库SELECT命令</param>
        /// /// <returns>view_dt应返回给一个用户自定义的全局DataTable</returns>
        public static void FilledCurrentForm(string connect_string, string select_string, ref MySqlCmd.MySqlAdapter adapter) {
            MySqlConnection conn = MySqlCmd.Connection(connect_string);
            MySqlCmd.SetMySqlDataAdapter(select_string, conn, ref adapter, Instance.Fill_Form);
        }

        /// <summary>
        /// 填充数据表，返回一个新的DataTable;
        /// </summary>
        /// <param name="uadapter">MySql_Utils下的工具数据类型</param>
        private void Fill_Form(ref MySqlCmd.MySqlAdapter uadapter) {
            try {
                DataSet ds = new DataSet();
                uadapter.adapter.Fill(ds, "order_form");

                DataTable dt = ds.Tables["order_form"];
                DataTable view_dt = new DataTable();

                for (int i = 0; i < uadapter.columns.Length; i++)
                    view_dt.Columns.Add(uadapter.columns[i]);

                DataRow new_row = null;
                foreach (DataRow row in dt.Rows) {
                    new_row = view_dt.NewRow();
                    for (int i = 0; i < uadapter.columns.Length; i++)
                        new_row[i] = row[uadapter.columns[i]];

                    view_dt.Rows.Add(new_row);
                }

                uadapter.grid_view.DataSource = view_dt;
                uadapter.grid_view.DataBind();
                uadapter.data_table = view_dt;
            }
            catch(Exception ex) {
                return;
            }
        }
    }
}