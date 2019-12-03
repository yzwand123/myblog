<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/18
  Time: 16:08
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
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/spigPet.css" rel="stylesheet" />
    <script type="text/javascript">
        var isindex = true;
        var visitor = true;
    </script>
    <style type="text/css">
        body{
            background-color: #F1F1F1;
        }
        .mumu{width:150px;height:190px;cursor: move;background:url('${pageContext.request.contextPath}/img/spig.png') no-repeat;}
    </style>
</head>
<body>
<div id="spig" class="spig">
    <div id="message">老王正在赶来的路上。。。。。</div>
    <div id="mumu" class="mumu"></div>
</div>
<nav class="navbar" role="navigation" style="background-color:#FFFFFF ;">
    <div class="container">
        <!-- 导航头部 -->
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
            <ul class="nav navbar-nav">
                <li class="active"><a href="https://www.cnblogs.com/">博客园</a></li>
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/admin">新随笔</a></li>
                <li><a>私信</a></li>
                <li><a href="${pageContext.request.contextPath}/user/admin">管理</a></li>
            </ul>

            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/" autocomplete="off">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索" name="key" value="${key}">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>


        </div>

        <!-- END .navbar-collapse -->
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-md-9 col-xs-12 col-sm-9">
            <div class="panel panel-success">
                <div class="panel-body">
                    <div class="container">
                        <div class="items items-hover">
                            <c:forEach items="${articles.data}" var="article">
                            <div class="item">
                                <div class="item-heading">
                                    <div class="pull-right label label-success">原创</div>
                                    <h4><a href="${pageContext.request.contextPath}/findArticleById?articleId=${article.id}">${article.articleTitle}</a></h4>
                                </div>
                                <div class="item-content">
                                    <div class="media pull-right">
                                        <img src="http://zui.sexy/docs/img/img2.jpg" alt="">
                                    </div>
                                    <div class="text" style="font-size: 16px">
                                            ${article.articleAbstract}
                                        <a href="${pageContext.request.contextPath}/findArticleById?articleId=${article.id}" class="btn btn-link">阅读全文>></a>
                                    </div>
                                </div>
                                <div class="item-footer">
                                    <span class="text-muted"><i class="icon icon-user"></i>&nbsp;${article.authorName}</span>&nbsp;
                                    <span class="text-muted">
                                       <i class="icon icon-time"></i>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:ss:mm"/>
                                    </span>
                                </div>
                            </div>
                            </c:forEach>
                            <footer>
                                <c:if test="${tagId == null && categoryId == null}">
                                <ul class="pager" data-ride="pager" data-page="${articles.pageCode}" data-rec-total="${articles.totalCount}"
                                    data-rec-per-page="${articles.pageSize}" data-link-creator="?pageCode={page}&pageSize=${articles.pageSize}&key=${key}"
                                ></ul>
                                </c:if>
                                <c:if test="${tagId != null}">
                                    <ul class="pager" data-ride="pager" data-page="${articles.pageCode}" data-rec-total="${articles.totalCount}"
                                        data-rec-per-page="${articles.pageSize}" data-link-creator="?pageCode={page}&pageSize=${articles.pageSize}&tagId=${tagId}"
                                    ></ul>
                                </c:if>
                                <c:if test="${categoryId != null}">
                                    <ul class="pager" data-ride="pager" data-page="${articles.pageCode}" data-rec-total="${articles.totalCount}"
                                        data-rec-per-page="${articles.pageSize}" data-link-creator="?pageCode={page}&pageSize=${articles.pageSize}&categoryId=${categoryId}"
                                    ></ul>
                                </c:if>
                            </footer>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-3 col-sm-3 col-xs-12">

            <div class="panel panel-warning">

                <div class="panel-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <img src="http://zui.sexy/docs/img/img2.jpg" width="100px" height="100px" class="img-circle" alt="圆形图片">
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <span style="font-size: 20px;">小菜鸡</span><br>
                                <button type="button" class="btn btn-success" id="beFans"><i class="icon icon-plus"></i>&nbsp;关注</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6 col-sm-6" style="border-right: 1px solid #BFBFBF;">
                                <span style="font-size: 20px;">${map.articleCount}&nbsp;总随笔</span>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <span style="font-size: 20px;">${map.fanCount}&nbsp;粉丝</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-body">
                    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="100%" height=86
                            src="//music.163.com/outchain/player?type=2&id=1403445370&auto=1&height=66">
                    </iframe>
                </div>
            </div>


            <div class="panel">
                <div class="panel-heading">
                    <span><i class="icon icon-tags"></i>&nbsp;我的标签</span>
                </div>
                <div class="panel-body">
                    <c:forEach items="${map.htags}" var="tag">
                    <a href="${pageContext.request.contextPath}/findArticleByTag?tagId=${tag.tagid}" class="bg-info" style="font-size: 12px;float: left;margin: 2px;padding: 4px;border-radius: 6px">${tag.tagname}&nbsp;(${tag.tagcount})</a>
                    </c:forEach>
                </div>
            </div>


            <div class="panel">
                <div class="panel-heading">
                    <span><i class="icon icon-pencil"></i>&nbsp;随笔分类</span>
                </div>

                <div class="panel-body" style="padding: 0;">
                    <div class="list-group" style="border: none;">
                        <c:forEach items="${map.hcategorys}" var="hcategorys">
                        <a href="${pageContext.request.contextPath}/findArticleByCategory?categoryId=${hcategorys.id}" class="list-group-item">
                            ${hcategorys.categoryname}
                            <span class="label label-danger label-badge pull-right">${hcategorys.categorycount}</span>
                        </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="icon icon-file-text-o"></i>&nbsp;阅读排行榜</span>
                </div>
                <div class="panel-body">
                    <c:forEach items="${map.harticleLink}" var="harticleLink" varStatus="s">
                    <div class="row" style="font-size: 12px;">
                        <div class="pull-left">
                            <p class="pull-left text">
                                <a href="${pageContext.request.contextPath}/findArticleById?articleId=${harticleLink.art_id}">${s.count}.${harticleLink.articletitle}</a>
                            </p>
                        </div>
                        <div class="pull-right">
                        <span class="label label-warning label-badge">${harticleLink.aview}</span>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
<script src="http://static.tctip.com/tctip-1.0.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/spig.js"></script>
<script type="text/javascript">

    jQuery(document).ready(function ($) {
        $("#spig").mousedown(function (e) {
            if(e.which==3){
                showMessage("秘密通道:<br /><a data-remote=\"/myblog/talk\" data-moveable=\"inside\" data-backdrop=\"false\" data-toggle=\"modal\" title=\"来找老王聊聊？\">隔壁老王</a>" +
                    "&nbsp;<a>聊天室</a>",10000);
            }
        });
        $("#spig").bind("contextmenu", function(e) {
            return false;
        });
    });

    $(function(){
        $('#beFans').click(function () {
            $.ajax({
                url : '${pageContext.request.contextPath}/user/addFans',
                type : 'GET',
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
                }
            });
        });
        new tctip({
            top: '20%',
            button: {
                id: 1,
                type: 'dashang',
            },
            list: [
                {
                    type: 'alipay',
                    qrImg: '${pageContext.request.contextPath}/img/alipay.png'
                }, {
                    type: 'wechat',
                    qrImg: '${pageContext.request.contextPath}/img/wechat.png'
                }
            ]
        }).init();
    });
</script>
</html>
