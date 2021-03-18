<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/20/2021
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <!--begin::Page Custom Styles(used by this page)-->
    <link href="<%=basePath%>dist/assets/css/pages/login/classic/login-4.css" rel="stylesheet" type="text/css" />
    <!--end::Page Custom Styles-->
    <!--begin::Global Theme Styles(used by all pages)-->
    <link href="<%=basePath%>dist/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Global Theme Styles-->
    <!--begin::Layout Themes(used by all pages)-->
    <link href="<%=basePath%>dist/assets/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/brand/dark.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>dist/assets/css/themes/layout/aside/dark.css" rel="stylesheet" type="text/css" />
    <!--end::Layout Themes-->
    <link rel="shortcut icon" href="<%=basePath%>dist/assets/media/logos/favicon.ico" />
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Login-->
    <div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
        <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<%=basePath%>dist/assets/media/bg/bg-3.jpg')">
            <div class="login-form text-center p-7 position-relative overflow-hidden">
                <!--begin::Login Header-->
                <div class="d-flex flex-center mb-15">
                    <a href="javascript:">
                        <img src="<%=basePath%>dist/assets/media/my/logo.png" class="max-h-75px" alt="logo" />
                    </a>
                </div>
                <!--end::Login Header-->
                <!--begin::Login Sign in form-->
                <div class="login-signin">
                    <div class="mb-20">
                        <h2><strong>修改密码</strong></h2>
                    </div>
                    <form class="form" novalidate id="updateUserForm" action="${pageContext.request.contextPath}/userServlet?method=updatePassword" method="post">
                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="text" placeholder="用户名" id="username" name="username" autocomplete="off" required />
                        </div>

                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="password" placeholder="原密码" id="oldPIN" name="oldPIN" required />
                        </div>

                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="password" placeholder="新密码" id="newPIN" name="newPIN" required />
                        </div>

                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="password" placeholder="确认新密码" id="newPIN2" name="newPIN2" required />
                        </div>

                        <div class="form-group d-flex flex-wrap justify-content-between align-items-center">
                            <c:if test="${!empty loginError}">
                                <span class="text-danger">${loginError}</span>
                            </c:if>
                        </div>

                        <div class="form-group d-flex flex-wrap flex-center mt-10">
                            <button type="submit" class="btn btn-success font-weight-bold px-9 py-4 my-3 mx-2">确认</button>
                            <a type="button" href="javascript:history.go(-1);" class="btn btn-light-primary font-weight-bold px-9 py-4 my-3 mx-2">返回</a>
                        </div>
                    </form>
                </div>
                <!--end::Login Sign in form-->
            </div>
        </div>
    </div>
    <!--end::Login-->
</div>
<!--end::Main-->
<!--begin::Global Config(global config for global JS scripts)-->
<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1400 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#3699FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#E4E6EF", "dark": "#181C32" }, "light": { "white": "#ffffff", "primary": "#E1F0FF", "secondary": "#EBEDF3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#3F4254", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#EBEDF3", "gray-300": "#E4E6EF", "gray-400": "#D1D3E0", "gray-500": "#B5B5C3", "gray-600": "#7E8299", "gray-700": "#5E6278", "gray-800": "#3F4254", "gray-900": "#181C32" } }, "font-family": "Poppins" };</script>
<!--end::Global Config-->
<script src="<%=basePath%>dist/assets/js/jquery/jquery-3.5.1.min.js" type="text/javascript"></script>
<!--begin::Global Theme Bundle(used by all pages)-->
<script src="<%=basePath%>dist/assets/plugins/global/plugins.bundle.js"></script>
<script src="<%=basePath%>dist/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="<%=basePath%>dist/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->
<!--begin::Page Scripts(used by this page)-->
<!--end::Page Scripts-->
<script type="text/javascript">
    $(function(){
        if (${!empty user}){
            $("#username").val("${user.username}");
            $("#oldPIN").val("${user.password}");
        }
    })

    window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('form');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);

</script>
</body>
<!--end::Body-->
</html>