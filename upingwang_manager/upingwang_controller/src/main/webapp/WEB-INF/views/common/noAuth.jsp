<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/22 0022
  Time: 上午 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>No Permission</title>
    <link href="/resources/css/errorpage.css" rel="stylesheet">
    <style>
        *{ margin:0; padding:0; list-style:none;}
        table{border-collapse:collapse;border-spacing:0;}
        body,html{ height:100%; font-family:'微软雅黑'; overflow-y:hidden;}
        .main{ width:60%; margin-left:20%; margin-right:20%; margin-top:10%;}
        .main_left{ width:38%; margin-left:12%; margin-top:10%; float:left;}
        .main_right{width:50%; float:left;}
        .main_radius{ padding-top:4%; width:75%; height:130px; border-radius:50%; background:#fef2ec; font-size:18px;text-align:center;}

    </style>
</head>
<body>
<div class="main">
    <div class="main_left"><img src="/resources/images/noAuth.png" width="229" height="128"/></div>
    <div class="main_right">
        <div class="main_radius">
            <p class="main_p">没有权限哦！！！</p>
            <p class="main_p">您的权限不足啊，这可咋整！</p>
        </div>
        <div class="text-left" style="margin-top:10%; margin-left:8%;">
            <a href="/index" class="button bg-yellow">返回首页</a>
        </div>
    </div>
</div>
</body>
</html>
