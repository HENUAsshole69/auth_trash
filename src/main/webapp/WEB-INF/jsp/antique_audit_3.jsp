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
		<jsp:include page="index.jsp" />
		<div id="div"></div>
		<div style="width: 1200px; position: absolute; top: 45px;left: 205px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit3/1">
				<i class="layui-icon" style="position: relative; top: 30px;left: 370px;">&#xe615;</i>
				<input type="text" name="UserOrAntiqueName" style="width: 400px;" lay-verify="required" placeholder="搜索用户名或文物名称进行搜索" autocomplete="off" class="layui-input">
				<button type="submit" class="layui-btn" style="position: relative;top:-38px;left: 410px;">立即搜索</button>
			</form>

		</div>
		<div style="width: 1340px; position: absolute; top:100px;left: 200px;">
			<table class="layui-table">
			  <colgroup>
			    <col width="250">
			    <col width="150">
			    <col width="150">
			    <col width="350">
			    <col>
			  </colgroup>
			  <thead>
			    <tr>
			      <th>昵称</th>
			      <th>序号</th>
			      <th>用户</th>
			      <th>描述</th>
			      <th>详情</th>
			    </tr> 
			  </thead>
			  <tbody>
			  <c:forEach items="${antiques}" var="antiques">
				  <input hidden="hidden" class="recheck" type="text" value="${antiques.antique_recheck}">
				  <tr>
					  <td>${antiques.antique_name}</td>
					  <td>${antiques.antique_number}</td>
					  <td>${antiques.antique_users}</td>
					  <td>${antiques.antique_details}</td>
					  <td>
						  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="specialistShow('${antiques.antique_number}','${antiques.antique_status}')">专家初审</button>
							<c:if test="${antiques.antique_checkor == 'true'}">
							  <button type="button" class="layui-btn layui-btn-disabled layui-btn-sm">已通过复核</button>
							</c:if>
							<c:if test="${antiques.antique_checkor != 'true'}">
							  <button type="button" class="layui-btn  layui-btn-sm"
							  		  <c:if test="${antiques.antique_status <= 2}">
									  onclick="recheck31('yes','${antiques.antique_number}','${antiques.antique_status}')"
									  </c:if>
							  >通过复核</button>
							  <button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
									  <c:if test="${antiques.antique_status <= 2}">
									  onclick="recheck31('no','${antiques.antique_number}','${antiques.antique_status}')"
									  </c:if>
							  >拒绝复核</button>
							</c:if>
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
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit3/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit3/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/audit3/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit3/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit3/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit3/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
<script src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test1' //指定元素
		});
	});
	function specialistShow(antique_number,antique_status) {
		if(antique_status < 1){
			layer.alert('请先通过文物复核!', {icon: 5});
		}else
			window.location.href = "/antique/audit3/specialist?antique_number="+antique_number;
	}
	function recheck3Yes() {
        layer.open({
            content: '是否确认通过初审？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                var form = document.getElementById("first_trial");
                var formDate = new FormData(form);
                $.ajax({
                    url: '${pageContext.request.contextPath}/antique/audit3/recheckYes',
                    type: 'POST',
                    data:formDate,
                    dataType: "json",
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function () {
                        layer.alert('初审已通过,请等待复核', {icon: 1});
                        layer.closeAll('page');
                    },
                    error: function (data) {
                        layer.alert('信息上传失败', {icon: 5});
                    }
                });
            }
            ,btn2: function(index, layero){
            }
            ,cancel: function(){
                //右上角关闭回调
                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    }
    function recheck31(recheckBol,antique_number,antique_status) {
		if(antique_status < 2)
			layer.alert('请先通过专家初审!', {icon: 5});
		else if(antique_status == 2)
			window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck31?recheckBol="+recheckBol+"&antique_number="+antique_number;
	}
</script>
</html>
