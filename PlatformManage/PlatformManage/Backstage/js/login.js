/*
* @Author: Star
* @Date:   2018-11-19 16:58:32
* @Last Modified by:   Star
* @Last Modified time: 2018-11-19 17:38:33
*/
var conf = {
	serverHost : ''
};

var _mm = {
	// 网络请求
	request: function(param){
		var _this = this;//缓存mm对象
		$.ajax({
			type      : param.method   || 'get',
			url       : param.url      || '',
			dataType  : param.type     || 'json',
			data      : param.data     || '',
			success: function(res){
				// 请求成功
				if(0 === res.status){
					typeof param.success === 'function' && param.success(res.data, res.msg);
				}
				// 没有登录状态，需要强制登录
				else if(10 === res.status){
					_this.doLogin();
				}
				// 请求数据错误
				else if(1 === res.status){
					typeof param.error === 'function' && param.error(res.msg);
				}
			},
			error: function(err){
				typeof param.error === 'function' && param.error(err.statusText);
			}
		});
	},
  getUrlParam : function(name){
    var reg     = new RegExp('(^|&)' + name + '=([^&]*)(&|$)');
    var result  = window.location.search.substr(1).match(reg);
    return result ? decodeURIComponent(result[2]) : null;
	},
  validate : function(value, type){
		var value = $.trim(value);
		// 非空验证
		if('require' === type){
			return !!value;
		}
		// 手机号验证
		if('phone' === type){
			return /^1\d{10}$/.test(value);
		}
	},
  // 获取服务器地址
  getServerUrl : function(path){
      return conf.serverHost + path;
  },
}

var _user = {
  login : function(userInfo, resolve, reject){
    _mm.request({
        url     : _mm.getServerUrl('/user/login.do'),
        data    : userInfo,
        method  : 'POST',
        success : resolve,
        error   : reject
    });
	}
}

var formError = {
	// 表单里的错误提示
	show : function(errMsg){
		$('.error-item').show().find('.err-msg').text(errMsg);
		// $('.error-item').show();
		// $('err-msg').text(errMsg);
	},		
	hide : function(){
		$('.error-item').hide().find('.err-msg').text('');
	}	
};


var page = {
	init: function() {
		this.bindEvent();
	},
	bindEvent: function() {
		var _this  = this;
		// 登录按钮的点击
		$('#button').click(function () {
			_this.submit();
		});
		// 如果按下回车键也会提交
		$('.form-control').keyup(function(e) {
			if(e.keyCode === 13) {
				_this.submit();
			}
		});
	},
	// 提交表单
	submit: function() {
		var formData = {
			username: $.trim($('#username').val()),
			password: $.trim($('#password').val())
		},
		// 表单验证结果
		validateResult = this.formValidate(formData);
			// 验证成功
			if(validateResult.status){
				// 提交
				_user.login(formData, function(res){
					// 成功后直接跳转首页
					window.location.href = _mm.getUrlParam('redirect') || './index.html';
					// 失败
				}, function(errMsg){
					formError.show(errMsg);
				});
			}
			// 表单验证失败
			else{
				// 错误提示
				formError.show(validateResult.msg);
			}
	},
	// 表单字段的验证
	formValidate : function(formData){
		var result = {
			status : false,
			msg    : ''
		};
		if(!_mm.validate(formData.username, 'require')){
			result.msg = '用户名不能为空!';
			return result;
		}	
		if(!_mm.validate(formData.password, 'require')){
			result.msg = '密码不能为空!';
			return result;
		}
		// 通过验证返回正确提示
		result.status = true;
		result.msg = '验证通过';
		return result;
	}
};

$(function(){
	page.init();
});