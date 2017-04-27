var url = '../change/menuSelect.action';
//窗体加载事件
$(function() {
	// 初始化数据
	initData();

	$('#smid').combobox({
		url : "../change/selectMenuAll.action",
		valueField : 'mid',
		textField : 'pname'
	});

});

function initData() {
	$('#dg').datagrid(
			{
				url : url,
				pagination : true,
				toolbar : '#tb',
				pageSize : 3,
				pageList : [ 3, 5, 8 ],
				sortName : 'id',
				sortOrder : 'asc',
				columns : [ [
					{
						title : "序号",
						field : "id",
						width : 30,
						checkbox : true,
					},{
							field : 'name',
							title : '用户名',
							width : 100
						},
						{
							field : 'icon',
							title : '图标',
							width : 100
							
						}, {
							field : 'url',
							title : '商品评价内容',
							width : 100
						}, {
							field : 'pname',
							title : '关联',
							width : 100
							
						} ] ]
			});

};

function searchData(){
	//查询条件
	var params={
			"name":"%"+$("#sname").val()+"%",
			"icon":$("#sicon").val(),
			
			
			
			"flag":true,
	};
	//重新加载
	$("#dg").datagrid("load",params);
};




function addDataInit() {
	showWindow("添加商品信息", "change/goAddMenu.action", 530, 430, true);
};

function editDataInit(){
	var rows=$('#dg').datagrid("getSelections");
	if(rows.length==1){
		alert(rows[0].id);
		showWindow("用户更新信息", "change/goUpdateMenu.action?id="+rows[0].id, 530, 430, true);
	}else{
		  $.messager.show({
              title:'Tip',
              msg:'请选择一条记录进行更新！',
              showType:'show'
          });
      	
	}
	
}



function deleteData(){
	//获取数据
	var arr = $('#dg').datagrid('getSelections');
	if(arr.length==0){
		$.messager.show({
			title:"提示",
			msg:"请选择要删除的数据",
			showType:'fade',
			style:{
				right:'',
				bottom:''
			}
		});
	}else{
		var ids='';
		//单个删除
		if(arr.length==1){
			var row = $('#dg').datagrid('getSelected');
			 ids = row.id;
		}else{
			for(var  index = 0;index<arr.length;index++){
//				获取行数据对象
				var row = arr[index];
				
					 ids+=row.id+",";
				
			}
		}
		$.post("../change/deleteMenu.action",{
			ids:ids,
			
		},function(data){
			msg="删除失败";
			alert(data);
	    	if(data){
	    		msg="删除成功";
	
	    	}
			parent.$.messager.show({
                title:'Tip',
                msg:msg,
                showType:'show'
            });
			if(data){
				$("#dg").datagrid('reload');
			}
		},'json');
	}
};
