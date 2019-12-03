<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/12/3
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
<div class="container">
    <div class="row">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 col-md-2 required">私信内容</label>
                <div class="col-sm-10 col-md-10">
                    <textarea class="form-control" rows="3"></textarea>
                </div>
            </div>
        </form>
    </div>
    <div class="row pull-right" style="margin-top: 8px;">
        <button type="button" class="btn btn-success"><i class="icon icon-envelope-alt"></i>&nbsp;发送</button>
    </div>
</div>
</body>
</html>

