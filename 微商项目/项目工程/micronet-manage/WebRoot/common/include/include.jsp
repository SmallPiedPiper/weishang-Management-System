<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="${basePath}common/js/bootstrap/css/bootstrap.min.css">
<!--[if lt IE 9]>
   <script src="${basePath}common/js/html5shiv.min.js"></script>
   <script src="${basePath}common/js/respond.min.js"></script>
 <![endif]-->
<script src="${basePath}common/js/jquery-1.9.1.js"></script>
<script src="${basePath}common/js/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath}common/js/bootstrap-dialog.js"></script>
<script src="${basePath}common/js/bootstrap-paginator.js"></script>

<script src="${basePath}common/js/bootstrapValidator.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}common/css/bootstrapValidator.css">

<link rel="stylesheet" type="text/css" href="${basePath}common/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="${basePath}common/js/iCheck/square/_all.css">
<script src="${basePath}common/js/iCheck/icheck.js"></script>

<!-- form 异步提交-->
<script type="text/javascript" src="<%=basePath%>common/js/jquery.form.js"></script>

<script src="${basePath}common/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}common/css/style.css">

<!-- AdminLTE App -->
<script src="${basePath}common/js/adminlte.js"></script>
<link rel="stylesheet" href="${basePath}common/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}common/css/AdminLTE.css">
<link rel="stylesheet" href="${basePath}common/css/skins/_all-skins.min.css">