<%--
  Created by IntelliJ IDEA.
  User: Xushd
  Date: 2017/1/22 0022
  Time: 上午 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>菜单管理/新增修改</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
<div class="main-wrap" data-href="${baseUrl}">
    <blockquote class="layui-elem-quote fhui-admin-main_hd">
        <h2>菜单管理/${handle}</h2>
    </blockquote>
    <div class="site-text site-block">
        <form class="layui-form layui-form-pane">
            <input type="hidden" value="${menu.id}" name="id"/>
            <div class="layui-form-item">
                <label class="layui-form-label">父节点</label>
                <div class="layui-input-block">
                    <select lay-verify="required" name="parent">
                        <option
                                <c:if test="${menu.parent==0}">selected="selected"</c:if> value="0">无节点,我是父节点
                        </option>
                        <c:forEach var="item" items="${list}">
                            <option
                                    <c:if test="${menu.parent==item.id}">selected="selected"</c:if> value="${item.id}">
                                |---${item.menuName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单类型</label>
                <div class="layui-input-block">
                    <select lay-verify="required" name="menuType">
                        <option value="">==请选择==</option>
                        <c:forEach var="item" items="${dicList}">
                            <option value="${item.id}"
                                    <c:if test="${item.id==menu.menuType}">selected="selected"</c:if>>${item.dicName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单名称</label>
                <div class="layui-input-block">
                    <input name="menuName" autocomplete="off" value="${menu.menuName}" lay-verify="required"
                           placeholder="菜单名称，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单ICO</label>
                <div class="layui-input-block">
                    <input name="menuIco" autocomplete="off" value="${menu.menuIco}" lay-verify="required"
                           placeholder="菜单ICO，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单URL</label>
                <div class="layui-input-block">
                    <input name="menuUrl" autocomplete="off" value="${menu.menuUrl}" lay-verify="required"
                           placeholder="菜单URL，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">排序</label>
                <div class="layui-input-block">
                    <input name="sort" autocomplete="off" value="${menu.sort}" min="0" lay-verify="required"
                           placeholder="数字，越小越向前" class="layui-input"
                           type="number">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否启用</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="启用"
                           <c:if test="${menu==null||menu.status==1}">checked="checked"</c:if> >
                    <input type="radio" name="status" value="0" title="停用"
                           <c:if test="${menu.status==0}">checked="checked"</c:if>>
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
    <script type="text/javascript">
        layui.use("form_a_e", function () {
            layui.form_a_e.init();
        });
    </script>
</div>
</body>
</html>
