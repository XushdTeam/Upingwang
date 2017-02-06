<%--
  Created by IntelliJ IDEA.
  User: Xushd
  Date: 2017/2/6 0006
  Time: 上午 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学校注册</title>
    <jsp:include page="../common/head.jsp"/>
</head>
<body>
<div class="main-wrap">
    <blockquote class="layui-elem-quote fhui-admin-main_hd">
        <h2>学校注册</h2>
    </blockquote>
    <blockquote class="layui-elem-quote fhuaui-tip">
        <p><i class="fa fa-info-circle" aria-hidden="true"></i>注册成功，默认为停用状态，需要管理员为学校创建独立数据库后方可正常使用!</p>
        <p><i class="fa fa-info-circle" aria-hidden="true"></i>注册成功，系统会为该学校分配默认管理员帐号，帐号格式请到学校管理模块中查看!</p>
    </blockquote>
    <div class="site-text site-block">
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">教育局名称</label>
                <div class="layui-input-block">
                    <select lay-verify="required" name="bureauId">
                        <option value="">请选择教育局</option>
                        <c:forEach var="item" items="${bureauList}">
                            <option value="${item.id}">${item.bureauName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学校名称</label>
                <div class="layui-input-block">
                    <input name="schoolName" autocomplete="off" lay-verify="required" maxlength="50"
                           placeholder="学校名称，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学校联系人</label>
                <div class="layui-input-block">
                    <input name="schoolLinkman" autocomplete="off" lay-verify="required" maxlength="50"
                           placeholder="学校联系人，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input name="schoolLinkphone" autocomplete="off" lay-verify="required" maxlength="50"
                           placeholder="学校联系人，50字符内" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label form-textarea-label">学校地址</label>
                <div class="layui-input-block">
                    <textarea name="schoolAddress" lay-verify="required" placeholder="请输入学校地址，200字符内"
                              class="layui-textarea form-textarea" maxlength="200"
                              style="margin-top: 0px; margin-bottom: 0px; height: 50px;"></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="height: 150px;">
                <label class="layui-form-label form-upload-label">学校LOGO</label>
                <div class="layui-input-block">
                    <div class="site-upload normal">
                        <img id="imgShow" src="/resources/images/logo_s.png">
                        <input type="hidden" name="schoolLogo" id="schoolLogo" value=""/>
                        <div class="site-upbar">
                            <input type="file" name="schoolLogo" class="layui-upload-file" lay-ext="jpg|png|gif">
                        </div>
                        <span class="loading"></span>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="btnsubmit" data-href="${saveUrl}">注册学校</button>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="/resources/js/event.js"></script>
    <script type="text/javascript">
        layui.use(['form', 'upload', 'common'], function () {
            var $ = layui.jquery,
                    form = layui.form(),
                    common = layui.common;

            /**
             * 绑定上传事件
             */
            layui.upload({
                url: '${uploadUrl}',
                before: function (input) {
                    $(".loading").show();
                },
                success: function (res) {
                    $(".loading").hide();
                    if (res.status == 200) {
                        common.layerAlertS(res.message);
                        document.getElementById("imgShow").src = res.data;
                        $("#schoolLogo").val(res.data);
                    } else {
                        common.layerAlertE(res.message, '提示');
                    }
                }
            });

            form.on("submit(btnsubmit)", function (formdata) {
                var logo = $("#schoolLogo").val();
                if (logo == "") {
                    common.layerMessageE("LOGO请上传！");
                } else {
                    formdata.field.schoolLogo = logo;
                    var url = $(formdata.elem).data("href");
                    common.ajaxPost(url, formdata.field, function (e, r) {
                        if (e) {
                            common.layerAlertE(e, '提示');
                        } else {
                            common.layerAlertS(r.message);
                            common.time(function () {
                                window.location.href = "${baseUrl}";
                            });
                        }
                    });
                }
                return false;
            });
        });
    </script>
</div>
</body>
</html>
