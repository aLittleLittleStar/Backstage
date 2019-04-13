<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_user.aspx.cs" Inherits="PlatformManage.Backstage.child.add_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>添加用户</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/base.css" />
</head>
<body>
    <form id="add_user" runat="server">
       <section id="userList">
        <div class="container">
            <div class="nav">
                <div class="btn btn-primary btn"
                     data-toggle="modal"
                     data-target="#addUser"
                     style="margin-top: 8px">
                    <span class="glyphicon glyphicon-plus"></span>
                    添加用户
                </div>
                <div class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input id="search_text" name="search_text" type="text" class="form-control" placeholder="请输入账号或姓名" runat="server"/>
                        <asp:Button ID="SearchButton" Text="查询" CssClass="btn btn-primary btn-sm glyphicon glyphicon-search" runat="server" OnClick="SearchButton_Click" />
                    </div>
                </div>
            </div>
            <!-- 添加控件 -->
            <div id="data_grid_form">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerSettings PageButtonCount="5" />
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


        <!-- 弹出层 -->
    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="setProject">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">添加用户</h3>
                </div>
                <div class="modal-body" id="modal_body" runat="server">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="account" name="account" placeholder="账号" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="姓名" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="firstname" placeholder="密码" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="lastname" placeholder="确认密码" runat="server"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <asp:Button ID="submit_btn" Text="立即创建" CssClass="btn btn-primary" OnClick="submit_btn_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>