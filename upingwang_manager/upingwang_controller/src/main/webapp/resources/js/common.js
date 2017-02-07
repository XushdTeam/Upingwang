/**
 * 公共模块
 * Created by Xushd on 2017/1/19 0019.
 */
layui.define(['layer','util'], function (exports) {
    var $ = layui.jquery,util = layui.util;
    var obj = {
        /**
         * ajax 方法
         * @param url
         * @param type GET or POST
         * @param dataType JSON or TEXT etc
         * @param data
         * @param callback
         */
        ajax: function (url, type, dataType, data, callback) {
            if(arguments.length==2){
                callback = arguments[1];
                type = "GET";
                dataType="JSON";
                data={};
            }
            obj.showLoading();
            $.ajax({
                url: url,
                type: type,
                dataType: dataType,
                data: data,
                success: function (data, startic) {
                    obj.closeLoading();
                    if (data.status == 200) {
                        callback(null,data);
                    } else if (data.status == 401){
                        //没有权限
                        obj.layerAlertW("<span class=red>"+data.message+"</span>");
                    } else {
                        callback(data.message);
                    }
                },
                error: function (e) {
                    obj.closeLoading();
                    callback("Net Lost");
                }
            });
        },
        /**
         * ajax POST
         * @param u{url}
         * @param d{DATA}
         * @param c{callBack}
         */
        ajaxPost:function(u,d,c){
            obj.showLoading();
            $.ajax({
                url: u,
                type: "POST",
                dataType: "JSON",
                data: d,
                success: function (data, startic) {
                    obj.closeLoading();
                    if (data.status == 200) {
                        c(null,data);
                    } else if (data.status == 401){
                        //没有权限
                        obj.layerAlertW("<span class=red>"+data.message+"</span>");
                    } else {
                        c(data.message);
                    }
                },
                error: function (e) {
                    obj.closeLoading();
                    c("Net Lost");
                }
            });

        },
        /**
         * 删除 确认 提交
         * @param title
         * @param text
         * @param url
         * @param type
         * @param dataType
         * @param data
         * @param callback
         */
        layerDel: function (title, text, url, type, dataType, data, callback) {
            parent.layer.confirm(text, {
                title: title,
                resize: false,
                icon: 3,
                btn: ['确定删除', '容我想想'],
                yes: function () {
                    obj.ajax(url, type, dataType, data, callback);
                }
            });
        },
        /**
         * 成功提示
         * @param text
         * @param title
         */
        layerAlertS: function (text, title) {
            parent.layer.alert(text, { title: title, icon: 1, time: 5000, resize: false, zIndex: layer.zIndex, anim: Math.ceil(Math.random() * 6) });
        },
        /**
         * 错误提示
         * @param text
         * @param title
         */
        layerAlertE: function (text, title) {
            parent.layer.alert(text, { title: title, icon: 2, time: 5000, resize: false, zIndex: layer.zIndex, anim: Math.ceil(Math.random() * 6) });
        },
        /**
         * 警告提示
         * @param text
         */
        layerAlertW: function (text){
            parent.layer.alert(text, { title: "警告", icon: 7, time: 5000, resize: false, zIndex: layer.zIndex, anim: Math.ceil(Math.random() * 6) });
        },
        /**
         * 信息提示
         * @param text
         */
        layerAlertI: function (text) {
            parent.layer.msg(text, { time: 5000, resize: false, zIndex: layer.zIndex,  });
           
        },
        layerMessageE:function(text){
            parent.layer.msg(text, {icon: 5,anim:6});
        },
        /**
         * Loading
         * @param test
         */
        showLoading:function(text){
            parent.layer.msg(text||"Loading...", {icon: 16,shade: 0.01, time: 0});
        },
        closeLoading:function(){
            parent.layer.closeAll(); //关闭加载层
        },
        time:function(callback){
            setTimeout(callback,1000);
        },
        //TODO prompt
        layerPrompt: function () {
        },
        /**
         * 询问层
         * @param text
         * @param btn
         * @param callback
         */
        layerConfirm: function (text,btn,callback) {
            parent.layer.confirm(text, {
                title: "系统询问",
                resize: false,
                btn: btn,
                btnAlign: 'c',
                icon: 3
            }, function () {
                callback();
            }, function () {
                parent.layer.msg('好吧！', {
                    time: 2000
                });
            });
        },
        /**
         * 退出系统
         * @param title
         * @param text
         * @param url
         * @param rturl
         * @param type
         * @param dataType
         * @param data
         * @param callback
         */
        signOut: function (url, callback) {
            parent.layer.confirm("确认退出系统?", {
                title: "系统询问",
                resize: false,
                btn: ['确定退出', '容我想想'],
                btnAlign: 'c',
                icon: 3

            }, function () {
                $.ajax({
                    url: url,
                    type: "POST",
                    dataType: "json",
                    data: {},
                    success: function (data, startic) {
                        if (data.status == 200) {
                            callback(null,data.message);
                        }
                        else {
                            callback(data.message);
                        }
                    },
                    error: function () {
                        callback("Net Lost!");
                    }
                });
            }, function () {
                parent.layer.msg('好吧！', {
                    time: 2000
                });
            });
        },
        /**
         * 抛出一个异常错误信息
         * @param {String} msg
         */
        throwError: function(msg) {
            throw new Error(msg);
        },
        fixBar: function () {
            var backUrl = $(".main-wrap").data("href");
            util.fixbar(
                {
                    bar1: "<i class='fa fa-arrow-left'></i>",
                    click: function (type) {
                        if (type === 'bar1') {
                            if (backUrl == undefined || backUrl == "") {
                                history.back();
                            } else {
                                window.location.href = backUrl;
                            }

                        }
                    }
                });
        }


    }

    exports("common", obj);
});
