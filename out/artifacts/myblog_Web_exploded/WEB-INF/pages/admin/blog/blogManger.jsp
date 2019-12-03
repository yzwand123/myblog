<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/12/2
  Time: 16:43
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
<body>
<div class="container">
    <div class="row">
        <h1>随笔管理</h1>
        <hr />
    </div>
    <div class="row" style="margin-bottom:10px;">
        <button class="btn btn-danger" id="deleteArticles" type="button"><i class="icon icon-trash"></i>&nbsp;批量删除</button>
    </div>
    <div class="row">
        <form id="articleForm" action="${pageContext.request.contextPath}/article/deleteArticles" method="post">
            <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" id="firstCheck"></th>
                <th>序号</th>
                <th>标题</th>
                <th>作者</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${articles.data}" var="article" varStatus="s">
                <tr>
                    <td><input type="checkbox" value="${article.id}" name="articleId"></td>
                    <td>${s.count}</td>
                    <td>${article.articleTitle}</td>
                    <td>${article.authorName}</td>
                    <td><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/findArticleById?articleId=${article.id}" target="_blank" class="btn btn-info"><i class="icon icon-eye-open"></i>&nbsp;查看</a>
                        <button type="button" class="btn btn-danger" onclick="deleteArticle(${article.id})"><i class="icon icon-trash"></i>&nbsp;删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </form>
    </div>
    <div class="row">

        <ul class="pager" data-ride="pager" data-page="${articles.pageCode}" data-rec-total="${articles.totalCount}"
            data-rec-per-page="${articles.pageSize}" data-link-creator="?pageCode={page}&pageSize=${articles.pageSize}"
            data-max-nav-count="6"
        ></ul>

    </div>

</div>
</body>
<script type="text/javascript">
    $(function () {

        $("#deleteArticles").click(function () {
            var flag = false;
            var cbs = document.getElementsByName("articleId");
            for(var i =0;i<cbs.length; i++){
                if(cbs[i].checked){
                    flag = true;
                    break;
                }

            }
            if(flag){
                if(confirm("您确定要删除选中的条目吗？")){
                    document.getElementById("articleForm").submit();
                }else return;
            }else{
                alert("请选择要删除的条目！");
            }
        });


        $("#firstCheck").click(function () {
            var chs = document.getElementsByName("articleId");
            for(var i =0;i<chs.length; i++){
                chs[i].checked = this.checked;
            }
        });
    });
    function deleteArticle(id) {
        $.ajax({
            url : '${pageContext.request.contextPath}/article/deleteArticle?id='+id,
            type : 'GET',
            dataType : 'json',
            success : function (data) {
                if (data.stateCode == 1){
                    new $.zui.Messager(data.msg, {
                        type: 'success' // 定义颜色主题
                    }).show();
                    setTimeout(function () {
                        location.href = "${pageContext.request.contextPath}/admin/blogManger";
                    },1000);
                }else{
                    new $.zui.Messager(data.msg, {
                        type: 'danger' // 定义颜色主题
                    }).show();
                }
            },
            error : function (data) {
                alert("删除失败！")
            }

        });
    }
</script>
</html>
