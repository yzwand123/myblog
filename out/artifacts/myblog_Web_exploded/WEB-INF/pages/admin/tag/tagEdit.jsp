<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/24
  Time: 11:20
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
        <c:if test="${tag != null}">
            <form class="form-horizontal" id="uform" autocomplete="off">
                <div class="form-group hidden">
                    <label class="col-sm-2 col-md-2 required">id</label>
                    <div class="col-sm-10 col-md-10">
                        <input class="form-control" placeholder="id" value="${tag.id}" name="id"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-md-2 required">名称</label>
                    <div class="col-sm-10 col-md-10">
                        <input class="form-control" placeholder="名称" value="${tag.tagname}" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-md-2 required">简介</label>
                    <div class="col-sm-10 col-md-10">
                        <textarea class="form-control" rows="3" name="context" placeholder="简介">${tag.tagcontext}</textarea>
                    </div>
                </div>
            </form>
        </c:if>

        <c:if test="${tag == null}">
            <form class="form-horizontal" id="aform" autocomplete="off">
                <div class="form-group hidden">
                    <label class="col-sm-2 col-md-2 required">id</label>
                    <div class="col-sm-10 col-md-10">
                        <input class="form-control" placeholder="id"  name="id"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-md-2 required">名称</label>
                    <div class="col-sm-10 col-md-10">
                        <input class="form-control" placeholder="名称" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-md-2 required">简介</label>
                    <div class="col-sm-10 col-md-10">
                        <textarea class="form-control" rows="3" name="context" placeholder="简介"></textarea>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
    <c:if test="${tag == null}">
    <div class="row pull-right" style="margin-top: 8px;">
        <button type="button" class="btn btn-success" id="eaddTag"><i class="icon icon-plus"></i>&nbsp;添加标签</button>
    </div>
    </c:if>
    <c:if test="${tag != null}">
        <div class="row pull-right" style="margin-top: 8px;">
            <button type="button" class="btn btn-info" id="updateTag"><i class="icon icon-pencil"></i>&nbsp;修改标签</button>
        </div>
    </c:if>
</div>
</body>
<script type="text/javascript">
    $(function () {

        $("#eaddTag").click(function () {
            var adata = $("#aform").serialize();
            $.ajax({
                url : '${pageContext.request.contextPath}/tag/addTag',
                type : 'POST',
                dataType : 'json',
                cache: false,
                data : adata,
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

        $("#updateTag").click(function () {
            var udata = $("#uform").serialize();
            $.ajax({
                url : '${pageContext.request.contextPath}/tag/updateTag',
                type : 'POST',
                dataType : 'json',
                cache: false,
                data : udata,
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
                    alert("修改失败！")
                }
            });
        });
    });
</script>
</html>
