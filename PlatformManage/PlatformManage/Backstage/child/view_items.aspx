<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_items.aspx.cs" Inherits="PlatformManage.Backstage.child.view_items" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看项目</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/child.css" />
    <style>
        #userList {
            padding-top: 0px;
        }
        .page-header {
            margin-left: 110px;
            margin-right: 110px;
        }
        .container{
            overflow: auto;
        }
        .content {
            width: 2000px;
        }
    </style>

</head>
<body>
    <form id="view_items" runat="server">
        <section id="userList">
        <div class="page-header">
            <h1>查看项目</h1>
        </div>
        <div class="container">
            <div class="content">
                <!-- 添加控件 -->
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <PagerTemplate>
                            <asp:Label ID="lblPage" CssClass="PagerFont" runat="server" Text='<%# "第" + (((GridView)Container.NamingContainer).PageIndex + 1)  + "页/共" + (((GridView)Container.NamingContainer).PageCount) + "页" %> '></asp:Label>
                            <asp:LinkButton ID="lbnFirst" CssClass="PagerFont" runat="Server" Text="首页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="First"></asp:LinkButton>
                            <asp:LinkButton ID="lbnPrev" CssClass="PagerFont" runat="server" Text="上一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="Prev"></asp:LinkButton>
                            <asp:LinkButton ID="lbnNext" CssClass="PagerFont" runat="Server" Text="下一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Next"></asp:LinkButton>
                            <asp:LinkButton ID="lbnLast" CssClass="PagerFont" runat="Server" Text="尾页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Last"></asp:LinkButton>
                            <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>" Width="20px"></asp:TextBox>
                            <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-1" CommandName="Page" Text="跳转"></asp:LinkButton>
                        </PagerTemplate>
                </asp:GridView>
            </div>
        </div>
    </section>

    <!-- deleteModal -->
    <div class="modal fade" id="deleteUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">删除用户信息</h3>
                </div>
                <div class="modal-body">
                    <p>您确认要删除该项目吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-default"
                            data-dismiss="modal">
                        取消
                    </button>
                    <button type="button"
                            class="btn btn-primary"
                            id="deleteHaulBtn">
                        确认
                    </button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script>
        var savetemp = localStorage.getItem("tempspop");
        console.log("savetemp:", savetemp);
        var lastth = $("thead tr").children("th")[20];
        var lasttd = $("tbody tr").children("td")[20];
        var lasettr = $("tbody").children();
        var lasttrlength = $("tbody").children("tr").length;
        console.log("lasttrlength:", lasttrlength);
        if (savetemp == 2) {
            $(".hidechild").hide();
            $(".secondItemHide").hide();
            lastth.style = "display: none"
            for (var i = 0; i < lasttrlength; i++) {
                $("tbody").children()[i].children[20].style = "display: none"
                // console.log("lasettr.children[i]:", $("tbody").children()[i].children[20])
            }
        }
    </script>
</body>
</html>