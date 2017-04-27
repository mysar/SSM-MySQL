$(function(){
	alert('123');
});
$('#sumAdd').bind('onclick', function() {
    alert('进来了');
	var price = $("#price").val();
	//文本框内容
	var num = $(".text_box").val();
	//var inputPrice = $(".number").html();
	var inputPrice = num * price + price * 1;
	console.info(price+"@@price"+num+"@@num"+inputPrice + "inputPrice@@@@@@@@")
});