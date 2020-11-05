<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>
<body>
<!-- 文物信息div -->
<div class="newInfoInput" style="display: none">
    <form class="layui-form" id="AntiqueForm">
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label" style="width: 100px;">*文物编号</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_number" required lay-verify="required" autocomplete="off"
                       class="layui-input antique_number" style="width: 250px;margin-top: 30px;">
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label">*名称</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_name" required lay-verify="required" autocomplete="off"
                       class="layui-input antique_name" style="width: 250px;margin-top: 30px;">
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label" style="width: 100px;">*文物类型</label>
            <div class="layui-input-block" style="width: 250px;">
                <select name="antique_kind" class="antique_kind" lay-verify="required">
                    <option value="瓷器"></option>
                    <option value="瓷器">瓷器</option>
                    <option value="玉器">玉器</option>
                    <option value="书画">书画</option>
                    <option value="金属器">金属器</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label">年代</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_time" required lay-verify="required" autocomplete="off"
                       class="layui-input antique_time" style="width: 250px;">
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label" style="width: 100px;">完整程度</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_intact" required lay-verify="required" autocomplete="off"
                       class="layui-input antique_intact" style="width: 250px;">
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label" style="width: 100px;">鉴定诉求</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_authenticate" required lay-verify="required"
                       autocomplete="off" class="layui-input antique_authenticate" style="width: 250px;">
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 25px;">
            <label class="layui-form-label" style="width: 100px;">来源信息</label>
            <div class="layui-input-block">
                <input value="" type="text" name="antique_info" required lay-verify="required" autocomplete="off"
                       class="layui-input antique_info" style="width: 250px;">
            </div>
        </div>
        <div class="layui-form-item layui-form-text" style="position: relative;">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <textarea type="text" name="antique_form" placeholder="请输入规格"
                          class="layui-textarea antique_form"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text" style="position: relative;">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea type="text" name="antique_details" placeholder="请输入文物描述"
                          class="layui-textarea antique_details"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="position:relative;height:100px;top:10px; left:115px;">
            <input type="file" name="uploadfile" onchange="viewImage(this,'preview2')">
        </div>
        <div class="layui-form-item" style="margin-left: 80px;position: relative;top:-20px;left: 225px;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="newAntiqueInfo()">下一步</button>
            </div>
        </div>
    </form>

</div>
<!-- 文物信息div -->
<!-- 文物所属人div -->
<div class="layui-tab layui-tab-card itemCard" style="display:none">
    <ul class="layui-tab-title">
        <li class="layui-this" style="width: 50%;">个体</li>
        <li style="width: 50%;">企业</li>
    </ul>
    <div class="layui-tab-content">
        <!--个体 -->
        <div class="layui-tab-item layui-show" style="height: 650px;">
            <div class="personInfoInput">
                <form class="layui-form" id="individual"
                      action="${pageContext.request.contextPath}/antique/newAntique/individual" method="post">
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_name" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_name"
                                   style="width: 250px;margin-top: 30px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">身份证号</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_number" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_number"
                                   style="width: 250px;margin-top: 30px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">联系方式</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_phone" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_phone" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">电子邮件</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_email" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_email" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label">传真</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_max" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_max" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label">邮编</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_code" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_code" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">通讯地址</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_address" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_address" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-left: 80px;position: relative;top:-20px;left: 225px;">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn">提交信息</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--个体 -->
        <!--企业 -->
        <div class="layui-tab-item">
            <div class="personInfoInput">
                <form class="layui-form" id="company"
                      action="${pageContext.request.contextPath}/antique/newAntique/company" method="post">
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">企业名称</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_name" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_name"
                                   style="width: 250px;margin-top: 30px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">营业执照代码</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_buscode" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_buscode"
                                   style="width: 250px;margin-top: 30px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">注册地址</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_loginadress" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_loginadress" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">官方代表人</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_represent" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_represent" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">法人职务</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_legal" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_legal" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">注册资本</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_capital" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_capital" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">联络人</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_reperson" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_reperson" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">联系人职务</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_rejob" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_rejob" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">联系电话</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_phone" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_phone" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">电子邮件</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_email" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_email" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">传真</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_max" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_max" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">邮编</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_code" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_code" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-bottom: 25px;">
                        <label class="layui-form-label" style="width: 100px;">通讯地址</label>
                        <div class="layui-input-block">
                            <input value="" type="text" name="applicant_address" required lay-verify="required"
                                   autocomplete="off" class="layui-input applicant_address" style="width: 250px;">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-left: 80px;position: relative;top:-20px;left: 225px;">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn">提交信息</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--企业 -->
    </div>
