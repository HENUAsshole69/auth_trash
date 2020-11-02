<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<!--企业 -->
	<div class="companyInfoInput" style="display: none">
		<form class="layui-form" id="company">
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">企业名称</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_name" required  lay-verify="required" autocomplete="off" class="layui-input applicant_name" style="width: 250px;margin-top: 30px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">营业执照代码</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_buscode" required  lay-verify="required" autocomplete="off" class="layui-input applicant_buscode" style="width: 250px;margin-top: 30px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">注册地址</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_loginadress" required  lay-verify="required" autocomplete="off" class="layui-input applicant_loginadress" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">官方代表人</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_represent" required  lay-verify="required" autocomplete="off" class="layui-input applicant_represent" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">法人职务</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_legal" required  lay-verify="required" autocomplete="off" class="layui-input applicant_legal" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">注册资本</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_capital" required  lay-verify="required" autocomplete="off" class="layui-input applicant_capital" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">联络人</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_reperson" required  lay-verify="required" autocomplete="off" class="layui-input applicant_reperson" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">联系人职务</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_rejob" required  lay-verify="required" autocomplete="off" class="layui-input applicant_rejob" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">联系电话</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_phone" required  lay-verify="required" autocomplete="off" class="layui-input applicant_phone" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">电子邮件</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_email" required  lay-verify="required" autocomplete="off" class="layui-input applicant_email" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">传真</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_max" required  lay-verify="required" autocomplete="off" class="layui-input applicant_max" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">邮编</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_code" required  lay-verify="required" autocomplete="off" class="layui-input applicant_code" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">通讯地址</label>
				<div class="layui-input-block">
					<input value="" disabled type="text" name="applicant_address" required  lay-verify="required" autocomplete="off" class="layui-input applicant_address" style="width: 250px;">
				</div>
			</div>
		</form>
	</div>
<!--企业 -->
<!--个体 -->
	<div class="personInfoInput" style="display: none">
		<form class="layui-form" id="individual">
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_name" required  lay-verify="required" autocomplete="off" class="layui-input applicant_name" style="width: 250px;margin-top: 30px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">身份证号</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_number" required  lay-verify="required" autocomplete="off" class="layui-input applicant_number" style="width: 250px;margin-top: 30px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">联系方式</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_phone" required  lay-verify="required" autocomplete="off" class="layui-input applicant_phone" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">电子邮件</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_email" required  lay-verify="required" autocomplete="off" class="layui-input applicant_email" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label">传真</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_max" required  lay-verify="required" autocomplete="off" class="layui-input applicant_max" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label">邮编</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_code" required  lay-verify="required" autocomplete="off" class="layui-input applicant_code" style="width: 250px;">
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 25px;">
				<label class="layui-form-label" style="width: 100px;">通讯地址</label>
				<div class="layui-input-block">
					<input value="" type="text" name="applicant_address" required  lay-verify="required" autocomplete="off" class="layui-input applicant_address" style="width: 250px;">
				</div>
			</div>
		</form>
	</div>
<!--个体 -->
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
		<div class="layui-form-item" style="position:relative;height:100px; left:80px; z-index: 9999999;">
			<form id="updateForm" action="">
				<img id="preview2" class="imgUp" width="200px" alt="您还未上传图片" src="${pageContext.request.contextPath}/upload/${user.image}">
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
</div>
<div class="certificateInfo" style="display: none">
	<div class="layui-form-item" style="margin-bottom: 25px;">
		<label class="layui-form-label certificate_id" style="width: 100px;left:30px;top: 20px;">证书编号</label>
		<div class="layui-input-block">
			<input  name="antique_certificate_id" type="text" class="layui-input antique_certificate_id"   required  lay-verify="required"
				   autocomplete="off" disabled style="width: 250px;position: relative;left:20px;top: 20px;" placeholder="证书未录入">
		</div>
	</div>
	<div>
		<label class="layui-form-label" style="position:absolute;width: 100px;left:30px;top:85px;">证书图片</label>
		<img  class="imgUpSpecialist antique_certificate_img" style="position: relative;left:100px;top:60px;width: 300px;height:250px;"alt="您还未上传图片" >
	</div>
