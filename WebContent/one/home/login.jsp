<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" /> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/one/css/dlstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/one/layer/layer.js"></script>
</head>
<body>

	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo" src="${pageContext.request.contextPath}/one/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="${pageContext.request.contextPath}/one/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form id="ff" method="post"
						action="${pageContext.request.contextPath}/login.do?method=login">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> 
							<input type="text" name="name" id="user" placeholder="邮箱/手机/用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label>
							<input type="password" id="password" placeholder="请输入密码" /> 
							<input type="hidden" name="admin" value="0" />
						</div>
					</form>
				</div>

				<div class="login-links">
					<label for="remember-me"><input id="remember-me"
						type="checkbox">记住密码</label> <a href="#" class="am-fr">忘记密码</a> <a
						href="register.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				<div class="am-cf">
					<input type="submit" name="" value="登 录" id="submitForm"
						class="am-btn am-btn-primary am-btn-sm" />
				</div>
				<div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<ul>
							<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
							<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span></a></li>
							<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span></a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div>
	<script>
		$(function() {
			$('#submitForm').click(function(){
				var user = $('#user').val(),
					pass = $('#password').val();
				
				if(user == '') {
					layer.msg('用户名不能为空！', { icon:2 });
					return;
				}
				if(pass == '') {
					layer.msg('密码不能为空！', { icon:2 });
					return;
				}
				
				$.ajax({
		            type: 'POST',
		            url: './change/usersAdd.action',
		        	data: {
						'userName': user,
						'passWord': pass
					},
		            dataType: 'json',
		            success: function(data){
		            	if(data == 1) {
			         		layer.msg("登陆成功，正在跳转到主页……", { icon:1 });
			         		setTimeout(function(){
			         			window.location.href="../Home/index";
			         		}, 1500);
			         	} else if(data == 2){
			         		layer.msg("用户不存在！", { icon:2 });
			         	} else {
			         		layer.msg("账号或密码不正确",{ icon:2 });
			         	}
                    }
		        });
				
				/*
	         	//需要转换程json对象
	         	data = eval("("+data+")");
	         	//获取结果
	         	var result=data.content;
	         	//判断结果
	         	if(result==0){
	         		layer.msg("登陆成功，正在跳转到主页……",{icon:1});
	         		setTimeout(function(){
	         			window.location.href="../../index/home.do?method=goIndex";
	         		},1500);
	         	}else if(result==1){
	         		layer.msg("账号或密码不正确",{icon:2});
	         	}*/
	         });
		});
	</script>
</body>

</html>