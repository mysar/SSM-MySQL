var url = "../change/categorySelect.action";

// 窗体加载事件
$(function(){
	// 初始化数据
	initData();
	
	$("#scategory").combobox({
		url : "../change/categorySelectAll.action",
		valueField : 'cid',
		textField : 'pname'
	});
});
function initData() {
	$('#dg').datagrid({
		url : url,
		pagination : true,
		toolbar : '#tb',
		sortName : 'id',
		sortOrder : 'des',
		pageSize : 10,
		pageList : [ 10, 15, 18 ],
		columns : [ [ {
			field : 'id',
			title : '商品类型id',
			width : 100,
			sortable : true
		}, {
			field : 'name',
			title : '商品类型名称',
			width : 100
		}, {
			field : 'outimg',
			title : '移除图片',
			width : 100
		}, {
			field : 'enterimg',
			title : '移入图片',
			width : 100
		}, {
			field : 'pname',
			title : '商品所属类型',
			width : 100
		}, {
			field : 'remark',
			title : '类型备注',
			width : 100
		}, {
			field : 'number',
			title : '类型编号',
			width : 100
		}, {
			field : 'spare',
			title : '备用字段',
			width : 100
		} ] ]
	});

};

//===========================模糊查询==============================
function searchData() {

	var name = $("#sname").val();
	var pname = $('#scategory').val();
	var queryParams = {
		names : name,
		pname : pname,
	};

	$("#dg").datagrid('load', queryParams);
	$('#dg').datagrid('beginEdit', 1);
};
/* 添加 */
function addDataInit() {
	showWindow("添加商品类型信息", "./change/goAddCategory.action", 530, 430,
			true);
};
// 更新
function editDataInit() {
	var arr = $('#dg').datagrid('getSelections');
	if (arr.length != 1) {
		$.messager.show({
			title : '提示信息',
			msg : '只能选择一条记录进行修改!'
		});
	} else {
		var row = arr[0];
		alert(row.id);
		showWindow("修改用户信息", "./change/go_update_category.action?id=" + row.id, 600, 600, true);
	}
}

// 删除
function deleteData() {
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
			$.post("../change/delete_category.action", {
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
