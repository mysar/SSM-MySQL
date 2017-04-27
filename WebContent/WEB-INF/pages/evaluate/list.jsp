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

<!-- 引入遮罩层 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>
<!-- 引入用户的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/evaluate.js"></script>

</head>
<body>
<h1>商品评价管理</h1>
	<div id="tb">
		<div>
			<table>
				<tr>
					<td>评价商品:</td>
					<td><input id="sgood" class="easyui-combobox" /></td>
					<td>商品名称:</td>
					<td><input id="suser" class="easyui-combobox" /></td>
					<td>评价内容:</td>
					<td><input id="smessage" class="easyui-textbox" /></td>
					<!-- <td>评价时间:</td>	
					<td><input id="scomDate" class="easyui-datebox" /></td> -->
					<td><a href="javascript:searchData()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">搜索</a></td>
				</tr>
			</table>
		</div>

		<div>
			<a href="javascript:addDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-add'" style="width: 80px">添加评价</a> <a
				href="javascript:editDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" style="width: 80px">修改评价</a> <a
				href="javascript:deleteData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove'" style="width: 80px">删除评价</a>
		</div>
	</div>
	<!-- easyui的表格显示 -->
	<div>
		<table id="dg"></table>
	</div>
</body>
</html>