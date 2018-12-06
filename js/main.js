/*
* @Author: Star
* @Date:   2018-11-29 15:39:54
* @Last Modified by:   Star
* @Last Modified time: 2018-12-06 15:10:18
*/
$(function() {
	$('.d-firstNav').click(function(e) {
		console.log("111");
		dropSwift($(this), '.d-firstDrop');	   
		// 方法阻止事件冒泡到父元素，阻止任何父事件处理程序被执行。
		e.stopPropagation();
	});
	$('.d-secondNav').click(function(e) {
		dropSwift($(this), '.d-secondDrop');
		// 方法阻止事件冒泡到父元素，阻止任何父事件处理程序被执行。
		e.stopPropagation();
	});
	
	
	
	/**
	 * @param dom   点击的当前元素
	 * @param drop  下一级菜单
	 */
	function dropSwift(dom, drop) {
		//点击当前元素，收起或者伸展下一级菜单
		dom.next().slideToggle();
		
		//设置旋转效果
		
		//1.将所有的元素都至为初始的状态		
		dom.parent().siblings().find('.fa-caret-right').removeClass('iconRotate');
		
		//2.点击该层，将其他显示的下滑层隐藏		
		dom.parent().siblings().find(drop).slideUp();
		
		var iconChevron = dom.find('.fa-caret-right');
		if(iconChevron.hasClass('iconRotate')) {			
			iconChevron.removeClass('iconRotate');
		} else {
			iconChevron.addClass('iconRotate');
		}
	}


	// progect = $('#progect')
	// desinger = $('#desinger')
	// $('.progect').click(function () {
	// 	$('#progect').show()
	// 	$('#firstTime').hide()
	// 	$('#compoundRuler').hide()
	// 	$('#contractDetail').hide()
	// 	$('#userList').hide()
	// 	$('#otherInfo').hide()
	// })
	// 	$('.firstTime').click(function () {
	// 	$('#firstTime').show()
	// 	$('#progect').hide()
	// 	$('#compoundRuler').hide()
	// 	$('#contractDetail').hide()
	// 	$('#userList').hide()
	// 	$('#otherInfo').hide()
	// })
	// $('.compoundRuler').click(function () {
	// 	$('#compoundRuler').show()
	// 	$('#firstTime').hide()
	// 	$('#progect').hide()
	// 	$('#contractDetail').hide()
	// 	$('#userList').hide()
	// 	$('#otherInfo').hide()
	// })
	// $('.contractDetail').click(function () {
	// 	$('#contractDetail').show()
	// 	$('#firstTime').hide()
	// 	$('#progect').hide()
	// 	$('#compoundRuler').hide()
	// 	$('#userList').hide()
	// 	$('#otherInfo').hide()
	// })
	// $('.userList').click(function () {
	// 	$('#userList').show()
	// 	$('#firstTime').hide()
	// 	$('#progect').hide()
	// 	$('#compoundRuler').hide()
	// 	$('#contractDetail').hide()
	// 	$('#otherInfo').hide()
	// })
	// $('.otherInfo').click(function () {
	// 	$('#otherInfo').show()
	// 	$('#firstTime').hide()
	// 	$('#progect').hide()
	// 	$('#compoundRuler').hide()
	// 	$('#contractDetail').hide()
	// 	$('#userList').hide()
	// })


		// $('.form_datetime').datetimepicker({
  //   	language:  'zh-CN',
  //   	weekStart: 1,
  //   	todayBtn:  1,
		// 	autoclose: 1,
		// 	todayHighlight: 1,
		// 	startView: 2,
		// 	forceParse: 0,
  //   	showMeridian: 1
  //   });

		$(".first").on("click", "li", function() {
			var itemId = $(this).data('id'); //获取data-id的值
			console.log('itemId', itemId);
			window.location.hash = itemId; //设置锚点
			loadInnerItem(itemId)
		});
		function loadInnerItem (itemId) {
			var itemId = window.location.hash;
			var pagePath, i;
			switch(itemId) {
				// 创建项目
				case '#baseSet':
					pagePath = '/Backstage/child/base_set.html';
					i = 0;
					break;
				// 水电
				case '#waterSeting':
					pagePath = '/Backstage/child/water_setting.html';
					i = 1;
					break;
				// 确认合同
				case '#contractConfirm':
					pagePath = '/Backstage/child/contract_confirm.html';
					i = 3;
					break;
				case '#waterSeting':
					pagePath = '/Backstage/child/water_setting.html';
					i =4;
					break;
			}
			console.log(pagePath);
			$("#content").load(pagePath); //加载相对应的内容
			// console.log($("#content").load(pagePath));
		}
		var itemId = window.location.hash;
		loadInnerItem(itemId)
    
})