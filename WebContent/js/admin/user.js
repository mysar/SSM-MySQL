var url = '../change/usersSelect.action';
var admin = "";
// 窗体加载事件
$(function() {
	// 初始化数据
	initData();
});
// 搜索函数
function searchData() {
	// 搜索变量
	var sname = $('#sname').val();
	var suserName = $('#sUserName').val();
	var semail = $('#semail').val();
	var sphone = $('#sphone').val();
	//admin = $("#admin").val();
	var queryParams = {
		name : sname,
		userName : suserName,
		email : semail,
		phone : sphone,
		//admin : admin
	};
	$("#dg").datagrid('load', queryParams);
};
// 添加函数
function addDataInit() {
	var admin = $('#admin').val();
	showWindow("添加商品信息", "./change/goAddUser.action?admin=" + admin, 400,
			400, true);
}
// 商品修改函数
function editDataInit() {
	// 判断是否选中行
	var arr = $("#dg").datagrid('getSelections');
	if (arr.length == 1) {
		// 返回编辑行的对象
		row = $("#dg").datagrid('getSelected');
		// showWindow("title", "url", width, height, true);
		showWindow("添加商品信息", "./change/goEdit.action?id=" + row.id, 400,
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

// 初始化显示数据
function initData() {
	admin = $("#admin").val();
	$('#dg').datagrid({
		url : url,
		pageSize : 6,
		pageList : [ 2, 4, 6 ],
		pagination : true,
		fitColumns : true,
		toolbar : '#tb',
		sortName : 'id',
		sortOrder : 'asc',
		queryParams : {
			admin : admin
		},
		columns : [ [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'id',
			title : '序号',
			width : 100,
			align : 'right'
		}, {
			field : 'password',
			title : '密码',
			width : 100,
			align : 'right'
		}, {
			field : 'sex',
			title : '性别',
			width : 100,
			align : 'right'
		}, {
			field : 'name',
			title : '昵称',
			width : 100
		}, {
			field : 'userName',
			title : '登陆名称',
			width : 100,
			sortable : true
		}, {
			field : 'email',
			title : '邮箱',
			width : 100,
			align : 'right',
			sortable : true
		}, {
			field : 'phone',
			title : '手机号码',
			width : 100,
			align : 'right'
		}, {
			field : 'registTime',
			title : '注册时间',
			width : 150,
			align : 'right'
		}, {
			field : 'telBind',
			title : '是否绑定手机',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (value == 0) {
					return "未绑定";
				} else {
					return "已绑定";
				}
			}
		},
		{
			field : 'state',
			title : '用户是否激活',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (value == 0) {
					return "未激活";
				} else {
					return "已激活";
				}
			}
		}] ]
	});
};


// 删除函数
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
		$.post('../change/deleteUser.action', {
			ids : ids,
			
		}, function(data) {
			
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
