<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>商品页面</title>

<link
	href="${pageContext.request.contextPath }/one/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/one/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/one/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath }/one/css/optstyle.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath }/one/css/style.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/basic/js/quick_links.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/js/jquery.flexslider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/js/list.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/one/js/amazeui.page.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/one/layer/layer.js"></script>

</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<c:choose>
						<c:when test="${user!=null }">
							<span>欢迎会员:</span>
							<a href="${pageContext.request.contextPath }/one/home/login.jsp"
								target="_top" class="h" style="color: red;">${user.userName }</a>
							<a
								href="${pageContext.request.contextPath }/login.do?method=SignOut"
								target="_top" class="h" style="color: red;">注销</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/one/home/login.jsp"
								target="_top" class="h">亲，请登录</a>
							<a
								href="${pageContext.request.contextPath }/one/home/register.jsp"
								target="_top">免费注册</a>
						</c:otherwise>
					</c:choose>
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
						href="${pageContext.request.contextPath}/Cart/goCart"
						target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h">0</strong></a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/one/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img
				src="${pageContext.request.contextPath }/one/images/logobig.png" /></li>
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
	<b class="line"></b>
	<div class="listMain">

		<!--分类-->
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
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">内容</li>
		</ol>
		<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
		<div class="scoll">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li><img
							src="${pageContext.request.contextPath }/one/images/01.jpg"
							title="pic" /></li>
						<li><img
							src="${pageContext.request.contextPath }/one/images/02.jpg" /></li>
						<li><img
							src="${pageContext.request.contextPath }/one/images/03.jpg" /></li>
					</ul>
				</div>
			</section>
		</div>

		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">
					<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

					<div class="tb-booth tb-pic tb-s310">
						<c:forEach items="${goods.imgs }" var="imgs" varStatus="img">
							<c:if test="${img.count==1 }">
								<a href="/img/${imgs.bigImg }"><img
									src="/img/${imgs.bigImg }" alt="细节展示放大镜特效"
									rel="/img/${imgs.bigImg }" class="jqzoom" /></a>
							</c:if>
						</c:forEach>
					</div>
					<ul class="tb-thumb" id="thumblist">
						<c:forEach items="${goods.imgs }" var="imgs">
							<li class="tb-selected">
								<div class="tb-pic tb-s40">
									<a href="#"> <img
										src="${pageContext.request.contextPath }/one/images/01_small.jpg"
										mid="${pageContext.request.contextPath }/one/images/01_mid.jpg"
										big="${pageContext.request.contextPath }/one/images/01.jpg">
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${goods.name }</h1>
				</div>
				<input type="hidden" id="goodId" value="${goods.id }" />
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>促销价</dt>
							<dd>
								<em>¥</em><b class="sys_item_price">${goods.price }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>原价</dt>
							<dd>
								<em>¥</em><b class="sys_item_mktprice">${goods.price+goods.price*0.3 }</b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					<!--地址-->
					<dl class="iteminfo_parameter freight">
						<dt>配送至</dt>
						<div class="iteminfo_freprice">
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">浙江省</option>
									<option value="b">湖北省</option>
								</select> <select data-am-selected>
									<option value="a">温州市</option>
									<option value="b">武汉市</option>
								</select> <select data-am-selected>
									<option value="a">瑞安区</option>
									<option value="b">洪山区</option>
								</select>
							</div>
							<div class="pay-logis">
								快递<b class="sys_item_freprice">10</b>元
							</div>
						</div>
					</dl>
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">库存</span><span class="tm-count">${goods.num }</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量</span><span class="tm-count">${goods.quantity }</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">点击量</span><span class="tm-count">${goods.click }</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" id="goCartff" name="loginform"
										action="${pageContext.request.contextPath }/Cart/goCart"
										method="post">
										<input type="hidden" name="id" value="${goods.id }">
										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dd>
													<input id="min" class="am-btn am-btn-default" name=""
														type="button" value="-" /> <input id="text_box"
														name="num" type="text" value="1" style="width: 30px;" /> <input
														id="add" class="am-btn am-btn-default" name=""
														type="button" value="+" /> <span id="Stock"
														class="tb-hidden">库存<span class="stock">${goods.num }<input
															type="hidden" id="number" value="${goods.num }"></input></span>件
													</span>
												</dd>
												<script type="text/javascript">
															$('#text_box').bind('change',function(){
																num();
															});
															$('#min').bind('click',function(){
																num();
															});
															$('#add').bind('click',function(){
																num();
															})
															
															function num(){
																var num = $("#text_box").val();
																var number = $('#number').val();
																$('#add').attr('disabled',false);
																$('#min').attr('disabled',false);
																if(num<=1){
																	$('#add').attr('disabled',false);
																	$('#min').attr('disabled',true);
																	$("#text_box").val(1);
																}
																if(num>number){
																	$('#add').attr('disabled',true);
																	$('#min').attr('disabled',false);
																	$("#text_box").val(number);
																}
															}
																
														</script>

											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>
										<div class="theme-signin-right">
											<div class="img-info">
												<img
													src="${pageContext.request.contextPath }/one/images/songzi.jpg" />
											</div>
											<div class="text-info">
												<span class="J_Price price-now">¥39.00</span> <span
													id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件
												</span>
											</div>
										</div>
									</form>
								</div>
							</div>

						</dd>
					</dl>
					<div class="clear"></div>
				</div>

				<div class="pay">
					<div class="pay-opt">
						<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
						<a><span class="am-icon-heart am-icon-fw">收藏</span></a>

					</div>
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:goCart();">立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" title="加入购物车" href="javascript:addCart();"><i></i>加入购物车</a>
						</div>
					</li>
				</div>

				<script type="text/javascript">

							function goCart(){
								$("#goCartff").submit();
							}
							
							function addCart(){
								$.post("../Cart/addCart",{
									id:$('#goodId').val(),
									num:$('#text_box').val()
								},function(data){
									layer.msg("添加购物车成功",{icon:1});
								},'json');
							}
						</script>

			</div>

			<div class="clear"></div>

		</div>

		<div class="clear"></div>


		<!-- introduce-->

		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>

						<li class="first">
							<div class="p-img">
								<a href="#"> <img class=""
									src="${pageContext.request.contextPath }/one/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${pageContext.request.contextPath }/one/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${pageContext.request.contextPath }/one/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${pageContext.request.contextPath }/one/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class=""
									src="${pageContext.request.contextPath }/one/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子218g】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#"> <span
								class="index-needs-dt-txt">宝贝详情</span></a></li>

						<li><a href="#"> <span class="index-needs-dt-txt">全部评价</span></a>

						</li>

						<li><a href="#"> <span class="index-needs-dt-txt">猜你喜欢</span></a>
						</li>
					</ul>

					<div class="am-tabs-bd">

						<div class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">

								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;烘炒类</li>
									<li title="">原料产地:&nbsp;巴基斯坦</li>
									<li title="">产地:&nbsp;湖北省武汉市</li>
									<li title="">配料表:&nbsp;进口松子、食用盐</li>
									<li title="">产品规格:&nbsp;210g</li>
									<li title="">保质期:&nbsp;180天</li>
									<li title="">产品标准号:&nbsp;GB/T 22165</li>
									<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
									<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存</li>
									<li title="">食用方法：&nbsp;开袋去壳即食</li>
								</ul>
								<div class="clear"></div>
							</div>

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<img
										src="${pageContext.request.contextPath }/one/images/tw1.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw2.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw3.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw4.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw5.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw6.jpg" />
									<img
										src="${pageContext.request.contextPath }/one/images/tw7.jpg" />
								</div>
							</div>
							<div class="clear"></div>

						</div>

						<div class="am-tab-panel am-fade">

							<div class="actor-new">
								<div class="rate">
									<strong>100<span>%</span></strong><br> <span>好评度</span>
								</div>
								<dl>
									<dt>买家印象</dt>
									<dd class="p-bfc">
										<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q> <q
											class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q> <q
											class="comm-tags"><span>口感好</span><em>(1823)</em></q> <q
											class="comm-tags"><span>商品不错</span><em>(1689)</em></q> <q
											class="comm-tags"><span>香脆可口</span><em>(1488)</em></q> <q
											class="comm-tags"><span>个个开口</span><em>(1392)</em></q> <q
											class="comm-tags"><span>价格便宜</span><em>(1119)</em></q> <q
											class="comm-tags"><span>特价买的</span><em>(865)</em></q> <q
											class="comm-tags"><span>皮很薄</span><em>(831)</em></q>
									</dd>
								</dl>
							</div>
							<div class="clear"></div>
							<div class="tb-r-filter-bar">
								<ul class=" tb-taglist am-avg-sm-4">
									<li class="tb-taglist-li tb-taglist-li-current">
										<div class="comment-info">
											<span>全部评价</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-1">
										<div class="comment-info">
											<span>好评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-0">
										<div class="comment-info">
											<span>中评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li--1">
										<div class="comment-info">
											<span>差评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<ul class="am-comments-list am-comments-list-flip" id="evaluates">

							</ul>

							<div class="clear"></div>

							<!--分页 -->
							<div id="page"></div>
							<script>
									$(function() {
										var pages = 2;
										$.ajax({
						        			url: '../Goods/getEvaluates',
						        			async: false,
						        			data: {
						        				id: $('#goodId').val(),
						        				page: '1'
						        			},
						        			success: function(data) {
						        				
						        				if(data!=null){
						        					pages = data.pages;
							        				var $li = "";
							        				for(var index = 0; index < data.rows.length; index++) {
							        					$li = "<li class='am-comment'><a href=''><img class='am-comment-avatar' src='../one/images/hwbn40x40.jpg' /></a><div class='am-comment-main'><header class='am-comment-hd'><div class='am-comment-meta'><a href='#link-to-user' class='am-comment-author'>" + data.rows[index].user.userName + "</a>评论于<time datetime=''>" + data.rows[index].comDate + "</time></div></header><div class='am-comment-bd'><div class='tb-rev-item ' data-id='255776406962'><div class='J_TbcRate_ReviewContent tb-tbcr-content '>" + data.rows[index].message + "</div><div class='tb-r-act-bar'>分类：" + data.rows[index].spare + "</div></div></div></div></li>";
							        					$('#evaluates').append($li);
							        				}
						        				}
						        				

						        			},
						        			dataType: 'json'
						        		});
										
										var $page = $("#page").page({
								            pages: 2, //页数
								            curr: 1, //当前页 
								            type: 'default', //主题
								            groups: 5, //连续显示分页数
								            prev: '<', //若不显示，设置false即可
								            next: '>', //若不显示，设置false即可        
								            first: "首页",
								            last: "尾页", //false则不显示
								            before: function(context, next) { //加载前触发，如果没有执行next()则中断加载
								            	var count  = context.option.curr;
								                next();
								            },
								            render: function(context, $el, index) { //渲染[context：对this的引用，$el：当前元素，index：当前索引]
								                //逻辑处理
								                if (index == 'last') { //虽然上面设置了last的文字为尾页，但是经过render处理，结果变为最后一页
								                    $el.find('a').html('最后一页');
								                    return $el; //如果有返回值则使用返回值渲染
								                }
								                return false; //没有返回值则按默认处理
								            },
								            after: function(context, next) { //加载完成后触发
								                var time = (new Date()).getTime(); //没有什么卵用的演示
								                console.log('分页组件加载完毕，耗时：' + (time - context.time) + 'ms');
								                next();
								            },
								            /*
								             * 触发分页后的回调，如果首次加载时后端已处理好分页数据则需要在after中判断终止或在jump中判断first是否为假
								             */
								            jump: function(context, first) {
								                var count = context.option.curr;
								                getData(count);
								                //$("#content").html(thisDate(context.option.curr));
								            }
								        });
								    })
								    
								    
								    function getData(count){
										$.ajax({
						        			url: '../Goods/getEvaluates',
						        			async: false,
						        			data: {
						        				id: $('#goodId').val(),
						        				page: count
						        			},
						        			success: function(data) {
						        				if(data!=null){
						        					$('#evaluates').children("li").remove(); 
						        					var $li = "";
							        				for(var index = 0; index < data.rows.length; index++) {
							        					$li = "<li class='am-comment'><a href=''><img class='am-comment-avatar' src='../one/images/hwbn40x40.jpg' /></a><div class='am-comment-main'><header class='am-comment-hd'><div class='am-comment-meta'><a href='#link-to-user' class='am-comment-author'>" + data.rows[index].user.userName + "</a>评论于<time datetime=''>" + data.rows[index].comDate + "</time></div></header><div class='am-comment-bd'><div class='tb-rev-item ' data-id='255776406962'><div class='J_TbcRate_ReviewContent tb-tbcr-content '>" + data.rows[index].message + "</div><div class='tb-r-act-bar'>分类：" + data.rows[index].spare + "</div></div></div></div></li>";
							        					$('#evaluates').append($li);
							        				}
						        				}

						        			},
						        			dataType: 'json'
						        		});
									}
									
									</script>

							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
								</div>
							</div>

						</div>

						<div class="am-tab-panel am-fade">
							<div class="like">
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<c:forEach items="${sameGoods }" var="sameGoods">
										<li>
											<div class="i-pic limit">
												<c:if test="${sameGoods.imgs!=null }">
													<c:forEach items="${sameGoods.imgs }" var="imgs"
														varStatus="statu">
														<c:if test="${statu.count==1 }">
															<img src="/img/${imgs.bigImg }"
																style="width: 214.5px; height: 214.5px;" />
														</c:if>
													</c:forEach>
												</c:if>
												<p>
													<span>${sameGoods.name }</span>
												</p>
												<p class="price fl">
													<b>¥</b> <strong>${sameGoods.price }</strong>
												</p>
											</div>
										</li>


									</c:forEach>

								</ul>
							</div>
							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							<div class="clear"></div>

						</div>

					</div>

				</div>

				<div class="clear"></div>

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

		</div>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item">
					<a href="#"> <span class="setting"></span>
					</a>
					<div class="ibar_login_box status_login">
						<div class="avatar_box">
							<p class="avatar_imgbox">
								<img
									src="${pageContext.request.contextPath }/one/images/no-img_mid_.jpg" />
							</p>
							<ul class="user_info">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox">
							<a href="#" class="login_order">我的订单</a> <a href="#"
								class="login_favorite">我的收藏</a>
						</div>
						<i class="icon_arrow_white"></i>
					</div>

				</div>
				<div id="shopCart" class="item">
					<a href="#"> <span class="message"></span>
					</a>
					<p>购物车</p>
					<p class="cart_num">0</p>
				</div>
				<div id="asset" class="item">
					<a href="#"> <span class="view"></span>
					</a>
					<div class="mp_tooltip">
						我的资产 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="foot" class="item">
					<a href="#"> <span class="zuji"></span>
					</a>
					<div class="mp_tooltip">
						我的足迹 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="brand" class="item">
					<a href="#"> <span class="wdsc"><img
							src="${pageContext.request.contextPath }/one/images/wdsc.png" /></span>
					</a>
					<div class="mp_tooltip">
						我的收藏 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="broadcast" class="item">
					<a href="#"> <span class="chongzhi"><img
							src="${pageContext.request.contextPath }/one/images/chongzhi.png" /></span>
					</a>
					<div class="mp_tooltip">
						我要充值 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div class="quick_toggle">
					<li class="qtitem"><a href="#"><span class="kfzx"></span></a>
						<div class="mp_tooltip">
							客服中心<i class="icon_arrow_right_black"></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem"><a href="#none"><span
							class="mpbtn_qrcode"></span></a>
						<div class="mp_qrcode" style="display: none;">
							<img
								src="${pageContext.request.contextPath }/one/images/weixin_code_145.png" /><i
								class="icon_arrow_white"></i>
						</div></li>
					<li class="qtitem"><a href="#top" class="return_top"><span
							class="top"></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop" class="quick_links_pop hide"></div>

			</div>

		</div>
		<div id="prof-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list">
				<a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">优惠券</div>
				</a> <a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">红包</div>
				</a> <a href="#" target="_blank" class="pl money">
					<div class="num">￥0</div>
					<div class="text">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>充值</div>
		</div>
	</div>

</body>

</html>