<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/23
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title></title>
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/zui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/jquery-3.4.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
    <style type="text/css">
        body{
            background-color: #F1F1F1;
        }
    </style>
</head>
<body>
<div class="container hidden-xs" style="margin-top: 150px;"></div>
<div class="container">
    <div class="row">
        <div class="col-md-offset-4 col-md-4">
            <div class="panel">
                <div class="panel-body">
                    <div class="row">
                        <h2 align="center"><i class="icon icon-book icon-2x"></i>&nbsp;MyBolg用户登录</h2>
                    </div>
                    <div class="row">
                        <h1 align="center"><i class="icon icon-user icon-3x"></i></h1>
                    </div>
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/Login" method="post" autocomplete="off">
                        <div class="form-group">
                            <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-12">
                                <input type="text" class="form-control" placeholder="用户名/邮箱" name="username" />
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-12">
                                <input type="password" class="form-control" placeholder="密码" name="password" />
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-12">
                                <input type="submit" class="form-control btn" value="登录" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-12">
                                <span>没有账号？<a href="${pageContext.request.contextPath}/user/showRegister">立即注册</a>
                                </span>
                                <span style="color: red">${msg}</span>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>

