<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
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
	<style type="text/css">
		.bv-form .help-block{
			position: absolute;
   			top: 30px;
		}
	</style>
  </head>
  
  <body style="background: url('image/login.jpg') no-repeat;background-size:cover;">
	<jsp:include page="${basePath}/common/include/header1.jsp"></jsp:include>
	<div class="container top-space">
		<div class="row">
			<div class="col-md-4 col-xs-10 col-md-offset-8 col-xs-offset-1 loginDiv">
				<form action="#" method="post" class="form-horizontal" id="registerForm">
					<div class="col-md-offset-4 col-md-4 col-xs-12 tc">
						<label class="loginTitle">用户注册</label>
					</div>
					<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_eamil"><span class="glyphicon glyphicon-envelope"></span></span>
					  		<input type="text" name="email" class="form-control" placeholder="请输入邮箱" describedby="s_eamil"
					  			required data-bv-notempty-message="邮箱不能为空" pattern="^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$" data-bv-regexp-message="邮箱格式不正确"/>  
					  	</div>
				  	</div>
				  	<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_eamil"><span class="glyphicon glyphicon-user"></span> </span>
					  		<input type="text" name="nickName" class="form-control" placeholder="请输入昵称" 
					  			required data-bv-notempty-message="用户名昵称不能为空"/>  
					  	</div>
				  	</div>
				  	<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_passWord"><span class="glyphicon glyphicon-lock"></span> </span>
					  		<input id="pass" type="password" name="password" class="form-control" placeholder="请输入密码" describedby="s_passWord"
					  			required data-bv-notempty-message="密码不能为空"/>  
					  	</div>
				  	</div>
				  	<div class="form-group">
						<div class="input-group col-md-10 col-md-offset-1">
					  		<span class="input-group-addon" id="s_passWord"><span class="glyphicon glyphicon-lock"></span> </span>
					  		<input id="a_pass" type="password" name="passwordAgan" class="form-control" placeholder="请再次输入密码" describedby="s_passWord"
					  			required data-bv-notempty-message="确认密码不能为空"/>  
					  	</div>
				  	</div>
				  	<div class="form-group">
					  	<div class="input-group col-md-5 col-md-offset-1 col-xs-6 vaildataDiv" style="display: inline-block;">
					  		<input name="valStr" type="text" class="form-control" placeholder="请输入验证码" style="border-radius: 4px;"/>  
					  	</div>
					  	<div class="input-group col-md-5 col-xs-6 vaildataDiv right" style="display: inline-block;">
					  		<img id="regValImg" src="validateColorSer" alt="..."  class="img-responsive vaildataIma radius" onclick="valChange()">
					  	</div>
					  	<div class="input-group col-md-10 col-md-offset-1 app-width hidden" id="msgDiv">
				  			<span id="message">验证已发送邮件，请点击验证，80秒若接收不到，请重试：80</span>
				  		</div>
				  	</div>
				  	<div class="form-group bottomSpace">
				  		
				  		<div class="input-group col-md-10 col-md-offset-1 app-width">
				  			<input id="regBtn" type="button" class="btn btn-info col-md-12 app-width" onclick="register()" value="注册">
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
		var t = 80;
		var interval;
		//注册
		function register(){
			var bv = comm.validator("registerForm");
			if(bv.isValid()){
				if($('#a_pass').val() != $('#pass').val()){
					alert("两次密码输入不一致");
					return;
				}
				ajaxMeth.genStringAjax('userRegister.data', $('#registerForm').serialize(), 'POST', function(str){
					if(str == 'SUCCESS'){
						alert('注册成功，请验证邮箱');
						$('#msgDiv').removeClass('hidden');
						$('#msgDiv').addClass('show');
						t = 80;
						interval = setInterval(timeRun, 1000);
						$('#regBtn').attr('disabled',true);
					}else{
						alert(str);
					}
					
				});
			}
			
		}
		//发送邮件倒计时定时器函数
		function timeRun(){
			console.log('aaa');
			if(t > 0 ){
				t--;
			}else{
				clearInterval(interval);
				$('#regBtn').attr('disabled',false);
				$('#msgDiv').removeClass('show');
			    $('#msgDiv').addClass('hidden');
			}
			$('#message').text("验证已发送邮件，请点击验证，80秒若接收不到，请重试："+t);
		}
		
		//重置验证码
		function valChange(){
			var i=Math.random(1000000);
			alert(i);
			$('#regValImg').attr('src', 'validateColorSer?id='+i);
		}
	</script>
  </body>
</html>
