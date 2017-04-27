<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
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

<script type="text/javascript" src="${ pageContext.request.contextPath}/js/admin/category/category_list.js"></script>

</head>
<body>
	<div id="tb">
		<div>
			<table>
				<tr>
					<td>商品类型名称:</td>
					<td><input id="sname" class="easyui-textbox" /></td>
					<!--  -<td>父类型:</td>
					<td><input id="scategory" class="easyui-combobox"></td>-->
					<td><a href="javascript:searchData()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">搜索</a></td>
				</tr>
			</table>
		</div>

		<div>
			<a href="javascript:addDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-add'" style="width: 80px">添加用户</a> <a
				href="javascript:editDataInit()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" style="width: 80px">修改用户</a> <a
				href="javascript:deleteData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove'" style="width: 80px">删除用户</a>
		</div>
	</div>
	<!-- easyui的表格显示 -->
	<div>
		<table id="dg"></table>
	</div>
</body>
</html>