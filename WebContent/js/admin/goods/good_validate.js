$.extend($.fn.validatebox.defaults.rules,{
	equalsTime:{
		validator:function(value,param){
			//获取时间值
			var time = $(param[0]).datebox('getValue');
			var firstTime  = $.fn.datebox.defaults.parser(time);  
			var secondTime = $.fn.datebox.defaults.parser(value); 
			return firstTime<=secondTime;
		},
		message:'商品下架时间必须大于等于商品上架时间.'
	}
});

if($.fn.validatebox){
	$.fn.validatebox.defaults.rules.remote.message="商品已存在，请修改名称";
}

