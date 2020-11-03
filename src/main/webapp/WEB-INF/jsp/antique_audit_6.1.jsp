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
				<blockquote class="layui-elem-quote" style="position:relative;top: 200px;">证书信息录入</blockquote>
				<!--证书录入-->
				<form id="first_trial">
                    <input type="text" name="antique_number_ce" hidden="hidden" value="${certificate.antique_number_ce}">
					<div class="layui-form-item" style="margin-bottom: 25px;">
						<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">证书编号</label>
						<div class="layui-input-block">
							<input value="${certificate.antique_certificate_id}" name="antique_certificate_id" type="text" class="layui-input antique_certificate_id"   required  lay-verify="required"
								   autocomplete="off" class="layui-input" <c:if test="${certificate.antique_certificate_id != null && certificate.antique_certificate_id != ''}">disabled</c:if>
								   style="width: 250px;position: relative;left:-20px;top: 200px;">
						</div>
					</div>
					<div class="layui-form-item" style="position:relative;height:100px;top:225px; left:90px;">
						<label class="layui-form-label" style="position:absolute;width: 100px;left:-120px;top:-25px;">证书图片</label>
						<c:if test="${certificate.antique_certificate_id == null || certificate.antique_certificate_id == ''}">
						<input style="position: relative;top: -130px;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')">
						</c:if>
						<img src="${pageContext.request.contextPath}/upload/${certificate.antique_certificate_img}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
					</div>
					<button type="button" class="layui-btn <c:if test="${certificate.antique_certificate_id != null && certificate.antique_certificate_id != ''}">layui-btn-disabled</c:if>
					" style="position: relative;top:350px;left:420px;width: 100px;" <c:if test="${certificate.antique_certificate_id == null || certificate.antique_certificate_id == ''}">onclick="recheck6Yes()</c:if>">
                        <c:if test="${certificate.antique_certificate_id == null || certificate.antique_certificate_id == ''}">
                        提交信息
                        </c:if>
                        <c:if test="${certificate.antique_certificate_id != null && certificate.antique_certificate_id != ''}">
                        信息已提交
                        </c:if>
                    </button>
				</form>
			</div>
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
	function recheck6Yes() {
        layer.open({
            content: '是否确认提交证书信息？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                var form = document.getElementById("first_trial");
                var formDate = new FormData(form);
                $.ajax({
                    url: '${pageContext.request.contextPath}/antique/audit6/certificateInfo',
                    type: 'POST',
                    data:formDate,
                    dataType: "json",
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function () {
                        layer.alert('证书信息已通过,请等待复核', {icon: 1});
                        layer.closeAll('page');
                        window.location.href = ${pageContext.request.contextPath}"/antique/audit6/1"
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
</script>
</html>
