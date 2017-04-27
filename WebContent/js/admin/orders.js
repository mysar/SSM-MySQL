var url = "../change/ordersSelect.action";

$(function() {
	// 初始化显示数据
	initData();
	
});

// 搜索函数
function searchData(){
	// 搜索变量

	var snumber = $('#snumber').val();
	var queryParams = {
		number : snumber
	};
	$("#dg").datagrid('load', queryParams);
};

function addDataInit() {
	showWindow("添加信息", "change/goAdd.action", 400,500, true);
}
function editDataInit() {
	var rows = $('#dg').datagrid("getSelections");
	if (rows.length == 1) {
		alert(rows[0].id);
		showWindow("用户更新信息", "change/goUpdateOrders.action?id=" + rows[0].id,
				530, 430, true);
	} else {
		$.messager.show({
			title : 'Tip',
			msg : '请选择一条记录进行更新！',
			showType : 'show'
		});

	}

}

function initData() {
	$('#dg')
			.datagrid(
					{
						url : url,
						pagination : true,
						fitColumns : true,
						// singleSelect:"true",
						pageSize : 5,
						pageList : [ 5, 10, 15 ],
						toolbar : "#tb",
						columns : [ [ {
							field : "ck",
							checkbox : true
						}, {
							field : "id",
							title : '序号',
							width : 100,
							align : "center"
						}, {
							field : 'number',
							title : '订单编号',
							width : 100,
							align : "center"
						}, {
							field : 'uname',
							title : '所属用户',
							width : 100,
							align : "center"
						}, {
							field : 'orderTime',
							title : '商品下单时间',
							width : 100,
							align : "center",
							formatter : function(value, row, index) {
								if (value) {
									return formatterDate( new Date(
											value));
								} 
							}
						}, {
							field : 'orderType',
							title : '订单状态',
							width : 100,
							align : "center",
							formatter : function(value, row, index) {
								if (value==1) {
									return "订单已完成";
								} else if(value==0) {
									return "订单未完成";
								}
								else if(value==2) {
									return "订单已撤销";
								}
							}
						}, {
							field : 'payType',
							title : '商品支付状态',
							width : 100,
							align : "center",
							formatter : function(value, row, index) {
									if (value==1) {
										return "未付款";
									} else if(value==0) {
										return "已付款";
									}
								}
						}, {
							field : 'totalPrice',
							title : '订单总价',
							width : 100,
							align : "center"
						}, {
							field : 'orderTime',
							title : '订单签收时间',
							width : 100,
							align : "center",
							formatter : function(value, row, index) {
								if (value) {
									return formatterDate( new Date(
											value));
								} 
							}
						}, {
							field : 'pname',
							title : '地址',
							width : 100,
							align : "center",
						}, ] ],
						view : detailview,
						detailFormatter : function(index, row) {

							return '<div style="padding:1px"><table class="ddv"></table></div>';
						},
						onExpandRow : function(index, row) {
					
							var ddv = $(this).datagrid('getRowDetail', index)
									.find('table.ddv');
							ddv.datagrid({
								url : '../change/detailSelectByOid.action?orders.id='
										+ row.id,
								fitColumns : true,
								singleSelect : true,
								rownumbers : true,
								loadMsg : '',
								height : 'auto',
								columns : [ [ {
									field : 'num',
									title : '商品数量',
									width : 100
								}, {
									field : 'price',
									title : '小计价格',
									width : 100,
									align : 'center'
								}, {
									field : 'gname',
									title : '所属商品',
									width : 100,
									align : 'center'
								} ] ],
								onResize : function() {
									$('#dg').datagrid('fixDetailRowHeight',
											index);
								},
								onLoadSuccess : function() {
									setTimeout(function() {
										$('#dg').datagrid('fixDetailRowHeight',
												index);
									}, 0);
								}
							});
							$('#dg').datagrid('fixDetailRowHeight', index);
						}
					})

};

function formatterDate(date) {
	return date.getFullYear() + "年" + (date.getMonth() + 1) + "月"
			+ date.getDate() + "日" ;
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
		$.post('../change/deleteOrders.action', {
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