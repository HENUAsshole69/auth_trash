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
					<blockquote class="layui-elem-quote">文物信息</blockquote>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">文物编号</label>
						<div class="layui-input-block">
							<input disabled value="${antique.antique_number}" type="text" name="antique_number" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;margin-top: 30px;"/>
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label">名称</label>
						<div class="layui-input-block">
							<input disabled value="${antique.antique_name}" type="text" name="antique_name" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;margin-top: 30px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label">年代</label>
						<div class="layui-input-block">
							<input value="${antique.antique_time}" disabled type="text" name="antique_time" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">完整程度</label>
						<div class="layui-input-block">
							<input value="${antique.antique_intact}" disabled type="text" name="antique_intact" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">鉴定诉求</label>
						<div class="layui-input-block">
							<input value="${antique.antique_authenticate}" disabled type="text" name="antique_authenticate" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;">来源信息</label>
						<div class="layui-input-block">
							<input value="${antique.antique_info}" disabled type="text" name="antique_info" required  lay-verify="required" autocomplete="off" class="layui-input " style="width: 250px;">
						</div>
					</div>
					<div class="layui-form-item" style="position:relative;height:100px;top:-20px; left:80px; z-index: 9999999;">
						<form id="updateForm" action="">
							<img src="${pageContext.request.contextPath}/upload/${antique.antique_img}" class="imgUp" style="position: relative;left:30px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
						</form>
					</div>
					<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
						<label class="layui-form-label">描述</label>
						<div class="layui-input-block" style="width: 450px;">
							<textarea disabled name="desc" class="layui-textarea ">${antique.antique_details}</textarea>
						</div>
					</div>
					<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
						<label class="layui-form-label">规格</label>
						<div class="layui-input-block" style="width: 450px;">
							<textarea disabled name="desc" class="layui-textarea ">${antique.antique_form}</textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="first_trial_specialist" style="position:relative;left:847px;top:-1553px;width: 660px;">
				<form class="layui-form">
				<blockquote class="layui-elem-quote" style="position:relative;top: 200px;">多维鉴定</blockquote>
				<!--专家审核-->
                    <input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
					<blockquote class="layui-elem-quote layui-quote-nm" style="position: relative;top: 200px;width: 300px;height: 50px;">
						<div class="layui-form-item" style="position: absolute;top:5px;left: -25px; width: 300px; z-index: 999;">
							<label class="layui-form-label" style="width: 100px;">藏品类型</label>
							<div class="layui-input-block">
								<select class="selectKind" lay-verify="required" <c:if test="${checkSpecialist.antique_kind != null}">disabled</c:if>>
									<option value="${checkSpecialist.antique_kind}">${checkSpecialist.antique_kind}</option>
									<option value="文物">文物</option>
									<option value="艺术品">艺术品</option>
									<option value="非文物非艺术品">非文物非艺术品</option>
								</select>
							</div>
						</div>
					</blockquote>
				</form>
					<!--4.1.1 一号下拉框-->
					<div id="div1"  style="position: relative;width: 300px;">
						<!--文物局-->
						<form action="${pageContext.request.contextPath}/antique/audit4_1/specialistCheck"  enctype="multipart/form-data" method="post">
							<div style="position: relative;top: 15px;">
								<input type="text" class="antique_kind" name="antique_kind" hidden="hidden">
								<input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">文物局专家名</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_aspecialist_name}" name="antique_aspecialist_name" type="text" class="layui-input antique_specialistName"   required  lay-verify="required"
											   autocomplete="off" class="layui-input"
											   <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
											   style="width: 250px;position: relative;left:-20px;top: 200px;">
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-40px;top: 190px;">日期</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_aspecialist_time}" name="antique_aspecialist_time" type="text" class="layui-input antique_specialistTime" id="test4"  required  lay-verify="required"
											   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;"
											   <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
										>
									</div>
								</div>
								<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
									<label class="layui-form-label" style="width: 100px;">专家意见</label>
									<div class="layui-input-block" style="width: 450px;">
								<textarea placeholder="请输入意见" name="antique_aspecialist_notes"
										  <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
										  class="layui-textarea antique_specialistNotes">${checkSpecialist.antique_aspecialist_notes}</textarea>
									</div>
								</div>
								<div class="layui-form-item" style="position:relative;height:100px;top:195px; left:90px;">
										<input style="position: relative;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')"  <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>>
									<img src="${pageContext.request.contextPath}/upload/${checkSpecialist.antique_aspecialist_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
								</div>
							</div>
							<c:if test="${checkSpecialist.antique_aspecialist_res != 'true'}"><button type="submit" class="layui-btn  layui-btn-warm" style="position: relative;top:385px;left:420px;width: 100px;">通过审核</button></c:if>
							<c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}"><button type="button" class="layui-btn  layui-btn-warm layui-btn-disabled" style="position: relative;top:385px;left:420px;width: 100px;">已通过审核</button></c:if>
						</form>
							<!--文物局-->
							<!--科技鉴定-->
						<form action="${pageContext.request.contextPath}/antique/audit4_1_1/specialistCheck" enctype="multipart/form-data" method="post">
							<div style="position: relative;top: 250px;">
								<input type="text" class="antique_kind" name="antique_kind" hidden="hidden">
								<input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">科技鉴定专家名</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_tspecialist_name}" name="antique_tspecialist_name" type="text" class="layui-input antique_specialistName"   required  lay-verify="required"
											   autocomplete="off" class="layui-input"
											   <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>
											   style="width: 250px;position: relative;left:-20px;top: 200px;">
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-40px;top: 190px;">日期</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_tspecialist_time}" name="antique_tspecialist_time" type="text" class="layui-input antique_specialistTime" id="test2"  required  lay-verify="required"
											   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;" <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>>
									</div>
								</div>
								<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
									<label class="layui-form-label" style="width: 100px;">专家意见</label>
									<div class="layui-input-block" style="width: 450px;">
								<textarea placeholder="请输入意见" name="antique_tspecialist_notes"
										  class="layui-textarea antique_tspecialist_notes"
										  <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>
								>${checkSpecialist.antique_tspecialist_notes}</textarea>
									</div>
								</div>
								<div class="layui-form-item" style="position:relative;height:100px;top:195px; left:90px;">
									<input style="position: relative;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')"  <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>>
									<img src="${pageContext.request.contextPath}/upload/${checkSpecialist.antique_tspecialist_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
								</div>
							</div>
							<c:if test="${checkSpecialist.antique_tspecialist_res != 'true'}"><button type="submit" class="layui-btn  layui-btn-warm" style="position: relative;top:585px;left:420px;width: 100px;">通过审核</button></c:if>
							<c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}"><button type="button" class="layui-btn  layui-btn-warm layui-btn-disabled" style="position: relative;top:585px;left:420px;width: 100px;">已通过审核</button></c:if>
						</form>
							<!--科技鉴定-->
					</div>
					<!--4.1.1 一号下拉框-->
					<!--4.1.2 二号下拉框-->
					<div id="div2"  style="position: relative;top: 0px;width: 300px;">
						<!--文物局-->
						<form action="${pageContext.request.contextPath}/antique/audit4_1/specialistCheck"  enctype="multipart/form-data" method="post">
							<div style="position: relative;top:15px;">
								<input type="text" class="antique_kind" name="antique_kind" hidden="hidden">
								<input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">文物局专家名</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_aspecialist_name}" name="antique_aspecialist_name" type="text" class="layui-input antique_specialistName"   required  lay-verify="required"
											   autocomplete="off" class="layui-input"
											   <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
											   style="width: 250px;position: relative;left:-20px;top: 200px;">
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-40px;top: 190px;">日期</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_aspecialist_time}" name="antique_aspecialist_time" type="text" class="layui-input antique_specialistTime" id="test1"  required  lay-verify="required"
											   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;"
											   <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
										>
									</div>
								</div>
								<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
									<label class="layui-form-label" style="width: 100px;">专家意见</label>
									<div class="layui-input-block" style="width: 450px;">
								<textarea placeholder="请输入意见" name="antique_aspecialist_notes"
										  <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>
										  class="layui-textarea antique_specialistNotes">${checkSpecialist.antique_aspecialist_notes}</textarea>
									</div>
								</div>
								<div class="layui-form-item" style="position:relative;height:100px;top:195px; left:90px;">
									<input style="position: relative;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')"  <c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}">disabled</c:if>>
									<img src="${pageContext.request.contextPath}/upload/${checkSpecialist.antique_aspecialist_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
								</div>
							</div>
							<c:if test="${checkSpecialist.antique_aspecialist_res != 'true'}"><button type="submit" class="layui-btn  layui-btn-warm" style="position: relative;top:385px;left:420px;width: 100px;">通过审核</button></c:if>
							<c:if test="${checkSpecialist.antique_aspecialist_res == 'true'}"><button type="button" class="layui-btn  layui-btn-warm layui-btn-disabled" style="position: relative;top:385px;left:420px;width: 100px;">已通过审核</button></c:if>
						</form>
						<!--文物局-->
						<!--艺术品鉴定-->
						<form action="${pageContext.request.contextPath}/antique/audit4_1_2/specialistCheck" enctype="multipart/form-data" method="post">
							<div style="position: relative;top: 250px;">
								<input type="text" class="antique_kind" name="antique_kind" hidden="hidden">
								<input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">艺术品鉴定专家名</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_rspecialist_name}" name="antique_rspecialist_name" type="text" class="layui-input "   required  lay-verify="required"
											   autocomplete="off" class="layui-input"
											   <c:if test="${checkSpecialist.antique_rspecialist_res == 'true'}">disabled</c:if>
											   style="width: 250px;position: relative;left:-20px;top: 200px;">
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-40px;top: 190px;">日期</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_rspecialist_time}" name="antique_rspecialist_time" type="text" class="layui-input " id="test5"  required  lay-verify="required"
											   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;" <c:if test="${checkSpecialist.antique_rspecialist_res == 'true'}">disabled</c:if>>
									</div>
								</div>
								<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
									<label class="layui-form-label" style="width: 100px;">专家意见</label>
									<div class="layui-input-block" style="width: 450px;">
								<textarea placeholder="请输入意见" name="antique_rspecialist_notes"
										  class="layui-textarea antique_rspecialist_notes"
										  <c:if test="${checkSpecialist.antique_rspecialist_res == 'true'}">disabled</c:if>
								>${checkSpecialist.antique_rspecialist_notes}</textarea>
									</div>
								</div>
								<div class="layui-form-item" style="position:relative;height:100px;top:195px; left:90px;">
									<input style="position: relative;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')"  <c:if test="${checkSpecialist.antique_rspecialist_res == 'true'}">disabled</c:if>>
									<img src="${pageContext.request.contextPath}/upload/${checkSpecialist.antique_rspecialist_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
								</div>
							</div>
							<c:if test="${checkSpecialist.antique_rspecialist_res != 'true'}"><button type="submit" class="layui-btn  layui-btn-warm" style="position: relative;top:585px;left:420px;width: 100px;">通过审核</button></c:if>
							<c:if test="${checkSpecialist.antique_rspecialist_res == 'true'}"><button type="button" class="layui-btn  layui-btn-warm layui-btn-disabled" style="position: relative;top:585px;left:420px;width: 100px;">已通过审核</button></c:if>
						</form>
						<!--艺术品鉴定-->
						<!--科技鉴定-->
						<form action="${pageContext.request.contextPath}/antique/audit4_1_1/specialistCheck" enctype="multipart/form-data" method="post">
							<div style="position: relative;top: 400px;">
								<input type="text" class="antique_kind" name="antique_kind" hidden="hidden">
								<input type="text" name="antique_number_d" hidden="hidden" value="${checkSpecialist.antique_number_d}">
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">科技鉴定专家名</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_tspecialist_name}" name="antique_tspecialist_name" type="text" class="layui-input antique_specialistName"   required  lay-verify="required"
											   autocomplete="off" class="layui-input"
											   <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>
											   style="width: 250px;position: relative;left:-20px;top: 200px;">
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 25px;">
									<label class="layui-form-label" style="width: 100px;left:-40px;top: 190px;">日期</label>
									<div class="layui-input-block">
										<input value="${checkSpecialist.antique_tspecialist_time}" name="antique_tspecialist_time" type="text" class="layui-input antique_specialistTime" id="test3"  required  lay-verify="required"
											   autocomplete="off" class="layui-input" style="width: 250px;position: relative;left:-20px;top: 190px;" <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>>
									</div>
								</div>
								<div class="layui-form-item layui-form-text" style="position: relative;left: -20px;top: 180px;">
									<label class="layui-form-label" style="width: 100px;">专家意见</label>
									<div class="layui-input-block" style="width: 450px;">
								<textarea placeholder="请输入意见" name="antique_tspecialist_notes"
										  class="layui-textarea antique_tspecialist_notes"
										  <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>
								>${checkSpecialist.antique_tspecialist_notes}</textarea>
									</div>
								</div>
								<div class="layui-form-item" style="position:relative;height:100px;top:195px; left:90px;">
									<input style="position: relative;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')"  <c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}">disabled</c:if>>
									<img src="${pageContext.request.contextPath}/upload/${checkSpecialist.antique_tspecialist_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
								</div>
							</div>
							<c:if test="${checkSpecialist.antique_tspecialist_res != 'true'}"><button type="submit" class="layui-btn  layui-btn-warm" style="position: relative;top:685px;left:420px;width: 100px;">通过审核</button></c:if>
							<c:if test="${checkSpecialist.antique_tspecialist_res == 'true'}"><button type="button" class="layui-btn  layui-btn-warm layui-btn-disabled" style="position: relative;top:685px;left:420px;width: 100px;">已通过审核</button></c:if>
						</form>
						<!--科技鉴定-->
					</div>
					<!--4.1.2 二号下拉框-->
			</div>
		</div>
	</body>
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
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test2' //指定元素
		});
	});
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test3' //指定元素
		});
	});
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test4' //指定元素
		});
	});
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem: '#test5' //指定元素
		});
	});
	// 监听
	$(document).ready(function() {
		if($('.selectKind').val()=="文物") {
			eval("div1.style.display=\"\";");
			eval("div2.style.display=\"none\";");
		}else if(($('.selectKind').val()=="艺术品")||($('.selectKind').val()=="非文物非艺术品")) {
			eval("div2.style.display=\"\";");
			eval("div1.style.display=\"none\";");
		}else{
			eval("div1.style.display=\"\";");
			eval("div2.style.display=\"none\";");
		}
		// select下拉框选中触发事件
		form.on("select", function(data){
			$('.antique_kind').val(data.value);
			if(data.value=="文物") {
				eval("div1.style.display=\"\";");
				eval("div2.style.display=\"none\";")
			}else{
				eval("div1.style.display=\"none\";")
				eval("div2.style.display=\"\";");
			}
		});
	});
</script>
</html>
