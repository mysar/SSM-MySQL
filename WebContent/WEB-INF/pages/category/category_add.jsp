<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="add_category" class="easyui-form" method="post" data-options="novalidate:true">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" required="true" name="name" style="width:100%" data-options="label:'商品类型名称:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="outimg" style="width:100%" data-options="label:'移除图片:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="enterimg" style="width:100%" data-options="label:'移入图片:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-combobox" name="cid" id="scategory" style="width:100%" data-options="label:'所属类型:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="remark" style="width:100%" data-options="label:'类型备注:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="number" style="width:100%" data-options="label:'类型编号:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="spare" style="width:100%" data-options="label:'备用字段:'">
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save_category()" style="width:80px">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
        </div>
    </div>
    <script>
    function save_category(){
    	$.messager.confirm("添加确认", "您确认要添加这些数据吗？", function(deleteAction) {
    		if (deleteAction) {
    			$('#add_category').form('submit', {
    				url : "../change/saveCategory.action",
    				onSubmit : function(param) {
    					return $(this).form('enableValidation').form('validate');
    				},
    				success : function(data) {
    					if(data!=null){
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
    	$('#add_category').form('clear');
    }
    </script>
</body>
</html>