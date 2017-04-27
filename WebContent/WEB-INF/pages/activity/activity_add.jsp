<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<!-- 引入css样式 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/themes/color.css">

<!-- 引入js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/locale/easyui-lang-zh_CN.js"></script>

<!-- 引入遮罩层 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/admin/activity/activity_list.js"></script>
</head>
<body>
	 <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'活动名:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="remark" style="width:100%" data-options="label:'活动介绍:'">
            </div>
            
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
        </div>
    </div>
    <script>
        function submitForm(){
            $('#ff').form('submit',{
                url:"../change/addActivity.action",
                onSubmit:function(){
                    return $(this).form('enableValidation').form('validate');
                },
                success:function(data){
                    if(data>0){
                    	//提示添加成功的消息
                        parent.$.messager.show({
                            title:'Tip',
                            msg:'用户添加成功！',
                            showType:'show'
                        });
                    	
                    	//关闭窗体,自己就会刷新datagrid
                    	parent.$("#myWinId").window('close');
                    	
                    }else{
                    	alert("用户添加失败");
                    }
                }
            });
        }
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
</body>
</html>