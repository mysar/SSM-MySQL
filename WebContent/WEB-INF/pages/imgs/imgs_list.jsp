<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- 引入用户的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/imgs.js"></script>

</head>
<body>
	<div id="tb">
		<div>
			<table>
				<tr>
					<td>备注</td>
					<td><input id="remark" class="easyui-textbox" /></td>
					<td>内推</td>
					<td>
							<input id="interpor" class="easyui-combobox" name="interpor"
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
						</div></td>
					<td><a href="javascript:searchData()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">搜索</a></td>
				</tr>
			</table>
		</div>

		<div>
			<a href="javascript:addDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-add'" style="width: 80px">添加商品</a> <a
				href="javascript:editDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" style="width: 80px">修改商品</a> <a
				href="javascript:deleteData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove'" style="width: 80px">删除商品</a> <a
				href="javascript:outinput()" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove'" style="width: 80px">导出数据</a>
		</div>
	</div>
	<!-- easyui的表格显示 -->
	<div>
		<table id="dg"></table>
	</div>
</body>
</html>