var url = '../change/imgSelect.action';

// 窗体加载事件
$(function() {
	// 初始化数据
	initData();
	
	
	$('#sgood').textbox('textbox').bind("focus", function() {
		//只发送一次请求deleteData
		$('#sgood').combobox({
			url : "../change/imgSelectAll.action",
			valueField : 'gid',
			textField : 'gname'
		});
	});
});

//商品修改函数
function editDataInit() {
	// 判断是否选中行
	var arr = $("#dg").datagrid('getSelections');
	if (arr.length == 1) {
		// 返回编辑行的对象
		row = $("#dg").datagrid('getSelected');
		// showWindow("title", "url", width, height, true);
		showWindow("添加商品信息", "./change/goEditImg.action?id=" + row.id, 400,
				320, true);
		// parent.$('#myWinId').window('close');
		// alert(row.id+"@@@@row.id");
		// 回显表单数据
		// $('#editff').form('load','./admin/goods.do?method=selectById&id='+row.id);
	} else {
		$.messager.show({
			title : '消息',
			msg : '请选择单行编辑！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
	}
};

// 初始化搜索框的内容，使用combox显示用户名称
$(function() {
	

});

// 添加函数
function addDataInit() {
	
	showWindow("添加商品信息", "./change/goAddImg.action", 400, 400, true);
	
};

// 添加按钮的函数


// 搜索函数
function searchData() {

	queryParams = {
		"flag":true,
		"gid" : $('#sgood').val(),
		"interpor" : $('#sinterpor').val()
		
	}
	$('#dg').datagrid('load', queryParams);
	

};
// 初始化函数
function initData() {
	$('#dg').datagrid({
		url : url,
		pageSize : 6,
		pageList : [ 2, 4, 6 ],
		
		pagination : true,
		fitColumns : true,
		toolbar : '#tb',
		columns : [ [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'id',
			title : '序号',
			width : 100,
			align : 'right',
		
		}, {
			field : 'smallImg',
			title : '小图',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (row.smallImg) {
					return value = "<img src=\"../uploads/"
							+ value
							+ "\" width=\"100px\" height=\"60px\" alt=\"图片丢失！！！\" />";
				} else {
					return value = "图片丢失！！"
				}
				return value;
			}
		
		}, {
			field : 'midImg',
			title : '中图',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (row.midImg) {
					return value = "<img src=\"../uploads/"
							+ value
							+ "\" width=\"100px\" height=\"60px\" alt=\"图片丢失！！！\" />";
				} else {
					return value = "图片丢失！！"
				}
				return value;
			}
		}, {
			field : 'bigImg',
			title : '大图',
			width : 100,
			formatter : function(value, row, index) {
				if (row.bigImg) {
					return value = "<img src=\"../uploads/"
							+ value
							+ "\" width=\"100px\" height=\"60px\" alt=\"图片丢失！！！\" />";
				} else {
					return value = "图片丢失！！"
				}
				return value;
			}
			
		}, {
			field : 'gname',
			title : '所属商品名称',
			width : 100,
			align : 'right',
			
		}, {
			field : 'interpor',
			title : '是否内推',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (value == 0) {
					return "否";
				} else {
					return "是";
				}
			}
		}, ] ]
	});
};


//删除函数
function deleteData() {
	var arr = $("#dg").datagrid('getSelections');
	if (arr.length == 0) {
		$.messager.show({
			title : '提示',
			msg : '请选择要删除的数据行',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
	} else {
		var ids = "";
		if (arr.length == 1) {
			// 删除的数据
			var row = $('#dg').datagrid('getSelected');
			ids = row.id;
		} else {
			for (var index = 0; index < arr.length; index++) {
				var row = arr[index];
				if (index == 0) {
					ids += row.id
				} else {
					ids += "," + row.id;
				}
			}
		}
		// 发送ajax请求
		$.post('../change/deleteImg.action', {
			ids : ids,
		}, function(data) {
			alert(data);
			alert(data==true);
			if (data) {
				$.messager.show({
					msg : '数据删除成功',
					timeout : 1200,
					showType : 'show'
				});
				// 刷新当前页的数据
				$("#dg").datagrid('reload');
			}else{
				$.messager.show({
					msg : '数据删除失败',
					timeout : 1200,
					showType : 'show'
				});
			}
		}, 'text');
	}

}