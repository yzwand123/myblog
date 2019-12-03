<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/24
  Time: 18:44
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
</head>
<body>
<div class="container">
    <div class="row">
        <form class="form-horizontal" id="form" autocomplete="off">
            <div class="form-group hidden" >
                <label class="col-sm-2 col-md-2 required">id</label>
                <div class="col-sm-10 col-md-10">
                    <input class="form-control" placeholder="id" value="${category.id}" name="id"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 required">名称</label>
                <div class="col-sm-10 col-md-10">
                    <input class="form-control" placeholder="名称" value="${category.categoryname}" name="name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-2 required">简介</label>
                <div class="col-sm-10 col-md-10">
                    <textarea class="form-control" rows="3" name="context" placeholder="简介">${category.categorycontext}</textarea>
                </div>
            </div>
        </form>
    </div>
    <c:if test="${category== null}">
        <div class="row pull-right" style="margin-top: 8px;">
            <button type="button" class="btn btn-success" id="eaddCategory"><i class="icon icon-plus"></i>&nbsp;添加分类</button>
        </div>
    </c:if>
    <c:if test="${category != null}">
        <div class="row pull-right" style="margin-top: 8px;">
            <button type="button" class="btn btn-info" id="updateCategory"><i class="icon icon-pencil"></i>&nbsp;修改分类</button>
        </div>
    </c:if>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var fdata = $("#form").serialize();
        $("#eaddCategory").click(function () {
            $.ajax({
                url : '${pageContext.request.contextPath}/tag/addTag',
                type : 'POST',
                data : fdata,
                cache: false,
                dataType : 'json',
                success : function (data) {
                    if (data.stateCode == 1){
                        new $.zui.Messager(data.msg, {
                            type: 'success' // 定义颜色主题
                        }).show();

                    }else{
                        new $.zui.Messager(data.msg, {
                            type: 'danger' // 定义颜色主题
                        }).show();
                    }
                },
                error : function () {
                    alert("添加失败")
                }
            });
        });

        $("#updateCategory").click(function () {
            $.ajax({
                url : '${pageContext.request.contextPath}/tag/updateTag',
                type : 'POST',
                dataType : 'json',
                cache: false,
                data : fdata,
                success : function () {
                    if (data.stateCode == 1){
                        new $.zui.Messager(data.msg, {
                            type: 'success' // 定义颜色主题
                        }).show();
                    }else{
                        new $.zui.Messager(data.msg, {
                            type: 'danger' // 定义颜色主题
                        }).show();
                    }
                },
                error : function () {
                    alert("修改失败！")
                }
            });
        });
    });
</script>
</html>
