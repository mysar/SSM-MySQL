<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<script type="text/javascript"
	src="${ pageContext.request.contextPath}/js/admin/goods/goods_list.js"></script>
<style>
body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#fuchuang {
	width: 300px;
	height: 200px;
	margin: 40px auto;
}
</style>
</head>
<body>
	<div id="fuchuang">
		<form id="goodsadd" method="post">
			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="aname" class="easyui-textbox" name="name"
					style="width: 80%" data-options="label:'商品名称:',required:true">
			</div>

			<div style="margin-bottom: 10px; margin-left: 20px">
				<input class="easyui-combobox" required="true" name="cid" id="ccname" style="width:80%" label="所属类别:" labelPosition="left"
				data-options="valueField:'id',textField:'name',url:'../change/categorySelectAll.action'">
			</div>
			
			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="aprice" class="easyui-numberbox" name="price"
					style="width: 80%" data-options="label:'销售价格:'">
			</div>

			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="anum" class="easyui-numberbox" name="num"
					style="width: 80%" label="商品数量:" labelPosition="left">

			</div>
			<div style="margin-bottom: 10px; margin-left: 20px">
				<select class="easyui-combobox" name="hote" labelPosition="left"
					label="是否热销:" style="width: 80%;" id="ahote">
					<option value="1">热销</option>
					<option value="0">不热销</option>
				</select>
			</div>
			<a href="javascript:saveGood()" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'"
				style="width: 78.4px; margin: 27px 44px;">保存</a><a
				href="javascript:cancel()" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'" style="width: 78.4px;">重置</a>
		</form>
	</div>
</body>
</html>
<script>
function saveGood(){
	$.messager.confirm("添加确认", "您确认要添加这些数据吗？", function(deleteAction) {
		if (deleteAction) {
			$('#goodsadd').form('submit', {
				url : "../change/saveGood.action",
				onSubmit : function(param) {
					return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {
					
					if(data>0){
						parent.$.messager.show({
							title:'Tip',
							msg:'添加成功',
							showType:'show'
						});
						parent.$("#myWinId").window('close');
					}else{
						parent.$.messager.alert("提示", "添加失败");
					}
				}
			});
		}
	})
}

function cancel(){
	$('#goodsadd').form('clear');
}
</script>