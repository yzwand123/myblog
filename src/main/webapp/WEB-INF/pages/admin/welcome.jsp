<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2019/11/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/zui/css/zui.min.css" />
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 20px;">
        <div class="alert alert-primary with-icon">
            <i class="icon icon-user"></i>
            <div class="content">
                <h4>管理员,欢迎回来。</h4>
            </div>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading">
            <p>数据统计</p>
        </div>
        <div class="panel-body">
            <div class="col-xs-4">
                <a>
                    <div class="alert with-icon">
                        <i class="icon icon-edit"></i>
                        <div class="content">
                            <h4>随笔数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${articleCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-4">
                <a>
                    <div class="alert alert-success with-icon">
                        <i class="icon icon-user"></i>
                        <div class="content">
                            <h4>粉丝数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${fansCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-4">
                <a>
                    <div class="alert alert-warning with-icon">
                        <i class="icon icon-envelope-alt"></i>
                        <div class="content">
                            <h4>私信数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${letterCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-4">
                <a>
                    <div class="alert alert-danger with-icon">
                        <i class="icon icon-heart"></i>
                        <div class="content">
                            <h4>获赞数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${thCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-4">
                <a>
                    <div class="alert alert-info with-icon">
                        <i class="icon icon-eye-open"></i>
                        <div class="content">
                            <h4>今日访问数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${visitorTodayCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-4">
                <a>
                    <div class="alert alert-primary with-icon">
                        <i class="icon icon-eye-open"></i>
                        <div class="content">
                            <h4>总访问数</h4>
                            <div class="card-content">
                                <span style="font-size:18px"><strong>${visitorAllCount}</strong></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="panel panel-danger">
        <div class="panel-heading">
            <p>一周访客统计</p>
        </div>
        <div class="panel-body">
            <div class="container">
                <div class="row">
                    <div class="pull-right">

                        <button class="btn btn-link" onclick="getData()"><span><i class="icon icon-refresh"></i></span></button>
                    </div>
                </div>
                <div class="row">

                    <canvas id="Chart" height="120"></canvas>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/js/zui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/lib/chart/zui.chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/zui/lib/ieonly/excanvas.js"></script>
<script type="text/javascript">

    $(function () {
        getData();

    });
    function getData() {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/getData',
            type : 'GET',
            dataType : 'json',
            success : function (data) {
                var datas = [];
                for (var i in data) {
                    datas.push(data[i].vcount);
                }
                var chdata = {
                    labels: ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"],
                    datasets: [
                        {
                            label: "访问量",
                            color: 'green',
                            data:datas
                        }
                    ]
                };

                var options = {responsive: true}; // 图表配置项，可以留空来使用默认的配置
                var BarChart = $('#Chart').lineChart(chdata, options);

            }

        });
    }

</script>
</html>
