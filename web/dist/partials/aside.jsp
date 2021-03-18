<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 1/13/2021
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="aside aside-left aside-fixed d-flex flex-column flex-row-auto" id="kt_aside">
    <!--begin::Brand-->
    <div class="brand flex-column-auto" id="kt_brand">
        <!--begin::Logo-->
        <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo">
            <img alt="Logo" src="<%=basePath%>dist/assets/media/my/SDM.png" style="width: 50%"
                 oncontextmenu="return false" ondragstart="return false" onselectstart="return false" />
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
