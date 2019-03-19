<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="base_set.aspx.cs" Inherits="PlatformManage.Backstage.child.base_set" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>基础设置</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/base.css" />
</head>
<body>
    <form class="form-horizontal" role="form" runat="server" method="post">
        <section id="userList">
            <div class="container">
                <div class="nav">
                    <div
                        class="btn btn-primary btn"
                        data-toggle="modal"
                        data-target="#setProject"
                        style="margin-top: 8px">
                        <span class="glyphicon glyphicon-plus"></span>
                        创建项目
                    </div>
                    <div class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input id="search_text" name="search_text" type="text" class="form-control" placeholder="请输入项目名或业主" runat="server" />
                            <asp:Button ID="SearchButton" Text="查询" CssClass="btn btn-primary btn-sm glyphicon glyphicon-search" runat="server" OnClick="SearchButton_Click" />
                        </div>
                    </div>
                </div>
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
            <div class="container">
                <ul class="pagination" id="pagination">
                </ul>
                <input type="hidden" id="PageCount" runat="server" />
                <input type="hidden" id="PageSize" runat="server" value="8" />
                <input type="hidden" id="countindex" runat="server" value="10" />
                <!--设置最多显示的页码数 可以手动设置 默认为7-->
                <input type="hidden" id="visiblePages" runat="server" value="7" />
            </div>
        </section>


        <div class="modal fade" id="setProject" tabindex="-1" role="dialog" aria-labelledby="setProject">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">创建项目</h3>
                    </div>
                    <div class="modal-body" id="modal_body" runat="server">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">项目</label>
                            <div class="col-sm-10">
                                <input id="item" name="item" type="text" class="form-control" placeholder="项目名" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">业主</label>
                            <div class="col-sm-10">
                                <input id="owner" name="owner" type="text" class="form-control" placeholder="业主" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">家装设计师</label>
                            <div class="col-sm-10">
                                <input id="home_style_designer" name="home_style_designer" type="text" class="form-control" placeholder="家装设计师" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
                            <div class="col-sm-10">
                                <input id="wooden_style_designer" name="wooden_style_designer" type="text" class="form-control" placeholder="木作设计师" runat="server" />
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
