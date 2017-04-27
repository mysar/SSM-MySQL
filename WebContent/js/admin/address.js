var url = '../change/addressSelect.action';

// 窗体加载时间
$(function() {
	// 初始化数据
	initData();
	initDlg();
	$(".user").combobox({
		url : "../change/selectAddressAll.action",
		valueField : 'uid',
		textField : 'pname'
	})
})
function searchData() {
	
	var sname = $('#sname').val();
	var saddress = $('#saddress').val();
	var spname = $('#spname').val();
	var sspare = $('#sspare').val();
	var sphone = $('#sphone').val();
	var suser= $('#suser').val();
	var queryParams = {
		name : sname,
		address : saddress,
		pname : spname,
		spare:sspare,
		phone : sphone,
		uid:suser
	};
	$("#dg").datagrid('load', queryParams);

};

function initData() {
	$('#dg').datagrid({
		url : url,
		pageList : [ 2, 4, 6 ],
		pageSize : 2,
		fitColumns : true,
		pagination : true,
		toolbar : '#tb',
		columns : [ [

		{
			field : 'id',
			title : '地址编号',
			width : 450,
			align : 'center'
		}, {
			field : 'address',
			title : '收货地址',
			width : 450,
			align : 'center'
		}, {
			field : 'pname',
			title : '父类型',
			width : 100,

		}, {
			field : 'createDate',
			title : '签收时间',
			width : 450,
			align : 'center',

		}

		] ]
	})
}
function addDataInit() {
	showWindow("添加用户信息", "change/goAddAddress.action", 530, 430, true);
};

function editDataInit() {
	var rows = $('#dg').datagrid("getSelections");
	if (rows.length == 1) {
		alert(rows[0].id);
		showWindow("用户更新信息", "change/goUpdateAddress.action?id="
				+ rows[0].id, 530, 430, true);
	} else {
		$.messager.show({
			title : 'Tip',
			msg : '请选择一条记录进行更新！',
			showType : 'show'
		});

	}

}
function initDlg() {

	$("#deleteDlg").dialog({
		title : '删除商品',
		width : 600,
		height : 500,
		closed : true,
		modal : true,
		buttons : [ {
			text : '删除商品',
			iconCls : 'icon-save',
			handler : deletes
		}, {
			text : '取消',
			iconCls : 'icon-cancel',
			handler : deletesCancel
		} ]
	});
}
var deletes = function() {
	alert('删除数据')
}
var deletesCancel = function() {
	alert('取消删除数据')
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
				$.post('../change/deleteAddress.action', {
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
