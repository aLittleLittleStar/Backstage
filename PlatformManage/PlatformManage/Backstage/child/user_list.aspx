<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_list.aspx.cs" Inherits="PlatformManage.Backstage.child.user_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>查看</title>
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



        <div class="modal fade" id="seeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">查看用户信息</h3>
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
                                <input type="text" class="form-control" id="confirm_number" name="confirm_number" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">项目</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="item" name="item" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">业主</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="owner" name="owner" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">初测时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="first_test_time" name="first_test_time" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">水电时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="water_electric_time" name="water_electric_time" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">家装设计师</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="home_style_designer" name="home_style_designer" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="wooden_style_designer" name="wooden_style_designer" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">橱柜门板</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="board_door_table" name="board_door_table" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">柜体部分</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="other_cabinet" name="other_cabinet" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">其他设备</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="other_sets" name="other_sets" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">实际安装时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="real_install_time" name="real_install_time" value="" disabled runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">备 注</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="comment" name="comment" value="" disabled runat="server"/>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">修改用户信息</h3>
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
                                <input type="text" class="form-control" id="confirm_number" name="confirm_number" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">项目</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="item" name="item" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">业 主</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="owner" name="owner" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">初测时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="first_test_time" name="first_test_time" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-2 control-label">水电时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="water_electric_time" name="water_electric_time" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">家装设计师</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="home_style_designer" name="home_style_designer" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="wooden_style_designer" name="wooden_style_designer" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">橱柜门板</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="board_door_table" name="board_door_table" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">柜体部分</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="other_cabinet" name="other_cabinet" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">其他设备</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="other_sets" name="other_sets" value="" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">实际安装时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="real_install_time" name="real_install_time" value="" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">备 注</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="comment" name="comment" value="" runat="server"/>
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

        <!-- deleteModal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">删除用户信息</h3>
                    </div>
                    <div class="modal-body">
                        <p>您确认要删除该合同吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-default"
                            data-dismiss="modal">
                            取消</button>
                        <button
                            type="button"
                            class="btn btn-primary"
                            id="deleteHaulBtn">
                            确认</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    $('.progect-add').on("click", 'li', function () {
        var itemid = $(this).data('id');
        console.log('itemid', itemid);
        window.location.hash = itemid;
        loadInnerItem(itemid)
    })
    function loadInnerItem(itemid) {
        var itemid = window.location.hash;
        var pagePath;
        switch (itemid) {
            case '#baseSet':
                pagePath = '/Backstage/child/base_set.html';
                break;
        }
        $("#content").load(pagePath); //加载相对应的内容
    }
    var itemid = window.location.hash;
    loadInnerItem(itemid)

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
