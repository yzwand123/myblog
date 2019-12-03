<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/23
  Time: 16:48
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
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- 导航头部 -->
        <div class="container">
            <div class="navbar-header">
                <!-- 移动设备上的导航切换按钮 -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-example">
                    <i class="icon icon-th-list"></i>
                </button>
                <!-- 品牌名称或logo -->
                <a class="navbar-brand" style="font-family: '楷体';font-size: 30px;">
                    <i class="icon icon-book icon-2x"></i>
                    Myblog
                </a>
            </div>
            <!-- 导航项目 -->

            <div class="collapse navbar-collapse navbar-collapse-example">
                <!-- 一般导航项目 -->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/user/showLogin">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/showRegister">注册</a></li>
                    <li><a href="">帮助</a></li>
                </ul>
            </div><!-- END .navbar-collapse -->
        </div>
    </div>
</nav>
<div class="container hidden-xs" style="margin-top: 100px;">
    <h1 style="border-bottom: 1px solid #BFBFBF;"><i class="icon icon-user icon-2x"></i>&nbsp;注册新用户</h1>
</div>
<div class="container">
    <div class="col-md-7 col-sm-7 col-xs-12">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-md-2 col-sm-2">邮箱</label>
                <div class="col-md-10 col-sm-10">
                    <input type="text" class="form-control" placeholder="邮箱" name="email">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 col-sm-2">登录用户名</label>
                <div class="col-md-10 col-sm-10">
                    <input type="text" class="form-control" placeholder="不得少于4个字符" name="username">
                    <div class="row with-padding">
                        <span id="umsg"></span>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <label class="col-md-2 col-sm-2">显示昵称</label>
                <div class="col-md-10 col-sm-10">
                    <input type="text" class="form-control" id="exampleInputPassword4" placeholder="不得少于两字符" name="nickname">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 col-sm-2">密码</label>
                <div class="col-md-10 col-sm-10">
                    <input type="password" class="form-control"  placeholder="密码" name="password" id="password">
                    <div class="row with-padding">
                        <span id="pmsg"></span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 col-sm-2">确认密码</label>
                <div class="col-md-10 col-sm-10">
                    <input type="password" class="form-control"  placeholder="确认密码" id="rPassword">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-10">
                    <button type="submit" class="btn btn-info btn-lg">立即注册</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-5 col-sm-5 hidden-xs" style="border-left: 1px solid #BFBFBF;">
        <img src="http://zui.sexy/docs/img/img1.jpg" width="300px" height="300px" class="img-rounded" alt="圆角图片">
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

    });
</script>
</html>
