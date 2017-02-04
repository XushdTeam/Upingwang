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

            <div class="layui-form-item">
                <label class="layui-form-label">教育局名称</label>
                <div class="layui-input-block">
                    <input name="menuName" autocomplete="off" value="${bureau.bureauName}" lay-verify="required"
                           placeholder="教育局名称，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">区域选择</label>
                <div class="layui-input-inline">
                    <select name="province" lay-filter="province">
                        <option value="">请选择省</option>
                    </select>
                </div>
                <div class="layui-input-inline" >
                    <select name="city" lay-filter="city">
                        <option value="">请选择市</option>
                    </select>
                </div>
                <div class="layui-input-inline" >
                    <select name="area" lay-filter="area">
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

        layui.use(["form_a_e","form"], function () {
            var $ = layui.jquery,
                form_a_e = layui.form_a_e,
                form=layui.form(),
                common = layui.common;






            form_a_e.init();

            form.on('select(prov)', function(data){

            });



        });
    </script>
</div>
</body>
</html>
