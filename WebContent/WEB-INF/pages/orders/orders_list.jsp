<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath}/js/themes/metro/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath}/js/themes/icon.css" />
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/admin/orders.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
</head>
<style>
.datagrid-row-expander {
	width: 17px;
}
</style>
<body>
	<span style="color: green;">orders</span>
	<div id="tb">
		<form id="ff" method="post">
			<table>
				<tr>

					<td>订单编号</td>
					<td><input id="snumber" class="easyui-textbox" /></td>
					<td><a href="javascript:searchData()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">搜索</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<a href="javascript:addDataInit()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" style="width: 80px">添加商品</a> <a
			href="javascript:editDataInit()" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" style="width: 80px">修改商品</a> <a
			href="javascript:deleteData()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'" style="width: 80px">删除商品</a>
	</div>
	<table id="dg" title="订单管理" class="easyui-datagrid">
	</table>
</body>
</html>