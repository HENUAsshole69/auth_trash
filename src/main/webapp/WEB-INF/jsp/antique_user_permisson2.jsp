<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
	</head>
	<body>

		<div id="div" style="height: 800px;">
			<div class="antiqueInfo" style="position:relative;left: 190px;top: -495px;width:600px;">
				<form class="layui-form" action="" onsubmit="">
					<blockquote class="layui-elem-quote">用户信息</blockquote>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">用户名</label>
						<div class="layui-input-block">
							<input disabled value="${user.user_username}" type="text" name="antique_number" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;margin-top: 30px;"/>
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label">用户密码</label>
						<div class="layui-input-block">
							<input disabled value="${user.user_pwd}" type="text" name="antique_name" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;margin-top: 30px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label">联系方式</label>
						<div class="layui-input-block">
							<input value="${user.user_phone}" disabled type="text" name="antique_time" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">电子邮件</label>
						<div class="layui-input-block">
							<input value="${user.user_email}" disabled type="text" name="antique_intact" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">身份证号</label>
						<div class="layui-input-block">
							<input value="${user.user_idcard}" disabled type="text" name="antique_authenticate" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">真实姓名</label>
						<div class="layui-input-block">
							<input value="${user.user_name}" disabled type="text" name="antique_info" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
				</form>
			</div>
			<div class="user_permission" style="position:relative;left:800px;top:-1050px;width: 660px;">
				<blockquote class="layui-elem-quote" style="position:relative;top:0px;">用户权限设置</blockquote>
				<div class="permission">
					<form class="layui-form" action="${pageContext.request.contextPath}/antique/user/updatePermission">
						<input type="text" class="user_id" value="${user.user_id}" name="user_id" hidden="hidden">
						<input type="text" class="user_username" value="${user.user_username}" name="user_username" hidden="hidden">
						<div style="margin-top: 30px;">
							<label class="layui-form-label" style="width: 100px;height: 300px;">权限列表</label>
							<input type="checkbox" name="roleBox" value="文物局" title="文物局" id="antique" <c:if test="${role.antique == 'yes'}">checked</c:if>  lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="老化痕迹鉴定人员" title="老化痕迹鉴定人员" <c:if test="${role.burn_in == 'yes'}">checked</c:if> id="burn_in"  lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="工作人员" title="工作人员" id="worker" <c:if test="${role.worker == 'yes'}">checked</c:if> lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="文物商店" title="文物商店" id="antique_store" <c:if test="${role.antique_store == 'yes'}">checked</c:if> lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="拍卖行" title="拍卖行" id="auction" <c:if test="${role.auction == 'yes'}">checked</c:if> lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="普通用户" class="ordinary" id="ordinary" <c:if test="${role.ordinary == 'yes'}">checked</c:if> title="普通用户" lay-skin="primary" disabled><br/><br/>
							<input type="checkbox" name="roleBox" value="财务人员" title="财务人员" id="finance" <c:if test="${role.finance == 'yes'}">checked</c:if> lay-skin="primary" disabled><br/><br/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
<script src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
</script>
</html>
