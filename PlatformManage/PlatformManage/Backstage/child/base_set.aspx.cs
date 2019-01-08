using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using PlatformManage.Backstage.utils;
using System.Data;
using MySql.Data.MySqlClient;

namespace PlatformManage.Backstage.child {
    public partial class base_set : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FilledDataGrid();
            }
        }
        
        private void Fill_Form(MySqlDataAdapter adapter) {
            DataSet ds = new DataSet();
            adapter.Fill(ds, "order_form");

            DataTable dt = ds.Tables["order_form"];
            DataTable dt_view = new DataTable("order_form_view");

            dt_view.Columns.Add(dt.Columns[0].ToString(), typeof(string));
            for (int i = 2; i <= 5; i++) {
                dt_view.Columns.Add(dt.Columns[i].ToString(), typeof(string));
            }

            // 把2-5列的数据加入到数据表
            DataRow new_row = null;
            foreach(DataRow row in dt.Rows) {
                new_row = dt_view.NewRow();
                new_row[0] = row[dt.Columns[0].ToString()];
                int j = 1;
                for (int i = 2; i <= 5; i++) {
                    new_row[j++] = row[dt.Columns[i].ToString()];
                }
                dt_view.Rows.Add(new_row);
            }

            this.GridView1.DataSource = dt_view;
            this.GridView1.DataBind();
        }
        
        /// <summary>
        /// 填充数据
        /// </summary>
        protected void FilledDataGrid() {
            MySqlConnection conn = MySqlCmd.MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_str = "SELECT * FROM ORDER_FORM";

            MySqlCmd.MySqlCmd.SetMySqlDataAdapter(select_str, conn, Fill_Form);
        }

        protected void FilledDataGrid(string search_string) {
            MySqlConnection conn = MySqlCmd.MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            string select_str = "SELECT * FROM ORDER_FORM WHERE `" + convert_columns_name("item") + "` = \"" +
                                 search_string + "\" OR `" + convert_columns_name("owner") + "` =\"" + search_string + "\"";

            MySqlCmd.MySqlCmd.SetMySqlDataAdapter(select_str, conn, Fill_Form);
        }

        /// <summary>
        /// 转换当前控件中的Name为数据库中的列名
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        private string convert_columns_name(string name) {
            string convert_str = null;
            switch (name) {
            case "item": {
                convert_str = "项目";
            }break;
            case "owner": {
                convert_str = "业主";
            }break;
            case "home_style_designer": {
                convert_str = "家装设计师";
            }break;
            case "wooden_style_designer": {
                convert_str = "木作设计师";
            }break;
            default: {
                convert_str = null;
            }break;
            }
            return convert_str;
        }
        
        private void Create_Cmd(ref MySqlCmd.MySqlCmd.MySqlContext udata) {
            // 遍历页面找到HtmlInputText控件
            PageSection<HtmlInputText> page = new PageSection<HtmlInputText>(this.modal_body.Controls);
            
            // 遍历所有HtmlInputText控件， 填入数据
            string context = "INSERT INTO `order_form` (`";
            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    context += convert_columns_name(page.ControlsContainer[i].Name) + "`, `";
                }
                else {
                    context += convert_columns_name(page.ControlsContainer[i].Name) + "`) VALUES ('";
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
            MySqlCmd.MySqlCmd.MySqlContext input_udata = new MySqlCmd.MySqlCmd.MySqlContext();
            input_udata.conn = MySqlCmd.MySqlCmd.Connection(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString());
            input_udata.status = MySqlCmd.MySqlRequest.INSERT;
            input_udata.res = 0;
            input_udata.create_cmd = Create_Cmd;

            MySqlCmd.MySqlCmd.SetMySqlCommand(ref input_udata);
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

            FilledDataGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            this.GridView1.PageIndex = e.NewPageIndex;
            FilledDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledDataGrid(this.search_text.Value.ToString());
        }
    }
}