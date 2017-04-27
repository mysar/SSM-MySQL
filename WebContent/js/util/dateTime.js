$.extend($.fn.validatebox.defaults.rules, {
	equalsTime : {
		validator : function(value, param) {
			// 获取第一个文本框的时间值
			var time = $(param[0]).datebox('getValue'); // 对象 思考
			if (time.trim()) {
				var startTime = $.fn.datebox.defaults.parser(time);
				var endTime = $.fn.datebox.defaults.parser(value);
				return startTime <= endTime;
			} else {
				return true;
			}
		},
		message : '商品的签收时间必须大于商品的上架时间!'
	},
	updateTime : {
		validator : function(value, param) {
			// 获取第一个文本框的时间值
			var updateTime = $(param[0]).datebox('getValue'); // 对象 思考
			if (updateTime.trim()) {
				var startTime = $.fn.datebox.defaults.parser(updateTime);
				var endTime = $.fn.datebox.defaults.parser(value);
				return startTime <= endTime;
			} else {
				return true;
			}
		},
		message : '商品的签收时间必须大于商品的下单时间!'
	},
	addequalsTime : {
		validator : function(value, param) {
			// 获取第一个文本框的时间值
			var Time = $(param[0]).datebox('getValue'); // 对象 思考
			if (Time.trim()) {
				var startTime = $.fn.datebox.defaults.parser(Time);
				var endTime = $.fn.datebox.defaults.parser(value);
				return startTime <= endTime;
			} else {
				return true;
			}
		},
		message : '商品的下架时间必须大于商品的上架时间!'
	}
});