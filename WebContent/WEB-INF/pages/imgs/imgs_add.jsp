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
<body><div class="easyui-panel"
		style="width: 100%; max-width: 400px; padding: 30px 60px;">
		<form id="ff" class="easyui-form" method="post"
			data-options="novalidate:true">
				<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="img" style="width: 80%"
					data-options="label:'图片'">
			</div>
			<div style="margin-bottom: 20px">
				<input id="delLoge" class="easyui-combobox" name="interpor"
					style="width: 80%"
					data-options="
							valueField: 'label',
							textField: 'value',
							data: [{
								label: '1',
								value: '是'
							},{
								label: '0',
								value: '否'
							}],
							label:'内推字段:'" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-text" name="remark" style="width: 80%"
					data-options="label:'备注'">
			</div>

		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()" style="width: 80px">Submit</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm()" style="width: 80px">Clear</a>
		</div>
	</div>
</div>
		<script>
		function submitForm() {
			$('#ff').form('submit', {
				url : "../change/imgsAdd.action",
				onSubmit : function() {
					return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {
					if (data!=0) {
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
