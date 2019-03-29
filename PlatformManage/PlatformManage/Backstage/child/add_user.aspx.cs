using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using PlatformManage.Backstage.utils;
using PlatformManage.Backstage.MySql_utils;

namespace PlatformManage.Backstage.child
{
    public partial class add_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                FilledCurrentDataGrid();
            }
        }

        private string[] display_columns = { "序号", "账号", "姓名" };
        /// <summary>
        /// 填充数据
        /// </summary>
        protected void FilledCurrentDataGrid() {
            string select_string = "SELECT * FROM USER_FORM";
            UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns, select_string);
        }

        protected void FilledCurrentDataGrid(string search_string) {
            string select_string = "SELECT * FROM USER_FORM WHERE `account` = \"" +
                                 search_string + "\" OR `name` =\"" + search_string + "\"";
            UtilityEventClass.UtilityFilledGridViewFunction(this.GridView1, display_columns, select_string);
        }

        private void create_cmd(ref MySqlCmd.MySqlContext udata) {
            // 遍历页面找到HtmlInputText控件
            PageSection<HtmlInputText> page = new PageSection<HtmlInputText>(this.modal_body.Controls);

            // 遍历所有HtmlInputText控件， 填入数据
            string context = "INSERT INTO `USER_FORM` (`";
            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    if (page.ControlsContainer[i].Value != "" || page.ControlsContainer[i].Value != null)
                        context += page.ControlsContainer[i].Name + "`, `";
                }
                else {
                    if (page.ControlsContainer[i].Value != "" || page.ControlsContainer[i].Value != null)
                        context += page.ControlsContainer[i].Name + "`) VALUES ('";
                    break;
                }
            }

            for (int i = 0; i < page.ControlsContainer.Count; i++) {
                if (i < page.ControlsContainer.Count - 1) {
                    if (page.ControlsContainer[i].Value != "" || page.ControlsContainer[i].Value != null)
                        context += page.ControlsContainer[i].Value + "', '";
                }
                else {
                    if (page.ControlsContainer[i].Value != "" || page.ControlsContainer[i].Value != null)
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

        private void Verify_Length() {
            if (this.account.Value.Length > 10) this.account.Value = this.account.Value.Substring(0, 9);
            if (this.name.Value.Length > 10) this.name.Value = this.name.Value.Substring(0, 9);
        }

        // 按钮点击事件，创建新数据
        protected void submit_btn_Click(object sender, EventArgs e) {
            if (this.account.Value == "" || this.name.Value == "") {
                string error = "<script>alert(\"Error: 账号和姓名不能为空\");</script>";
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alert_apart", error);
                return;
            }
            Verify_Length();

            SubmitButton_Click();
            string success = "<script>alert(\"用户添加成功\");</script>";
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