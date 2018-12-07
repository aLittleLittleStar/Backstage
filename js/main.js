/*
* @Author: Star
* @Date:   2018-11-29 15:39:54
* @Last Modified by:   Star
* @Last Modified time: 2018-12-07 11:52:12
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
				// 预定安装时间
				case '#confirmInstallData':
					pagePath = '/Backstage/child/confirm_install_data.html';
					i = 4;
					break;
				// 橱柜
				case '#cupboard':
					pagePath = '/Backstage/child/cupboard.html';
					i = 5;
					break;
				// 衣柜
				case '#wardrobe':
					pagePath = '/Backstage/child/wardrobe.html';
					i = 6;
					break;
				// 其他柜体
				case '#other_cabinet_body':
					pagePath = '/Backstage/child/cabinet_body.html';
					i = 7;
					break;
				// 项目准备
				case '#getReady':
					pagePath = '/Backstage/child/get_ready.html';
					i = 8;
					break;
				// 搜索
				case '#search':
					pagePath = '/Backstage/child/search.html';
					i = 9;
					break;
				// 用户列表
				case '#userList':
					pagePath = '/Backstage/child/user_list.html';
					i = 10;
					break; 
				// 安装详情 
				case '#installDetail':
					pagePath = '/Backstage/child/install_detail.html';
					i = 11;
					break;
				// 安装详情 
				case '#remarks':
					pagePath = '/Backstage/child/remarks.html';
					i = 12;
					break;
			}
			console.log(pagePath);
			$("#content").load(pagePath); //加载相对应的内容
			//当前列表高亮
			$(".s-side .s-secondItem li").click(function () {
				var that = this;
				$(".s-side .s-secondItem li").each(function () {
					this.className = this == that ? 'current' : 'none'
				})
			})
		}
		var itemId = window.location.hash;
		loadInnerItem(itemId)


})