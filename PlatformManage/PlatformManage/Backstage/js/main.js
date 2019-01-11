/*
* @Author: Star
* @Date:   2018-11-29 15:39:54
* @Last Modified by:   Star
* @Last Modified time: 2018-12-21 20:26:48
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

		// html页面的点击替换
		// 1.获取iframe的src
		child = $(window.parent.document).find("#changeItem").attr("src");
		console.log(child);
		// 设置点击事件
		$(".first").on("click", '#baseSet', function() {
			$(window.parent.document).find("#changeItem").attr("src","child/base_set.aspx");  
		})
		$(".first").on("click", '#waterSeting', function() {
			$(window.parent.document).find("#changeItem").attr("src","child/water_settings.aspx");  
		})
		$(".first").on("click", '#contractConfirm', function() {
			$(window.parent.document).find("#changeItem").attr("src","child/contract_confirm.aspx");  
		})
		$(".first").on("click", '#confirmInstallData', function() {
			$(window.parent.document).find("#changeItem").attr("src","child/confirm_install_data.aspx");  
		})

		$(".first").on("click", '#cupboard', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/cupboard.aspx");  
		})
		$(".first").on("click", '#wardrobe', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/wardrobe.aspx");  
		})
		$(".first").on("click", '#other_cabinet_body', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/cabinet_body.aspx");  
		})

		$(".first").on("click", '#getReady', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/get_ready.aspx");  
		})
		$(".first").on("click", '#search', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/search.aspx");  
		})
		$(".first").on("click", '#userList', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/user_list.aspx");  
		})

		$(".first").on("click", '#installDetail', function() {
            $(window.parent.document).find("#changeItem").attr("src","child/install_detail.aspx");  
		})

		// 设置点击slider侧边栏item时颜色变化
		$(".s-side .s-secondItem li").click(function () {
			var that = this;
			$(".s-side .s-secondItem li").each(function () {
				this.className = this == that ? 'current' : 'none'
			})
		})

})