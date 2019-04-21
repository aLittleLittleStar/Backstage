/*
* @Author: Star
* @Date:   2018-11-29 15:39:54
* @Last Modified by:   Star
* @Last Modified time: 2019-04-21 16:52:12
*/
$(function () {
    $('.d-firstNav').click(function (e) {
        dropSwift($(this), '.d-firstDrop');
        // 方法阻止事件冒泡到父元素，阻止任何父事件处理程序被执行。
        e.stopPropagation();
    });
    $('.d-secondNav').click(function (e) {
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
        if (iconChevron.hasClass('iconRotate')) {
            iconChevron.removeClass('iconRotate');
        } else {
            iconChevron.addClass('iconRotate');
        }
    }

    // html页面的点击替换
    // 1.获取iframe的src
    child = $(window.parent.document).find("#changeItem").attr("src");
    // 设置点击事件
    changeChild('#addUser', 'child/add_user.aspx');
    changeChild('#userInfo', 'child/user_info.aspx');
    changeChild('#baseSet', 'child/base_set.aspx');
    changeChild('#viewItems', 'child/view_items.aspx');
    changeChild('#waterSeting', 'child/water_settings.aspx');
    changeChild('#contractConfirm', 'child/contract_confirm.aspx');
    changeChild('#confirmInstallData', 'child/confirm_install_data.aspx');
    changeChild('#cupboard', 'child/cupboard.aspx');
    changeChild('#wardrobe', 'child/wardrobe.aspx');
    changeChild('#other_cabinet_body', 'child/cabinet_body.aspx');
    changeChild('#getReady', 'child/get_ready.aspx');
    changeChild('#search', 'child/search.aspx');
    changeChild('#installDetail', 'child/install_detail.aspx');

    // 封装点击事件函数
    function changeChild(childName, url) {
        $(".first").on("click", childName, function () {
            $(window.parent.document).find("#changeItem").attr("src", url);
        })
    }

    // 设置点击slider侧边栏item时颜色变化
    $(".s-side .s-secondItem li").click(function () {
        var that = this;
        $(".s-side .s-secondItem li").each(function () {
            this.className = this == that ? 'current' : 'none'
        })
    })

})