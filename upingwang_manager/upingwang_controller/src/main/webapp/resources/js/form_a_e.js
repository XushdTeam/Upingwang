/**
 * Created by Administrator on 2017/1/29 0029.
 */
layui.define(["common","form",'util','sha256'],function (exports) {
    var $ = layui.jquery,
        form = layui.form(),
        common = layui.common,
        sha256 = layui.sha256;

    var backUrl = $(".main-wrap").data("href");

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
            common.fixBar();
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
            common.fixBar();
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
            common.fixBar();
        },
        fixbar:function () {
            common.fixBar();
        }
    };
    exports("form_a_e",obj);
});