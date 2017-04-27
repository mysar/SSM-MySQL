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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/util/shade_util.js"></script>
</head>
<body>
	<div class="easyui-panel"
		style="width: 100%; max-width: 400px; padding: 30px 60px;">
		<form id="ff" class="easyui-form" method="post">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="number" style="width: 100%"
					data-options="label:'订单编号',required:true" value="${orders.number}">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-numberspinner" name="totalPrice"
					style="width: 100%"
					data-options="label:'订单总价格',min:0,required:true" value="${orders.totalPrice}">
			</div>

			<!-- div style="margin-bottom: 20px">
				<input class="easyui-datebox" name="orderTime" style="width: 100%"
					data-options="label:'订单时间',editable:false">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-datebox" name="signTime" style="width: 100%"
					data-options="label:'订单签收时间',editable:false">
			</div> -->
			<div style="margin-bottom: 20px">
				<input class="easyui-combobox"  value="${orders.uid}" name="uid" id="sname"
					style="width: 100%" data-options="label:'用户名称:',required:true,valueField:'id',textField:'name',url:'../change/usersSelectAll.action'">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-combobox" id="saddress" value="${orders.aid}" name="aid"
				 style="width: 80%" data-options="label:'订单送货地址:',required:true,valueField:'id',textField:'address',url:'../change/addressSelectAll.action'">
			</div>
			<div style="margin-bottom: 20px">
				订单支付状态： <input type="radio" name="payType" value="0">已付款 <input
					type="radio" name="hote" value="1">未付款
			</div>

			<div style="margin-bottom: 20px">
				<select class="easyui-combobox" name="orderType" label="热销状态"
					style="width: 100%">
					<option value="1">订单已完成</option>
					<option value="0">订单未完成</option>
					<option value="2">订单已撤销</option>
				</select>
			</div>
			<input type="hidden" name="id" value="${orders.id}"/>
		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:insertBtn();" class="easyui-linkbutton"
				onclick="submitForm()" style="width: 80px">添加</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm()" style="width: 80px">清空</a>
		</div>
	</div>
	<script>
	function submitForm(){
        $('#ff').form('submit',{
            url:"../change/ordersUpdate.action",
            onSubmit:function(){
                return $(this).form('enableValidation').form('validate');
            },
            success:function(data){
            	//data=eval("("+data+")");
                if(data!=null){
                	//提示添加成功的消息
                    parent.$.messager.show({
                        title:'Tip',
                        msg:'商品评价更新成功！',
                        showType:'show'
                    });
                    //关闭窗体,自己就会刷新datagrid
                	parent.$("#myWinId").window('close');
                }else{
                	//提示添加成功的消息
                    parent.$.messager.show({
                        title:'Tip',
                        msg:'商品评价更新失败！',
                        showType:'show'
                    });
                }
             
            }
        });
    }
    function clearForm(){
        $('#ff').form('clear');
    }
	</script>

</html>