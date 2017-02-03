/**
 * Created by Xushd on 2017/1/19 0019.
 */
layui.define(['form','sha256','common','element'], function(exports){
    var form = layui.form(),
        common = layui.common,
        device = layui.device(),
        sha256 = layui.sha256;


    var obj = {
        init:function () {
            //阻止IE7以下访问
            if (device.ie && device.ie < 8) {
                common.layerAlertE('最低支持ie8，您当前使用的是古老的 IE' + device.ie + '！');
            }
            //防止iframe嵌套
            window.top.location !== window.location && (window.top.location = window.location);
            //提交
            form.on('submit(btnsubmit)', function (formdata) {
                formdata.field.password = sha256.sha256_digest(formdata.field.password);
                common.ajax("/loginCheck","POST","json",formdata.field,function (err,res) {
                    if(err){
                        common.layerAlertE(err, '提示');
                    }else{
                        common.layerAlertI("登录成功");
                        common.time(function () {
                            window.location.href = res.message;
                        });

                    }
                });
                return false;
            });
        }
    }
    exports('auth', obj);
});