</div>
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
			<form class="layui-form" action="${pageContext.request.contextPath}/index/1">
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
				  <tr>
					  <td>${antiques.antique_name}</td>
					  <td>${antiques.antique_number}</td>
					  <td>${antiques.antique_users}</td>
					  <td>${antiques.antique_details}</td>
					  <td>
						  <button type="button" class="layui-btn layui-btn-sm" onclick="certificateBtn('${antiques.antique_number}')">查看证书</button>
						  <button type="button" class="layui-btn layui-btn-sm">二维码</button>
						  <button type="button" class="layui-btn layui-btn-sm" onclick="antiqueDetails('${antiques.antique_number}','${antiques.antique_name}'
								  ,'${antiques.antique_info}','${antiques.antique_details}','${antiques.antique_time}'
								  ,'${antiques.antique_intact}','${antiques.antique_authenticate}','${antiques.antique_form}','${antiques.antique_img}')">文物详情</button>
						  <button type="button" class="layui-btn layui-btn-sm" onclick="CompanyDiv('${antiques.antique_number}')">文物所属人</button>
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
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/index/1">首页</a></li>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/index/${pageInfo.prePage}">上一页</a></li>
				</c:if>
				<!-- 中间要显示的页数 -->
				<c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
					<c:if test="${navigatepageNum==pageInfo.pageNum}">
						<li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/index/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
					<c:if test="${navigatepageNum!=pageInfo.pageNum}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/index/${navigatepageNum}">${navigatepageNum}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${!pageInfo.isLastPage}">
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/index/${pageInfo.nextPage }">下一页</a></li>
					<li class="page-item"><a class="page-link"
											 href="<%=request.getContextPath() %>/index/${pageInfo.lastPage}">尾页</a></li>
				</c:if>
			</ul>
		</div>
	</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
	function certificateBtn(antique_number) {
		$.ajax({
			url: '${pageContext.request.contextPath}/index/certificate',
			type: 'POST',
			data:"antique_number="+antique_number,
			dataType:'json',
			success: function (data) {
				$('.antique_certificate_id').val(data.antique_certificate_id);
				$('.antique_certificate_img').attr('src',${pageContext.request.contextPath}"/upload/"+data.antique_certificate_img);
				layer.open({
					type: 1,
					anim: 4,
					maxmin: true,
					shadeClose: true,
					offset: '150px',
					shade: 0.3,
					area: ['560px', '580px'],
					title: '证书信息',
					content: $(".certificateInfo"),
					end: function () {
						$(".certificateInfo").css({"display": "none"})
					},
					cancel: function () {//关闭按钮的回调函数
						$(".certificateInfo").css({"display": "none"})
					},
				});
			}
		});
	}
	function antiqueDetails(antique_number,antique_name,antique_info,antique_details,antique_time,antique_intact,antique_authenticate,antique_form,antique_img) {
			$(".antique_number").val(antique_number);
			$(".antique_name").val(antique_name);
			$(".antique_info").val(antique_info);
			$(".antique_details").val(antique_details);
			$(".antique_time").val(antique_time);
			$(".antique_authenticate").val(antique_authenticate);
			$(".antique_form").val(antique_form);
			$(".antique_intact").val(antique_intact);
			$(".imgUp").attr("src",${pageContext.request.contextPath}"/upload/"+antique_img);
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
	}
	<!--个体/企业窗口-->
	function CompanyDiv(antique_number){
		$.ajax({
			url: '${pageContext.request.contextPath}/index/bePeopleKind',
			type: 'POST',
			data:"antique_number="+antique_number,
			dataType:'json',
			success: function (data) {
				if(data.kind == "企业"){
					$('.applicant_name').val(data.applicant_name);
					$('.applicant_buscode').val(data.applicant_buscode);
					$('.applicant_loginadress').val(data.applicant_loginadress);
					$('.applicant_represent').val(data.applicant_represent);
					$('.applicant_legal').val(data.applicant_legal);
					$('.applicant_capital').val(data.applicant_capital);
					$('.applicant_reperson').val(data.applicant_reperson);
					$('.applicant_rejob').val(data.applicant_rejob);
					$('.applicant_phone').val(data.applicant_phone);
					$('.applicant_email').val(data.applicant_email);
					$('.applicant_max').val(data.applicant_max);
					$('.applicant_code').val(data.applicant_code);
					$('.applicant_address').val(data.applicant_address);
					layer.open({
						type:1,
						anim:4,
						maxmin:true,
						shadeClose:true,
						offset: '150px',
						shade:0.3,
						area:['450px','600px'],
						title: '所属企业信息',
						content: $(".companyInfoInput"),
						end:function(){
							$(".companyInfoInput").css({"display":"none"})
						},
						cancel: function(){
							layer.closeAll();
							$(".companyInfoInput").css({"display":"none"})
						},
					});
				}else if(data.kind == "个体"){
					$('.applicant_name').val(data.applicant_name);
					$('.applicant_number').val(data.applicant_number);
					$('.applicant_phone').val(data.applicant_phone);
					$('.applicant_email').val(data.applicant_email);
					$('.applicant_max').val(data.applicant_max);
					$('.applicant_code').val(data.applicant_code);
					$('.applicant_address').val(data.applicant_address);
					layer.open({
						type:1,
						anim:4,
						maxmin:true,
						shadeClose:true,
						offset: '150px',
						shade:0.3,
						area:['450px','600px'],
						title: '所属人信息',
						content: $(".personInfoInput"),
						end:function(){
							$(".personInfoInput").css({"display":"none"})
						},
						cancel: function(){
							layer.closeAll();
							$(".personInfoInput").css({"display":"none"})
						},
					})
				}
			},
			error: function (data) {
			}
		})
	};
</script>
</html>
