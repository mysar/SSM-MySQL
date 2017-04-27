<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 引入用户的js文件 -->

</head>
<body>
	<div class="easyui-panel"
		style="width: 100%; max-width: 400px; padding: 30px 60px;">
		<form id="ff" class="easyui-form" method="post">
			<div style="margin-bottom: 20px">
				<input type="hidden" name="admin" value="${admin}">
			
				<input class="easyui-textbox" name="userName" style="width: 80%"
					data-options="label:'登录名称',required:true"><!--,validType:'Name'  -->
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="name" name="name" style="width: 80%"
					data-options="label:'用户昵称'">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="password" style="width: 80%"
					data-options="label:'密码',required:true"">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="phone" style="width: 80%"
					data-options="label:'手机号'">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox"  name="email"
					style="width: 80%; height: 27px;"
					data-options="label:'邮箱'">
	
			</div>
			<!-- <div style="margin-bottom: 20px">
				<input class="easyui-datebox" id="registTime" name="registTime" style="width: 80%"
					data-options="label:'注册日期',required:true",editable:false">
			</div> -->
			<div style="margin-bottom: 20px">
				性别： <input type="radio" name="sex" value="男 ">男 <input
					type="radio" name="sex" value="女">女
			</div>
			
		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:submitForm()" class="easyui-linkbutton"
				 style="width: 80px">保存</a> <a
				href="javascript:clearForm()" class="easyui-linkbutton"
				onclick="clearForm()" style="width: 80px">清空</a>
		</div>
	</div>
	<script>
		function submitForm() {
			
			$('#ff').form('submit', {
				url : "../change/addUser.action",
				onSubmit : function() {
					return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {
					data = eval("(" + data + ")");
					if (data>0) {
						//提示添加成功的消息
						parent.$.messager.show({
							title : 'Tip',
							msg : '用户添加成功！',
							showType : 'show'
						});
						
						//关闭窗体,自己就会刷新datagrid
						parent.$("#myWinId").window('close');
					
					} else {
						alert("用户添加失败");
					}
				}
			});
		}
		function clearForm() {
			$('#ff').form('clear');
		}
	</script>
</body>
</html>