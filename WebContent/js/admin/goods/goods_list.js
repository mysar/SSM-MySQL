var url = "../change/goodlist.action";
var editIndex=undefined;
$(function() {
	initDate();
	
	$("#ccname").combobox({
		url : "../change/categorySelectAll.action",
		valueField : 'id',
		textField : 'name'
	});
});

function initDate() {
	$('#dg').datagrid({
						url : url,
						pagination : true,
						fitColumns : true,
						pageSize : 15,
						pageList : [ 15, 18, 20 ],
						toolbar : "#su",
						columns : [ [
								{
									field : "id",
									title : '序号',
									width : 50,
									align : "center"
								},
								{
									field : 'number',
									title : '商品编号',
									width : 100,
									align : "center",
									sortable : true
								},
								{
									field : 'name',
									title : '商品名称',
									width : 100,
									align : "center",
									sortable : true

								},{
									field : 'cname',
									title : '所属类型',
									width : 100,
									align : "center"
								},{
									field : 'price',
									title : '商品价格',
									width : 100,
									align : "center",
									sortable : true
								},
								{
									field : 'quantity',
									title : '商品销量',
									width : 100,
									align : "center",
									sortable : true
								},
								{
									field : 'createdate',
									title : '商品上架时间',
									width : 100,
									align : "center",
									formatter : function(value, row, index) {
										if (value) {
											return formatterDate( new Date(
													value));
										} 
									}
									
								},
								{
									field : 'outdate',
									title : '商品下架时间',
									width : 100,
									align : "center",
									formatter : function(value, row, index) {
										if (value) {
											return formatterDate( new Date(
													value));
										} 
									}
									
								},
								{
									field : 'hote',
									title : '热销状态',
									width : 100,
									align : "center",
									formatter : function(value, row, index) {
										if (value) {
											value = "热销";
										} else {
											value = "不热销";
										}
										return value;
									}
								},{
									field : 'remark',
									title : '商品备注',
									width : 100,
									align : "center"
								},
								{
									field : "opt",
									title : '添加图片',
									width : 100,
									align : "center",
									formatter : function(value, row, index) {
										var id = row.id;
										value = " <a href=\"javascript:uploadImg("
												+ id
												+ ")\" class=\"easyui-linkbutton l-btn l-btn-large\" "
												+ "data-options=\"iconCls:'icon-large-picture',size:'large',iconAlign:'top'\" "
												+ "group=\"\" id=\"\"><span class=\"l-btn-left l-btn-icon-top\""
												+ "><span class=\"l-btn-text\">上传</span><span class=\"l-btn-icon icon-large-picture\""
												+ ">&nbsp;</span></span></a>";
										return value;
									},
								}
								 ] ],
						onDblClickRow : function(index, field, value) {
							if (editIndex == undefined) {
								editIndex = index;
								$('#dg').datagrid('selectRow', index).datagrid(
										'beginEdit', index);
							}
						},
						rowStyler : function(index, row) {
							if (row.admin == 1) {
								return 'background-color:#6293BB;color:#fff;font-weight:bold;';
							}
						},

					})
	var $pagetion = $("#dg").datagrid("getPager");
	$pagetion.pagination({
		layout : [ 'list', 'sep', 'first', 'prev', 'links', 'next', 'last',
				'sep', 'refresh' ]
	});
}

function formatterDate(date) {
	return date.getFullYear() + "年" + (date.getMonth() + 1) + "月"
			+ date.getDate() + "日" ;
}
//===========================模糊查询==============================

function searchData() {

	var names = $("#sname").val();
	var numbers = $('#snumber').val();
	var queryParams = {
		names : names,
		numbers : numbers,
	};
	$("#dg").datagrid('load', queryParams);
	$('#dg').datagrid('beginEdit', 1);
};

function addDataInit() {
	showWindow("添加用户信息", "./change/go_add_good.action", 600, 600, true);
}

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
		showWindow("修改用户信息", "./change/go_update_good.action?id=" + row.id, 600, 600, true);
	}
}
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
			$.post("../change/delete_good.action", {
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

function uploadImg() {
	showWindow("添加图片", "./admin/imgAction!input.action", 530, 430, true);
};
