<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/14/2021
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
    <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
        <!--begin::Info-->
        <div class="d-flex align-items-center flex-wrap mr-2">
            <!--begin::Page Title-->
            <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">欢迎使用！</h5>
            <!--end::Page Title-->
        </div>
        <!--end::Info-->
        <!--begin::Toolbar-->
        <div class="d-flex align-items-center">
           <!-- weather plugin positioned here -->
            <a href="javascript:" class="btn btn-clean btn-sm font-weight-bold font-size-base mr-1 d-none"> </a>
            <div class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-4 bg-gray-200"></div>
            <!--begin::Daterange-->
            <a href="javascript:" class="btn btn-sm btn-light font-weight-bold mr-2" id="kt_dashboard_daterangepicker" data-toggle="tooltip" title="日期" data-placement="left">
                <span class="text-muted font-size-base font-weight-bold mr-2" id="kt_dashboard_daterangepicker_title">今日</span>
                <span class="text-primary font-size-base font-weight-bolder" id="kt_dashboard_daterangepicker_date"> </span>
            </a>
            <!--end::Daterange-->
        </div>
        <!--end::Toolbar-->
    </div>
</div>