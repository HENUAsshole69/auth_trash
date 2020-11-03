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

		<div id="div"></div>
		<div >
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit6/1">
				<i class="layui-icon" style="position: relative; top: 30px;left: 370px;">&#xe615;</i>
				<input type="text" name="UserOrAntiqueName" style="width: 400px;" lay-verify="required" placeholder="搜索用户名或文物名称进行搜索" autocomplete="off" class="layui-input">
				<button type="submit" class="layui-btn" style="position: relative;top:-38px;left: 410px;">立即搜索</button>
			</form>

		</div>
		<div >
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
						  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="certificateShow('${antiques.antique_number}','${antiques.antique_status}')">录入证书</button>
							<c:if test="${antiques.antique_recheckor == 'yes'}">
							  <button type="button" class="layui-btn layui-btn-disabled layui-btn-sm">已通过复核</button>
							</c:if>
							<c:if test="${antiques.antique_recheckor != 'yes'}">
							  <button type="button" class="layui-btn  layui-btn-sm"
							  		  <c:if test="${antiques.antique_status <= 5}">
									  onclick="recheck61('yes','${antiques.antique_number}','${antiques.antique_certificate_id}','${antiques.antique_status}')"
									  </c:if>
							  >通过复核</button>
							  <button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
									  <c:if test="${antiques.antique_status <= 5}">
									  onclick="recheck61('no','${antiques.antique_number}','${antiques.antique_certificate_id}','${antiques.antique_status}')"
									  </c:if>
							  >拒绝复核</button>
							</c:if>
									<c:if test="${antiques.antique_recheckor == 'no'}">
										<button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
													onclick="rejectReason('${antiques.antique_recheckor_reason}')"
										>查看拒绝理由</button>
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
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit6/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit6/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/audit6/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit6/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit6/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit6/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
	<div style="display: none" class="rejectCertificateRececkor">
		<form class="layui-form">
		<div class="layui-form-item layui-form-text" style="width: 400px;margin-top: 40px;">
			<label class="layui-form-label">拒绝理由</label>
			<div class="layui-input-block">
				<textarea name="desc"  placeholder="请填写拒绝多维鉴定复核理由" class="layui-textarea rejectCertificateTextarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn rejectRecheckBtn layui-btn layui-btn-sm" onclick="rejectCertificateBtn()">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary layui-btn layui-btn-sm">重置</button>
			</div>
		</div>
		</form>
	</div>
	<!--查看拒绝理由-->
	<div style="display: none" class="rejectCertificateReason">
		<form class="layui-form">
			<div class="layui-form-item layui-form-text" style="width: 400px;margin-top: 40px;">
				<label class="layui-form-label">拒绝理由</label>
				<div class="layui-input-block">
					<textarea name="desc" disabled  placeholder="请填写拒绝多为鉴定复核理由" class="layui-textarea rejectCertificateReasonText"></textarea>
				</div>
			</div>
		</form>
	</div>
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
	function certificateShow(antique_number,antique_status) {
			if(antique_status < 5)
				layer.alert('请先通过位点信息录入!', {icon: 5});
			else
			window.location.href = "/antique/audit6/certificateShow?antique_number="+antique_number;
	}
	var reB;
	var an;
    function recheck61(recheckBol,antique_number,antique_certificate_id,antique_status) {
		if(antique_status < 5 || antique_certificate_id == null || antique_certificate_id == "")
			layer.alert('请先通过证书信息录入!', {icon: 5});
		else if(antique_status == 5 && antique_certificate_id != null && antique_certificate_id != "" && recheckBol == 'yes'){
			layer.confirm('确认通过证书信息复核？', {
				btn: ['确认', '取消']
			}, function(index, layero){
				window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck61?recheckBol="+recheckBol+"&antique_number="+antique_number;
			}, function(index){
				//按钮【按钮二】的回调
			});
		}
		else if(antique_status == 5 && (antique_certificate_id != null && antique_certificate_id != "" && recheckBol == 'no')){
			reB = recheckBol;
			an = antique_number;
			layer.confirm('确认拒绝证书信息复核？', {
				btn: ['确认', '取消']
			}, function(index, layero){
				layer.open({
					type:1,
					anim:4,
					maxmin:true,
					shadeClose:true,
					offset: '150px',
					shade:0.3,
					area:['460px','280px'],
					title: '证书审核',
					content: $(".rejectCertificateRececkor"),
					end:function(){
						$(".rejectCertificateRececkor").css({"display":"none"})
					},
					cancel: function(){//关闭按钮的回调函数
						$(".rejectCertificateRececkor").css({"display":"none"})
					},
				});
			}, function(index){
			});
		}
	}
	function rejectCertificateBtn() {
		window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck61?recheckBol="+reB+"&antique_number="+an+"&reason="+$('.rejectCertificateTextarea').val();
	}
	function rejectReason(reason) {
    	$('.rejectCertificateReasonText').text(reason);
		layer.open({
			type:1,
			anim:4,
			maxmin:true,
			shadeClose:true,
			offset: '150px',
			shade:0.3,
			area:['460px','280px'],
			title: '拒绝理由',
			content: $(".rejectCertificateReason"),
			end:function(){
				$(".rejectCertificateReason").css({"display":"none"})
			},
			cancel: function(){//关闭按钮的回调函数
				$(".rejectCertificateReason").css({"display":"none"})
			},
		});
	}
</script>
</html>
