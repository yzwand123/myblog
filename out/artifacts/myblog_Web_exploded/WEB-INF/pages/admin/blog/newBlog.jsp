<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/30
  Time: 10:23
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/editor/css/editormd.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zui/lib/uploader/zui.uploader.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zui/lib/chosen/chosen.min.css" type="text/css"/>
</head>
<body class="load-indicator" data-loading="正在发布...">
<div class="container">
    <h3>新增随笔</h3><hr />
    <div class="row">
        <form class="form-horizontal" autocomplete="off">
            <div class="col-md-9">
                <div class="form-group">
                    <label class="col-md-1 required">标题</label>
                    <div class="col-md-11">
                        <input type="text" id="title" class="form-control" placeholder="文章标题"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 required">内容摘要</label>
                    <div class="col-md-11">
                        <textarea placeholder="文章内容摘要" class="form-control" rows="4" id="abst"></textarea>
                    </div>
                </div>
                <div id="editor">
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <span><i class="icon icon-file-image"></i>&nbsp;上传图片</span>
                    </div>
                    <div class="panel-body">
                        <div id='impUploader' class="uploader">
                            <div class="uploader-message text-center">
                                <div class="content"></div>
                                <button type="button" class="close">×</button>
                            </div>
                            <div class="uploader-files file-list file-list-lg" data-drag-placeholder="请拖拽文件到此处"></div>
                            <div class="uploader-actions">
                                <div class="uploader-status pull-right text-muted"></div>
                                <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <span><i class="icon icon-cogs"></i>&nbsp;博客设置</span>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="col-md-3 required">标签</label>
                            <div class="col-md-9">
                                <select data-placeholder="给文章加一些标签.." id="tags" class="chosen-select form-control" tabindex="2" multiple="">
                                    <c:forEach items="${tags}" var="tag">
                                        <option value="${tag.tagid}">${tag.tagname}</option>
                                    </c:forEach>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 required">分类</label>
                            <div class="col-md-9">
                                <select class="form-control" id="category">
                                    <option value="">你选择文章分类</option>
                                    <c:forEach items="${cateGories}" var="category">
                                        <option value="${category.id}">${category.categoryname}</option>
                                    </c:forEach>

                                </select>
                            </div>

                        </div>
                        <div class="pull-right" style="margin-top: 8px;">
                            <button type="button" class="btn btn-primary" id="release">发布</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/lib/uploader/zui.uploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/lib/chosen/chosen.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/editormd.min.js"></script>
<script type="text/javascript">
    var editor
    $(function() {
        editor = editormd('editor', {
            placeholder : '开始写博客了',
            width : "100%",
            height : 400,
            syncScrolling: "single",
            path: "${pageContext.request.contextPath}/editor/lib/",
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            saveHTMLToTextarea: true,
            emoji: true,
            taskList: true,
            imageUpload: true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${pageContext.request.contextPath}/admin/uploadImage",//注意你后端的上传图片服务地址
            tocm: true,         // Using [TOCM]
            tex: true, 			   // 开启科学公式TeX语言支持，默认关闭
            flowChart: true,             // 开启流程图支持，默认关闭
            sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
            toolbarIcons : function() {  //自定义工具栏，后面有详细介绍
                return editormd.toolbarModes['full']; // full, simple, mini
            }
        });
        editor.getMarkdown();

    });

    $('select.chosen-select').chosen({
        no_results_text: '没有找到',    // 当检索时没有找到匹配项时显示的提示文本
        disable_search_threshold: 6, // 10 个以下的选择项则不显示检索框
        search_contains: true         // 从任意位置开始检索
    });

    $('#impUploader').uploader({
        url : '${pageContext.request.contextPath}/admin/imgUploader',
        filters : {
            mime_types: [
                {title: '图片', extensions: 'jpg,gif,png'},
                {title: '图标', extensions: 'ico'}
            ],
            // 最大上传文件为 1MB
            max_file_size: '1mb',
            // 不允许上传重复文件
            prevent_duplicates: true
        },
        max_retries : 0



    });
    var upload = $('#impUploader').data('zui.uploader');
    $('#release').click(function () {

        upload.start();
        $("body").addClass("loading");
        $('#impUploader').uploader().on('onUploadComplete',function (files) {

           var title = $('#title').val();
           var abst = $('#abst').val();
           var html = editor.getHTML();
           var tags = $('#tags').val();
           var category = $('#category').val();
           var formData = new FormData();
           formData.append("tile",title);
           formData.append("abst",abst);
           formData.append("html",html);
           formData.append("tags",tags);
           formData.append("category",category);
           $.ajax({
               url : '${pageContext.request.contextPath}/article/saveArticle',
               type : 'POST',
               data : formData,
               dataType : 'json',
               contentType : false,
               processData : false,
               async : true,
               cache : false,
               success : function (data) {
                    if (data.stateCode == 1){
                        $("body").removeClass("loading");
                        new $.zui.Messager(data.msg, {
                            type: 'success' // 定义颜色主题
                        }).show();
                        setTimeout(function () {
                            location.href = "${pageContext.request.contextPath}/admin/newBlog";
                        },1000);
                    }
               }
           });

        })
    });
</script>

</html>

