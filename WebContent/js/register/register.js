//邮箱正则表达式
var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
//密码正则表达式
var passReg = /^(?=.{6,16}$)(?![0-9]+$)(?!.*(.).*\1)[0-9a-zA-Z.?]+$/;

$(function() {
	$("#emailRegister").bind('click', function() {
		var email = $("#email").val();
		var password = $("#password").val();
		var pd = $("#passwordRepeat").val();
		var flag = reg.test(email);
		if (flag) {
			if(passReg.test(password)){
				if (password != pd) {
					alert("两次密码输入不一致");
				} else {
					// 提交发送ajax事件
					$.post("../../admin/user.do", {
						method : "saveRegisterObject",
						email : email,
						passWord : password
					}, function(data) {
						var result = data.content;
						if (result == 1) {
							alert('用户名已存在');
						} else{
							alert('注册成功');
							// 登陆成功
							window.location.href = "./login/login.jsp";
						}
					}, 'json');
				}
			}else{
				alert('密码含不能含有特殊字符');
			}
			
		} else {
			alert('邮箱格式不正确');
		}
	});

});