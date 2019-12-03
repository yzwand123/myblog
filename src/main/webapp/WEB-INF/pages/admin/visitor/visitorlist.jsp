<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/23
  Time: 12:57
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
        <h1>访客管理</h1><hr />
    </div>
    <div class="row" style="margin-bottom: 10px">
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
            <button class="btn btn-danger" id="deleteVisitors"><i class="icon icon-trash"></i>&nbsp;批量删除</button>
        </div>
    </div>
    <div class="row">
        <form id="visitorForm" action="${pageContext.request.contextPath}/visitor/deleteVisitors" method="post">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" id="firstCheck" /></th>
                <th>序号</th>
                <th>名称</th>
                <th>ip地址</th>
                <th>所在城市</th>
                <th>访问时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${visitors.totalCount == 0}">
                <tr><td><h1>您还没有数据哦！</h1></td></tr>
            </c:if>
            <c:forEach items="${visitors.data}" var="visitor" varStatus="s">
            <tr>
                <th><input type="checkbox" value="${visitor.id}" name="visitorId"/></th>
                <td>${s.count}</td>
                <td>${visitor.name}</td>
                <td>${visitor.ip}</td>
                <td>${visitor.location}</td>
                <td><fmt:formatDate value="${visitor.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <button class="btn btn-danger" onclick="deleteVisitor(${visitor.id})"><i class="icon icon-trash"></i>&nbsp;删除</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        </form>
    </div>


    <div class="row">

        <ul class="pager" data-ride="pager" data-page="${visitors.pageCode}" data-rec-total="${visitors.totalCount}"
            data-rec-per-page="${visitors.pageSize}" data-link-creator="?pageCode={page}&pageSize=${visitors.pageSize}"
            data-max-nav-count="6"></ul>

    </div>

</div>

</body>
<script type="text/javascript">
    $(function () {

        $("#deleteVisitors").click(function () {
            var flag = false;
            var cbs = document.getElementsByName("visitorId");
            for(var i =0;i<cbs.length; i++){
                if(cbs[i].checked){
                    flag = true;
                    break;
                }

            }
            if(flag){
                if(confirm("您确定要删除选中的条目吗？")){
                    document.getElementById("visitorForm").submit();
                }else return;
            }else{
                alert("请选择要删除的条目！");
            }
        });

        $("#firstCheck").click(function () {
            var chs = document.getElementsByName("visitorId");
            for(var i =0;i<chs.length; i++){
                chs[i].checked = this.checked;
            }
        });
    });


    function deleteVisitor(id) {
        if (confirm("您确定要删除吗？")){
            $.ajax({
                url : "${pageContext.request.contextPath}/visitor/deleteVisitor?id="+id,
                type : "GET",
                dataType: "json",
                success : function (data) {
                    if (data.stateCode == 1){
                        new $.zui.Messager(data.msg, {
                            type: 'success' // 定义颜色主题
                        }).show();
                        setTimeout(function () {
                            location.href = "${pageContext.request.contextPath}/visitor/visitorList"
                        },1000)
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
        }else return;
    }
</script>
</html>

