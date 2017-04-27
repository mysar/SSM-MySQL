var url='../admin/Img!list.action';

$(function() {
	// 初始化数据
	initData();
	//初始化添加里的商品类型

});
function addDataInit() {
	showWindow("添加用户信息", "./admin/Img!input.action", 530, 430, true);
};

//初始化显示数据
function initData() {
	$('#dg').datagrid({
	    url:url,
	    pagination:true,
	    toolbar : '#tb',
	    pageSize:3,
	    pageList:[3,5,8],
	    sortName:'id',
	    sortOrder:'asc',
	    
	    columns:[[
	    	{field:"ck",checkbox : true},
	    	{field:'id',title:'序号',width:100},
	        {field:'img',title:'轮播图',width:100,sortable:true},
	        {field:'interpor',title:'内推',width:100,formatter : function(value, row, index) {
				if (value == 0) {
					return "否";
				} else if (value == 1) {
					return "是";
				}
			}
	        },
	        {field:'remark',title:'备注',width:100}
	    ]]
	});
};


function searchData() {
	

	var sinterpor = $("#sinterpor").combobox('getValue');
	var queryParams = {
			"interpor":sinterpor,	
			"flag":true
	};
	
	$("#dg").datagrid('load', queryParams);
	$('#dg').datagrid('beginEdit', 1);

	/*
	 * var index = $('#dg').datagrid('appendRow', { FlowTypeName : 'new name',
	 * FlowTypeCode : 30 }).datagrid('getRows').length - 1;
	 */
};

/**
 * 删除方法
 * @returns
 */
function deleteData(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert("系统提示", "请选择要删除的数据！");
		return;
	}
	var strIds = [];
	for (var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].id);
	}
	var ids = strIds.join(",");
	$.messager.confirm("系统提示", "您确认要删除这<font color=red>" + selectedRows.length
			+ "</font>条数据吗？", function(r) {
		if (r) {
			$.post("../admin/Img!delete.action", {
				id : ids
			}, function(data) {
				if (data) {
				
					$.messager.alert("系统提示", "数据已成功删除！");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "数据删除失败！");
				}
			}, "json");
		}
	});

}



/**
 * 添加数据
 * 
 * @returns
 */
function addObejcts() {
	$.messager.confirm("添加确认", "您确认要添加这些数据吗？", function(deleteAction) {
		if (deleteAction) {
			$('#imgsadd').form('submit', {
				url : "../admin/img.do",
				onSubmit : function(param) {
					param.method = "saveObject"
				},
				success : function(data) {
					var jsona =JSON.parse(data);
					if(jsona.id){
						parent.$.messager.alert("提示", "添加成功");
						parent.$("#myWinId").window('close');
					}else{
						parent.$.messager.alert("提示", "添加失败");
					}
				}
			});
		}
	})
}


/**
 * 跳转更新页面
 * @returns
 */
function initupdate(){
	arr = $("#dg").datagrid("getSelections");
	
	if (arr.length == 1) {
		$('#imgsupdate').form('load', arr[0]);
		var id= arr[0].id;
		showWindow("更新用户地址信息", "./admin/imgs.do?method=goUpdate&id="+id, 500, 400, true);
	
	} else {
		$.messager.show({
			title : '提示',
			msg : '请选择一行进行编辑',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
	}
}


function uploadImg() {
	showWindow("上传商品图片", "./admin/imgs.do?method=goImg", 900, 400,
			true);
};


/**
 * 更新功能
 * @returns
 */
function editDataInit(){
	var rows=$('#dg').datagrid("getSelections");
	if(rows.length==1){
		alert(rows[0].id);
		showWindow("用户更新信息", "./admin/Imgs!selectById.action?id="+rows[0].id, 530, 430, true);
	}else{
		  $.messager.show({
              title:'Tip',
              msg:'请选择一条记录进行更新！',
              showType:'show'
          });
      	
	}
}