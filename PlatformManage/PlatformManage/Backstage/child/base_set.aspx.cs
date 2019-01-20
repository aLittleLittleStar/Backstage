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
        /// <summary>
        /// 填充数据
        /// </summary>
        protected void FilledCurrentDataGrid() {
            string select_string = "SELECT * FROM ORDER_FORM";
            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = base_set_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `" + Database.convert_columns_name("item") + "` = \"" +
                                 search_string + "\" OR `" + Database.convert_columns_name("owner") + "` =\"" + search_string + "\"";
            MySqlCmd.MySqlAdapter adapter = new MySqlCmd.MySqlAdapter();
            adapter.grid_view = this.GridView1;
            adapter.columns = base_set_column;
            FormFillTools.FilledCurrentForm(WebConfigurationManager.ConnectionStrings["senshang_database_connection_string"].ToString(),
                                            select_string, ref adapter);
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