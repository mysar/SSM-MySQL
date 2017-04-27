$(function() {
	// 初始化轮播图
	// initImg();
	// 导航效果
	initCategory();
});

// 初始化轮播图
function initImg() {
	// 发送ajax请求
	$.ajax({
		url : './index.do?method=selectImg',
		async : false,
		success : function(data) {
			alert(data.length);
			// 遍历数组
			for (var index = 0; index < data.length; index++) {
				var $li = $("<li class=\"banner" + (index + 1)
						+ "\"><a href=\"#\">" + "<img src=\"./uploads/"
						+ data[index].img + "\" /></a></li>");

				// 创建一个li
				/*
				 * var $li = $("<li class=\"banner" + (index + 1) + "\"><a
				 * href=\"#\"><img src=\"./uploads/" + data[index].img + "\" /></a></li>");
				 */
				// 把li加入到ul中
				$("#carousel").append($li);
			}
		},
		dataType : "JSON"
	});
};

// 发送ajax事件，获取导航效果
function initCategory() {
	$.ajax({
				url : './index.do?method=selectCategoryByCid',
				async : false,
				success : function(data) {
					if (data != null && data.length > 0) {
						for (var index = 0; index < data.length; index++) {
							var obj = data[index];
							var $li;
							if (index == 0) {
								$li = $("<li class=\"appliance js_toggle relative first\"><div class=\"category-info\"><h3 class=\"category-name b-category-name\" ><i><img src=\"#\"></i><a class=\"ml-22\" title=\""
										+ obj.name
										+ "\">"
										+ obj.name
										+ "</a></h3><em>&gt;</em></div></li>");
							} else {
								$li = $("<li class=\"appliance js_toggle relative\"><div class=\"category-info\"><h3 class=\"category-name b-category-name\" ><i><img src=\"#\"></i><a class=\"ml-22\" title=\""
										+ obj.name
										+ "\">"
										+ obj.name
										+ "</a></h3><em>&gt;</em></div></li>");
							}
							$.ajax({
										url : './index.do?method=selectCategoryByCid',
										type : 'POST',
										data : {
											cid : obj.id
										},
										async : false,
										success : function(data) {
											if (data != null && data.length > 0) {
												var $div1 = $("<div class=\"menu-item menu-in top\"></div>");
												var $div2 = $("<div class=\"area-in\"></div>");
												var $div3 = $("<div class=\"area-bg\"></div>");
												var $div4 = $("<div class=\"menu-srot\"></div>");
												var $div5 = $(" <div class=\"sort-side\" ></div>");
												var $b = $("<b class=\"arrow\"></b>");
												$div4.append($div5);
												$div3.append($div4);
												$div2.append($div3);
												$div1.append($div2);
												$li.append($div1);
												$li.append($b);
												for (var index = 0; index < data.length; index++) {
													var obj1 = data[index];
													var $dl = $("<dl class=\"dl-sort\"></dl>");
													var $dt = $("<dt><span title=\""
															+ obj1.name
															+ "\">"
															+ obj1.name
															+ "</span></dt>");
													$dl.append($dt);
													$div5.append($dl);
													$.ajax({
																url : './index.do?method=selectCategoryByCid',
																type : 'POST',
																data : {
																	cid : obj1.id
																},
																async : false,
																success : function(
																		data) {
																	if (data != null
																			&& data.length > 0) {
																		for (var c = 0; c < data.length; c++) {

																			var $dd = $("<dd><a title=\""
																					+ data[c].name
																					+ "\" href=\"#\"><span>"
																					+ data[c].name
																					+ "</span></a></dd>");
																			$dl.append($dd);
																		}
																	}
																},
																dataType : 'json'
															});
												}
											}

										},
										dataType : 'json'
									});
							$('#js_climit_li').append($li);
						}

					}
				},
				dataType : 'JSON'
			});
}
