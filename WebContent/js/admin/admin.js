var url = '../admin/user.do';

// 窗体加载事件
$(function() {
	// 初始化数据
	initData();
});

//搜索函数
function searchData(){
	//搜索变量
	var sname=$('#sname').val();
	var suserName=$('#sUserName').val();
	var semail=$('#semail').val();
	var sphone=$('#sphone').val();	
	var queryParams = {
			method:'select',
			sname:sname,
			suserName:suserName,
			semail:semail,
			sphone:sphone,
//			admin:1
	};
	$("#dg").datagrid('load', queryParams);
};

function initData() {
	$('#dg').datagrid({
		url : url,
		pageSize : 6,
		pageList : [ 2, 4, 6 ],
		queryParams : {
			method : 'select',
			admin : 1
		},
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
			title : '真实名称',
			width : 100
		}, {
			field : 'userName',
			title : '登陆名称',
			width : 100
		}, {
			field : 'email',
			title : '邮箱',
			width : 100,
			align : 'right'
		}, {
			field : 'phone',
			title : '手机号码',
			width : 100,
			align : 'right'
		}, {
			field : 'registTime',
			title : '注册时间',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (value) {
					return formatterDate(new Date(value.time));
				} else {
					return value;
				}
			}
		}, {
			field : 'telBind',
			title : '绑定手机',
			width : 100,
			align : 'right',
			formatter : function(value, row, index) {
				if (value == 0) {
					return "未绑定";
				} else {
					return "已绑定";
				}
			}
		}, ] ]
	});
};

// 日期格式
function formatterDate(date) {
	return date.getFullYear() + "/" + (date.getMonth() + 1) + "/"
			+ date.getDate() + "/" + date.getHours() + "时" + date.getMinutes()
			+ "分" + date.getSeconds() + "秒";
};

