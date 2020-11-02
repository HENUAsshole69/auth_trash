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
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit5/1">
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
			    <col width="300">
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
				  <c:if test="${antiques.antique_kind != '非文物非艺术品'}">
				  <input hidden="hidden" class="recheck" type="text" value="${antiques.antique_recheck}">
				  <tr>
					  <td>${antiques.antique_name}</td>
					  <td>${antiques.antique_number}</td>
					  <td>${antiques.antique_users}</td>
					  <td>${antiques.antique_details}</td>
					  <td>
						  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="LocusShowInfo('${antiques.antique_number}','${antiques.antique_status}')">位点信息</button>
						  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="LocusShowImg('${antiques.antique_number}','${antiques.antique_status}')">位点标记图</button>
							<c:if test="${antiques.antique_recheckor == 'yes'}">
							  <button type="button" class="layui-btn layui-btn-disabled layui-btn-sm">已通过复核</button>
							</c:if>
							<c:if test="${antiques.antique_recheckor != 'yes'}">
							  <button type="button" class="layui-btn  layui-btn-sm"
							  		  <c:if test="${antiques.antique_status <= 4}">
									  onclick="recheck512('yes','${antiques.antique_number}',${antiques.antique_status},'${antiques.antique_locus_submit}','${antiques.antique_locus_submitImg}')"
									  </c:if>
							  >通过复核</button>
							  <button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
									  <c:if test="${antiques.antique_status <= 4}">
									  onclick="recheck512('no','${antiques.antique_number}',${antiques.antique_status},'${antiques.antique_locus_submit}','${antiques.antique_locus_submitImg}')"
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
				  </c:if>
			  </c:forEach>
			  </tbody>
			</table>
			<div class="message">
				共&nbsp;<i class="blue">${pageInfo.total}</i>&nbsp;条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum}/${pageInfo.pages}</i>&nbsp;页
			</div><br/>
			<ul class="pagination">
				<c:if test="${!pageInfo.isFirstPage}">
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit5/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit5/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/audit5/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit5/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit5/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit5/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
	<div style="display: none" class="rejectBitRececkor">
		<form class="layui-form">
		<div class="layui-form-item layui-form-text" style="width: 400px;margin-top: 40px;">
			<label class="layui-form-label">拒绝理由</label>
			<div class="layui-input-block">
				<textarea name="desc"  placeholder="请填写拒绝多为鉴定复核理由" class="layui-textarea rejectBitTextarea"></textarea>
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
	<div style="display: none" class="rejectBitReason">
		<form class="layui-form">
			<div class="layui-form-item layui-form-text" style="width: 400px;margin-top: 40px;">
				<label class="layui-form-label" style="width: 100px;">拒绝理由</label>
				<div class="layui-input-block">
					<textarea name="desc" disabled  placeholder="请填写拒绝位点信息复核理由" class="layui-textarea rejectBitReasonText"></textarea>
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
	function LocusShowInfo(antique_number,antique_status) {
			if(antique_status < 4)
				layer.alert('请先通过多维鉴定!', {icon: 5});
			else
			window.location.href = "/antique/audit5/LocusShowInfo?antique_number="+antique_number;
	}
	function LocusShowImg(antique_number,antique_status) {
		if(antique_status < 4)
			layer.alert('请先通过多维鉴定!', {icon: 5});
		else
			window.location.href = "/antique/audit5/LocusShowImgInfo?antique_number="+antique_number;
	}
	var reB;
	var an;
    function recheck512(recheckBol,antique_number,antique_status,antique_locus_submit,antique_locus_submitImg) {
		if(antique_status < 4 || antique_locus_submit != 'yes' || antique_locus_submitImg != 'yes')
			layer.alert('请先通过所有位点信息录入!', {icon: 5});
		else if(antique_status == 4 || (antique_locus_submit != 'yes' && antique_locus_submitImg != 'yes' && recheckBol == 'yes')){
			layer.confirm('确认通过位点信息复核？', {
				btn: ['确认', '取消']
			}, function(index, layero){
				window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck51?recheckBol="+recheckBol+"&antique_number_lu="+antique_number;
			}, function(index){
				//按钮【按钮二】的回调
			});
		}
		else if(antique_status == 4 || (antique_locus_submit == 'yes' && antique_locus_submitImg == 'yes' && recheckBol == 'no')){
			reB = recheckBol;
			an = antique_number;
			layer.confirm('确认拒绝位点信息复核？', {
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
					title: '位点信息审核',
					content: $(".rejectBitRececkor"),
					end:function(){
						$(".rejectBitRececkor").css({"display":"none"})
					},
					cancel: function(){//关闭按钮的回调函数
						$(".rejectBitRececkor").css({"display":"none"})
					},
				});
			}, function(index){
			});
		}
	}
	function rejectCertificateBtn() {
		window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck51?recheckBol="+reB+"&antique_number_lu="+an+"&reason="+$('.rejectBitTextarea').val();
	}
	function rejectReason(reason) {
    	$('.rejectBitReasonText').text(reason);
		layer.open({
			type:1,
			anim:4,
			maxmin:true,
			shadeClose:true,
			offset: '150px',
			shade:0.3,
			area:['460px','280px'],
			title: '拒绝理由',
			content: $(".rejectBitReason"),
			end:function(){
				$(".rejectBitReason").css({"display":"none"})
			},
			cancel: function(){//关闭按钮的回调函数
				$(".rejectBitReason").css({"display":"none"})
			},
		});
	}
</script>
</html>
