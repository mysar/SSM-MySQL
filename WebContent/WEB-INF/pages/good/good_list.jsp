<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/goods/goods_list.js"></script>

<style type="text/css">
.datagrid-row-expander{
	width:13px;
}
</style>
</head>
<body>
	<div id="su">
		<form id="ff" method="post">
			<table>
				<tr>
					<td>编号:</td>
					<td><input id="snumber" name="number" class="easyui-textbox" /></td>
					<td>名称:</td>
					<td><input id="sname" name="name" class="easyui-textbox" /></td>
					<td>类别:</td>
					<td><input id="ccname" class="easyui-combobox"></td>
					<td>备注:</td>
					<td><input id="sremark" class="easyui-textbox" /></td>

					<td><a href="javascript:searchData()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">搜索</a></td>
					<td><a class="easyui-linkbutton" id="addJPanel"
						href="javascript:addDataInit()" data-options="iconCls:'icon-add'"
						style="width: 80px">添加</a></td>
					<td><a class="easyui-linkbutton" id="addJPanel"
						href="javascript:editDataInit()" data-options="iconCls:'icon-add'"
						style="width: 80px">更新</a></td>
					<td><a class="easyui-linkbutton" id="addJPanel"
						href="javascript:deleteData()"
						data-options="iconCls:'icon-remove'" style="width: 80px">删除</a></td>
			
				</tr>
			</table>
		</form>
	</div>
	<table id="dg" title="Goods" class="easyui-datagrid"
		style="width: 100%">
	</table>

</body>

</html>