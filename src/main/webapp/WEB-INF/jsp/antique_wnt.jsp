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
<script>
    function viewImage(file, ElementId) {
        var preview = document.getElementById(ElementId);
        if (file.files && file.files[0]) {
            //火狐下
            preview.style.display = "block";
            preview.style.width = "250px";
            preview.style.height = "200px";
            preview.src = window.URL.createObjectURL(file.files[0]);
        } else {
            //ie下，使用滤镜
            file.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "300px";
            localImagId.style.height = "250px";
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                locem("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            document.selection.empty();
        }
        return true;
    }

    //新建文物信息
    function newWnt(id) {
        var form = document.getElementById("AntiqueForm");
        var formDate = new FormData(form);
        $.ajax({
            url: '${pageContext.request.contextPath}/antique/wnt',
            type: 'POST',
            data: formDate,
            dataType: "json",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $(".newInfoInput").css({"display": "none"});
                layer.closeAll();
                personInfo();
            },
            error: function (data) {
                layer.alert('信息上传失败', {icon: 5});
            }
        })
    }
</script>

<div class="antiqueInfo" style="display: none">
    <form class="layui-form" id="AntiqueForm">
        <div class="layui-form-item layui-form-text" style="position: relative;">
            <textarea style="display: none" type="text" name="antique_id" placeholder="请输入磨损信息"
                      class="layui-textarea antique_id"></textarea>
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea type="text" name="wnt_info" placeholder="请输入磨损信息"
                          class="layui-textarea wnt_info"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="position:relative;height:100px;top:10px; left:115px;">
            <input type="file" name="uploadfile" class="imgUp" onchange="viewImage(this,'preview2')">
            <img src="${pageContext.request.contextPath}/upload/${antique.antique_img}" class="imgUp" style="position: relative;left:30px;top:20px;width: 300px;height:250px;"alt="您还未上传图片" >
        </div>
        <div class="layui-form-item" style="margin-left: 80px;position: relative;top:-20px;left: 225px;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="newWnt()">保存</button>
            </div>
        </div>
    </form>
</div>

<div id="div"></div>
<div >
    <form class="layui-form" action="${pageContext.request.contextPath}/antique/wnt/1">
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
                    <button type="button" class="layui-btn layui-btn-sm" onclick="antiqueDetails('${antiques.antique_id}','${antiques.wnTInfo.wnt_info}','${antiques.wnTInfo.wnt_image}')">审核文物</button>
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
            <li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/wnt/1">首页</a></li>
            <li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/wnt/${pageInfo.prePage}">上一页</a></li>
        </c:if>
        <!-- 中间要显示的页数 -->
        <c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNum">
            <c:if test="${navigatepageNum==pageInfo.pageNum}">
                <li  class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/antique/wnt/${navigatepageNum}">${navigatepageNum}</a></li>
            </c:if>
            <c:if test="${navigatepageNum!=pageInfo.pageNum}">
                <li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/antique/wnt/${navigatepageNum}">${navigatepageNum}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${!pageInfo.isLastPage}">
            <li class="page-item"><a class="page-link"
                                     href="<%=request.getContextPath() %>/antique/wnt/${pageInfo.nextPage }">下一页</a></li>
            <li class="page-item"><a class="page-link"
                                     href="<%=request.getContextPath() %>/antique/wnt/${pageInfo.lastPage}">尾页</a></li>
        </c:if>
    </ul>
</div>
</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
    function antiqueDetails(antique_id,wnt_info,wnt_image) {
        $(".antique_id").val(antique_id);
        $(".wnt_info").val(wnt_info);
        $(".imgUp").attr("src","/upload/"+wnt_image);
        layer.open({
            type:1,
            anim:4,
            maxmin:true,
            shadeClose:true,
            offset: '150px',
            shade:0.3,
            area:['560px','580px'],
            title: '磨损信息',
            content: $(".antiqueInfo"),
            end:function(){
                $(".antiqueInfo").css({"display":"none"})
            },
            cancel: function(){//关闭按钮的回调函数
                $(".antiqueInfo").css({"display":"none"})
            },
        });
       /* var recheckStatus = $('.recheck').val();
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
        }*/
    }
</script>
</html>
