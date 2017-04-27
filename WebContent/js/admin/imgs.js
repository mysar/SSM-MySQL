var url = '../change/imgsSelect.action';

// 窗体加载时间
$(function() {
	// 初始化数据
	initData();
})
function searchData() {
	// 搜索变量
	var remark = $('#remark').val();
	var interpor = $('#interpor').val();
	var queryParams = {
		remark : remark,
		interpor : interpor,

	};
	$("#dg").datagrid('load', queryParams);
};

function initData() {
	$('#dg').datagrid({
		url : url,
		pageList : [ 10, 15, 20 ],
		pageSize : 10,
		fitColumns : true,
		pagination : true,
		toolbar : '#tb',
		columns : [ [

		{
			field : 'id',
			title : 'id',
			width : 450,
			align : 'center'
		}, {
			field : 'img',
			title : '大图片',
			width : 450,
			align : 'center',
			formatter : function(value, row, index) {
				if (row.img) {
					return value = "<img src=\"../uploads/"
							+ value
							+ "\" width=\"100px\" height=\"60px\" alt=\"图片丢失！！！\" />";
				} else {
					return value = "图片丢失！！"
				}
				return value;
			}
		}, {
			field : 'interpor',
			title : '内推',
			formatter : function(value, row, index) {
				if (value == 0) {
					return "非内推";
				} else if (value == 1) {
					return "内推";
				}
			}
		},

		{
			field : 'remark',
			title : '备注',
			width : 450,
			align : 'center',

		}

		] ]
	})
}
function addDataInit() {
	showWindow("添加用户信息", "change/goAddImgs.action", 530, 430, true);
};

function editDataInit() {
	var rows = $('#dg').datagrid("getSelections");
	if (rows.length == 1) {
		alert(rows[0].id);
		showWindow("用户更新信息", "change/goUpdateImgs.action?id=" + rows[0].id,
				530, 430, true);
	} else {
		$.messager.show({
			title : 'Tip',
			msg : '请选择一条记录进行更新！',
			showType : 'show'
		});

	}

}
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
		$.messager.confirm("友情提示", "你确认删除选定的记录吗？", function(deleteValue) {
			if (deleteValue) {
				var ids = "";
				for (var index = 0; index < arr.length; index++) {
					var row = arr[index];
					ids += row.id+",";
				}
				// ../admin/User!list.action
				// 发送ajax请求
				$.post('../change/deleteImgs.action', {
					ids : ids
				}, function(data) {
					var msg="删除失败";
					if (data) {
						msg = '数据删除成功',
						// 刷新当前页的数据
						$("#dg").datagrid('reload');
					}
					$.messager.show({
						msg : msg,
						timeout : 1200,
						showType : 'show'
					});
				}, 'json');
			}
		})
	}

}

