<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 导入标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link href="${ctx}/static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/datatables.min.css" rel="stylesheet" type="text/css">
<link href="${ctx}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${ctx}/static/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/js/commonUtils.js"></script>

<script type="text/javascript" src="${ctx}/static/js/datatables.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap-datetimepicker.min.js"></script>