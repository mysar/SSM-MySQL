$(function() {
});

// 添加商品
function addCart() {
	// 商品id
	var id = $("#gId").val();
	var price = $("#gPrice").html();
	// alert(id+"@@ID"+name+"@@@name"+price+"@@@price"+num+"@@num");
	// window.location.href="../index/cart.do?method=addCart";
	window.location.href = "../index/cart.do?method=goCart&id=" + id+ "&price=" + price;
};
