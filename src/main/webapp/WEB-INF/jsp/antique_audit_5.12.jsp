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
			<div class="bit_trial_specialist" style="position:relative;left:847px;top:-1553px;width: 660px;">
				<blockquote class="layui-elem-quote" style="position:relative;top: 200px;">位点信息录入</blockquote>
				<!--位点`图片录入-->
				<form id="bit_trialImg" class="layui-form">
                    <input type="text" name="antique_number_lu" hidden="hidden" value="${locus.antique_number_lu}">
					<div class="layui-form-item" style=" position: relative;top:200px;left: 10px; width: 200px; z-index: 999;">
						<label class="layui-form-label" style="position:relative;left:-20px;width: 100px;">位点标记图</label>
						<div class="layui-input-block" >
							<select name="antique_locus_imgnum" class="selectBitImgNumber" lay-verify="required" <c:if test="${locus.antique_locus_submitImg == 'yes'}">disabled</c:if>>
								<option value="${locus.antique_locus_imgnum}"><c:if test="${locus.antique_locus_submitImg == 'yes'}">${locus.antique_locus_imgnum}</c:if><c:if test="${locus.antique_locus_submitImg != 'yes'}">请选择</c:if></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
					</div>
					<!--位点1-->
					<div id="bitImg1" style="margin-top: -30px;">
						<label class="layui-form-label" style="width: 115px;left:-120px;top: 240px;">位点标记图1</label>
						<div class="layui-form-item" style="position:relative;top:250px;margin-bottom: 25px;">
							<c:if test="${locus.antique_locus_submitImg != 'yes'}">
							<input style="position: relative;top: -130px;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')">
							</c:if>
							<img src="${pageContext.request.contextPath}/upload/${locus.antique_locus_img1}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
						</div>
					</div>
					<!--位点2-->
					<div id="bitImg2" style="margin-top: 60px;">
						<label class="layui-form-label" style="width: 115px;left:-20px;top: 240px;">位点标记图2</label>
						<div class="layui-form-item" style="position:relative;top:250px;margin-bottom: 25px;">
							<c:if test="${locus.antique_locus_submitImg != 'yes'}">
								<input style="position: relative;top: -130px;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')">
							</c:if>
							<img src="${pageContext.request.contextPath}/upload/${locus.antique_locus_img2}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
						</div>
					</div>
					<!--位点3-->
					<div id="bitImg3" style="margin-top: 60px;">
						<label class="layui-form-label" style="width: 115px;left:-20px;top: 240px;">位点标记图3</label>
						<div class="layui-form-item" style="position:relative;top:250px;margin-bottom: 25px;">
							<c:if test="${locus.antique_locus_submitImg != 'yes'}">
								<input style="position: relative;top: -130px;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')">
							</c:if>
							<img src="${pageContext.request.contextPath}/upload/${locus.antique_locus_img3}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
						</div>
					</div>
					<!--位点4-->
					<div id="bitImg4" style="margin-top: 60px;">
						<label class="layui-form-label" style="width: 115px;left:-20px;top: 240px; ">位点标记图4</label>
						<div class="layui-form-item" style="position:relative;top:250px;margin-bottom: 25px;">
							<c:if test="${locus.antique_locus_submitImg != 'yes'}">
								<input style="position: relative;top: -130px;" type="file" class="specialistUploadInput" name="uploadfile" onchange="viewImage(this,'preview2')">
							</c:if>
							<img src="${pageContext.request.contextPath}/upload/${locus.antique_locus_img4}" class="imgUpSpecialist" style="position: relative;left:0px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
						</div>
					</div>
					<button type="button" class="layui-btn <c:if test="${locus.antique_locus_submitImg == 'yes'}">layui-btn-disabled</c:if>
					" style="position: relative;top:320px;left:270px;width: 100px;" <c:if test="${locus.antique_locus_submitImg != 'yes'}">onclick="bitImgSumbit()"</c:if>>
                        <c:if test="${locus.antique_locus_submitImg != 'yes'}">
                        提交信息
                        </c:if>
                        <c:if test="${locus.antique_locus_submitImg == 'yes'}">
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
	var form = layui.form, layer = layui.layer;
	$(document).ready(function () {
		if($('.selectBitImgNumber').val()=="2"){
			eval("bitImg1.style.display=\"\";");
			eval("bitImg2.style.display=\"\";");
			eval("bitImg3.style.display=\"none\";");
			eval("bitImg4.style.display=\"none\";");
		}else if($('.selectBitImgNumber').val()=="3"){
			eval("bitImg1.style.display=\"\";");
			eval("bitImg2.style.display=\"\";");
			eval("bitImg3.style.display=\"\";");
			eval("bitImg4.style.display=\"none\";");
		}else if($('.selectBitImgNumber').val()=="4"){
			eval("bitImg1.style.display=\"\";");
			eval("bitImg2.style.display=\"\";");
			eval("bitImg3.style.display=\"\";");
			eval("bitImg4.style.display=\"\";");
		}
		else{
			eval("bitImg1.style.display=\"\";");
			eval("bitImg2.style.display=\"none\";");
			eval("bitImg3.style.display=\"none\";");
			eval("bitImg4.style.display=\"none\";");
		}
		// select下拉框选中触发事件
		form.on("select", function(data){
			$('.selectBitImgNumber').val(data.value);
			if($('.selectBitImgNumber').val()=="2"){
				eval("bitImg1.style.display=\"\";");
				eval("bitImg2.style.display=\"\";");
				eval("bitImg3.style.display=\"none\";");
				eval("bitImg4.style.display=\"none\";");
			}else if($('.selectBitImgNumber').val()=="3"){
				eval("bitImg1.style.display=\"\";");
				eval("bitImg2.style.display=\"\";");
				eval("bitImg3.style.display=\"\";");
				eval("bitImg4.style.display=\"none\";");
			}else if($('.selectBitImgNumber').val()=="4"){
				eval("bitImg1.style.display=\"\";");
				eval("bitImg2.style.display=\"\";");
				eval("bitImg3.style.display=\"\";");
				eval("bitImg4.style.display=\"\";");
			}
			else{
				eval("bitImg1.style.display=\"\";");
				eval("bitImg2.style.display=\"none\";");
				eval("bitImg3.style.display=\"none\";");
				eval("bitImg4.style.display=\"none\";");
			}
		});
	})
	function bitImgSumbit() {
        layer.open({
            content: '是否确认提交位点标记图信息？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                var form = document.getElementById("bit_trialImg");
                var formDate = new FormData(form);
                $.ajax({
                    url: '${pageContext.request.contextPath}/antique/audit5/bit_trialImgInfo',
                    type: 'POST',
                    data:formDate,
                    dataType: "json",
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function () {
                        layer.alert('位点标记图已提交,请等待复核', {icon: 1});
                        layer.closeAll('page');
                        window.location.href = ${pageContext.request.contextPath}"/antique/audit5/1"
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
