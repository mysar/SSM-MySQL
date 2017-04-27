var url = '../change/evaluateSelect.action';

// 窗体加载事件
$(function() {
	// 初始化数据
	initData();
	$('#suser').textbox('textbox').bind("focus", function() {
		//只发送一次请求
		$('#suser').combobox({
			url : "../change/evaluateSelectAll.action",
			
			valueField : 'uid',
			textField : 'uname'
		});
	});
	
	$('#sgood').textbox('textbox').bind("focus", function() {
		//只发送一次请求deleteData
		$('#sgood').combobox({
			url : "../change/evaluateSelectAll.action",
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
		showWindow("添加商品信息", "./change/goEditEvaluate.action?id=" + row.id, 400,
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
	
	showWindow("添加商品信息", "./change/goAddEvaluate.action", 400, 400, true);
	
};

// 添加按钮的函数


// 搜索函数
function searchData() {

	queryParams = {
		flag:true,
		gid : $('#sgood').val(),
		uid : $('#suser').val(),
		message: $('#smessage').val()
		
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
			field : 'uname',
			title : '用户名称',
			width : 100,
			align : 'right',
		
		}, {
			field : 'message',
			title : '评价内容',
			width : 100,
			align : 'right'
		}, {
			field : 'gname',
			title : '所属商品称',
			width : 100,
			
		}, {
			field : 'comDate',
			title : '评价时间',
			width : 100,
			align : 'right',
			
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
		$.post('../change/deleteEvaluate.action', {
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