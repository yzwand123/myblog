<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/12/2
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h1>评论管理</h1><hr />
    </div>
    <div class="row with-padding">
        <div class="pull-left col-md-3 col-sm-3 col-xs-8">
            <div class="input-group">
                <div class="input-control search-box  has-icon-left has-icon-right search-example" id="searchbox">
                    <input id="inputSearch" type="search" class="form-control search-input" placeholder="搜索">
                    <label for="inputSearch" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
                </div>
                <span class="input-group-btn">
							<button class="btn btn-primary" type="button">搜索</button>
                </span>
            </div>
        </div>
        <div class="pull-right">
            <button class="btn btn-danger"><i class="icon icon-trash"></i>&nbsp;批量删除</button>
        </div>
    </div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" /></th>
                <th>序号</th>
                <th>昵称</th>
                <th>文章</th>
                <th>评论内容</th>
                <th>评论时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${comments.data}" var="comment" varStatus="s">
                <tr>
                    <th><input type="checkbox" /></th>
                    <td>${s.count}</td>
                    <td>${comment.nickName}</td>
                    <td>${comment.arTitle}</td>
                    <td>${comment.commentContext}</td>
                    <td><fmt:formatDate value="${comment.commentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/findArticleById?articleId=${comment.commentArId}" target="_blank" class="btn btn-info"><i class="icon icon-eye-open"></i>&nbsp;查看</a>
                        <button class="btn btn-danger"><i class="icon icon-trash"></i>&nbsp;删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>


    <div class="row">

        <ul class="pager" data-ride="pager" data-page="${comments.pageCode}" data-rec-total="${comments.totalCount}"
            data-rec-per-page="${comments.pageSize}" data-link-creator="?pageCode={page}&pageSize=${comments.pageSize}"
            data-max-nav-count="6"></ul>

    </div>

</div>



</body>
</html>

