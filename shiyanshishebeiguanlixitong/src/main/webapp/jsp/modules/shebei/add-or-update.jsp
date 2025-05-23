<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑设备</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">设备管理</li>
                        <li class="breadcrumb-item active">编辑设备</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">设备信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa shiyanshi">
                                        <label>实验室</label>
                                        <div>
                                            <select style="width: 450px" id="shiyanshiSelect" name="shiyanshiSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 shiyanshi">
                                        <label>实验室名称</label>
                                        <input style="width: 450px" id="shiyanshiName" name="shiyanshiName" class="form-control"
                                               placeholder="实验室名称" readonly>
                                    </div>
                                    <div class="form-group col-md-6 shiyanshi">
                                        <label>实验室类型</label>
                                        <input style="width: 450px" id="shiyanshiValue" name="shiyanshiValue" class="form-control"
                                               placeholder="实验室类型" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="shiyanshiId" name="shiyanshiId" type="hidden">
                                    <div class="form-group col-md-6 shebeiNameDiv">
                                        <label>设备名称</label>
                                        <input style="width: 450px" id="shebeiName" name="shebeiName" class="form-control"
                                               placeholder="设备名称">
                                    </div>
                                    <div class="form-group col-md-6 shebeiTypesDiv">
                                        <label>设备分类</label>
                                        <select style="width: 450px" id="shebeiTypesSelect" name="shebeiTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 shebeiNumberDiv">
                                        <label>设备数量</label>
                                        <input style="width: 450px" id="shebeiNumber" name="shebeiNumber" class="form-control"
                                               onchange="shebeiNumberChickValue(this)"  placeholder="设备数量">
                                    </div>

                                    <div class="form-group  col-md-6 shebeiContentDiv">
                                        <label>设备详情</label>
                                        <input id="shebeiContentupload" name="file" type="file">
                                        <script id="shebeiContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var shebeiContentUe = UE.getEditor('shebeiContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="shebeiContent" id="shebeiContent-input">
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "shebei";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var shebeiTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var shiyanshiOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#shebeiContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('shebeiContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '实验室'){//当前登录用户不为这个
                if($("#shiyanshiId") !=null){
                    var shiyanshiId = $("#shiyanshiId").val();
                    if(shiyanshiId == null || shiyanshiId =='' || shiyanshiId == 'null'){
                        alert("实验室不能为空");
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("shebei/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addshebei');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function shebeiTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shebei_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shebeiTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function shiyanshiSelect() {
            //填充下拉框选项
            http("shiyanshi/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    shiyanshiOptions = res.data.list;
                }
            });
        }

        function shiyanshiSelectOne(id) {
            http("shiyanshi/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                shiyanshiShowImg();
                shiyanshiShowVideo();
                shiyanshiDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationShebeitypesSelect(){
            var shebeiTypesSelect = document.getElementById('shebeiTypesSelect');
            if(shebeiTypesSelect != null && shebeiTypesOptions != null  && shebeiTypesOptions.length > 0 ){
                for (var i = 0; i < shebeiTypesOptions.length; i++) {
                    shebeiTypesSelect.add(new Option(shebeiTypesOptions[i].indexName,shebeiTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationshiyanshiSelect() {
            var shiyanshiSelect = document.getElementById('shiyanshiSelect');
            if(shiyanshiSelect != null && shiyanshiOptions != null  && shiyanshiOptions.length > 0 ) {
                for (var i = 0; i < shiyanshiOptions.length; i++) {
                        shiyanshiSelect.add(new Option(shiyanshiOptions[i].shiyanshiName, shiyanshiOptions[i].id));
                }

                $("#shiyanshiSelect").change(function(e) {
                        shiyanshiSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var shebeiTypesSelect = document.getElementById("shebeiTypesSelect");
        if(shebeiTypesSelect != null && shebeiTypesOptions != null  && shebeiTypesOptions.length > 0 ) {
            for (var i = 0; i < shebeiTypesOptions.length; i++) {
                if (shebeiTypesOptions[i].codeIndex == ruleForm.shebeiTypes) {//下拉框value对比,如果一致就赋值汉字
                        shebeiTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var shiyanshiSelect = document.getElementById("shiyanshiSelect");
            if(shiyanshiSelect != null && shiyanshiOptions != null  && shiyanshiOptions.length > 0 ) {
                for (var i = 0; i < shiyanshiOptions.length; i++) {
                    if (shiyanshiOptions[i].id == ruleForm.shiyanshiId) {//下拉框value对比,如果一致就赋值汉字
                        shiyanshiSelect.options[i+1].selected = true;
                        $("#shiyanshiSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.shebeiContent != null && ruleForm.shebeiContent != 'null' && ruleForm.shebeiContent != '' && $("#shebeiContentupload").length>0) {

            var shebeiContentUeditor = UE.getEditor('shebeiContentEditor');
            shebeiContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.shebeiContent != null){
                    mes = ''+ ruleForm.shebeiContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                shebeiContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#shebeiContentupload").length>0) {
            var shebeiContentEditor = UE.getEditor('shebeiContentEditor');
            if (shebeiContentEditor.hasContents()) {
                $('#shebeiContent-input').attr('value', shebeiContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function shebeiNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addshebei');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                shiyanshiId: "required",
                shebeiName: "required",
                shebeiTypes: "required",
                shebeiNumber: "required",
                shebeiContent: "required",
            },
            messages: {
                shiyanshiId: "实验室不能为空",
                shebeiName: "设备名称不能为空",
                shebeiTypes: "设备分类不能为空",
                shebeiNumber: "设备数量不能为空",
                shebeiContent: "设备详情不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addshebei = window.sessionStorage.getItem("addshebei");
        if (addshebei != null && addshebei != "" && addshebei != "null") {
            //注册表单验证
            $(validform());

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("shebei/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        shiyanshiDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#shiyanshiId").val(ruleForm.shiyanshiId);
        $("#shebeiName").val(ruleForm.shebeiName);
        $("#shebeiNumber").val(ruleForm.shebeiNumber);
        $("#shebeiContent").val(ruleForm.shebeiContent);

    }
    <!--  级联表的数据回显  -->
    function shiyanshiDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#shiyanshiId").val(ruleForm.id);

        $("#shiyanshiName").val(ruleForm.shiyanshiName);
        $("#shiyanshiValue").val(ruleForm.shiyanshiValue);
        $("#shiyanshiAddress").val(ruleForm.shiyanshiAddress);
        $("#shiyanshiContent").val(ruleForm.shiyanshiContent);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        shiyanshiShowImg();
    }


    <!--  级联表的图片  -->

    function shiyanshiShowImg() {
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        shiyanshiShowVideo();
    }


    <!--  级联表的视频  -->

    function shiyanshiShowVideo() {
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            shebeiTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            shiyanshiSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationShebeitypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationshiyanshiSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addshebei');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '校方') {
            // $(".aaaaaa").remove();
            $(".xiaofang").remove();//删除当前用户的信息
        }
		else if (window.sessionStorage.getItem('role') == '学生') {
            // $(".aaaaaa").remove();
            $(".xuesheng").remove();//删除当前用户的信息
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
