<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/18/2021
  Time: 3:28 PM
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
    <meta name="description" content="员工界面，个人参与项目" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Page Vendors Styles(used by this page)-->
    <link href="<%=basePath%>dist/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
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
    <script src="<%=basePath%>dist/assets/js/jquery/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body" class="header-fixed header-mobile-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
<!--begin::Main-->
<script type="text/javascript">
    $(function(){
        // 选项框
        $("#progressSelect").change(function () {
            var p1=$(this).children('option:selected').val();
            if(p1=="全部"){
                var p2 = "${pageContext.request.contextPath}/personalProjectServlet?method=getAllPersonalProject";
                $(location).attr('href',p2);
            }else{
                var p2 = "${pageContext.request.contextPath}/projectServlet?method=getPersonalProjectByProgress";
                var content = "";
                $.post(p2,{"progress":p1},function(data){
                    if(data.length>0){
                        for(var i=0;i<data.length;i++) {
                            content += " <tr>" +
                                "<td>" + data[i].projectName + "</td>" +
                                "<td>" + data[i].projectNo + "</td>" +
                                "<td>" + data[i].deadline + "</td>" +
                                "<td>" + data[i].finish + "</td>" +
                                "<td>" + data[i].progress + "</td>" +
                                "<td>" + data[i].manager + "</td>" +
                                "<td>" + data[i].designer + "</td>" +
                                "<td>" + data[i].reviewer + "</td>" +
                                "<td>" + data[i].office + "</td>" +
                                "<td>" + data[i].ce + "</td>" +
                                "<td>" + data[i].stage + "</td>" +
                                "<td>" + data[i].remarks + "</td>" +
                                <%--"<td><a href='${pageContext.request.contextPath}/projectServlet?method=quitProject&projectid="+data[i].id+"'><button type='button' class='btn btn-inverse-danger-muted btn-rounded btn-xs text-danger border-danger'>退出</button></a></td>" +--%>
                                "</tr>";
                        }
                    }else{
                        content = " <tr> <td></td><td></td><td></td><td></td><td>空</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>";
                    }
                    $("#tb").html(content);
                },"json");
            }
        })
    });
</script>
<!--begin::Header Mobile-->
<%@ include file="../partials/headerMobile.jsp" %>
<!--end::Header Mobile-->
<div class="d-flex flex-column flex-root">
    <!--begin::Page-->
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::Aside-->
<%--        <%@ include file="../partials/aside.jsp" %>--%>
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
                        <li class="menu-item" aria-haspopup="true" ${user.power!=0?"":"hidden"}>
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
                        <li class="menu-item menu-item-active" aria-haspopup="true" ${user.power==2||user.power==3||user.power==18?"":"hidden"}>
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
            <%@ include file="../partials/header.jsp" %>
            <!--end::Header-->
            <!--begin::Content-->
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <!--begin::Entry-->
                <div class="d-flex flex-column-fluid">
                    <!--begin::Container-->
                    <div class="container">
                        <!--begin::Card-->
                        <div class="card card-custom">
                            <div class="card-header flex-wrap py-5">
                                <div class="card-title">
                                    <h3 class="card-label text-primary">科室项目</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row mb-8">
                                    <div class="col-lg-2 mb-lg-0 mb-6">
                                        <label for="progressSelect">状态</label>
                                        <select class="select2 form-control" data-col-index="6" id="progressSelect" name="progressSelect">
                                            <option value="全部">全部</option>
                                            <option value="已完成">已完成</option>
                                            <option value="未完成">未完成</option>
                                            <option value="延期">延期</option>
                                            <option value="取消">取消</option>
                                        </select>
                                    </div>
                                </div>
                                <!--begin: Datatable-->
                                <table class="table table-responsive-sm table-separate table-hover table-head-custom table-checkable" id="table01">
                                    <thead>
                                    <tr>
                                        <th>项目名称</th>
                                        <th>工程号</th>
                                        <th>截止日期</th>
                                        <th>实际日期</th>
                                        <th>状态</th>
                                        <th>专业<br>负责人</th>
                                        <th>设计人</th>
                                        <th>审核人</th>
                                        <th>室审</th>
                                        <th>总师</th>
                                        <th>高阶段<br>分类</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tb">
                                    <c:if test="${!empty projectList}">
                                        <c:forEach var="project" items="${projectList}">
                                            <tr>
                                                <td>${project.projectName}</td>
                                                <td>${project.projectNo}</td>
                                                <td>${project.deadline}</td>
                                                <td>${project.finish}</td>
                                                <td>${project.progress}</td>
                                                <td>${project.manager}</td>
                                                <td>${project.designer}</td>
                                                <td>${project.reviewer}</td>
                                                <td>${project.office}</td>
                                                <td>${project.ce}</td>
                                                <td>${project.stage}</td>
                                                <td>${project.remarks}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--end::Card-->
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Entry-->
            </div>
            <!--end::Content-->
            <!--begin::Footer-->
            <%@ include file="../partials/footer.jsp" %>
            <!--end::Footer-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Page-->
</div>
<!--end::Main-->
<!--begin::Scrolltop-->
<%@ include file="../partials/scrolltop.jsp" %>
<!--end::Scrolltop-->
<!--begin::Global Config(global config for global JS scripts)-->
<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1400 }, "colors":
        { "theme": { "base": { "white": "#ffffff", "primary": "#3699FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#E4E6EF", "dark": "#181C32" }, "light": { "white": "#ffffff", "primary": "#E1F0FF", "secondary": "#EBEDF3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#3F4254", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#EBEDF3", "gray-300": "#E4E6EF", "gray-400": "#D1D3E0", "gray-500": "#B5B5C3", "gray-600": "#7E8299", "gray-700": "#5E6278", "gray-800": "#3F4254", "gray-900": "#181C32" } }, "font-family": "Poppins" };</script>
<!--end::Global Config-->
<!--begin::Global Theme Bundle(used by all pages)-->
<script src="<%=basePath%>dist/assets/plugins/global/plugins.bundle.js"></script>
<script src="<%=basePath%>dist/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="<%=basePath%>dist/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->
<script src="<%=basePath%>dist/assets/plugins/custom/datatables/datatables.bundle.js"></script>
<!--end::Page Vendors-->
<!--begin::Page Scripts(used by this page)-->
<script src="<%=basePath%>dist/assets/js/pages/select.js"></script>
<script src="<%=basePath%>dist/assets/js/pages/crud/datatables/basic/paginations.js"></script>
<script type="text/javascript">

    $('#table01').DataTable({
        "aLengthMenu": [[10, 20, 30, -1], ["10条", "20条", "30条", "所有"]],
        "iDisplayLength": 10,
        "language": {
            search: "",
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            }
        },
        "oAria": {
            "sSortAscending": ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
        }
    });

    $('#table01').each(function () {
        var datatable = $(this);
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', '搜索');
        search_input.removeClass('form-control-sm');
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.removeClass('form-control-sm');
    });

</script>
<style type="text/css">
    .table th, .table td {
        text-align: center;
        vertical-align: middle !important;
    }
    table {
        table-layout : auto;
    }
    /*table td{*/
    /*    max-width: 58px;*/
    /*    overflow: hidden;*/
    /*    text-overflow:ellipsis;*/
    /*    white-space: nowrap;*/
    /*}*/
    /*table td:hover {*/
    /*    overflow: auto;*/
    /*    white-space: pre-wrap;*/
    /*}*/
</style>
</body>
<!--end::Body-->
</html>