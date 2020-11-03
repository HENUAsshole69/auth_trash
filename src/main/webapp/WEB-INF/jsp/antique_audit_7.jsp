<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<div class="selectCertificate" style="display: none">
	<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit7/certificateInfoInsert" enctype="multipart/form-data" method="post">
		<input type="text" hidden="hidden" name="antique_number_ce"  class="antique_number">
		<div class="layui-form-item" style="position:relative;top: -160px;left:50px;margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;left:-20px;top: 190px;">出证日期</label>
			<div class="layui-input-block">
				<input  name="antique_certificate_time" type="text" class="layui-input "  required  lay-verify="required"
					   autocomplete="off"  style="width: 250px;position: relative;left:-20px;top: 190px;" disabled
				>
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">业务方</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_certificate_businessman" disabled required  lay-verify="required" autocomplete="off" class="layui-input antique_certificate_businessman" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">藏品估计</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_certificate_price" disabled required  lay-verify="required" autocomplete="off" class="layui-input antique_certificate_price" style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item layui-form-text" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 90px;position: relative;left: 10px;">业务描述</label>
			<div class="layui-input-block" style="width: 350px;">
				<textarea  name="antique_certificate_business" disabled class="layui-textarea antique_certificate_business"></textarea>
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;height:100px;top:185px; left:60px;">
			<label class="layui-form-label" style="position:relative;width: 100px;left:-30px;top:-140px;">业务文件</label>
			<img class="antique_certificate_file" style="position: relative;left:0px;top:-55px;width: 300px;height:250px;"alt="您还未上传图片" >
		</div>
	</form>
</div>

<div class="certificateInput" style="display: none">
	<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit7/certificateInfoInsert" enctype="multipart/form-data" method="post">
		<input type="text" hidden="hidden" name="antique_number_ce"  class="antique_number">
		<div class="layui-form-item" style="position:relative;top: -160px;left:50px;margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;left:-20px;top: 190px;">出证日期</label>
			<div class="layui-input-block">
				<input value="" name="antique_certificate_time" type="text" class="layui-input " id="test1"  required  lay-verify="required"
					   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;"
				>
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">业务方</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_certificate_businessman" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">藏品估计</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_certificate_price" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item layui-form-text" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 90px;position: relative;left: 10px;">业务描述</label>
			<div class="layui-input-block" style="width: 350px;">
				<textarea  name="antique_certificate_business" class="layui-textarea antique_certificate_business"></textarea>
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;height:100px;top:185px; left:60px;">
			<label class="layui-form-label" style="position:relative;width: 100px;left:-30px;top:-140px;">业务文件</label>
			<input style="position: relative;top: -130px;" type="file" class="antique_certificate_file" name="uploadfile" onchange="viewImage(this,'preview2')">
		</div>
		<div class="layui-input-block" style="position: relative;top: 30px;left: 250px;">
			<button class="layui-btn" lay-submit type="submit">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>
</div>

