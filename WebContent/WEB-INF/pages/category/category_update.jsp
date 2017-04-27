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
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" required="true" name="name" style="width:100%" value="${entity.name}" data-options="label:'商品类型名称:'">
            </div><!-- 
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="outimg" style="width:100%" value="${entity.outimg}" data-options="label:'移除图片:'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="enterimg" style="width:100%" value="${entity.enterimg}" data-options="label:'移入图片:'">
            </div>-->
             <div style="margin-bottom:20px">
                <input class="easyui-combobox" name="cid" value="${entity.cid}" id="scategory" style="width:100%" data-options="label:'商品所属类型:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="remark" style="width:100%" value="${entity.remark}" data-options="label:'类型备注:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="number" style="width:100%" value="${entity.number}" data-options="label:'类型编号:'">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="spare" style="width:100%" value="${entity.spare}" data-options="label:'备用字段:'">
            </div>
            <input type="hidden" name="id" value="${entity.id}"/>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
        </div>
    </div>
    <script>
	  function submitForm(){
	        $('#ff').form('submit',{
	            url:"../change/updateCategory.action",
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
</body>
</html>