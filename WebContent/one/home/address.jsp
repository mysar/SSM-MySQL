<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link
	href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/one/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/one/css/addstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/distpicker.js"></script>
</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<div class="am-container header">
					<ul class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<a href="#" target="_top" class="h">亲，请登录</a> <a href="#"
									target="_top">免费注册</a>
							</div>
						</div>
					</ul>
					<ul class="message-r">
						<div class="topMessage home">
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath }/Home/index"
									target="_top" class="h">商城首页</a>
							</div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng">
								<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd"
									href="${pageContext.request.contextPath }/Cart/goCart"
									target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
									id="J_MiniCartNum" class="h">0</strong></a>
							</div>
						</div>
						<div class="topMessage favorite">
							<div class="menu-hd">
								<a href="#" target="_top"><i
									class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
							</div>
					</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><img
							src="${pageContext.request.contextPath}/one/images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text"
								placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			</div>
		</article>
	</header>

	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach items="${address}" var="address">
							<c:choose>
								<c:when test="${address.defaultAdd==1 }">
									<li class="user-addresslist defaultAddr"><span
										class="new-option-r"> <i class="am-icon-check-circle"></i>默认地址
									</span>
										<p class="new-tit new-p-re">
											<span class="new-txt">${address.name }</span> <span
												class="new-txt-rd2">${address.phone }</span>
										</p>
										<div class="new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="title">地址：</span> <span>${address.address }</span>
											</p>
										</div>
										<div class="new-addr-btn">
											<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
												class="new-addr-bar">|</span> <a href="javascript:void(0);"
												onclick="delClick(${address.id});"><i
												class="am-icon-trash"></i>删除</a>
										</div></li>

								</c:when>

								<c:otherwise>
									<li class="user-addresslist"
										onclick="setdefaultadd(${address.id})"><span
										class="new-option-r"> <i class="am-icon-check-circle"></i>默认地址
									</span>
										<p class="new-tit new-p-re">
											<span class="new-txt">${address.name }</span> <span
												class="new-txt-rd2">${address.phone }</span>
										</p>
										<div class="new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="title">地址：</span> <span>${address.address }</span>
											</p>
										</div>
										<div class="new-addr-btn">
											<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
												class="new-addr-bar">|</span> <a href="javascript:void(0);"
												onclick="delClick(${address.id});"><i
												class="am-icon-trash"></i>删除</a>
										</div></li>

								</c:otherwise>

							</c:choose>


						</c:forEach>

					</ul>
					<script type="text/javascript">
						function setdefaultadd(id){
							$.ajax({
								url:'../User/setDefaultAdd',
								type:'POST',
								data:{
									id:id
								},
								success:function(data){
									if(data){
										window.location.href="../User/getAddress";
									}
								}
							});
						}
						
						function delClick(id){
							$.ajax({
								url:'../Address/delete',
								type:'POST',
								data:{
									id:id
								},
								success:function(data){
									if(data){
										window.location.href="../User/getAddress";
									}else{
										layer.msg("提交订单失败",{icon:2});
									}
								}
							});
						}
						
						
					</script>

					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal"
									action="${pageContext.request.contextPath }/Address/save"
									method="post" onSubmit="addAddress();">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" name="name" id="user-name"
												required="required" placeholder="收货人">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" name="phone" placeholder="手机号必填"
												required="required" pattern="^1[3|4|5|7|8][0-9]{9}$"
												type="tel" />
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<div data-toggle="distpicker">
												<select data-province="---- 选择省 ----" id="province"></select>
												<select data-city="---- 选择市 ----" id="city"></select> <select
													data-district="---- 选择区 ----" id="area"></select>
											</div>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-addre"
												required="required" placeholder="输入详细地址"></textarea>
											<small>100字以内写出你的详细地址</small>
										</div>
									</div>
									<input name="address" id="address" type="hidden" /> <input
										name="defaultAdd" type="hidden" value="0" />
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<input class="am-btn am-btn-danger" type="submit" value="保存" />
											<a href="#" class="am-close am-btn am-btn-danger"
												data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							});
					
							function addAddress(){
								var p = $("#province").val();
								var c = $("#city").val();
								var a = $("#area").val();
								var u = $("#user-addre").val();
								$('#address').val(p+""+c+""+a+""+u);
							}				
				</script>

				<div class="clear"></div>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
			<ul>
				<li class="person"><a href="index.html">个人中心</a></li>
				<li class="person"><a href="#">个人资料</a>
					<ul>
						<li><a href="information.html">个人信息</a></li>
						<li><a href="safety.html">安全设置</a></li>
						<li class="active"><a href="address.html">收货地址</a></li>
					</ul></li>
				<li class="person"><a href="#">我的交易</a>
					<ul>
						<li><a href="order.html">订单管理</a></li>
						<li><a href="change.html">退款售后</a></li>
					</ul></li>
				<li class="person"><a href="#">我的资产</a>
					<ul>
						<li><a href="coupon.html">优惠券 </a></li>
						<li><a href="bonus.html">红包</a></li>
						<li><a href="bill.html">账单明细</a></li>
					</ul></li>

				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="collection.html">收藏</a></li>
						<li><a href="foot.html">足迹</a></li>
						<li><a href="comment.html">评价</a></li>
						<li><a href="news.html">消息</a></li>
					</ul></li>

			</ul>

		</aside>
	</div>

</body>

</html>