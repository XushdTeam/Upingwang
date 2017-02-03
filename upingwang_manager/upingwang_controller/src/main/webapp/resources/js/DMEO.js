/**
 * Created by Xushd on 2017/1/20 0020.
 */

layui.define(["common","form","laytpl","laypage",'element'],function (exports) {
    var $= layui.jquery,
        form =layui.form,
        element = layui.element(),
        laypage = layui.laypage,
        laytpl = layui.laytpl,
        common = layui.common;

    var obj = {
        getList:function(data,callback){
            //AJAX 获取数据
            common.ajax("/permission/list","GET","json",data,callback);
        },
        listInit:function(){
            var map={key1:123,key2:456};
            //定义模版
            var tpl = laytpl($("#tpl").html());

            //初始获取数据
            obj.getList({pageIndex:1,pageSize:10,searchFileds:map},function (err,res) {
                if(err){
                    common.layerAlertE("ERROR",err);
                }else{
                    //分页
                    laypage({
                        cont: 'page',
                        pages: res.data.pages,//总页数
                        groups: 5, //连续显示分页数
                        jump: function(obj_page, first) {
                            //得到了当前页，用于向服务端请求对应数据
                            var curr = obj_page.curr;
                            if(!first) {
                                obj.getList({pageIndex:curr,pageSize:10,searchFileds:map},function (err,res) {
                                    if (err){
                                        common.layerAlertE("ERROR",err);
                                    }else{
                                        var data = {rows:res.data.rows};
                                        tpl.render(data, function(html){
                                            $("#tbody").html(html);
                                        });
                                    }
                                });
                            }
                        }
                    });
                    //初始
                    var data = {rows:res.data.rows};
                    tpl.render(data, function(html){
                        $("#tbody").html(html);

                    });
                }
            });
        },
        addInit:function () {

        }




    };
    exports('permission', obj);

});
