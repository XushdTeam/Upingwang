/**
 * Created by Administrator on 2017/1/29 0029.
 */
layui.define(["common","form",'util','sha256'],function (exports) {
    var $ = layui.jquery,
        form = layui.form(),
        util = layui.util,
        common = layui.common,
        sha256 = layui.sha256;

    var backUrl = "";

    var private ={

        submit:function (data) {
            var url = $(data.elem).data("href");
            common.ajax(url,"POST","json",data.field,function (err,res) {
                if(err){
                    common.layerAlertE(err, '提示');
                }else{
                    common.layerAlertS(res.message);
                    common.time(function () {
                       window.location.href = backUrl;
                    });

                }
            });
           
        },
        /**
         * 绑定form提交
         * @param callback
         */
        formOn:function (callback) {
            form.on('submit(btnsubmit)',callback);
        },
        /**
         * 返回和回到顶部
         */
        fixbar:function () {
            backUrl = $(".main-wrap").data("href");
            util.fixbar(
                {
                    bar1: "<i class='fa fa-arrow-left'></i>",
                    click: function (type) {
                        if(type === 'bar1'){
                            window.location.href = backUrl;
                        }
                    }
                });
        }
    }

    var obj = {
        /**
         * 通用
         */
        init:function () {
            private.formOn(function (formdata) {
                private.submit(formdata);
                return false;
            });
            private.fixbar();
        },
        /**
         * 角色
         */
        roleInit:function () {
            private.formOn(function(formdata){

                var permission = [];
                $.each( $('input[name="permission"]:checked'),function(j,i){
                    permission.push(i.value);
                });
                formdata.field.permission = permission;

                private.submit(formdata);
                return false;
            });
            private.fixbar();
        },
        /**
         * 用户注册
         */
        userInit:function(){
            private.formOn(function(formdata){
                formdata.field.password = sha256.sha256_digest("123456");
                private.submit(formdata);
                return false;
            });
            private.fixbar();
        },
        fixbar:function () {
            private.fixbar();
        }
    };
    exports("form_a_e",obj);
});