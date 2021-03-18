<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/18/2021
  Time: 10:42 AM
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
    <meta name="description" content="员工界面，修改调试/工程管理工作量" />
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
        // 给工程号赋值
        $("#projectid").change(function () {
            var p1=$(this).children('option:selected').attr("id");
            $("#projectNo").val(p1);
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
        <%@ include file="../partials/aside.jsp" %>
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
                                <h3 class="card-title text-primary">调试/工程管理</h3>
                            </div>
                            <!--begin::Form-->
                            <form class="form" action="${pageContext.request.contextPath}/debugWorkingServlet?method=updateDebugWorking" method="post">
                                <div class="card-body">

                                    <div class="form-group mb-8">
                                        <div class="alert alert-custom alert-default" role="alert">
                                            <div class="alert-icon">
                                                <span class="svg-icon svg-icon-primary svg-icon-xl">
                                                    <!--begin::Svg Icon | path:assets/media/svg/icons/Tools/Compass.svg-->
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <rect x="0" y="0" width="24" height="24" />
                                                            <path d="M7.07744993,12.3040451 C7.72444571,13.0716094 8.54044565,13.6920474 9.46808594,14.1079953 L5,23 L4.5,18 L7.07744993,12.3040451 Z M14.5865511,14.2597864 C15.5319561,13.9019016 16.375416,13.3366121 17.0614026,12.6194459 L19.5,18 L19,23 L14.5865511,14.2597864 Z M12,3.55271368e-14 C12.8284271,3.53749572e-14 13.5,0.671572875 13.5,1.5 L13.5,4 L10.5,4 L10.5,1.5 C10.5,0.671572875 11.1715729,3.56793164e-14 12,3.55271368e-14 Z" fill="#000000" opacity="0.3" />
                                                            <path d="M12,10 C13.1045695,10 14,9.1045695 14,8 C14,6.8954305 13.1045695,6 12,6 C10.8954305,6 10,6.8954305 10,8 C10,9.1045695 10.8954305,10 12,10 Z M12,13 C9.23857625,13 7,10.7614237 7,8 C7,5.23857625 9.23857625,3 12,3 C14.7614237,3 17,5.23857625 17,8 C17,10.7614237 14.7614237,13 12,13 Z" fill="#000000" fill-rule="nonzero" />
                                                        </g>
                                                    </svg>
                                                    <!--end::Svg Icon-->
                                                </span>
                                            </div>
                                            <div class="alert-text">修改时请注意，不得使用英文标点符号。</div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-form-label text-right col-lg-2 col-sm-12">项目名称</label>
                                        <div class="col-lg-3 col-md-9 col-sm-12">
                                            <select class="select2w form-control" id="projectid" name="projectid">
                                                <option value="" ${debug.projectid==""?"selected":""} >请选择</option>
                                                <c:if test="${!empty projectList}">
                                                    <c:forEach var="project" items="${projectList}">
                                                        <option id="${project.projectNo}" value="${project.id}" ${project.id == debug.projectid?"selected":""} >${project.projectName}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>

                                        <label class="col-lg-2 col-form-label text-lg-right">工程号</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" id="projectNo" name="projectNo" value="${requestScope.debugproject.projectNo}" readonly />
                                        </div>
                                    </div>

                                    <div class="input-group-append" hidden="true">
                                        <input type="text" class="form-control col-sm-1" name="id" id="id" value="${debug.id}">
                                        <input type="text" class="form-control col-sm-1" name="year" id="year" value="${debug.year}">
                                        <input type="text" class="form-control col-sm-1" name="month" id="month" value="${debug.month}">
                                    </div>

                                    <div class="separator separator-dashed my-10"></div>

                                    <div class="form-group row">
                                        <label class="col-lg-2 col-form-label text-lg-right">工作名称</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" id="workname" name="workname" />
                                            <span class="form-text text-danger">若该工作无可对应项目，请定义工作量具体名称</span>
                                        </div>
                                    </div>

                                    <div class="separator separator-dashed my-10"></div>

                                    <div class="form-group row">
                                        <label class="col-lg-2 col-form-label text-lg-right">项目地点</label>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" placeholder="地点" value="${debug.site}" id="site" name="site" autocomplete="off"/>
                                            <span class="text-muted"></span>
                                        </div>
                                    </div>

                                    <div class="separator separator-dashed my-10"></div>

                                    <div class="form-group row">
                                        <label class="col-lg-2 col-form-label text-lg-right">工程管理</label>
                                        <div class="col-lg-3">
                                            <input type="number" class="form-control" placeholder="工日" value="${debug.manageday}" id="manageday" name="manageday" autocomplete="off"/>
                                        </div>
                                        <label class="col-lg-2 col-form-label text-lg-right">工程调试</label>
                                        <div class="col-lg-3">
                                            <input type="number" class="form-control" placeholder="工日" value="${debug.debugday}" id="debugday" name="debugday" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="separator separator-dashed my-10"></div>

                                    <div class="form-group mb-1">
                                        <label for="remark">备注<span class="text-danger">*</span></label>
                                        <textarea class="form-control" name="remark" id="remark" rows="3">${debug.remark}</textarea>
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-10">
                                            <button type="submit" class="btn btn-success mr-2" name="submit">确认修改</button>
                                            <button type="reset" class="btn btn-secondary mr-2">重置</button>
                                            <a type="button" class="btn btn-outline-info" href="javascript:history.go(-1);">返回</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--end::Form-->
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
</body>
<!--end::Body-->
</html>