<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/4 0004
  Time: 下午 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教育局管理/新增修改</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
<div class="main-wrap" data-href="${baseUrl}">
    <blockquote class="layui-elem-quote fhui-admin-main_hd">
        <h2>${handle}</h2>
    </blockquote>
    <div class="site-text site-block">
        <form class="layui-form layui-form-pane">
            <input type="hidden" id="code" value="${bureau.bureauCode}">
            <div class="layui-form-item">
                <label class="layui-form-label">教育局名称</label>
                <div class="layui-input-block">
                    <input name="bureauName" autocomplete="off" value="${bureau.bureauName}" lay-verify="required"
                           placeholder="教育局名称，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">区域选择</label>
                <div class="layui-input-inline">
                    <select name="prov" lay-filter="prov" lay-verify="not0">
                        <option value="">请选择省</option>
                    </select>
                </div>
                <div class="layui-input-inline" >
                    <select name="city" lay-filter="city" lay-verify="not0">
                        <option value="">请选择市</option>
                    </select>
                </div>
                <div class="layui-input-inline" >
                    <select name="area" lay-filter="area" >
                        <option value="">请选择县/区</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否启用</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="启用"
                           <c:if test="${bureau==null||bureau.status==1}">checked="checked"</c:if> >
                    <input type="radio" name="status" value="0" title="停用"
                           <c:if test="${bureau.status==0}">checked="checked"</c:if>>
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="btnsubmit" data-href="${saveUrl}">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </form>
    </div>

    <div class="fhui-admin-pagelist"></div>
    <script type="text/javascript" src="/resources/js/event.js"></script>
    <script type="text/javascript" src="/resources/js/areafun.js"></script>
    <script type="text/javascript">
        layui.use(["form","app"], function () {
            var $ = layui.jquery,
                form=layui.form(),
                app = layui.app;

            app.fixBar();

            form.verify({
                not0: function(value){
                    if(value==0){
                        return '请选择';
                    }
                }
            });
            form.on("submit(btnsubmit)", function (formdata) {

                var url = $(formdata.elem).data("href");

                var area = document.getElementsByName("area")[0];
                var city = document.getElementsByName('city')[0];
                var prov = document.getElementsByName('prov')[0];
                //判断 县区是否隐藏
                if ($(area).parent().is(":hidden")) {
                    formdata.field.bureauCode = formdata.field.city;
                    formdata.field.bureauArea = $(prov).find("option:selected").text() + $(city).find("option:selected").text();
                } else {
                    if (area.value == 0) {
                        $(area).addClass("layui-form-danger");
                        app.layerMessageE("请选择");
                        return false;
                    }
                    formdata.field.bureauCode = formdata.field.area;
                    formdata.field.bureauArea = $(prov).find("option:selected").text() + $(city).find("option:selected").text() + $(area).find("option:selected").text();
                }
                app.ajaxPost(url,filedata.field,function(e,r){
                    if(e){app.layerAlertE(e)}
                    else{
                        app.layerAlertS(r.message);
                        app.time(function(){
                            app.route($(".main-wrap").data("href"));
                        });
                    }
                });
                return false;
            });

        });
    </script>
</div>
</body>
</html>
