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

        private string[] display_columns = { "序号", "项目", "业主", "家装设计师", "木作设计师" };
        /// <summary>
        /// 填充数据
        /// </summary>
        protected void FilledCurrentDataGrid() {
            UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM ORDER_FORM WHERE `ITEMS` = \"" +
                                 search_string + "\" OR `OWNERS` =\"" + search_string + "\"";
            UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns, select_string);
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            // 遍历页面找到HtmlInputText控件
            PageSection<HtmlInputText> page = new PageSection<HtmlInputText>(this.modal_body.Controls);
            
            // 遍历所有HtmlInputText控件， 填入数据
            string context = "INSERT INTO `order_form` (`";
            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    context += page.ControlsContainer[i].Name + "`, `";
                }
                else {
                    context += page.ControlsContainer[i].Name + "`) VALUES ('";
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
        protected void SubmitButton_Click() {
            UtilityEventClass.UtilitySubmitButtonClick(MySqlRequest.INSERT, create_cmd);
            FilledCurrentDataGrid();
        }

        // 按钮点击事件，创建新数据
        protected void submit_btn_Click(object sender, EventArgs e) {
            if (this.items.Value == "" || this.owners.Value == "") {
                string error = "<script>alert(\"Error: 项目和业主不能为空\");</script>";
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alert_apart", error);
                return;
            }

            SubmitButton_Click();
            string success = "<script>alert(\"项目创建成功\");</script>";
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alert_apart", success);

            FilledCurrentDataGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            UtilityEventClass.UtilityPageIndexChanging(sender, e);
            FilledCurrentDataGrid();
        }

        protected void SearchButton_Click(object sender, EventArgs e) {
            FilledCurrentDataGrid(this.search_text.Value.ToString());
        }
    }
}