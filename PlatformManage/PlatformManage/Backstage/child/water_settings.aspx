<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="water_settings.aspx.cs" Inherits="PlatformManage.Backstage.child.water_settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>水电时间</title>
</head>
<body>
    <section>
		<form id="form1" class="form-horizontal" role="form" runat="server" action="index.html">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
		      <ContentTemplate>
                <div class="form-group">
		        <label for="lastname" class="col-sm-2 control-label">项 目</label>
		        <div class="col-sm-10">
		    	    <input class="form-control" id="item" name="item" type="text" runat="server" disabled>
		        </div>
		      </div>
		      <div class="form-group">
		        <label for="lastname" class="col-sm-2 control-label">业 主</label>
		        <div class="col-sm-10">
		    	    <input class="form-control" id="owner" name="owner" type="text" runat="server" disabled>
		        </div>
		      </div>
		      <div class="form-group">
		        <label for="lastname" class="col-sm-2 control-label">家装设计师</label>
		        <div class="col-sm-10">
		    	    <input class="form-control" id="home_style_designer" name="home_style_designer" type="text" runat="server" disabled>
		        </div>
		      </div>
		      <div class="form-group">
		        <label for="lastname" class="col-sm-2 control-label">木作设计师</label>
		        <div class="col-sm-10">
		    	    <input class="form-control" id="wooden_style_designer" name="wooden_style_designer" type="text" runat="server" disabled>
		        </div>
		      </div>
		      <div class="form-group">
		        <label for="lastname" class="col-sm-2 control-label">复 尺</label>
		        <div class="col-sm-10">
		    	    <input class="form-control" id="owner_confirm" name="owner_confirm" type="text" runat="server" placeholder="复 尺">
		        </div>
		      </div>
			    <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">初测时间</label>
				    <div class="col-sm-10">
            <fieldset>
	      	    <div 
	        	    class="input-group date form_datetime" 
	        	    data-date="2018-09-16T" 
	        	    data-date-format="yyyy MM dd" 
	        	    data-link-field="dtp_input1">
	        	    <input id="origin_date" name="origin_date" class="form-control" size="16" type="text" runat="server" value="" readonly />
	        	    <span class="input-group-addon">
	          	    <span class="glyphicon glyphicon-remove"></span>
	        	    </span>
						    <span class="input-group-addon">
	          	    <span class="glyphicon glyphicon-th"></span>
	        	    </span>
	            </div>
					    <input type="hidden" id="dtp_input1" value="" /><br/>
            </fieldset>
				    </div>
			    </div>

			    <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">水电时间</label>
				    <div class="col-sm-10">
            <fieldset>
	      	    <div 
	        	    class="input-group date form_datetime" 
	        	    data-date="2018-09-16T" 
	        	    data-date-format="yyyy MM dd" 
	        	    data-link-field="dtp_input1">
	        	    <input id="water_electic_date" name="water_electic_date" class="form-control" size="16" type="text" runat="server" value="" readonly />
	        	    <span class="input-group-addon">
	          	    <span class="glyphicon glyphicon-remove"></span>
	        	    </span>
						    <span class="input-group-addon">
	          	    <span class="glyphicon glyphicon-th"></span>
	        	    </span>
	            </div>
					    <input type="hidden" id="dtp_input1" value="" /><br/>
	        </fieldset>
				    </div>
			    </div>
		      <div class="form-group">
		        <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button runat="server" ID="submit_button" class="btn btn-primary btn-lg" Text="提交" OnClick="submit_button_Click"/>
		        </div>
		      </div>
		  </ContentTemplate>
        </asp:UpdatePanel>
		</form>
	</section>
</body>
<script>
    $('.form_datetime').datetimepicker({
    	language:  'zh-CN',
    	weekStart: 1,
    	todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
    	showMeridian: 1,
    	minView: "month"
    });
</script>
</html>
