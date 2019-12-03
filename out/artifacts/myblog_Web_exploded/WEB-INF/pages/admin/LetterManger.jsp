<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/12/3
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h1>私信管理</h1><hr />
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
                    <th>内容</th>
                    <th>邮箱</th>
                    <th>状态</th>
                    <th>私信时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${letters.data}" var="letter" varStatus="s">
                    <tr>
                        <th><input type="checkbox" /></th>
                        <td>${s.count}</td>
                        <td>${letter.nickName}</td>
                        <td>${letter.letterComtext}</td>
                        <td>${letter.email}</td>
                        <td>
                            <c:if test="${letter.letterState == 1}">
                                <span class="bg-green">已回复</span>
                            </c:if>
                            <c:if test="${letter.letterState == 0}">
                                <span class="bg-default">未回复</span>
                            </c:if>
                        </td>
                        <td><fmt:formatDate value="${letter.letterTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <button class="btn btn-info"><i class="icon icon-comment-alt"></i>&nbsp;回复</button>
                            <button class="btn btn-danger"><i class="icon icon-trash"></i>&nbsp;删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    </div>


    <div class="row">

        <ul class="pager" data-ride="pager" data-page="${letters.pageCode}" data-rec-total="${letters.totalCount}"
            data-rec-per-page="${letters.pageSize}" data-link-creator="?pageCode={page}&pageSize=${letters.pageSize}"
            data-max-nav-count="6"
        ></ul>

    </div>

</div>



</body>
</html>

