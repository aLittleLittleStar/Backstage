<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_items.aspx.cs" Inherits="PlatformManage.Backstage.child.view_items" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看项目</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/confirm_install_data.css" />
</head>
<body>
    <form id="form1" runat="server">
      <section id="userList">
		<div class="container">
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="请输入合同编号或项目名或业主" />
          <li class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-search"></span>
            查询
          </li>
        </div>
      </form>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>序号</th>
						<th>合同编号</th>
						<th>项 目</th>
						<th>业 主</th>
						<th>合同确定时间</th>
						<th>操 作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>YS-18-10-01</td>
						<td>阎良</td>
						<td>张三 </td>
						<td>2018/12/2</td>
						<td>
							<button 
								type="button" 
								class="btn btn-primary btn-sm"  
								data-toggle="modal" 
								data-target="#myModal">
								编辑
							</button>
							<button 
								type="button" 
								class="btn btn-danger btn-sm"  
								data-toggle="modal" 
								data-target="#deleteModal">
								删除
							</button>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>YS-18-10-02</td>
						<td>阎12良</td>
						<td>wang123 </td>
						<td>2018/2/12</td>
						<td>
							<button type="button" class="btn btn-primary btn-sm">编辑</button>
							<button type="button" class="btn btn-danger btn-sm">删除</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
    <div class="container">
      <ul class="pagination" id="pagination">
      </ul>
      <input type="hidden" id="PageCount" runat="server" />
      <input type="hidden" id="PageSize" runat="server" value="8" />
      <input type="hidden" id="countindex" runat="server" value="10"/>
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
				<form class="form-horizontal" role="form" >
					<div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">合同编号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="YS-18-10-01" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">项目</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="阎良" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">业 主</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="张三" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">初测时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="2018/12/2" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">水电时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="2018/12/22" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">家装设计师</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="李四" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="王五" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">橱柜门板</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已到厂" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">柜体部分</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已下单" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">移 门</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="待打款" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">实际安装时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="2018/12/24" disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">备 注</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已验收交工" disabled>
				    </div>
				  </div>
				</form>
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
				<form class="form-horizontal" role="form" >
					<div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">合同编号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="YS-18-10-01">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">项目</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="阎良">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">业 主</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="张三">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">初测时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="2018/12/2">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">水电时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="firstname" value="2018/12/22">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">家装设计师</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="李四">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="王五">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">橱柜门板</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已到厂">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">柜体部分</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已下单">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">移 门</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="待打款">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">实际安装时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="2018/12/24">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">备 注</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="lastname" value="已验收交工">
				    </div>
				  </div>
				</form>
      </div>
			<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">提交更改</button>
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
          data-dismiss="modal">取消</button>
        <button 
        	type="button" 
        	class="btn btn-primary"
          id="deleteHaulBtn">确认</button>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