<div class="InfoInsert" style="display: none">
	<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit7/InfoInsert" enctype="multipart/form-data" method="post">
		<input type="text" hidden="hidden" name="antique_number_in"  class="antique_number_in">
		<div class="layui-form-item" style="position:relative;top: -160px;left:50px;margin-bottom: 25px;">
			<label class="layui-form-label" style="width: 100px;left:-20px;top: 190px;">文本框1</label>
			<div class="layui-input-block">
				<input value="" name="antique_info1" type="text" class="layui-input " required  lay-verify="required"
					   autocomplete="off" style="width: 250px;position: relative;left:-20px;top: 190px;"
				>
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">文本框2</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_info2" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">文本框3</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_info3" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;top:20px;left:30px;">
			<label class="layui-form-label" style="width: 100px;">文本框4</label>
			<div class="layui-input-block">
				<input value="" type="text" name="antique_info4" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
			</div>
		</div>
		<div class="layui-form-item" style="position:relative;height:100px;top:185px; left:60px;">
			<label class="layui-form-label" style="position:relative;width: 100px;left:-30px;top:-140px;">业务文件</label>
			<input style="position: relative;top: -130px;" type="file" class="antique_certificate_file" name="uploadfile" onchange="viewImage(this,'preview2')">
		</div>
		<div class="layui-input-block" style="position: relative;top: 30px;left: 250px;">
			<button class="layui-btn" lay-submit type="submit">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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

		<div id="div"></div>
		<div >
			<form class="layui-form" action="${pageContext.request.contextPath}/antique/audit7/1">
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
						  <c:if test="${antiques.antique_certificate_insert != 'yes'}">
							  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="certificateInfoInsert('${antiques.antique_number}','${antiques.antique_status}')">录入业务</button>
						  </c:if>
						  <c:if test="${antiques.antique_certificate_insert == 'yes'}">
							  <button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="selectcertificateInfoInsert('${antiques.antique_certificate_time}','${antiques.antique_certificate_business}','${antiques.antique_certificate_businessman}','${antiques.antique_certificate_price}','${antiques.antique_certificate_file}')">查看业务</button>
						  </c:if>
							<c:if test="${antiques.antique_recheckor == 'yes'}">
							  <button type="button" class="layui-btn layui-btn-disabled layui-btn-sm">已通过复核</button>
								<button type="button" class="layui-btn layui-btn-warm layui-btn-sm" onclick="InfoInsert('${antiques.antique_number}')">追加信息</button>
							</c:if>
							<c:if test="${antiques.antique_recheckor != 'yes'}">
							  <button type="button" class="layui-btn  layui-btn-sm"
							  		  <c:if test="${antiques.antique_status <= 6}">
									  onclick="recheck71('yes','${antiques.antique_certificate_insert}','${antiques.antique_status}','${antiques.antique_number}')"
									  </c:if>
							  >通过复核</button>
							  <button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
									  <c:if test="${antiques.antique_status <= 6}">
									  onclick="recheck71('no','${antiques.antique_certificate_insert}','${antiques.antique_status}','${antiques.antique_number}')"
									  </c:if>
							  >拒绝复核</button>
							</c:if>
									<c:if test="${antiques.antique_recheckor == 'no'}">
										<button type="button" class="layui-btn layui-btn-danger layui-btn-sm"
													onclick="rejectReason7('${antiques.antique_recheckor_reason}')"
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
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit7/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit7/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/audit7/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/audit7/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit7/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/antique/audit7/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
	<div style="display: none" class="rejectCertificateRececkor">
		<form class="layui-form">
		<div class="layui-form-item layui-form-text" style="width: 400px;margin-top: 40px;">
			<label class="layui-form-label">拒绝理由</label>
			<div class="layui-input-block">
				<textarea name="desc"  placeholder="请填写拒绝业务信息复核理由" class="layui-textarea rejectCertificateTextarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn rejectRecheckBtn layui-btn layui-btn-sm" onclick="rejectCertificateBtn7()">立即提交</button>
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
	var form = layui.form, layer = layui.layer;
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test1' //指定元素
		});
	});
	function certificateInfoInsert(antique_number,antique_status) {
			$('.antique_number').val(antique_number);
			if(antique_status < 6)
				layer.alert('请先通过位点信息审核!', {icon: 5});
			else
				layer.open({
					type: 1,
					anim: 4,
					maxmin: true,
					shadeClose: true,
					offset: '150px',
					shade: 0.3,
					area: ['560px', '550px'],
					title: '业务信息录入',
					content: $(".certificateInput"),
					end: function () {
						$(".certificateInput").css({"display": "none"})
					},
					cancel: function () {//关闭按钮的回调函数
						$(".certificateInput").css({"display": "none"})
					},
				});
	}
	var reB;
	var an;
    function recheck71(recheckBol,certificate_insert,antique_status,antique_number) {
		if(antique_status < 6 || certificate_insert == null || certificate_insert == "")
			layer.alert('请先通过业务信息录入!', {icon: 5});
		else if(antique_status == 6 && certificate_insert != null && certificate_insert != "" && recheckBol == 'yes'){
				layer.confirm('确认通过业务信息复核？', {
				btn: ['确认', '取消']
			}, function(index, layero){
				window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck71?recheckBol="+recheckBol+"&antique_number="+antique_number;
			}, function(index){
				//按钮【按钮二】的回调
			});
		}
		else if(antique_status == 6 && certificate_insert != null && certificate_insert != "" && recheckBol == 'no'){
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
					title: '业务信息审核',
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
	function rejectCertificateBtn7() {
		window.location.href = ${pageContext.request.contextPath}"/antique/audit/recheck71?recheckBol="+reB+"&antique_number="+an+"&reason="+$('.rejectCertificateTextarea').val();
	}
	function rejectReason7(reason) {
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
	function selectcertificateInfoInsert(time,business,businessman,price,file) {
		$('.antique_certificate_time').val(time);
		$('.antique_certificate_business').html(business);
		$('.antique_certificate_businessman').val(businessman);
		$('.antique_certificate_price').val(price);
		$('.antique_certificate_file').attr('src','/upload/'+file);
		layer.open({
			type:1,
			anim:4,
			maxmin:true,
			shadeClose:true,
			offset: '150px',
			shade:0.3,
			area:['560px', '550px'],
			title: '业务信息',
			content: $(".selectCertificate"),
			end:function(){
				$(".selectCertificate").css({"display":"none"})
			},
			cancel: function(){//关闭按钮的回调函数
				$(".selectCertificate").css({"display":"none"})
			},
		});
	}
	
	function InfoInsert(antique_number) {
		$('.antique_number_in').val(antique_number);
		layer.open({
			type:1,
			anim:4,
			maxmin:true,
			shadeClose:true,
			offset: '150px',
			shade:0.3,
			area:['560px', '550px'],
			title: '追加信息',
			content: $(".InfoInsert"),
			end:function(){
				$(".InfoInsert").css({"display":"none"})
			},
			cancel: function(){//关闭按钮的回调函数
				$(".InfoInsert").css({"display":"none"})
			},
		});
	}
</script>
</html>
