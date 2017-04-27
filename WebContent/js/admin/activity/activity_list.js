var url ="../change/activitySelect.action";

 var owner = "";
$(function(){
	//初始话数据
	initDate();
	//初始化搜索

});


/**
 * 初始化数据显示
 * @returns
 */
function initDate() {
	$('#dg').datagrid(
			{
				url : url,
				pagination : true,
				fitColumns : true,
				pageSize : 10,
				pageList : [ 10, 20,30],
				toolbar : "#tb",
				columns : [ [
						{
							field : "ck",
							checkbox : true
						},
						{
							field : "id",
							title : '序号',
							width : 100,
							align : "center",
							sortable:true,
						},
						{
							field : 'name',
							title : '活动名',
							width : 150,
							align : "center",
							sortable : true
						},
						{
							field : 'img',
							title : '活动图片',
							width : 100,
							align : "center",
							sortable : true,
							formatter : function(value, row, index) {
								if(row.img){
									return value= "<img src=\"../uploads/"+row.img+"\" width=\"100px\" height=\"60px\" alt=\"活动尚未开始！！！\" />";
								}else{
									return value = "活动尚未开放！！"
								}
								return value;
							}
						},
						{
							field : 'remark',
							title : '活动介绍',
							width : 200,
							align : "center",
							sortable : true
						},
						
						{
							field : 'addTime',
							title : '添加时间',
							width : 100,
							align : "center"
								},
						{
							field : 'outTime',
							title : '结束时间',
							width : 100,
							align : "center"
								}/*,
						{
							field : "opt",
							title : '上传',
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
						},
						{
							field : "interpor",
							title : '设值内推',
							width : 100,
							align : "center",
							formatter : function(value, row, index) {
								var temp = "";
								if (row.interpor == 0) {
									temp = "<a class=\"easyui-linkbutton l-btn l-btn-small easyui-fluid\" style=\"width: 105px;\" href=\"javascript:setInterpor("
											+ row.id
											+ ","
											+ index
											+ ")\" data-options=\"iconCls:'icon-add'\" group=\"\"><span class=\"l-btn-left l-btn-icon-left\" style=\"margin-top: 0px;\">"
											+ "<span class=\"l-btn-text\">设置</span><span class=\"l-btn-icon icon-add\">&nbsp;</span></span></a>";
								} else {
									temp = "<a class=\"easyui-linkbutton l-btn l-btn-small easyui-fluid\" style=\"width: 105px;\" href=\"javascript:setInterpor("
											+ row.id
											+ ","
											+ index
											+ ")\" data-options=\"iconCls:'icon-add'\" group=\"\"><span class=\"l-btn-left l-btn-icon-left\" style=\"margin-top: 0px;\">"
											+ "<span class=\"l-btn-text\">取消</span><span class=\"l-btn-icon icon-add\">&nbsp;</span></span></a>";
								}
								return temp;
							},*/
						 ] ],

			});
	
}


function searchData(){
		//查询条件
		var params={
				"name":"%"+$("#sname").val()+"%",
				"remark":$("#sremark").val(),
				
				
				
				"flag":true,
		};
		//重新加载
		$("#dg").datagrid("load",params);
	};
	


function addDataInit() {
	showWindow("添加用户信息", "change/goAddActivity.action", 530, 430, true);
};

function editDataInit(){
	var rows=$('#dg').datagrid("getSelections");
	if(rows.length==1){
		alert(rows[0].id);
		showWindow("用户更新信息", "change/goUpdateActivity.action?id="+rows[0].id, 530, 430, true);
	}else{
		  $.messager.show({
              title:'Tip',
              msg:'请选择一条记录进行更新！',
              showType:'show'
          });
      	
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
			$.post("../change/deleteActivity.action", {
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
