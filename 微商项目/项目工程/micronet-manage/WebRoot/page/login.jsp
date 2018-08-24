<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="login page">
	<jsp:include page="${basePath}/common/include/include.jsp"></jsp:include>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body style="background: url('image/login.jpg') no-repeat;background-size:cover;">
	<jsp:include page="${basePath}/common/include/header1.jsp"></jsp:include>
	<div class="container log-top-space" >
		<div class="row">
			<div class="col-md-4 col-xs-10 col-md-offset-8 col-xs-offset-1 loginDiv">
				<form action="#" method="post" class="form-horizontal" id="loginForm">
					<div class="col-md-offset-3 col-md-6 col-xs-12 tc">
						<label class="loginTitle">用户登录</label>
					</div>
					<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_eamil"><span class="glyphicon glyphicon-envelope"></span> </span>
					  		<input id="email" type="text" class="form-control" placeholder="请输入手机号" describedby="s_eamil"
					  			required data-bv-notempty-message="手机号不能为空"/>  
					  	</div>
				  	</div>
				  	<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_passWord"><span class="glyphicon glyphicon-lock"></span> </span>
					  		<input id="password" type="password" class="form-control" placeholder="请输入密码" describedby="s_passWord"/>  
					  	</div>
				  	</div>
				  	<div class="form-group mb0">
					  	<div class="input-group col-md-5 col-md-offset-1 col-xs-6 vaildataDiv" style="display: inline-block;">
					  		<input id="valStr" type="text" class="form-control" placeholder="请输入验证码" style="border-radius: 4px;"/>  
					  	</div>
					  	<div class="input-group col-md-5 col-xs-6 vaildataDiv right" style="display: inline-block;">
					  		<img id="validateImg" src="validateColorSer" alt="..."  class="img-responsive vaildataIma radius" onclick="valChange()">
					  	</div>
				  	</div>
				  	<div class="form-group">
				  		<div class="col-md-10 col-md-offset-1" style="padding: 0px;">
				  			<a href="javaScript:void(0)" onclick="retrievePassword()"><span style="float:left;color: blue;">忘记密码</span></a>
							<a href="register.html"><span style="float:right;color: blue;">注册</span></a>
				  		</div>
						
					</div>
				  	<div class="form-group">
				  		<div class="input-group col-md-10 col-md-offset-1 app-width">
				  			<button type="button" class="btn btn-info col-md-12 app-width" onclick="login()">登录</button>
				  		</div>
					</div>
					<div class="col-md-4 col-md-offset-4 col-xs-6 col-xs-offset-3 bottomSpace">
						<div style="text-align: center;">
							<img alt="" src="image/weixin.png" style="cursor:pointer;">&emsp;
							<img alt="" src="image/QQ.png" style="cursor:pointer;">
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	<jsp:include page="${basePath}/common/include/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$('.vaildataIma').height($('.vaildataDiv').height());
			if($(document).width() < 400){
				$('.footer').css('margin-top','20%');
			}else{
				$('.footer').addClass('bottom');
			}
		});
		//重置验证码
		function valChange(){
			var i=Math.random(1000000);
			$('#validateImg').attr('src', 'validateColorSer?id='+i);
		}
		//登录
		function login(){
			var email = $('#email').val();
			var password = $('#password').val();
			var valStr = $('#valStr').val();
			var data = {'email':email,'password':password,'valStr':valStr};
			ajaxMeth.genStringAjax('login.data', data, 'POST', function(str){
				if(str == 'ERROR'){
					str = '请检查账号密码是否正确';
				}
				if(str == 'SUCCESS'){
					window.location.href="index.html";
				}else{
					valChange();
				}
				alert(str);
			});
		}
		//找回密码
		function retrievePassword(){
			 dialog.generic("找回密码", 'retrievePassword.data', function() {
			 	 var bv = comm.validator("retrievePwForm");
	   	   	   	 if(bv.isValid()){
	   	   	   	 	ajaxMeth.genStringAjax('sendRpwEmail.data', $('#retrievePwForm').serialize(), 'POST', function(str){
	   	   	   	 		alert(str);
	   	   	   	 		dialog.genClose();
	   	   	   	 	});
	   	   	   	 }
	   	   	   	 return false;
			 });
		}
	</script>
  </body>
</html>
