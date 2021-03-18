<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/18/2021
  Time: 4:41 PM
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
    <meta name="description" content="科室每月全员全部工作量汇总统计" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
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
        $("#expButton").click(function () {
            var year=$("#selYear").children('option:selected').val();
            var month=$("#selMonth").children('option:selected').val();
            var projectid=$("#selProject").children('option:selected').val();
            var url = "${pageContext.request.contextPath}/exportMonthSummaryServlet?method=exportMonthSummary";

            window.location.href=url+"&year="+year+"&month="+month+"&projectid="+projectid;
        });
        // 选项框
        $("#selButton").click(function () {
            var year=$("#selYear").children('option:selected').val();
            var month=$("#selMonth").children('option:selected').val();
            var projectid=$("#selProject").children('option:selected').val();
            var url = "${pageContext.request.contextPath}/personalSummaryServlet?method=getWorkingListByDateProject";
            var summaryContent = "";
            var designContent = "";
            var programingContent = "";
            var debugContent = "";
            var manageContent = "";
            var dailyContent = "";
            $.post(url,{"year":year,"month":month,"projectid":projectid},function(data){
                if(data.summaryList.length>0){
                    for(var i=0;i<data.summaryList.length;i++) {
                        summaryContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.summaryList[i].name + "</td>" +
                            "<td>" + data.summaryList[i].work_day + "</td>" +
                            "</tr>";
                    }

                }else{
                    summaryContent = " <tr> <td></td><td>空</td><td></td> </tr>";
                }

                if(data.designVoList.length>0){
                    for(var i=0;i<data.designVoList.length;i++) {
                        designContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.designVoList[i].name + "</td>" +
                            "<td>" + data.designVoList[i].projectName + "</td>" +
                            "<td hidden=''>" + data.designVoList[i].projectNo + "</td>" +
                            "<td>" + data.designVoList[i].amount + "</td>" +
                            "<td>" + data.designVoList[i].a1 + "</td>" +
                            "<td>" + data.designVoList[i].zheheWorkingDay + "</td>" +
                            "<td>" + data.designVoList[i].monthDay + "</td>" +
                            "<td>" + data.designVoList[i].programDay + "</td>" +
                            "<td>" + data.designVoList[i].basicDesignDay + "</td>" +
                            "<td>" + data.designVoList[i].leader + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" + data.designVoList[i].remark + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" +
                            "<a title='修改' href='${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid="+data.designVoList[i].id+"' class='btn btn-icon btn-light-success btn-circle'>" +
                            "<i class='flaticon-edit'></i></a>" +
                            "</td></tr>";
                    }
                }else{
                    designContent = " <tr> <td></td><td></td><td></td><td></td><td></td><td>空</td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>";
                }
                if(data.programingVoList.length>0){
                    for(var i=0;i<data.programingVoList.length;i++) {
                        programingContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.programingVoList[i].name + "</td>" +
                            "<td>" + data.programingVoList[i].projectName + "</td>" +
                            "<td>" + data.programingVoList[i].workname + "</td>" +
                            "<td>" + data.programingVoList[i].digitalNumber + "</td>" +
                            "<td>" + data.programingVoList[i].analogNumber + "</td>" +
                            "<td>" + data.programingVoList[i].programingPicture + "</td>" +
                            "<td>" + data.programingVoList[i].programingDay + "</td>" +
                            "<td>" + data.programingVoList[i].monthday + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" + data.programingVoList[i].remark + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" +
                            "<a title='修改' href='${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid="+data.programingVoList[i].id+"' class='btn btn-icon btn-light-success btn-circle'>" +
                            "<i class='flaticon-edit'></i></a></td>" +
                            "</tr>";
                    }
                }else{
                    programingContent = " <tr> <td></td><td></td><td></td><td></td><td>空</td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>";
                }
                if(data.debugVoList.length>0){
                    for(var i=0;i<data.debugVoList.length;i++) {
                        debugContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.debugVoList[i].name + "</td>" +
                            "<td>" + data.debugVoList[i].projectName + "</td>" +
                            "<td>" + data.debugVoList[i].workname + "</td>" +
                            "<td>" + data.debugVoList[i].site + "</td>" +
                            "<td>" + data.debugVoList[i].manageday + "</td>" +
                            "<td>" + data.debugVoList[i].debugday + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" + data.debugVoList[i].remark + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" +
                            "<a title='修改' href='${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid="+data.debugVoList[i].id+"' class='btn btn-icon btn-light-success btn-circle'>" +
                            "<i class='flaticon-edit'></i></a></td>" +
                            "</tr>";
                    }
                }else{
                    debugContent = " <tr> <td></td><td></td><td></td><td>空</td><td></td><td></td><td></td><td></td><td></td> </tr>";
                }
                if(data.manageVoList.length>0){
                    for(var i=0;i<data.manageVoList.length;i++) {
                        manageContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.manageVoList[i].name + "</td>" +
                            "<td><div class='text text-wrap text-break'>" + data.manageVoList[i].projectName + "</div></td>" +
                            "<td>" + data.manageVoList[i].workname + "</td>" +
                            "<td>" + data.manageVoList[i].xunjiabaojia + "</td>" +
                            "<td>" + data.manageVoList[i].tender + "</td>" +
                            "<td>" + data.manageVoList[i].sign + "</td>" +
                            "<td>" + data.manageVoList[i].toubiao + "</td>" +
                            "<td>" + data.manageVoList[i].equip + "</td>" +
                            "<td>" + data.manageVoList[i].test + "</td>" +
                            "<td>" + data.manageVoList[i].cuikuan + "</td>" +
                            "<td>" + data.manageVoList[i].contract + "</td>" +
                            "<td>" + data.manageVoList[i].other + "</td>" +
                            "<td>" + data.manageVoList[i].PMday + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.manageVoList[i].remark + "</div></td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" +
                            "<a title='修改' href='${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid="+data.manageVoList[i].id+"' class='btn btn-icon btn-light-success btn-circle'>" +
                        "<i class='flaticon-edit'></i></a></td>" +
                        "</tr>";
                    }
                }else{
                    manageContent = " <tr> <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>空</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>";
                }
                if(data.dailyVoList.length>0){
                    for(var i=0;i<data.dailyVoList.length;i++) {
                        dailyContent += " <tr>" +
                            "<td>" + i + "</td>" +
                            "<td>" + data.dailyVoList[i].name + "</td>" +
                            "<td>" + data.dailyVoList[i].type + "</td>" +
                            "<td>" + data.dailyVoList[i].monthDay + "</td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.dailyVoList[i].remark + "</div></td>" +
                            "<td ${user.power==1||user.power==2?'':'hidden'}>" +
                            "<a title='修改' href='${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid="+data.dailyVoList[i].id+"' class='btn btn-icon btn-light-success btn-circle'>" +
                            "<i class='flaticon-edit'></i></a></td>" +
                            "</tr>";
                    }
                }else{
                    dailyContent = " <tr> <td></td><td></td><td>空</td><td></td><td></td><td></td> </tr>";
                }
                $("#tbSummary").html(summaryContent);
                $("#tbDesign").html(designContent);
                $("#tbPorgraming").html(programingContent);
                $("#tbDebug").html(debugContent);
                $("#tbManage").html(manageContent);
                $("#tbDaily").html(dailyContent);
            },"json");
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
                        <li class="menu-item menu-item-active" aria-haspopup="true" ${user.power!=0?"":"hidden"}>
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
                        <div class="card card-custom gutter-b example example-compact">
                            <div class="card-header">
                                <h3 class="card-title text-primary">科室工作量记录</h3>
                            </div>

                            <div class="card-body">
                                <div class="form-group mb-8" ${user.power==1||user.power==2?"":"hidden"}>
                                    <div class="alert alert-custom alert-default" role="alert">
                                        <div class="alert-icon">
                                            <span class="svg-icon svg-icon-primary svg-icon-xl">
                                                 <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                     <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                         <rect x="0" y="0" width="24" height="24" />
                                                         <path d="M7.07744993,12.3040451 C7.72444571,13.0716094 8.54044565,13.6920474 9.46808594,14.1079953 L5,23 L4.5,18 L7.07744993,12.3040451 Z M14.5865511,14.2597864 C15.5319561,13.9019016 16.375416,13.3366121 17.0614026,12.6194459 L19.5,18 L19,23 L14.5865511,14.2597864 Z M12,3.55271368e-14 C12.8284271,3.53749572e-14 13.5,0.671572875 13.5,1.5 L13.5,4 L10.5,4 L10.5,1.5 C10.5,0.671572875 11.1715729,3.56793164e-14 12,3.55271368e-14 Z" fill="#000000" opacity="0.3" />
                                                         <path d="M12,10 C13.1045695,10 14,9.1045695 14,8 C14,6.8954305 13.1045695,6 12,6 C10.8954305,6 10,6.8954305 10,8 C10,9.1045695 10.8954305,10 12,10 Z M12,13 C9.23857625,13 7,10.7614237 7,8 C7,5.23857625 9.23857625,3 12,3 C14.7614237,3 17,5.23857625 17,8 C17,10.7614237 14.7614237,13 12,13 Z" fill="#000000" fill-rule="nonzero" />
                                                     </g>
                                                 </svg>
                                            </span>
                                        </div>
                                        <div class="alert-text">
                                            <div class="d-flex justify-content-start">
                                                <div class="mr-4">
                                                    <button class="btn btn-icon btn-light-success btn-circle">
                                                        <i class="flaticon-edit"></i>
                                                    </button>
                                                    <span>——修改</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-8">
                                    <div class="col-lg-2 mb-lg-0 mb-6">
                                        <label>年份</label>
                                        <select class="select2 form-control" id="selYear" name="selYear">
                                            <c:forEach begin="2018" end="2026" step="1" var="i">
                                                <option value="${i}" ${currentYear == i?"selected":""}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-lg-2 mb-lg-0 mb-6 mr-3">
                                        <label>月份</label>
                                        <select class="select2 form-control" id="selMonth" name="selMonth">
                                            <c:forEach begin="1" end="12" step="1" var="i">
                                                <option value="${i}" ${currentMonth == i?"selected":""}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-lg-3 mb-lg-0 mb-6 mr-3">
                                        <label>项目</label>
                                        <select class="select2w form-control" id="selProject" name="selProject">
                                            <c:if test="${!empty projectList}">
                                                <option value="全部" selected="selected">全部</option>
                                                <c:forEach  var="project" items="${projectList}">
                                                    <option value="${project.id}" data-content="${project.id}">${project.projectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>

                                    <div class="row mt-8 mr-5">
                                        <div class="col-lg-12">
                                            <button class="btn btn-primary btn-primary--icon" id="selButton">
                                                <span>
                                                    <i class="la la-search"></i>
                                                    <span>确定</span>
                                                </span>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="row mt-8" ${user.power==1||user.power==2?"":"hidden"}>
                                        <div class="col-lg-12">
                                            <button class="btn btn-light-danger btn-danger--icon" id="expButton">
                                                <span>
                                                    <i class="flaticon2-print"></i>
                                                    <span>导出</span>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="example mb-10">
                                    <div class="example-preview">
                                        <ul class="nav nav-light-info nav-pills" id="myTab3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="tab-total" data-toggle="tab" href="#total">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-file-2"></i>
                                                    </span>
                                                    <span class="nav-text">月总工日</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-design" data-toggle="tab" href="#design" aria-controls="profile">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-interface-9"></i>
                                                    </span>
                                                    <span class="nav-text">设计</span>
                                                </a>
                                            </li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link" id="tab-programming" data-toggle="tab" href="#programming" aria-controls="profile">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-internet"></i>
                                                    </span>
                                                    <span class="nav-text">编程画面</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-debug" data-toggle="tab" href="#debug" aria-controls="contact">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-cogwheel-2"></i>
                                                    </span>
                                                    <span class="nav-text">调试管理</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-manage" data-toggle="tab" href="#manage" aria-controls="contact">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-analytics"></i>
                                                    </span>
                                                    <span class="nav-text">经营管理</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab-daily" data-toggle="tab" href="#daily" aria-controls="contact">
                                                    <span class="nav-icon">
                                                        <i class="flaticon-notes"></i>
                                                    </span>
                                                    <span class="nav-text">日常零星</span>
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="tab-content mt-5" id="myTabContent3">
                                            <div class="tab-pane fade show active" id="total" role="tabpanel" aria-labelledby="tab-total">
                                                <table class="table table-hover mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">总工日</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbSummary">
                                                    <c:if test="${!empty mainVo.summaryList}">
                                                        <c:forEach var="summary" items="${mainVo.summaryList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${summary.name}</td>
                                                                <td>${summary.work_day}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="tab-design">
                                                <table class="table table-hover table-responsive-sm mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">工程</th>
                                                        <th scope="col" hidden="">工程号</th>
                                                        <th scope="col">图纸数</th>
                                                        <th scope="col">折合A1</th>
                                                        <th scope="col">总工日</th>
                                                        <th scope="col">完成工日</th>
                                                        <th scope="col">技术方案</th>
                                                        <th scope="col">基本设计</th>
                                                        <th scope="col">专业<br>负责人</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>备注</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDesign">
                                                    <c:if test="${!empty mainVo.designVoList}">
                                                        <c:forEach var="design" items="${mainVo.designVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${design.name}</td>
                                                                <td>${design.projectName}</td>
                                                                <td hidden="">${design.projectNo}</td>
                                                                <td>${design.amount}</td>
                                                                <td>${design.a1}</td>
                                                                <td>${design.zheheWorkingDay}</td>
                                                                <td>${design.monthDay}</td>
                                                                <td>${design.programDay}</td>
                                                                <td>${design.basicDesignDay}</td>
                                                                <td>${design.leader}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>${design.remark}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a title="修改" href="${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid=${design.id}" class="btn btn-icon btn-light-success btn-circle">
                                                                        <i class="flaticon-edit"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="programming" role="tabpanel" aria-labelledby="tab-programming">
                                                <table class="table table-hover table-responsive-sm mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">工程</th>
                                                        <th scope="col">工作名称</th>
                                                        <th scope="col">总开关量</th>
                                                        <th scope="col">总模拟量</th>
                                                        <th scope="col">类型</th>
                                                        <th scope="col">总工日</th>
                                                        <th scope="col">完成工日</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>备注</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbPorgraming">
                                                    <c:if test="${!empty mainVo.programingVoList}">
                                                        <c:forEach var="programing" items="${mainVo.programingVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${programing.name}</td>
                                                                <td>${programing.projectName}</td>
                                                                <td>${programing.workname}</td>
                                                                <td>${programing.digitalNumber}</td>
                                                                <td>${programing.analogNumber}</td>
                                                                <td>${programing.programingPicture}</td>
                                                                <td>${programing.programingDay}</td>
                                                                <td>${programing.monthday}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>${programing.remark}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a title="修改" href="${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid=${programing.id}" class="btn btn-icon btn-light-success btn-circle">
                                                                        <i class="flaticon-edit"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="debug" role="tabpanel" aria-labelledby="tab-debug">
                                                <table class="table table-hover table-responsive-sm mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">工程</th>
                                                        <th scope="col">工作名称</th>
                                                        <th scope="col">地点</th>
                                                        <th scope="col">管理</th>
                                                        <th scope="col">调试</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>备注</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDebug">
                                                    <c:if test="${!empty mainVo.debugVoList}">
                                                        <c:forEach var="debug" items="${mainVo.debugVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${debug.name}</td>
                                                                <td>${debug.projectName}</td>
                                                                <td>${debug.workname}</td>
                                                                <td>${debug.site}</td>
                                                                <td>${debug.manageday}</td>
                                                                <td>${debug.debugday}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>${debug.remark}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a title="修改" href="${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid=${debug.id}" class="btn btn-icon btn-light-success btn-circle">
                                                                        <i class="flaticon-edit"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="manage" role="tabpanel" aria-labelledby="tab-manage">
                                                <table class="table table-hover table-responsive-sm mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">工程</th>
                                                        <th scope="col">工作<br>名称</th>
                                                        <th scope="col">商务<br>询价</th>
                                                        <th scope="col">标书<br>制作</th>
                                                        <th scope="col">合同<br>签署</th>
                                                        <th scope="col">投标</th>
                                                        <th scope="col">设备<br>采购</th>
                                                        <th scope="col">设备<br>检测</th>
                                                        <th scope="col">债务</th>
                                                        <th scope="col">合同<br>管理</th>
                                                        <th scope="col">其他</th>
                                                        <th scope="col">项目<br>经理</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>备注</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbManage">
                                                    <c:if test="${!empty mainVo.manageVoList}">
                                                        <c:forEach var="manage" items="${mainVo.manageVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${manage.name}</td>
                                                                <td>${manage.projectName}</td>
                                                                <td>${manage.workname}</td>
                                                                <td>${manage.xunjiabaojia}</td>
                                                                <td>${manage.tender}</td>
                                                                <td>${manage.sign}</td>
                                                                <td>${manage.toubiao}</td>
                                                                <td>${manage.equip}</td>
                                                                <td>${manage.test}</td>
                                                                <td>${manage.cuikuan}</td>
                                                                <td>${manage.contract}</td>
                                                                <td>${manage.other}</td>
                                                                <td>${manage.PMday}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>${manage.remark}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a title="修改" href="${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid=${manage.id}" class="btn btn-icon btn-light-success btn-circle">
                                                                        <i class="flaticon-edit"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="daily" role="tabpanel"
                                                 aria-labelledby="tab-daily">
                                                <table class="table table-hover table-responsive-sm  mt-2">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">姓名</th>
                                                        <th scope="col">类型</th>
                                                        <th scope="col">工日</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>备注</th>
                                                        <th scope="col" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDaily">
                                                    <c:if test="${!empty mainVo.dailyVoList}">
                                                        <c:forEach var="daily" items="${mainVo.dailyVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${daily.name}</td>
                                                                <td>${daily.type}</td>
                                                                <td>${daily.monthDay}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>${daily.remark}</td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a title="修改" href="${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid=${daily.id}" class="btn btn-icon btn-light-success btn-circle">
                                                                        <i class="flaticon-edit"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer"> </div>
                        </div>
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
<!--begin::Page Scripts(used by this page)-->
<script src="<%=basePath%>dist/assets/js/pages/select.js"></script>
<!--end::Page Scripts-->
<style type="text/css">
    .table>thead>tr>th {
        text-align: center;
    }
    .table>tbody>tr>td {
        text-align: center;
    }
</style>
</body>
<!--end::Body-->
</html>

