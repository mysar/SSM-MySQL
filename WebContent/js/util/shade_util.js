//在工具栏下的按钮调用此函数即可，该函数弹出一个窗口，在页面最顶层，遮罩全局。
//title -- 弹出窗口左上角的名称
//href  -- 该弹出框内部容纳的页面，是一个完整的jsp或html页面
//width --宽度
//height --高度
//modal --遮罩层
function showWindow(title, href, width, height, modal) {
	//创建window对象
    var openWin = window.top.$('<div id="myWinId" class="easyui-window" style="overflow:hidden"></div>').appendTo(window.top.document.body);
    //设置openWin属性
    openWin.window({
        title: title, //标题
        closed:true,  //关闭
        width: width === 200 ? 360 : width,  //默认宽,取值
        height: height === undefined ? 300 : height, //默认宽,取值
        content: '<iframe scrolling="yes" frameborder="0"  src="' + getBasePath()+href + '" style="width:100%;height:100%;"></iframe>',
        //+ parent.getBasePath()+href + http://locoalhost:8080/sshblank/   href=win/pages/admin/win_product.jsp
        modal: modal === undefined ? true : modal,
        minimizable: false,
        maximizable: false,
        shadow: false,
        cache: false,
        closed: false,
        collapsible: false,
        resizable: false,
        loadingMessage: '正在加载数据，请稍等片刻......',
        onClose : function(){ 
            openWin.window("destroy"); //销毁窗体
            //刷新datagrid,这里的#dg必须要和form表单里的一致
            $("#dg").datagrid("reload");
        }
        //扩展几个销毁窗体的方法
    });
}
 
//这个函数写在最外面的jsp页面中，即iframe的容器中，子页面调用是前面加上parent即可
/*这个函数写在最外面的jsp页面中，即iframe的容器中
 * 
 */
function getBasePath() {
    var location = (window.location+'').split('/');  
    var basePath = location[0]+'//'+location[2]+'/'+location[3]+'/'; 
    return basePath;
}

 
//对于弹出的一些警告框，要想在弹出是遮罩整个页面，把这个封装一下，放在主页面，然后通过
// parent.globalAlert()来调用即可。以此类推，confirm或者progressBar都可以这么做
/*这个函数写在最外面的jsp页面中，即iframe的容器中
 * 
 */
function globalAlert(name, msg, level) {
    $.messager.alert(name, msg, level);
}

//简单而言，登陆进来之后，就是index.jsp，然后index.jsp里有tabs，tabs里有iframe
//通过parent来调用的函数放在index.jsp中，然后iframe中在函数前加上parent.就可以调用了
//这样弹出窗就是在index.jsp页面上了，也就是实现了全局遮罩的效果。
//不知道各位有没有更好的实现方式？请赐教。