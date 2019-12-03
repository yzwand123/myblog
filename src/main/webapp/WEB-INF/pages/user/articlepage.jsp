<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/18
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title></title>
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/zui.min.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/spigPet.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-color: #F1F1F1;
        }
        .mumu{width:150px;height:190px;cursor: move;background:url('${pageContext.request.contextPath}/img/spig.png') no-repeat;}
    </style>
    <script type="text/javascript">
        var isindex = true;
        var visitor = true;
    </script>
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
                <li><a href="${pageContext.request.contextPath}/user/ShowSendLetter">私信</a></li>
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
        <div class="col-sm-9 col-md-9 col-xs-12">
            <div class="panel panel-success">
                <div class="panel-body">
                    <article class="article">
                        <header>
                            <h1 class="text-center">${article.articleTitle}</h1>
                            <dl class="dl-inline">
                                <dt>作者：</dt>
                                <dd>${article.authorName}</dd>
                                <dt>发表时间：</dt>
                                <dd><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:ss:mm"/> </dd>
                                <dt></dt>
                                <dd class="pull-right">
                                    <c:forEach items="${article.tags}" var="tag" varStatus="s">
                                             <span class="label label-success">${tag.tagname}</span>
                                    </c:forEach>
                            </dl>
                            <section class="abstract">
                                <p><strong>摘要：</strong>${article.articleAbstract}</p>
                            </section>
                        </header>
                        <section class="content">
                            ${article.articleContext}
                            <c:if test="${article.saveImages.size() != 0}">
                                <c:forEach items="${article.saveImages}" var="image">
                                    <img src="${image.url}" width="250px" height="300px" class="img-thumbnail" alt="缩略图">
                                </c:forEach>
                            </c:if>
                        </section>
                        <footer>
                            <div class="row" style="margin-top: 20px;">

                                <div class="pull-right">
                                    <a><i class="icon icon-eye-open"></i>&nbsp;阅读(${viewCount})</a>&nbsp;
                                    <a id="up"><i class="icon icon-thumbs-up"></i>&nbsp;顶(<span>${thUp}</span>)</a>&nbsp;
                                </div>
                            </div>
                        </footer>
                    </article>
                </div>
            </div>
            <div class="panel panel-danger">
                <div class="panel-body">
                    <div class="row">
                        <div class="comments">
                            <header>
                                <c:if test="${user == null}">
                                    <p class="text-muted">您需要&nbsp;<a href="${pageContext.request.contextPath}/user/showLogin">登录</a>&nbsp;or
                                        &nbsp;<a href="${pageContext.request.contextPath}/user/showRegister">注册</a>&nbsp;才可以评论</p>
                                </c:if>
                                <c:if test="${user != null}">
                                <div class="pull-right"><a href="#commentReply" class="btn btn-primary"><i class="icon-comment-alt"></i> 发表评论</a></div>
                                </c:if>
                                <h3>所有评论</h3>
                            </header>
                            <section class="comments-list">
                                <c:if test="${comments.size() == 0}">
                                    <h4 class="text-muted">还没有评论哦，快来占个沙发吧！</h4>
                                </c:if>
                                <c:if test="${comments.size() != 0}">

                                    <c:forEach items="${comments}" var="comment">
                                        <div class="comment" id="${comment.id}">
                                            <a href="###" class="avatar">
                                                <i class="icon-user icon-2x"></i>
                                            </a>
                                            <div class="content">
                                                <div class="pull-right text-muted">
                                                    <fmt:formatDate value="${comment.commentTime}" pattern="yyyy-MM-dd HH:ss:mm"/>
                                                </div>
                                                <div><a href="###"><strong>${comment.nickName}&nbsp;
                                                    <c:if test="${comment.commentUId == user.id}">
                                                        (自己)
                                                    </c:if>
                                                </strong></a>
                                                    <div class="text">${comment.commentContext}</div>
                                                </div>
                                            </div>
                                            <c:if test="${user != null}">
                                            <div class="actions">
                                                <c:if test="${comment.commentUId == user.id }">
                                                    <a href="javascript:deleteComment(${comment.id})">删除</a>
                                                </c:if>
                                                <c:if test="${user.roleid == 2}">
                                                    <a href="javascript:deleteComment(${comment.id})">删除</a>
                                                </c:if>
                                            </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>

                                </c:if>


                            </section>

                            <footer>
                                <c:if test="${user != null}">
                                <div class="reply-form" id="commentReply">

                                    <a href="###" class="avatar"><i class="icon-user icon-2x"></i></a>
                                    <form class="form">
                                        <div class="form-group">
                                            <textarea class="form-control" id="uComment" name="commentContext" rows="2" placeholder="撰写评论..."></textarea>
                                        </div>
                                        <div class="form-group comment-user">
                                            <div class="row">
                                                <div class="col-md-2"><button type="button" id="commentBtn" class="btn btn-block btn-primary"><i class="icon-ok"></i>评论</button></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
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
                                <button type="button" class="btn btn-success" id="abeFans"><i class="icon icon-plus"></i>&nbsp;关注</button>
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

    });
    $(function () {
        var flag = true;
        $("#commentBtn").click(function () {
                var comment =  $("#uComment").val();
                var arid = ${article.id};
                var cdata = "arid="+arid+"&commentContext="+comment;
                if (comment === ""){
                    alert("评论不可以为空！");
                    return;
                }else {
                    $.ajax({
                        url : '${pageContext.request.contextPath}/comment/userComment',
                        type : 'POST',
                        data : cdata,
                        dataType : 'json',
                        success : function (data) {
                            if (data.stateCode == 1){
                                $(".comments-list").append("<div class='comment'>" +
                                    "<a class='avatar'> <i class='icon-user icon-2x'></i></a>" +
                                    "<div class='content'>" +
                                    "<div class='pull-right text-muted'>刚刚</div>" +
                                    "<div><a><strong>" +data.comment.nickName+" (自己)"+"</strong></a></div>"+
                                    "<div class='text'>"+data.comment.commentContext+"</div>"+
                                    "</div>" +
                                    "</div>");
                                $('#uComment').val("");
                            }else{
                                alert("评论失败");
                                $('#uComment').val("");
                            }
                        }
                    });
                }
            });
        $('#up').click(function () {
          if (flag){

              $.ajax({
                 url : '${pageContext.request.contextPath}/user/userSignUp?arid=${article.id}',
                 type : 'GET',
                 dataType : 'json',
                  success : function (data) {
                      if (data.stateCode == 0){
                          new $.zui.Messager(data.msg, {
                              type: 'danger' // 定义颜色主题
                          }).show();
                      }else {
                          $('#up').css({
                              color : "red"
                          });
                          var value = $("#up > span").html();
                          $("#up > span").html(parseInt(value)+1);
                          flag = false;
                      }
                  }
              });
              flag = false;
          }else {
              $.ajax({
                  url : '${pageContext.request.contextPath}/?arid=${article.id}',
                  type : 'GET',
                  dateType : 'json',
                  success : function (data) {
                      if (data.stateCode == 1){
                          $('#up').css({
                              color : ""
                          });
                          var value = $("#up > span").html();
                          $("#up > span").html(parseInt(value)-1);
                          flag = true;
                      }else {
                          new $.zui.Messager(data.msg, {
                              type: 'danger' // 定义颜色主题
                          }).show();
                      }
                  }

              });

          }
        });
        $('#abeFans').click(function () {
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

    });
    function deleteComment(id){
        $.ajax({
            url :'${pageContext.request.contextPath}/comment/deleteComment?id='+id,
            type : 'GET',
            dataType : 'json',
            success : function (data) {
                if (data.stateCode === 1){
                    $("#"+id).remove();
                }else {
                    alert("删除失败！");
                }
            }

        })
    }
</script>
</html>
