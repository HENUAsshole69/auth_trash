<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<div class="antiqueInfo" style="display: none">
	<form class="layui-form" action="" onsubmit="">
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;">文物编号</label>
			<div class="layui-input-block">
				<input disabled value="" type="text" name="antique_number" required  lay-verify="required" autocomplete="off" class="layui-input antique_number" style="width: 250px;margin-top: 30px;">
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label">名称</label>
			<div class="layui-input-block">
				<input disabled value="" type="text" name="antique_name" required  lay-verify="required" autocomplete="off" class="layui-input antique_name" style="width: 250px;margin-top: 30px;">
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label">年代</label>
			<div class="layui-input-block">
				<input value="" disabled type="text" name="antique_time" required  lay-verify="required" autocomplete="off" class="layui-input antique_time" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;">完整程度</label>
			<div class="layui-input-block">
				<input value="" disabled type="text" name="antique_intact" required  lay-verify="required" autocomplete="off" class="layui-input antique_intact" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;">鉴定诉求</label>
			<div class="layui-input-block">
				<input value="" disabled type="text" name="antique_authenticate" required  lay-verify="required" autocomplete="off" class="layui-input antique_authenticate" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;">来源信息</label>
			<div class="layui-input-block">
				<input value="" disabled type="text" name="antique_info" required  lay-verify="required" autocomplete="off" class="layui-input antique_info" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;height:100px;top:-20px; left:80px; z-index: 9999999;">
			<form id="updateForm" action="">
				<img class="imgUp" style="position: relative;left:30px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
			</form>
		</div>
		<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
			<label class="layui-form-label">描述</label>
			<div class="layui-input-block">
				<textarea disabled name="desc" class="layui-textarea antique_details"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
			<label class="layui-form-label">规格</label>
			<div class="layui-input-block">
				<textarea disabled name="desc" class="layui-textarea antique_form"></textarea>
			</div>
		</div>
	</form>
	<button type="button" class="layui-btn yesBtn" style="position: relative;top:180px;left: 330px;" onclick="recheckYes()">通过复核</button>
	<button type="button" class="layui-btn layui-btn-danger noBtn" style="position: relative;top:180px;left: 330px;" onclick="recheckNO()">拒绝通过</button>
</div>
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
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit/1">
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
						  <button type="button" class="layui-btn layui-btn-sm" onclick="antiqueDetails('${antiques.antique_number}','${antiques.antique_name}'
								  ,'${antiques.antique_info}','${antiques.antique_details}','${antiques.antique_time}'
								  ,'${antiques.antique_intact}','${antiques.antique_authenticate}','${antiques.antique_form}','${antiques.antique_recheck}','${antiques.antique_img}')">审核文物</button>
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
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/audit/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
	function antiqueDetails(antique_number,antique_name,antique_info,antique_details,antique_time,antique_intact,antique_authenticate,antique_form,antique_recheck,antique_img) {
		$(".antique_number").val(antique_number);
		$(".antique_name").val(antique_name);
		$(".antique_info").val(antique_info);
		$(".antique_details").val(antique_details);
		$(".antique_time").val(antique_time);
		$(".antique_authenticate").val(antique_authenticate);
		$(".antique_form").val(antique_form);
		$(".antique_intact").val(antique_intact);
		$(".imgUp").attr("src","/upload/"+antique_img);
		$(".recheck").val(antique_recheck);
		layer.open({
			type:1,
			anim:4,
			maxmin:true,
			shadeClose:true,
			offset: '150px',
			shade:0.3,
			area:['560px','580px'],
			title: '文物详情',
			content: $(".antiqueInfo"),
			end:function(){
				$(".antiqueInfo").css({"display":"none"})
			},
			cancel: function(){//关闭按钮的回调函数
				$(".antiqueInfo").css({"display":"none"})
			},
		});
		var recheckStatus = $('.recheck').val();
		if(recheckStatus == 'true'){
			layer.alert('该文物已通过复核', {icon: 1});
			$('.yesBtn').attr("disabled",true);
			$('.noBtn').attr("disabled",true);
		}else if(recheckStatus == 'false'){
			layer.alert('该文物未通过复核', {icon: 2});
			$('.yesBtn').attr("disabled",true);
			$('.noBtn').attr("disabled",true);
		}else {
			layer.alert('该文物未复核', {icon: 3});
			$('.yesBtn').attr("disabled",false);
			$('.noBtn').attr("disabled",false);
		}
	}
	function recheckYes() {
		layer.open({
			content: '是否确认通过审核？'
			,btn: ['确认', '取消']
			,yes: function(index, layero){
				layer.alert('复核已通过', {icon: 1});
				layer.closeAll('page');
				window.location.href = '/antique/audit/recheckYes?recheck='+$('.antique_number').val();
			}
			,btn2: function(index, layero){
			}
			,cancel: function(){
				//右上角关闭回调
				//return false 开启该代码可禁止点击该按钮关闭
			}
		});
	}
	function recheckNO() {
		layer.open({
			content: '是否确认拒绝通过？'
			,btn: ['确认', '取消']
			,yes: function(index, layero){
				layer.alert('复核已拒绝', {icon: 5});
				layer.closeAll('page');
				window.location.href = '/antique/audit/recheckNo?recheck='+$('.antique_number').val();
			}
			,btn2: function(index, layero){
			}
			,cancel: function(){
				//右上角关闭回调
				//return false 开启该代码可禁止点击该按钮关闭
			}
		});
	}
</script>
</html>
