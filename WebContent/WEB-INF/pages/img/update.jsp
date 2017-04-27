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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/evaluate.js"></script>

</head>
<body>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
            <div style="margin-bottom:20px">
                <input class="easyui-datebox" name="comDate" value="${entity.comDate}" style="width:100%" data-options="label:'评价时间:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="message" value="${entity.message}" style="width:100%" data-options="label:'评价内容：'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-combobox" name="uid"  value="${entity.gname}"  id="sgood" style="width:100%" data-options="label:'用户名称:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-combobox" name="gid"  value="${entity.uname}"  id="suser" style="width:100%" data-options="label:'所属商品：'">
            </div>
          <input type="hidden" name="id" value="${entity.id}"/>
        </form>
        <div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0);" class="easyui-linkbutton"
				onclick="submitForm()" style="width: 80px">更改</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm()" style="width: 80px">清空</a>
		</div>
    </div>
	<script>
	$('#suser').textbox('textbox').bind("focus", function() {
		//只发送一次请求
		$('#suser').combobox({
			url : "../change/evaluateSelectAll.action",
			
			valueField : 'uid',
			textField : 'uname'
		});
	});
	
	$('#sgood').textbox('textbox').bind("focus", function() {
		//只发送一次请求
		$('#sgood').combobox({
			url : "../change/evaluateSelectAll.action",
			valueField : 'gid',
			textField : 'gname'
		});
	});
		//确认更新事件
		function submitForm() {
			//使用ajax提交form表单
			$('#ff').form('submit', {
				url : "../change/updateEvaluate.action",
				//提交form表单
				onSubmit : function(param) {
						return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {
					if(data){
                    	//提示添加成功的消息
                        parent.$.messager.show({
                            title:'Tip',
                            msg:'用户更新成功！',
                            showType:'show'
                        });
                    	//关闭窗体,自己就会刷新datagrid
                    	parent.$("#myWinId").window('close');
                    	
                    }else{
                    	alert("用户添加失败");
                    }
                }
			});
		}
		function clearForm() {
			$('#editff').form('clear');
		}
	</script>
</body>
</html>