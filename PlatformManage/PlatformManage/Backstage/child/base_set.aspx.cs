using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using PlatformManage.Backstage.utils;
using PlatformManage.Backstage.MySql_utils;
using System.Data;
using MySql.Data.MySqlClient;

namespace PlatformManage.Backstage.child {
    public partial class base_set : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FilledCurrentDataGrid();
            }
        }

        private string[] base_set_column = { "序号", "项目", "业主", "家装设计师", "木作设计师" };
        private void Fill_Form(MySqlDataAdapter adapter) {
            DataSet ds = new DataSet();
            adapter.Fill(ds, "order_form");

            DataTable dt = ds.Tables["order_form"];
            DataTable view_dt = new DataTable("order_form_view");

            for (int i = 0; i < base_set_column.Length; i++) {
                view_dt.Columns.Add(base_set_column[i]);
            }

            // 把5列的数据加入到数据表
            DataRow new_row = null;
            foreach(DataRow row in dt.Rows) {
                new_row = view_dt.NewRow();
                for (int i = 0; i < base_set_column.Length; i++) {
                    new_row[i] = row[base_set_column[i]];
                }
                view_dt.Rows.Add(new_row);
            }

            this.GridView1.DataSource = view_dt;
            this.GridView1.DataBind();
        }
        
        /// <summary>
        /// 填充数据
        /// </summary>
        protected void FilledCurrentDataGrid() {
            MySqlConnection conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_str = "SELECT * FROM ORDER_FORM";
            MySqlCmd.SetMySqlDataAdapter(select_str, conn, Fill_Form);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            MySqlConnection conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_str = "SELECT * FROM ORDER_FORM WHERE `" + Database.convert_columns_name("item") + "` = \"" +
                                 search_string + "\" OR `" + Database.convert_columns_name("owner") + "` =\"" + search_string + "\"";
            MySqlCmd.SetMySqlDataAdapter(select_str, conn, Fill_Form);
        }

        private void Create_Cmd(ref MySqlCmd.MySqlContext udata) {
            // 遍历页面找到HtmlInputText控件
            PageSection<HtmlInputText> page = new PageSection<HtmlInputText>(this.modal_body.Controls);
            
            // 遍历所有HtmlInputText控件， 填入数据
            string context = "INSERT INTO `ORDER_FORM` (`";
            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    context += Database.convert_columns_name(page.ControlsContainer[i].Name) + "`, `";
                }
                else {
                    context += Database.convert_columns_name(page.ControlsContainer[i].Name) + "`) VALUES ('";
                    break;
                }
            }

            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    context += page.ControlsContainer[i].Value + "', '";
                }
                else {
                    context += page.ControlsContainer[i].Value + "');";
                    break;
                }
            }
            udata.context = context;
        }

        // 上传用户填写的表格数据
        private void Upload_UserData() {
            MySqlCmd.MySqlContext input_udata = new MySqlCmd.MySqlContext();
            input_udata.conn = MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            input_udata.status = MySqlRequest.INSERT;
            input_udata.res = 0;
            input_udata.create_cmd = Create_Cmd;

            MySqlCmd.SetMySqlCommand(ref input_udata);
        }
        
        // 按钮点击事件，创建新数据
        protected void submit_btn_Click(object sender, EventArgs e) {
            if (this.item.Value == "" || this.owner.Value == "") {
                string error = "<script>alert(\"Error: 项目和业主不能为空\");</script>";
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alert_apart", error);
                return;
            }

            Upload_UserData();
            string success = "<script>alert(\"项目创建成功\");</script>";
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alert_apart", success);

            FilledCurrentDataGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            this.GridView1.PageIndex = e.NewPageIndex;
            FilledCurrentDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }
    }
}