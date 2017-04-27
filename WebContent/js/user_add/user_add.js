var url = "../admin/user.do";

$(function(){
	$("#add").click(function(){
	})
})



/*$.ajax({
	url : "../admin/user.do",
	type : 'post',
	async : false,
	data : {
		method : 'selectById',
		id : value
	},
	success : function(data) {
		value = data.name;
	},
	dataType : 'json'
});
*/



/*
 * function save(){
 * 
 * $('#addff').form('submit', { url : url, onSubmit : function(param) {
 * param.method = 'saveObject'; return
 * $(this).form('enableValidation').form('validate'); }, success :
 * function(data) { var json=eval("("+data+")"); if (json.id) { // 提示添加成功的消息
 * parent.$.messager.show({ title : '友情提示!', msg : '商品添加成功！', showType : 'show'
 * }); //关闭窗体,自己就会刷新datagrid parent.$("#myWinId").window('close'); } else {
 * alert("添加失败！"); }
 *  } }); }
 */