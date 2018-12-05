/*
* @Author: Star
* @Date:   2018-11-29 15:39:54
* @Last Modified by:   Star
* @Last Modified time: 2018-12-03 21:16:17
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


	progect = $('#progect')
	desinger = $('#desinger')
	$('.progect').click(function () {
		$('#progect').show()
		$('#firstTime').hide()
		$('#compoundRuler').hide()
		$('#contractDetail').hide()
		$('#userList').hide()
		$('#otherInfo').hide()
	})
		$('.firstTime').click(function () {
		$('#firstTime').show()
		$('#progect').hide()
		$('#compoundRuler').hide()
		$('#contractDetail').hide()
		$('#userList').hide()
		$('#otherInfo').hide()
	})
	$('.compoundRuler').click(function () {
		$('#compoundRuler').show()
		$('#firstTime').hide()
		$('#progect').hide()
		$('#contractDetail').hide()
		$('#userList').hide()
		$('#otherInfo').hide()
	})
	$('.contractDetail').click(function () {
		$('#contractDetail').show()
		$('#firstTime').hide()
		$('#progect').hide()
		$('#compoundRuler').hide()
		$('#userList').hide()
		$('#otherInfo').hide()
	})
	$('.userList').click(function () {
		$('#userList').show()
		$('#firstTime').hide()
		$('#progect').hide()
		$('#compoundRuler').hide()
		$('#contractDetail').hide()
		$('#otherInfo').hide()
	})
	$('.otherInfo').click(function () {
		$('#otherInfo').show()
		$('#firstTime').hide()
		$('#progect').hide()
		$('#compoundRuler').hide()
		$('#contractDetail').hide()
		$('#userList').hide()
	})


		$('.form_datetime').datetimepicker({
    	language:  'zh-CN',
    	weekStart: 1,
    	todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
    	showMeridian: 1
    });
})