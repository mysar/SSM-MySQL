<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>

<!-- 引入用户的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/address.js"></script>

</head>
<body>
	<div id="tb">
		<div>
			<table>
				<tr>
					<td>姓名:</td>
					<td><input id="sname" class="easyui-textbox" /></td>
					<td>收货地址:</td>
					<td><input id="saddress" class="easyui-textbox" /></td>
					<td>所属用户:</td>
					<td><input id="suser" class="user" class="easyui-combobox" /></td>
					<td>手机号</td>
					<td><input id="sphone" class="easyui-textbox" /></td>
					<td>备注</td>
					<td><input id="sspare" class="easyui-textbox" /></td>
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
				data-options="iconCls:'icon-remove'" style="width: 80px">删除商品</a>
		</div>
	</div>
	<!-- easyui的表格显示 -->
	<div>
		<table id="dg"></table>
	</div>
</body>
</html>