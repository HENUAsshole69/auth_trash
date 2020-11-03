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
				<!--证书录入-->
				<form id="bit_trial" class="layui-form">
                    <input type="text" name="antique_number_lu" hidden="hidden" value="${locus.antique_number_lu}">
					<div class="layui-form-item" style=" position: relative;top:200px;left: 10px; width: 200px; z-index: 999;">
						<label class="layui-form-label" style="position:relative;left:-20px;width: 100px;">位点个数</label>
						<div class="layui-input-block" >
							<select name="antique_locus_textnum" class="selectBitNumber" lay-verify="required" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>>
								<option value="${locus.antique_locus_textnum}"><c:if test="${locus.antique_locus_submit == 'yes'}">${locus.antique_locus_textnum}</c:if><c:if test="${locus.antique_locus_submit != 'yes'}">请选择</c:if></option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
						</div>
					</div>
					<div id="bit3">
						<!--位点1-->
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<label class="layui-form-label" style="width: 100px;left:-30px;top: 200px;">位点1</label>
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text1}" name="antique_locus_text1" type="text" class="layui-input antique_locus_text1"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 200px;">
							</div>
						</div>
						<!--位点2-->
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<div class="layui-input-block">
								<label class="layui-form-label" style="width: 100px;left:-140px;top: 210px;">位点2</label>
								<input value="${locus.antique_locus_text2}" name="antique_locus_text2" type="text" class="layui-input antique_locus_text2"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:-90px;top: 210px;">
							</div>
						</div>
						<!--位点3-->
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<label class="layui-form-label" style="width: 100px;left:-30px;top: 220px;">位点3</label>
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text3}" name="antique_locus_text3" type="text" class="layui-input antique_locus_text3"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 220px;">
							</div>
						</div>
					</div>
					<!--位点4-->
					<div id="bit4">
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<label class="layui-form-label" style="width: 100px;left:-30px;top: 230px;">位点4</label>
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text4}" name="antique_locus_text4" type="text" class="layui-input antique_locus_text4"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 230px;">
							</div>
						</div>
					</div>
					<!--位点5-->
					<div id="bit5">
						<label class="layui-form-label" style="width: 100px;left:-30px;top: 240px;">位点5</label>
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text5}" name="antique_locus_text5" type="text" class="layui-input antique_locus_text5"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 200px;">
							</div>
						</div>
					</div>
					<!--位点6-->
					<div id="bit6">
						<label class="layui-form-label" style="width: 100px;left:-30px;top: 220px;">位点6</label>
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text6}" name="antique_locus_text6" type="text" class="layui-input antique_locus_text6"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 170px;">
							</div>
						</div>
					</div>
					<!--位点7-->
					<div id="bit7">
						<label class="layui-form-label" style="width: 100px;left:-30px;top: 190px;">位点7</label>
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text7}" name="antique_locus_text7" type="text" class="layui-input antique_locus_text7"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 140px;">
							</div>
						</div>
					</div>
					<!--位点8-->
					<div id="bit8">
						<label class="layui-form-label" style="width: 100px;left:-30px;top: 165px;">位点8</label>
						<div class="layui-form-item" style="margin-bottom: 25px;">
							<div class="layui-input-block">
								<input value="${locus.antique_locus_text8}" name="antique_locus_text8" type="text" class="layui-input antique_locus_text8"   required  lay-verify="required"
									   autocomplete="off" class="layui-input" <c:if test="${locus.antique_locus_submit == 'yes'}">disabled</c:if>
									   style="width: 250px;position: relative;left:10px;top: 120px;">
							</div>
						</div>
					</div>
					<button type="button" class="layui-btn <c:if test="${locus.antique_locus_submit == 'yes'}">layui-btn-disabled</c:if>
					" style="position: relative;top:220px;left:270px;width: 100px;" <c:if test="${locus.antique_locus_submit != 'yes'}">onclick="bitSumbit()"</c:if>>
                        <c:if test="${locus.antique_locus_submit != 'yes'}">
                        提交信息
                        </c:if>
                        <c:if test="${locus.antique_locus_submit == 'yes'}">
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
		if($('.selectBitNumber').val()=="4") {
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"\";");
			eval("bit5.style.display=\"none\";");
			eval("bit6.style.display=\"none\";");
			eval("bit7.style.display=\"none\";");
			eval("bit8.style.display=\"none\";");
		}else if($('.selectBitNumber').val()=="5"){
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"\";");
			eval("bit5.style.display=\"\";");
			eval("bit6.style.display=\"none\";");
			eval("bit7.style.display=\"none\";");
			eval("bit8.style.display=\"none\";");
		}else if($('.selectBitNumber').val()=="6"){
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"\";");
			eval("bit5.style.display=\"\";");
			eval("bit6.style.display=\"\";");
			eval("bit7.style.display=\"none\";");
			eval("bit8.style.display=\"none\";");
		}else if($('.selectBitNumber').val()=="7"){
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"\";");
			eval("bit5.style.display=\"\";");
			eval("bit6.style.display=\"\";");
			eval("bit7.style.display=\"\";");
			eval("bit8.style.display=\"none\";");
		}else if($('.selectBitNumber').val()=="8"){
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"\";");
			eval("bit5.style.display=\"\";");
			eval("bit6.style.display=\"\";");
			eval("bit7.style.display=\"\";");
			eval("bit8.style.display=\"\";");
		}
		else{
			eval("bit3.style.display=\"\";");
			eval("bit4.style.display=\"none\";");
			eval("bit5.style.display=\"none\";");
			eval("bit6.style.display=\"none\";");
			eval("bit7.style.display=\"none\";");
			eval("bit8.style.display=\"none\";");
		}
		// select下拉框选中触发事件
		form.on("select", function(data){
			$('.selectBitNumber').val(data.value);
			if(data.value=="4") {
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"\";");
				eval("bit5.style.display=\"none\";");
				eval("bit6.style.display=\"none\";");
				eval("bit7.style.display=\"none\";");
				eval("bit8.style.display=\"none\";");
			}else if(data.value=="5"){
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"\";");
				eval("bit5.style.display=\"\";");
				eval("bit6.style.display=\"none\";");
				eval("bit7.style.display=\"none\";");
				eval("bit8.style.display=\"none\";");
			}else if(data.value=="6"){
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"\";");
				eval("bit5.style.display=\"\";");
				eval("bit6.style.display=\"\";");
				eval("bit7.style.display=\"none\";");
				eval("bit8.style.display=\"none\";");
			}else if(data.value=="7"){
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"\";");
				eval("bit5.style.display=\"\";");
				eval("bit6.style.display=\"\";");
				eval("bit7.style.display=\"\";");
				eval("bit8.style.display=\"none\";");
			}else if(data.value=="8"){
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"\";");
				eval("bit5.style.display=\"\";");
				eval("bit6.style.display=\"\";");
				eval("bit7.style.display=\"\";");
				eval("bit8.style.display=\"\";");
			}
			else{
				eval("bit3.style.display=\"\";");
				eval("bit4.style.display=\"none\";");
				eval("bit5.style.display=\"none\";");
				eval("bit6.style.display=\"none\";");
				eval("bit7.style.display=\"none\";");
				eval("bit8.style.display=\"none\";");
			}
		});
	})
	function bitSumbit() {
        layer.open({
            content: '是否确认提交位点信息？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                var form = document.getElementById("bit_trial");
                var formDate = new FormData(form);
                $.ajax({
                    url: '${pageContext.request.contextPath}/antique/audit5/bit_trialInfo',
                    type: 'POST',
                    data:formDate,
                    dataType: "json",
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function () {
                        layer.alert('位点信息已提交,请等待复核', {icon: 1});
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
