<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<div class="selectPermission" style="display: none;">
    <form class="layui-form" action="${pageContext.request.contextPath}/antique/user/updatePermission">
        <input type="text" value="${user.user_id}" class="user_id" name="user_id" hidden="hidden">
        <input type="text" value="${user.user_username}" class="user_username" name="user_username" hidden="hidden">
        <div class="layui-form-item" style="margin-top: 30px;width: 250px;position: relative;left: 10px;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" required value="${user.user_username}"  lay-verify="required" disabled autocomplete="off" class="layui-input user_username">
            </div>
        </div>
        <div style="margin-top: 30px;">
            <label class="layui-form-label" style="width: 100px;height: 300px;">权限列表</label>
            <c:forEach items="${permission}" var="permission">
                <input type="checkbox" title="permission" lay-skin="primary" disabled><br/><br/>
            </c:forEach>

        </div>
    </form>
</div>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
	</head>
	<body>

		<div >
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/user/1">
				<i class="layui-icon" style="position: relative; top: 30px;left: 370px;">&#xe615;</i>
				<input type="text" name="UserOrAntiqueName" style="width: 400px;" lay-verify="required" placeholder="输入用户名进行搜索" autocomplete="off" class="layui-input">
				<button type="submit" class="layui-btn" style="position: relative;top:-38px;left: 410px;">立即搜索</button>
			</form>
		</div>
		<div >
			<table class="layui-table">
			  <colgroup>
			    <col width="250">
			    <col width="150">
			    <col width="150">
				<col width="150">
			    <col width="350">
			    <col>
			  </colgroup>
			  <thead>
			    <tr>
			      <th>用户名</th>
			      <th>真实姓名</th>
			      <th>联系方式</th>
					<th>电子邮箱</th>
			      <th>详情</th>
			    </tr> 
			  </thead>
			  <tbody>
			  <c:forEach items="${userList}" var="userList">
				  <tr>
					  <td>${userList.user_username}</td>
					  <td>${userList.user_name}</td>
					  <td>${userList.user_phone}</td>
					  <td>${userList.user_email}</td>
					  <td>
						  <button type="button" class="layui-btn layui-btn-sm" onclick="selectPermission('${userList.user_id}','${userList.user_username}')">查看权限</button>
						  <button type="button" class="layui-btn layui-btn-sm" onclick="updatePermission('${userList.user_id}','${userList.user_username}')">设置权限</button>
					  </td>
				  </tr>
			  </c:forEach>
			  </tbody>
			</table>
			<div class="message">
				共&nbsp;<i class="blue">${pageInfo.total}</i>&nbsp;条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum}/${pageInfo.pages}</i>&nbsp;页
			</div><br/>
			<ul class="pagination">
				<c:if test="${!pageInfo.isFirstPage}">
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/user/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/user/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/user/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/user/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/user/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/user/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
	layui.use('form', function(){
		var form = layui.form;
	});
	function updatePermission(user_id,user_username) {
		window.location.href = '/antique/user/selectPermission?user_id='+user_id+'&user_username='+user_username;
	}
    function selectPermission(user_id,user_username) {
        window.location.href = '/antique/user/selectPermission2?user_id='+user_id+'&user_username='+user_username;
    }
</script>
</html>
