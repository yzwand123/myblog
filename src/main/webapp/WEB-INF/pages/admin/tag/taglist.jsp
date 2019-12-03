<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/23
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1>标签管理</h1>
        <hr />
    </div>
    <div class="row" style="margin-bottom:10px;">
        <div class="pull-left">
            <button class="btn btn-danger" type="button" id="deleteTags"><i class="icon icon-trash"></i>&nbsp;批量删除</button>
            <button type="button" class="btn btn-success" id="addTag"><i class="icon icon-plus"></i>&nbsp;添加标签</button>
        </div>
        <div class="pull-right">
            <button class="btn btn-primary" id="tagFlush"><i class="icon icon-refresh"></i>&nbsp;刷新</button>
        </div>
    </div>
    <div class="row">
        <form id="tagForm" action="${pageContext.request.contextPath}/tag/deleteTags" method="post">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" id="firstCheck"></th>
                <th>序号</th>
                <th>名称</th>
                <th>简介</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${tags.totalCount == 0}">
                <tr><td><h1>您还没有数据哦！</h1></td></tr>
            </c:if>
            <c:forEach items="${tags.data}" var="tag" varStatus="s">
            <tr>
                <td><input type="checkbox" value="${tag.tagid}" name="tagId"></td>
                <td>${s.count}</td>
                <td>${tag.tagname}</td>
                <td>${tag.tagcontext}</td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="deleteTag(${tag.tagid})"><i class="icon icon-trash"></i>删除</button>
                    <button type="button" class="btn btn-info" onclick="updateTag(${tag.tagid})"><i class="icon icon-pencil"></i>修改</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        </form>
    </div>
    <div class="row">

        <ul class="pager" data-ride="pager" data-page="${tags.pageCode}" data-rec-total="${tags.totalCount}"
            data-rec-per-page="${tags.pageSize}" data-link-creator="?pageCode={page}&pageSize=${tags.pageSize}"
        ></ul>

    </div>

</div>
</body>
<script type="text/javascript">

    $(function () {

        $("#deleteTags").click(function () {
            var flag = false;
            var cbs = document.getElementsByName("tagId");
            for(var i =0;i<cbs.length; i++){
                if(cbs[i].checked){
                    flag = true;
                    break;
                }

            }
            if(flag){
                if(confirm("您确定要删除选中的条目吗？")){
                    document.getElementById("tagForm").submit();
                }else return;
            }else{
                alert("请选择要删除的条目！");
            }
        });

        $("#firstCheck").click(function () {
            var chs = document.getElementsByName("tagId");
            for(var i =0;i<chs.length; i++){
                chs[i].checked = this.checked;
            }
        });

        $('#addTag').click(function () {
            new $.zui.ModalTrigger({
                title : '添加标签',
                type : 'ajax',
                remote: '${pageContext.request.contextPath}/tag/showTagEdit'
            }).show();
        });

        $("#tagFlush").click(function () {
            location.href = "${pageContext.request.contextPath}/tag/tagList"
        });
    });

    function deleteTag(id) {
        if (confirm("您确定要删除吗？")){
            $.ajax({
                url : "${pageContext.request.contextPath}/tag/deleteTag?id="+id,
                type : "GET",
                dataType: "json",
                success : function (data) {
                    if (data.stateCode == 1){
                        new $.zui.Messager(data.msg, {
                            type: 'success' // 定义颜色主题
                        }).show();
                        setTimeout(function () {
                            location.href = "${pageContext.request.contextPath}/tag/tagList";
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
        }else return;
    }

    function updateTag(id){
        new $.zui.ModalTrigger({
            title : '修改标签',
            type : 'ajax',
            remote: '${pageContext.request.contextPath}/tag/showTagEdit?id='+id
        }).show();
    }



</script>
</html>

