﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="get_ready.aspx.cs" Inherits="PlatformManage.Backstage.child.get_ready" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>项目准备</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datetimepicker.min.js"></script>
    <script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../js/jqPaginator.js"></script>
    <link rel="stylesheet" href="../css/item.css" />
</head>
<body>
    <form id="form1" runat="server">
        <section id="userList">
            <div class="container">
                <div class="form-group">
                    <input id="search_text" name="search_text" type="text" class="form-control" placeholder="请输入合同编号或项目名或业主" runat="server" />
                    <asp:Button ID="SearchButton" Text="查询" CssClass="btn btn-primary btn-sm glyphicon glyphicon-search" runat="server" OnClick="SearchButton_Click" />
                </div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ButtonType="Button" HeaderText="操作" SelectText="录入信息" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary btn-sm" />
                    </Columns>
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
                <button id="ShowButton" name="ShowButton" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#inputMsg" style="display: none">录入信息</button>
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



        <div class="modal fade" id="inputMsg" tabindex="-1" role="dialog" aria-labelledby="inputMsg">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">录入信息</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">序号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="number" name="number" value="" disabled runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">合同编号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="confirm_number" name="confirm_number" value="" disabled runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">项目</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="item" name="item" value="" disabled runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">业主</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="owner" name="item" value="阎良" disabled runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">水槽/电器</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="waterchannel_wiring" name="waterchannel_wiring" placeholder="水槽/电器" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="col-sm-2 control-label">五金配件</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="hardware_fitting" name="hardware_fitting" placeholder="五金配件" runat="server" />
                                </div>
                            </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <asp:Button ID="SubmitButton" CssClass="btn btn-primary" runat="server" CausesValidation="false" CommandName="" OnClick="SubmitButton_Click" Text="确定" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    function loadData(num) {
        $("#PageCount").val("89");
    }
    function exeData(num, type) {
        loadData(num);
        loadpage();
    }
    function loadpage() {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
        $("#countindex").val(countindex);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: 1,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (num, type) {
                if (type == "change") {
                    exeData(num, type);
                }
            }
        });
    }
    $(function () {
        loadData(1);
        loadpage();
    });
</script>
</html>
