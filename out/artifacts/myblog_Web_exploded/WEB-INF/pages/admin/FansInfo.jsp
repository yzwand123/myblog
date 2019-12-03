<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/12/2
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title></title>
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/zui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/jquery-3.4.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
<body>
<div class="container">
    <div class="row">
        <h1>我的粉丝</h1>
        <hr />
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>账号</th>
                <th>昵称</th>
                <th>邮箱</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${fans.data}" var="fans" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${fans.userName}</td>
                    <td>${fans.nickname}</td>
                    <td>${fans.email}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <ul class="pager" data-ride="pager" data-page="${fans.pageCode}" data-rec-total="${fans.totalCount}"
            data-rec-per-page="${fans.pageSize}" data-link-creator="?pageCode={page}&pageSize=${fans.pageSize}"
            data-max-nav-count="6"
        ></ul>

    </div>

</div>
</body>
</html>

