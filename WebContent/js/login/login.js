$(function() {
	$("#sbBtn").bind('click', function() {
		console.info('进来了');
		var name = $("#user").val();
		var pass = $("#password").val();
		// 验证规则
		// 提交发送ajax事件
		$.post("../../../admin/login.do", {
			method : "login",
			name : name,
			pass : pass,
			admin : 0
		}, function(data) {
			var result = data.content;
			if (result == 0) {
				// 登陆成功
				window.location.href = "../home.jsp";
			} else if (result == 2) {
				$("#tip").text("用户名不存在");
			} else if (result == 3) {
				$("#tip").text("密码输入错误");
				$("#password").val("");
			}
		}, 'json');
	});
});