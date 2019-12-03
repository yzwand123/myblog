<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/26
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link type="text/css" href="${pageContext.request.contextPath}/zui/css/zui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
    <style type="text/css">
        .wang span {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 10px;
            background: #0181cc;
            color: #fff;
        }

        .me {
            margin: 10px;
            text-align: right;
        }

        .me span {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 10px;
            background: #ef8201;
            color: #fff;

        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-success">
        <div class="panel-body scrollbar-hover" style="max-height: 300px;overflow: scroll;height: 260px;" id="words">

            <div class="wang"><span>老王：您的隔壁老王为您服务！</span></div>
        </div>
    </div>

    <div class="panel ">
        <div class="panel-body">
            <form class="form-horizontal">
                <div class="form-inline">
                    <div class="col-xs-10">
                        <input type="text" class="form-control" id="msg" autocomplete="off" />
                    </div>
                    <div class="col-xs-2">
                        <button type="button" class="btn btn-primary" id="send">发送</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    $(function () {
        var words = document.getElementById("words");

        var msg = document.getElementById("msg");

        var send = document.getElementById("send");
        send.onclick = function() {
            var str = "";
            if ("" == msg.value) {
                alert("消息不能为空！");
                return;
            } else {
                str = "<div class='me'><span>" + msg.value + "：我</span></div>";
            }
            words.innerHTML = words.innerHTML + str;
            words.scrollTop = words.scrollHeight;
            var msgValue = msg.value;
            msg.value = "";
            $.ajax({
                url : '${pageContext.request.contextPath}/startTalk?msg='+msgValue,
                type : 'GET',
                dataType : 'json',
                success : function (data) {
                    if (data.message == "success"){
                        $('#words').append("<div class='wang'><span>老王："+data.data.info.text+"</span></div>");
                        words.scrollTop = words.scrollHeight;
                    }else {
                        $('#words').append("<div class='wang'><span>老王：这个老王还不知道哦！</span></div>");
                        words.scrollTop = words.scrollHeight;
                    }
                }
            });


        }
    });

</script>
</html>

