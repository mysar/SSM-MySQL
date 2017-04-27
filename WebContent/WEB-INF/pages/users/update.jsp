<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入css样式 -->
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath}/js/themes/metro/easyui.css" />
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user_add/user_add.js"></script>
<!-- 引入用户的js文件 -->
</head>
<body>
	<div align="center">
		<form id="editff" class="easyui-form" method="post">
			<input type="hidden" name="id" value="${entity.id}"/>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="username" name="userName"
					value="${entity.userName}" style="width: 80%"
					data-options="label:'用户名'">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="name" name="name"
					value="${entity.name}" style="width: 80%"
					data-options="label:'真实名称',required:true"><!-- readonly="readonly"  -->
				<!--,validType:'Name'  -->
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" prompt="Password" name="password"
					value="${entity.password}" style="width: 80%"
					data-options="label:'密码',required:true"">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="phone" style="width: 80%"
					value="${entity.phone}" data-options="label:'手机号',validType:'phone'">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="email" value="${entity.email}"
					style="width: 80%; height: 27px;" data-options="label:'邮箱',validType:'email'">
			</div>
			<!-- 隐藏传递一个id值 -->
			<%-- <input type="hidden" name="id" value="${entity.id}"> --%>
		</form>
		<!-- 获取本行id值 -->
		<div>
			<a href="javascript:editBtn();" class="easyui-linkbutton" id="add"
				name="确定" data-options="iconCls:'icon-save'">确认更新</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm()"
				data-options="plain:true,iconCls:'icon-reload'">清空</a>
		</div>
	</div>
</body>
<script type="text/javascript">

/* $(function(){
	//扩展验证
	function validation(){
	    $.extend($.fn.validatebox.defaults.rules, {
	        phone: {
	            validator: function(value, param){
	            	var re =/^1[3|4|5|8][0-9]\d{8}$/;
	                return re.test(value);
	            },
	            message: '手机号格式不正确.'
	        }
	    });
	}

}); */

	//确认更新 
	function editBtn() {
		$.messager.confirm("友情提示", "确认更新这条数据么？", function(editUpdate) {
			if (editUpdate) {
				$('#editff').form(
						'submit',
						{
							url : "../change/updateUser.action",
							onSubmit : function() {
								//验证form表单
								return $(this).form('enableValidation').form(
										'validate');
							},
							success : function(data) {
								//提示修改成功的消息
								if (data>0) {
									//提示修改成功的消息
									parent.$.messager.show({
										title : '友情提示',
										msg : '用户更新成功！',
										showType : 'show'
									});
									//关闭时自动刷新当前页
									parent.$("#myWinId").window('close');
								} else {
									parent.$.messager.show({
										title : '友情提示',
										msg : '用户更新失败！',
										showType : 'show'
									});
								}
							}
						});
			}
		})
	}

	function clearForm() {
		$('#editff').form('clear');
	}
</script>

</html>