</div>
<!-- 文物所属人div -->
<!-- 导航栏 -->
<div class="layui-layout-admin">

    <div class="layui-header">
        <ul class="layui-nav">
            <li class="layui-nav-item"><a href="" style="font-size: 20px;">社会文物登记服务中心</a></li>
            <li class="layui-nav-item " style="float: right">
                <a href="${pageContext.request.contextPath}/loginOut">注销<span class=""></span></a>
            </li>
            <li class="layui-nav-item" style="float: right">
                <a href="">用户设置<span class="layui-badge-dot"></span></a>
            </li>

        </ul>
    </div>
    <div class="layui-side">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item">
                <a href="javascript:;"> <i class="layui-icon" style="font-size:20px;margin-right: 10px;">&#xe68e;</i>主 页</a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;"><i class="layui-icon" style="font-size:20px;margin-right: 10px;">&#xe62e;</i>文 物</a>
                <dl class="layui-nav-child">
                    <%
                        //获取url中的参数值
                        String pageName = "", pagePath="";
                        request.setCharacterEncoding("utf-8");
                        if (!request.getParameterMap().isEmpty()){
                            pageName = request.getParameter("page");
                            if(pageName.equals("browse"))
                                pagePath="/browse/1";
                            else if(pageName.equals("audit1"))
                                pagePath="/antique/audit/1";
                            else if(pageName.equals("audit3"))
                                pagePath="/antique/audit3/1";
                            else if(pageName.equals("audit4"))
                                pagePath="/antique/audit4/1";
                            else if(pageName.equals("audit5"))
                                pagePath="/antique/audit5/1";
                            else if(pageName.equals("audit6"))
                                pagePath="/antique/audit6/1";
                            else if(pageName.equals("audit7"))
                                pagePath="/antique/audit7/1";
                            else if(pageName.equals("manage"))
                                pagePath="/antique/user/1";
                            else if(pageName.equals("wnt"))
                                pagePath="/antique/wnt/1";
                        }
                        else{
                            pageName = "browse";
                            pagePath = "/browse/1";
                        }
                    %>
                    <dd><a onclick="newInfo()">新建 <i class="layui-icon" style="font-size:20px;margin-left: 100px;">&#xe654;</i></a>
                    </dd>
                    <dd><a href="/?page=browse">浏览 <i class="layui-icon"
                                                                                   style="font-size:20px;margin-left: 100px;">&#xe705;</i></a>
                    </dd>
                    <dd><a href="/?page=audit1">文物复核 <i class="layui-icon"
                                                                                             style="font-size:20px;margin-left: 72px;">&#xe6b2;</i></a>
                    </dd>
                    <dd><a href="/?page=audit3">初步鉴定 <i class="layui-icon"
                                                                                              style="font-size:20px;margin-left: 72px;">&#xe657;</i></a>
                    </dd>
                    <dd><a href="/?page=audit4">多维鉴定 <i class="layui-icon"
                                                                                               style="font-size:20px;margin-left: 70px;">&#xe656;</i></a>
                    </dd>
                    <dd><a href="/?page=audit5">位点录入 <i class="layui-icon"
                                                                                               style="font-size:20px;margin-left: 70px;">&#xe857;</i></a>
                    </dd>
                    <dd><a href="/?page=audit6">证书信息 <i class="layui-icon"
                                                                                               style="font-size:20px;margin-left: 70px;">&#xe663;</i></a>
                    </dd>
                    <dd><a href="/?page=audit7">业务录入 <i class="layui-icon"
                                                                                               style="font-size:20px;margin-left: 70px;">&#xe67d;</i></a>
                    </dd>
                    <dd><a href="/?page=wnt">磨损信息 <i class="layui-icon"
                                                        style="font-size:20px;margin-left: 70px;">&#xe67d;</i></a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;"><i class="layui-icon"
                                          style="font-size:20px;margin-right: 10px;">&#xe66f;</i>管理</a>
                <dl class="layui-nav-child">
                    <shiro:hasRole name="超级管理员">
                        <%
                            //获取url中的参数值
                            if (!request.getParameterMap().isEmpty()){
                                pageName = request.getParameter("page");
                                if(pageName.equals("manage"))
                                    pagePath="/antique/user/1";
                            }
                        %>
                        <dd><a href="/?page=manage">用户管理 <i class="layui-icon"
                                                                                                style="font-size:20px;margin-left: 70px;">&#xe612;</i></a>
                        </dd>
                    </shiro:hasRole>
                    <dd><a href="">日志 <i class="layui-icon" style="font-size:20px;margin-left: 100px;">&#xe621;</i></a>
                    </dd>
                </dl>
            </li>
        </ul>

    </div>
    <div class="layui-body">
        <iframe src="${pageContext.request.contextPath}<%=pagePath%>" frameborder="0" width="100%" height="100%" id="contentIframe"></iframe>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
    function clearValues() {
        $('.antique_details').val('');
        $('.antique_form').val('');
        $("input").each(function () {
            var value = $(this).val(null); //这里的value就是bai每一个duinput的value值~
        });
    }

    function newInfo() {
        clearValues();
        layer.open({
            type: 1,
            anim: 4,
            maxmin: true,
            shadeClose: true,
            offset: '150px',
            shade: 0.3,
            area: ['550px', '600px'],
            title: '新建文物信息',
            content: $(".newInfoInput"),
            end: function () {
                $(".newInfoInput").css({"display": "none"})
            },
            cancel: function () {
                layer.closeAll();
                $(".newInfoInput").css({"display": "none"})
            },
        });
    };

    function personInfo() {
        layer.open({
            type: 1,
            anim: 4,
            maxmin: true,
            shadeClose: true,
            offset: '150px',
            shade: 0.3,
            area: ['550px', '600px'],
            title: '新建所属人信息',
            content: $(".itemCard"),
            end: function () {
                $(".itemCard").css({"display": "none"})
            },
            cancel: function () {
                layer.closeAll();
                $(".itemCard").css({"display": "none"})
            },
        });
    };

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
    function newAntiqueInfo() {
        var form = document.getElementById("AntiqueForm");
        var formDate = new FormData(form);
        $.ajax({
            url: '${pageContext.request.contextPath}/antique/info',
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

    //新建文物所属人信息
    function newAntiqueAllInfo(bePeople) {
        var form;
        var formDate;
        var bePeopleKind = bePeople;
        if ("个体" == bePeopleKind) {
            form = document.getElementById("individual");
            formDate = new FormData(form);
            $.ajax({
                url: '${pageContext.request.contextPath}/antique/newAntique/individual',
                type: 'POST',
                data: formDate,
                dataType: "json",
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (msg) {
                    if (msg == "success") {
                        layer.alert('信息上传成功', {icon: 1});
                    }
                    clearValues();
                    layer.closeAll();
                    $(".newInfoInput").css({"display": "none"});
                },
                error: function () {
                    layer.alert('信息上传失败', {icon: 5});
                }
            })
        } else if ("企业" == bePeopleKind) {
            form = document.getElementById("company");
            formDate = new FormData(form);
            $.ajax({
                url: '${pageContext.request.contextPath}/antique/newAntique/company',
                type: 'POST',
                data: formDate,
                dataType: "json",
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (msg) {
                    if (msg == "success") {
                        layer.alert('信息上传成功', {icon: 1});
                    }
                    clearValues();
                    layer.closeAll();
                    $(".newInfoInput").css({"display": "none"});
                },
                error: function () {
                    layer.alert('信息上传失败', {icon: 5});
                }
            })
        }
    }
</script>
</html>
