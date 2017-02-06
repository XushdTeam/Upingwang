/**
 * 页面交互事件
 * Created by Xushd on 2017/1/30 0030.
 */
layui.config({
    base: '/resources/js/' //自定义layui组件的目录
});
layui.use(['layer','common','element'], function () {

    var $ = layui.jquery,
        util = layui.util,
        upload = layui.upload,
        common = layui.common;

    //修改tab文字
    var title = $(".fhui-admin-main_hd").find("h2").text();
    var tab = parent.document.getElementById("admin-tab");
    $(tab).find(".layui-this").find("cite").text(title);

    /**
     * 绑定页面do-action事件
     */
    $('body').on("click",".do-action", function (e) {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
        layui.stope(e);//阻止冒泡事件
    });

    var active = {
        /**
         * 刷新
         */
        doRefresh: function () {
            var url = $(this).data('href');
            if (url) {
                location.href = url;
            }
            else {
                location.href = location.href;
            }
        },
        /**
         * 新增修改
         */
        doAddEdit:function () {
            var url = $(this).data('href');
            if (url) {
                location.href = url;
            }
            else {
                common.layerAlertE("错误","没有设定跳转地址");
            }
        },
        /**
         * 单向ajax
         */
        doAjax:function () {
            var url = $(this).data("href");
            common.ajax(url,"POST","json",{}, function (err, res) {
                if (err){
                    common.layerAlertE(err,"提示");
                }else {
                    common.layerAlertS(res.message);
                }
            });

        },
        /**
         * 删除
         */
        doDelete:function(){
            var url = $(this).data("href");
            var text = $(this).data("text");
            common.layerConfirm(text||"确定删除么？",["确定","容我想想"],function(){
                common.ajax(url,"POST","json",{}, function (err, res) {
                    if (err){
                        common.layerAlertE(err,"提示");
                    }else {
                        common.layerAlertS(res.message);
                        common.time(function(){
                            location.href = location.href;
                        });
                    }
                });
            });
        },
        /**
         * 返回  有href 为跳转 否则后退
         */
        doGoBack: function () {
            var url = $(this).data('href');
            if (url) {
                location.href = url;
            }
            else {
                history.go(-1);
            }

        },
        /**
         * 子父节点展开收缩
         */
        doToggle:function () {
            var parentId = $(this).data("id");
            if( $(this).find('i').hasClass("fa-minus-square-o")){
                $(this).find('i').removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
            }else{
                $(this).find('i').removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
            }

            $.each($('tr[data-parent="'+parentId+'"]'),function (j,i) {
                $(i).toggle();
            });
        }
    }
});
