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
		<form id="goodsupdate" method="post">
			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="aname" class="easyui-textbox" name="name"
					style="width: 80%" data-options="label:'商品名称:',required:true"
					value="${entity.name}">
			</div>
			<div style="margin-bottom: 10px; margin-left: 20px">
			
			<input class="easyui-combobox" name="cid" id="ccname" style="width:80%" 
					style="width: 80%" label="所属类别:" labelPosition="left" 
					data-options="valueField:'id',textField:'name',url:'../change/categorySelectAll.action'" value="${entity.cname}">
			</div>

			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="uprice" class="easyui-numberbox" name="price"
					style="width: 80%" data-options="label:'销售价格:'"
					value="${entity.price}">
			</div>

			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="unum" class="easyui-numberbox" name="num"
					style="width: 80%" label="商品数量:" labelPosition="left"
					value="${entity.num}">

			</div>
			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="uclick" class="easyui-numberbox" name="click"
					style="width: 80%" label="点击量:" labelPosition="left"
					value="${entity.click}">

			</div>
			<div style="margin-bottom: 10px; margin-left: 20px">
				<select class="easyui-combobox" name="uhote" labelPosition="left"
					label="是否热销:" style="width: 80%;" id="uhote" selected="0">
					<option value="1">热销</option>
					<option value="0">不热销</option>
				</select>
			</div>

			<div style="margin-bottom: 10px; margin-left: 20px">
				<input id="uquantity" class="easyui-textbox" name="remark"
					style="width: 80%" label="备注:" labelPosition="left">
					
					 <input type="hidden" name="id" value="${entity.id}">
			</div>


			<a href="javascript:updateGoods()" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'"
				style="width: 78.4px; margin: 27px 44px;">修改</a><a
				href="javascript:cancel()" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'" style="width: 78.4px;">重置</a>
		</form>
	</div>
	<script type="text/javascript">
		$('select').val('${requestScope.goods.price}');
	</script>
	<script type="text/javascript">
	function updateGoods(){
		$.messager.confirm("添加确认", "您确认要添加这些数据吗？", function(deleteAction) {
			if (deleteAction) {
				$('#goodsupdate').form('submit', {
					url : "../change/update_good.action",
					onSubmit : function(param) {
						return $(this).form('enableValidation').form('validate');
					},
					success : function(data) {
						
						if(data){
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
		$('#goodsupdate').form('clear');
	}
	</script>
</body>
</html>