<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head id="Head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>OA系统后台</title>
    <link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css" />
    <style type="text/css">
    .panel-tool div {
	display: inline-block;
	width: 16px;
	height: 16px;
	opacity: 0.6;
	filter: alpha(opacity = 60);
	margin: 0 0 0 2px;
	vertical-align: top;
	cursor:pointer;
    }
    
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.1.2.2.js"></script>
	<script type="text/javascript" src='${pageContext.request.contextPath}/js/outlook2.js'> </script>
    <script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"用户管理",
							"menus":[{"menuid":"11","menuname":"会员管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goUser.action?admin=0"},
									{"menuid":"12","menuname":"管理员管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/admin/User/goUser?admin=1"}
								]
						},{"menuid":"2","icon":"icon-sys","menuname":"商品管理",
							"menus":[{"menuid":"21","menuname":"商品分类管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goCategory.action"},
									{"menuid":"22","menuname":"商品管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goGood.action"},
									{"menuid":"23","menuname":"商品评价管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goEvaluate.action"}
							]
						},{"menuid":"3","icon":"icon-sys","menuname":"订单管理",
							"menus":[{"menuid":"31","menuname":"订单管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goOrder.action"}
						]
					},{"menuid":"4","icon":"icon-sys","menuname":"地址管理",
						"menus":[{"menuid":"41","menuname":"送货地址管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goAddress.action"}
					]
				},
				{"menuid":"4","icon":"icon-sys","menuname":"图片管理",
					"menus":[{"menuid":"41","menuname":"主界面","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goMenu.action"}
					,{"menuid":"41","menuname":"图片表","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goImg.action"},
					{"menuid":"41","menuname":"轮播图","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goImgs.action"}
				]
			}
				,{"menuid":"5","icon":"icon-sys","menuname":"扩展@@@@",
					"menus":[{"menuid":"51","menuname":"活动管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/change/goActivity.action"},
						{"menuid":"52","menuname":"@管理","icon":"icon-nav","url":"demo1.html"}
				]
			}
				]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {

            openPwd();

            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){closePwd();})

			//点击退出触发的事件
            $('#loginOut').click(function() {
            	//提示框
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
                    if (r) {
                        window.location.href = '../admin/login.do?method=loginOut';
                    }
                });
            })
        });
		
		

    </script>
 
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>

<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>


    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 ${sessionScope.user.userName} <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="${pageContext.request.contextPath}/images/blocks.gif" width="20" height="20" align="absmiddle" />OA系统的使用</span>
    </div>
    
    
    
    <div region="south" split="true" style="height: 30px; background: #D2E0F2;text-align: center;">
        <div class="footer">By 陈红军(QQ:905072634) jQuery.Easy-UI的使用</div>
    </div>
    
    
    
    <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
          <div id="nav" class="easyui-accordion" fit="true" border="false">
		         <!--  导航内容 -->
		   </div>

    </div>
    
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="默认页面" style="padding:20px;overflow:hidden; color:red; " >
				<h1 style="font-size:24px;">* 作者：陈红军 QQ：905072634</h1>
<h1 style="font-size:24px;">* BLOG: <a style="font-size:24px;color:green;" href="http://hxling.cnblogs.com">陈红军的博客</a></h1>
<h1 style="font-size:24px;">chenhj@csdn.net</h1>
			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>