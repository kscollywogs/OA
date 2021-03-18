<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/13/2021
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Queue"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<!--begin::Head-->
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>自动化工程技术公司工作量汇总查询系统</title>
    <meta name="description" content="山东省冶金设计院股份有限公司 - 自动化工程技术分公司，工作量汇总统计查询，自动化办公系统。" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Page Vendors Styles(used by this page)-->
    <link href="<%=basePath%>dist/assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Page Vendors Styles-->
    <!--begin::Global Theme Styles(used by all pages)-->
    <link href="<%=basePath%>dist/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Global Theme Styles-->
    <!--begin::Layout Themes(used by all pages)-->
    <link href="<%=basePath%>dist/assets/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/brand/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/aside/light.css" rel="stylesheet" type="text/css" />
    <!--end::Layout Themes-->
    <link rel="shortcut icon" href="<%=basePath%>dist/assets/media/logos/favicon.ico" />
</head>
<!--end::Head-->
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
<!--begin::Main-->
<!--begin::Header Mobile-->
<%@ include file="dist/partials/headerMobile.jsp" %>
<!--end::Header Mobile-->
<div class="d-flex flex-column flex-root">
    <!--begin::Page-->
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::Aside-->
<%--        <%@ include file="dist/partials/aside.jsp" %>--%>
        <div class="aside aside-left aside-fixed d-flex flex-column flex-row-auto" id="kt_aside">
            <!--begin::Brand-->
            <div class="brand flex-column-auto" id="kt_brand">
                <!--begin::Logo-->
                <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo">
                    <img alt="Logo" src="<%=basePath%>dist/assets/media/my/SDM.png" style="width: 70%" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" />
                </a>
                <!--end::Logo-->
                <!--begin::Toggle-->
                <button class="brand-toggle btn btn-sm px-0" id="kt_aside_toggle">
                    <span class="svg-icon svg-icon svg-icon-xl">
                        <!--begin::Svg Icon | path:dist/assets/media/svg/icons/Navigation/Angle-double-left.svg-->
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <polygon points="0 0 24 0 24 24 0 24" />
                                <path d="M5.29288961,6.70710318 C4.90236532,6.31657888 4.90236532,5.68341391 5.29288961,5.29288961 C5.68341391,4.90236532 6.31657888,4.90236532 6.70710318,5.29288961 L12.7071032,11.2928896 C13.0856821,11.6714686 13.0989277,12.281055 12.7371505,12.675721 L7.23715054,18.675721 C6.86395813,19.08284 6.23139076,19.1103429 5.82427177,18.7371505 C5.41715278,18.3639581 5.38964985,17.7313908 5.76284226,17.3242718 L10.6158586,12.0300721 L5.29288961,6.70710318 Z" fill="#000000" fill-rule="nonzero" transform="translate(8.999997, 11.999999) scale(-1, 1) translate(-8.999997, -11.999999)" />
                                <path d="M10.7071009,15.7071068 C10.3165766,16.0976311 9.68341162,16.0976311 9.29288733,15.7071068 C8.90236304,15.3165825 8.90236304,14.6834175 9.29288733,14.2928932 L15.2928873,8.29289322 C15.6714663,7.91431428 16.2810527,7.90106866 16.6757187,8.26284586 L22.6757187,13.7628459 C23.0828377,14.1360383 23.1103407,14.7686056 22.7371482,15.1757246 C22.3639558,15.5828436 21.7313885,15.6103465 21.3242695,15.2371541 L16.0300699,10.3841378 L10.7071009,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(15.999997, 11.999999) scale(-1, 1) rotate(-270.000000) translate(-15.999997, -11.999999)" />
                            </g>
                        </svg>
                        <!--end::Svg Icon-->
                    </span>
                </button>
                <!--end::Toolbar-->
            </div>
            <!--end::Brand-->
            <!--begin::Aside Menu-->
            <div class="aside-menu-wrapper flex-column-fluid" id="kt_aside_menu_wrapper">
                <!--begin::Menu Container-->
                <div id="kt_aside_menu" class="aside-menu my-4" data-menu-vertical="1" data-menu-scroll="1" data-menu-dropdown-timeout="500">
                    <!--begin::Menu Nav-->
                    <ul class="menu-nav">
                        <li class="menu-item menu-item-active" aria-haspopup="true" ${user.power!=0?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/index.jsp" class="menu-link">
                                <i class="menu-icon flaticon-home-2"></i>
                                <span class="menu-text">首页</span>
                            </a>
                        </li>

                        <li class="menu-section" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <h4 class="menu-text">工作量记录</h4>
                            <i class="menu-icon ki ki-bold-more-hor icon-md"></i>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/designWorkingServlet?method=getAllProjectByUser" class="menu-link">
                                <i class="menu-icon flaticon2-poll-symbol"></i>
                                <span class="menu-text">设计</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getAllProjectByUser" class="menu-link">
                                <i class="menu-icon flaticon-technology-2"></i>
                                <span class="menu-text">编程/画面</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/debugWorkingServlet?method=getAllProjectByUser" class="menu-link">
                                <i class="menu-icon flaticon2-box"></i>
                                <span class="menu-text">调试/管理</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/manageWorkingServlet?method=getAllProjectByUser" class="menu-link">
                                <i class="menu-icon flaticon2-website"></i>
                                <span class="menu-text">经营管理</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/dist/forms/daily.jsp" class="menu-link">
                                <i class="menu-icon flaticon2-percentage"></i>
                                <span class="menu-text">日常其他</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/dist/forms/transfer.jsp" class="menu-link">
                                <i class="menu-icon flaticon2-map"></i>
                                <span class="menu-text">借调</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/addProjectServlet?method=getPeopleInfo" class="menu-link">
                                <i class="menu-icon flaticon2-contract"></i>
                                <span class="menu-text">科室项目</span>
                            </a>
                        </li>

                        <li class="menu-section" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <h4 class="menu-text">个人查询</h4>
                            <i class="menu-icon ki ki-bold-more-hor icon-md"></i>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/personalSummaryServlet?method=getAllWorkingList" class="menu-link">
                                <i class="menu-icon flaticon2-analytics"></i>
                                <span class="menu-text">工作量记录</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/personalProjectServlet?method=getAllPersonalProject" class="menu-link">
                                <i class="menu-icon flaticon2-sheet"></i>
                                <span class="menu-text">参与项目</span>
                            </a>
                        </li>

                        <li class="menu-section" ${user.power!=0?"":"hidden"}>
                            <h4 class="menu-text">科室查询</h4>
                            <i class="menu-icon ki ki-bold-more-hor icon-md"></i>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power!=0?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/departmentSummaryServlet?method=getWorkingList" class="menu-link">
                                <i class="menu-icon flaticon2-analytics-2"></i>
                                <span class="menu-text">工作量记录</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power!=0?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/countSummaryServlet?method=getHistorySummary" class="menu-link">
                                <i class="menu-icon flaticon2-browser-2"></i>
                                <span class="menu-text">统计汇总</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==1||user.power==2?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/projectServlet?method=getAllProject" class="menu-link">
                                <i class="menu-icon flaticon2-checking"></i>
                                <span class="menu-text">科室项目</span>
                            </a>
                        </li>

                        <li class="menu-section" ${user.power==0?"":"hidden"}>
                            <h4 class="menu-text">管理</h4>
                            <i class="menu-icon ki ki-bold-more-hor icon-md"></i>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==0?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/dist/root/register.jsp" class="menu-link">
                                <i class="menu-icon flaticon-doc"></i>
                                <span class="menu-text">添加人员</span>
                            </a>
                        </li>
                        <li class="menu-item" aria-haspopup="true" ${user.power==0?"":"hidden"}>
                            <a href="${pageContext.request.contextPath}/manageUserServlet?method=findAllUser" class="menu-link">
                                <i class="menu-icon flaticon-tool"></i>
                                <span class="menu-text">编辑人员</span>
                            </a>
                        </li>
                    </ul>
                    <!--end::Menu Nav-->
                </div>
                <!--end::Menu Container-->
            </div>
            <!--end::Aside Menu-->
        </div>
        <!--end::Aside-->
        <!--begin::Wrapper-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <!--begin::Header-->
            <%@ include file="dist/partials/header.jsp" %>
            <!--end::Header-->
            <!--begin::Content-->
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <!--begin::Subheader-->
                <%@ include file="dist/partials/subheader.jsp" %>
                <!--end::Subheader-->
                <!--begin::Entry-->
                <div class="d-flex flex-column-fluid">
                    <!--begin::Container-->
                    <div class="container">
                        <!--begin::Dashboard-->
                        <div class="row">
                            <div class="container-fluid col-md-12">
                                <div class="alert alert-custom alert-notice alert-light-success fade show" role="alert">
                                    <div class="alert-icon">
                                        <i class="flaticon-light"></i>
                                    </div>
                                    <div class="alert-text"
                                         style="font-size: large">你好，${sessionScope.user.name} ！！😁😊</div>
                                    <div class="alert-close">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true"><i class="ki ki-close"></i></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr style="border: none; height: 18px">

                        <div class="row">
                            <div class="col-md-12 order-1 order-xxl-1">
                                <div class="card card-custom card-stretch gutter-b shadow">
                                    <div class="card-header border-0 bg-light-info py-5">
                                        <h3 class="card-title font-weight-bolder" style="color: #48426d">本月各项工作内容比例</h3>
                                    </div>
                                    <!--begin::Body-->
                                    <div class="card-body p-0 position-relative overflow-hidden">
                                        <!--begin::Chart-->
                                        <div id="kt_mixed_widget_1_chart" class="card-rounded-bottom bg-light-info"
                                             style="height: 150px"></div>
                                        <!--end::Chart-->
                                        <!--begin::Stats-->
                                        <div class="card-spacer mt-n25">
                                            <!--begin::Row-->
                                            <div class="row m-0">
                                                <div class="col bg-light-primary px-6 py-8 rounded-xl mr-7 mb-7">
                                                    <div id="pie" class="d-flex justify-content-center col-sm-12 col-md-10 col-lg-8"></div>
                                                </div>

                                                <div class="col-lg-3 col-sm-1 bg-light-warning px-6 py-8 rounded-xl mb-7" style="height: 200px">
                                                    <span class="svg-icon svg-icon-3x svg-icon-warning d-block my-2">
                                                        <!--begin::Svg Icon | path:assets/media/svg/icons/Media/Equalizer.svg-->
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24" />
                                                                <rect fill="#000000" opacity="0.3" x="13" y="4" width="3" height="16" rx="1.5" />
                                                                <rect fill="#000000" x="8" y="9" width="3" height="11" rx="1.5" />
                                                                <rect fill="#000000" x="18" y="11" width="3" height="9" rx="1.5" />
                                                                <rect fill="#000000" x="3" y="13" width="3" height="7" rx="1.5" />
                                                            </g>
                                                        </svg>
                                                        <!--end::Svg Icon-->
                                                    </span>
                                                    <a href="${pageContext.request.contextPath}/departmentSummaryServlet?method=getWorkingList" class="text-warning font-weight-bold font-size-h6">查看月统计情况</a>
                                                </div>
                                            </div>
                                            <!--end::Row-->
                                        </div>
                                        <!--end::Stats-->
                                    </div>
                                    <!--end::Body-->
                                </div>
                            </div>
                        </div>
                        <!--end::Dashboard-->
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Entry-->
            </div>
            <!--end::Content-->
            <!--begin::Footer-->
            <%@ include file="dist/partials/footer.jsp" %>
            <!--end::Footer-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Page-->
</div>
<!--end::Main-->
<!--begin::Scrolltop-->
<%@ include file="dist/partials/scrolltop.jsp" %>
<!--end::Scrolltop-->
<!--begin::Global Config(global config for global JS scripts)-->
<script>
    var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1400 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#3699FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#E4E6EF", "dark": "#181C32" }, "light": { "white": "#ffffff", "primary": "#E1F0FF", "secondary": "#EBEDF3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#3F4254", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#EBEDF3", "gray-300": "#E4E6EF", "gray-400": "#D1D3E0", "gray-500": "#B5B5C3", "gray-600": "#7E8299", "gray-700": "#5E6278", "gray-800": "#3F4254", "gray-900": "#181C32" } }, "font-family": "Poppins" };
</script>
<!--end::Global Config-->
<!--begin::Global Theme Bundle(used by all pages)-->
<script src="<%=basePath%>dist/assets/js/jquery/jquery-3.5.1.js"></script>
<script src="<%=basePath%>dist/assets/plugins/global/plugins.bundle.js"></script>
<script src="<%=basePath%>dist/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="<%=basePath%>dist/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->
<!--begin::Page Vendors(used by this page)-->
<script src="<%=basePath%>dist/assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<!--end::Page Vendors-->
<!--begin::Page Scripts(used by this page)-->
<script src="<%=basePath%>dist/assets/js/pages/widgets.js"></script>
<!--end::Page Scripts-->
<script type="text/javascript">

    var pieOption = {
        labels: ["设计", "编程画面", "调试管理", "经营", "日常"],
        series: [1,1,1,1,1],
        chart: {
            type: 'donut',
            // width: '100%',
            // height: auto,
        },
        dataLabels: {
            enabled: true,
            dropShadow: {
                enabled: true,
                left: 2,
                top: 2,
                opacity: 0.5
            },
        },
        fill: {
            type: 'fill'
        },
        legend: {
            show: true,
            formatter: function(val, opts) {
                return val + "  " + opts.w.globals.series[opts.seriesIndex]
            },
            position: 'right',
            containerMargin: {
                left: 35,
                right: 60
            }
        },
        noData: {
            text: '暂无可用数据',
            align: 'right',
            verticalAlign: 'center',
            offsetX: 0,
            offsetY: 0,
            style: {
                color: '#000000',
                fontSize: '14px',
            }
        },
        responsive: [{
            breakpoint: undefined,
            legend: {
                position: "top"
            }
        }]
    };

    var pieChart = new ApexCharts(document.querySelector("#pie"), pieOption);
    var url = '${pageContext.request.contextPath}/chartServlet?method=getChartData';
    $.getJSON(url, function(date) {
        pieChart.updateSeries(date);
    });
    pieChart.render();
</script>
<script src="https://widget.qweather.net/simple/static/js/he-simple-common.js?v=2.0"></script>
</body>
<!--end::Body-->
</html>