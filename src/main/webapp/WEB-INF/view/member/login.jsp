<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트랩 css 사용 -->
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>


<style>
	@import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

	/* font-family: 'Abril Fatface', cursive;
	font-family: 'Open Sans', sans-serif; */
	
	* {
	  margin: 0;
	  padding: 0;
	  outline: none;
	  box-sizing: border-box;
	  line-height: 1.5em;
	  color: #747474;
	  font-family: "Open Sans", sans-serif;
	  font-size: 12px;
	}
	body {
	  height: 100vh;
	  display: flex;
	}
	.main {
	  width: 70%;
	  height: 75%;
	  margin: auto;
	  border-radius: 10px;
	  /* display: flex; */
	  /* background: rgb(249, 63, 76); */
	  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
	  transition: all 0.1s ease-in 0.1s;
	}
	/* PAGE HOME */
	.home {
	  width: 100%;
	  height: 100%;
	  border-radius: 10px;
	  color: white;
	  background: rgb(249, 63, 76);
	  display: flex; /* flex or none */
	  flex-flow: column wrap;
	  justify-content: center;
	  align-items: center;
	
	  opacity: 1;
	  transition: all 0.4s ease-in 0.2s;
	}
	.home h1 {
	  margin-bottom: 80px;
	  color: white;
	  text-align: center;
	}
	.home h1 span {
	  color: white;
	  display: block;
	  font-size: 2.5em;
	  font-family: "Abril Fatface", cursive;
	}
	.home p {
	  margin-top: 40px;
	}
	.home p a {
	  color: white;
	}
	a.link-copy {
	  text-decoration: none;
	}
	.btn {
	  background: none;
	  border: 2px solid white;
	  border-radius: 150px;
	  align-self: center;
	  width: 150px;
	  padding: 8px 16px;
	  margin: 10px;
	  color: white;
	  font-weight: bold;
	  cursor: pointer;
	  transition: all 0.1s ease-in-out 0.1s;
	}
	.btn:hover {
	  background: white;
	  color: rgb(249, 63, 76);
	}
	
	/* PAGE SING UP */
	.sign-up {
	  display: none; /*flex or none*/
	  opacity: 1;
	  width: 100%;
	  height: 100%;
	}
	.signup-left {
	  width: 50%;
	  /* padding: 20px; */
	  opacity: 0;
	  display: flex;
	  flex-flow: column wrap;
	  justify-content: space-between;
	  font-size: 14px;
	  background: rgb(249, 63, 76);
	  border-radius: 10px 0 0 10px;
	  transition: all 0.5s ease-in 0.2s;
	}
	.signup-left h1 {
	  font-size: 21px;
	  font-family: "Abril Fatface", cursive;
	  letter-spacing: 2px;
	}
	.signup-left h1,
	.signup-left div,
	.signup-left h3,
	.signup-left p {
	  color: white;
	}
	.signup-left h3 {
	  font-size: 2.2em;
	}
	
	.btn-back {
	  align-self: flex-start;
	  display: flex;
	  align-items: center;
	  font-weight: bold;
	  cursor: pointer;
	}
	.angle-left-color {
	  color: white;
	  margin-right: 5px;
	}
	.form-area {
	  position: absolute;
	  top: 20%;
	  left: 40%;
	  width: 20%;
	  height: 60%;
	  padding: 20px 0;
	  background: white;
	  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	  border-radius: 10px;
	  z-index: 2;
	
	  opacity: 0;
	  transition: opacity 0.5s ease-in 0.2s;
	}
	.organize-form {
	  width: 100%;
	  height: 100%;
	  display: flex;
	  flex-flow: column wrap;
	  justify-content: space-around;
	  align-items: center;
	}
	.organize-form h2 {
	  font-size: 1.4em;
	  font-weight: normal;
	}
	.organize-form h2::after {
	  content: "";
	  display: block;
	  width: 50%;
	  height: 2px;
	  background: rgb(249, 63, 76);
	  margin: 0 auto;
	}
	.organize-form p a {
	  color: rgb(249, 63, 76);
	  text-decoration: none;
	  font-weight: bold;
	}
	.form-area-signup {
	  /* display: none; */
	  opacity: 0;
	  transition: all 0.4s ease-in 0.2s;
	}
	.form-area-signin {
	  /* display: none; */
	  opacity: 0;
	  transition: all 0.4s ease-in 0.2s;
	}
	
	.form {
	  width: 85%;
	}
	.form-field {
	  display: flex;
	  flex-flow: column wrap;
	  width: 100%;
	}
	.form-field input {
	  border: none;
	  padding: 5px;
	  border-bottom: 1px solid rgba(116, 116, 116, 0.44);
	  height: 30px;
	  transition: border-bottom 0.1s ease-in-out 0.1s;
	}
	.form-field input:focus {
	  border-bottom: 1px solid rgb(249, 63, 76);
	}
	.form-field label {
	  position: relative;
	  top: 25px;
	  left: 5px;
	  cursor: text;
	  transition: all 0.2s ease-in-out 0.1s;
	  color: rgba(116, 116, 116, 0.44);
	  user-select: none;
	}
	.btn-sign {
	  border: none;
	  background: rgb(249, 63, 76);
	  color: white;
	  font-weight: bold;
	  width: 100%;
	  padding: 10px;
	  margin-top: 20px;
	  border-radius: 50px;
	  cursor: pointer;
	  transition: background 0.1s ease 0.1s;
	}
	.btn-sign:hover {
	  background: rgb(230, 57, 69);
	}
	.signup-right {
	  width: 50%;
	  padding: 20px;
	  background: white;
	  border-radius: 0 10px 10px 0;
	  display: flex;
	  flex-flow: column wrap;
	  justify-content: space-between;
	  align-items: flex-end;
	  background-image: url("https://i.pinimg.com/564x/cc/51/8a/cc518a8b056431fb434240676d1e77fb.jpg");
	  background-size: 70%;
	  background-repeat: no-repeat;
	  background-position: 235% 50%;
	
	  opacity: 0;
	  transition: opacity 0.5s ease-in 0.2s, background-position-x 0.5s ease-in 0.2s;
	}
	.bars-style {
	  color: rgb(249, 63, 76);
	  cursor: pointer;
	  font-size: 16px;
	}
	
	@media (max-width: 1023px) {
	  .main {
	    width: 100%;
	    height: 100%;
	  }
	  .home, .signup-left { border-radius: 0; }
	  .form-area {
	    left: 35%;
	    width: 30%;
	    height: 70%;
	  }
	}
	@media (max-width: 768px) {
	  .form-area {
	    left: 20%;
	    width: 60%;
	  }
	  .wc_message {
	/*     display: none; */
	    opacity: 0;
	    transition: opacity .1s;
	  }
	}
	
	@media (max-width: 375px) {
	  .form-area {
	    left: 10%;
	    width: 80%;
	  }
	}

</style>

<script>
	function checkNumber(event) {
		  if(event.key === '.'  // event.keyCode 코드값 . (Num Lock)
		     || event.key === '-' // event.keyCode 코드값 - (Num Lock)
		     || event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
	}

	$(document).ready(function() {
		// Elements
		const el = {
		  signUpHome: document.getElementById('sign-up'),
		  signInHome: document.getElementById('sign-in'),
		  btnHome: document.querySelector('.btn-back'),
		  pageMain: document.querySelector('.main'),
		  pageHome: document.querySelector('.home'),
		  pageSignUp: document.querySelector('.sign-up'),
		  formArea: document.querySelector('.form-area'),
		  sideSignLeft: document.querySelector('.signup-left'),
		  sideSignRight: document.querySelector('.signup-right'),
		  formSignUp: document.querySelector('.form-area-signup'),
		  formSignIn: document.querySelector('.form-area-signin'),
		  linkUp: document.querySelector('.link-up'),
		  linkIn: document.querySelector('.link-in'),
		  btnSignUp: document.querySelector('.btn-up'),
		  btnSignIn: document.querySelector('.btn-in'),
		  labels: document.getElementsByTagName('label'),
		  inputs: document.getElementsByTagName('input')
		};
		
		
		// ADD Events
		// Show the page Sign Up
		el.signUpHome.addEventListener('click', function(e) {
			showSign(e, 'signup');
		});
	
		el.linkUp.addEventListener('click', function(e) {
		  showSign(e, 'signup');
		});
		
		// Show the page sign in
		el.signInHome.addEventListener('click', function(e) {
		  showSign(e, 'signin');
		});
		el.linkIn.addEventListener('click', function(e) {
		  showSign(e, 'signin');
		});
		
		// Show the page Home
		el.btnHome.addEventListener('click', showHome);
		
		
		// Functions Events
		// function to show screen Home
		function showHome(event) {
		  
		  
		  setTimeout(function() {
		    el.sideSignLeft.style.padding = '0';
		    el.sideSignLeft.style.opacity = '0';
		    el.sideSignRight.style.opacity = '0';
		    el.sideSignRight.style.backgroundPositionX = '235%';
		
		    el.formArea.style.opacity = '0';
		    setTimeout(function() {
		      el.pageSignUp.style.opacity = '0';
		      el.pageSignUp.style.display = 'none';
		      for (input of el.inputs)  {
		        input.value = '';
		      }
		    }, 900);
		
		  }, 100);
		
		  setTimeout(function() {
		    el.pageHome.style.display = 'flex';
		  },1100);
		  
		  setTimeout(function() {
		    el.pageHome.style.opacity = '1';
		  }, 1200);
		
		}
		// function to show screen Sign up/Sign in
		function showSign(event, sign) {
		
		  if (sign === 'signup') {
		    el.formSignUp.style.display = 'flex';
		    el.formSignIn.style.opacity = '0';
		    setTimeout(function() {
		      el.formSignUp.style.opacity = '1';
		    }, 100);
		    el.formSignIn.style.display = 'none';
		
		  } else {
		    el.formSignIn.style.display = 'flex';
		    el.formSignUp.style.opacity = '0';
		    setTimeout(function() {
		      el.formSignIn.style.opacity = '1';
		    }, 100);
		    el.formSignUp.style.display = 'none';
		  }
		
		  el.pageHome.style.opacity = '0';
		  setTimeout(function() {
		    el.pageHome.style.display = 'none';
		  }, 700);
		  
		  setTimeout(function() {
		    el.pageSignUp.style.display = 'flex';
		    el.pageSignUp.style.opacity = '1';
		    
		    setTimeout(function() {
		      el.sideSignLeft.style.padding = '20px';
		      el.sideSignLeft.style.opacity = '1';
		      el.sideSignRight.style.opacity = '1';
		      el.sideSignRight.style.backgroundPositionX = '230%';
		
		      el.formArea.style.opacity = '1';
		    }, 10);
		
		  }, 900);
		}
		
		// Behavior of the inputs and labels
		for (input of el.inputs) {
		  console.log(input)
		  input.addEventListener('keydown', function() {
		    this.labels[0].style.top = '10px';
		  });
		  input.addEventListener('blur', function() {
		    if (this.value === '') {
		      this.labels[0].style.top = '25px';
		    }
		  });
		}
		
		
		
		
		
		
		if($('#idMsg').val() != '') { // 아이디 중복일 때
			alert('사용할 수 없는 아이디입니다');
			$('#idMsg').val('');
		}
		
		if($('#msg').val() != '') { // 가입 완료 후
			
			alert('가입을 환영합니다!');
			document.querySelector("#sign-in").click();
		}
		
		if($('#loginMsg').val() != '') { // 로그인 실패시
			alert('아이디와 비밀번호를 확인하세요');
			$('#loginMsg').val('');
		}
		
		$('#loginBtn').click(function() {
			if($('#id').val() == '') { // 아이디 빈칸 체크
				alert('아이디를 입력하세요');
				$('#id').focus();
				return;
			} 
			if($('#pw').val() == '') { // 비밀번호 빈칸 체크
				alert('비밀번호를 입력하세요');
				$('#pw').focus();
				return;
			}
			
			if($('#id').val() != '' && $('#pw').val() != '') {
				$('#loginForm').submit();
			}
		});
		
		
		$('#createBtn').click(function() {
			if($('#newName').val() == '') { // 비밀번호 빈칸 체크
				alert('이름을 입력하세요');
				$('#name').focus();
				return;
			}
			if($('#newId').val() == '') { // 아이디 빈칸 체크
				alert('아이디를 입력하세요');
				$('#id').focus();
				return;
			} 
			if($('#newPw').val() == '') { // 비밀번호 빈칸 체크
				alert('비밀번호를 입력하세요');
				$('#pw').focus();
				return;
			}
			if($('#newPw').val() != $('#pw2').val()) { // 비밀번호 확인
				alert('비밀번호를 확인하세요');
				$('#pw2').focus();
				return;
			}
			
			if($('#newId').val() != '' && $('#newPw').val() != '' && $('#newName').val() != '') {
				$('#addMemberForm').submit();
			}
		});

	});
</script>


</head>
<body>
	<main class="main">
	  <section class="home">
	    <h1>Welcome to the <span>Board</span></h1>
	    <button id="sign-up" class="btn">Sign Up</button>
	    <button id="sign-in" class="btn">Sign In</button>
	    <p><a class="link-copy" href="http://collectui.com/designers/dnes/sign-up" target="_blank">©Copyright 2020</a></p>
	  </section>
	
	  <section class="sign-up">
	    <article class="signup-left">
	      <h1>Board</h1>
	      <div class="wc_message">
	        <h3>Let's Kick Now!</h3>
	        <p>It's Easy and takes less then 30 seconds.</p>
	      </div>
	      <div class="btn-back">
	        <i class="fas fa-2x fa-angle-left angle-left-color"></i>
	        HOME
	      </div>
	    </article>
	
	    <article class="form-area">
	      
	      <!-- Form area Sign Up -->
	      <div class="organize-form form-area-signup">
	        <h2>SIGN UP</h2>
	        <input type = "hidden" id = "idMsg" value = "${idMsg}">
	        <form class="form" id = "addMemberForm" method = "post" action ="${pageContext.request.contextPath}/member/addMember">
	          <div class="form-field">
	            <label for="newName">Name</label>
	            <input type="text" id="newName" name = "newName" />
	          </div>
	
	          <div class="form-field">
	            <label for="newId">ID</label>
	            <input type="text" id="newId" name="newId" />
	          </div>
	
	          <div class="form-field">
	            <label for="newPw">Password</label>
	            <input type="password" id="newPw" name = "newPw" onkeypress='return checkNumber(event)' />
	          </div>
	          
	          <div class="form-field">
	            <label for="pw2">Repeat Password</label>
	            <input type="password" id="pw2" name="pw2" />
	          </div>
	
	          <button type = "button" class="btn-sign btn-up" id = "createBtn">Sign Up</button>
	        </form>
	        <p>Have an account? <a href="#" class="link-in">Sign In</a></p>
	      </div> <!-- Form area Sign Up End-->
	
	      <!-- Form area Sign In -->
	      <div class="organize-form form-area-signin">
	        <h2>SIGN IN</h2>
	        <input type = "hidden" id = "msg" value = "${msg}">
			<input type = "hidden" id = "loginMsg" value = "${loginMsg}">
	        <form class="form" id = "loginForm" method = "post" action ="${pageContext.request.contextPath}/member/login">
	          <div class="form-field">
	            <label for="id">ID</label>
	            <input type="text" name="id" id="id" />
	          </div>
	
	          <div class="form-field">
	            <label for="pw">Password</label>
	            <input type="password" name="pw" id="pw" onkeypress='return checkNumber(event)' />
	          </div>
	
	          <button type = "button" class="btn-sign btn-in" id = "loginBtn">Sign In</button>
	        </form>
	        <p>Haven't an account? <a href="#" class="link-up">Sign Up</a></p>
	      </div>
	    </article>
	
	    <article class="signup-right">
	      <div></div>
	      <p><a class="link-copy" href="http://collectui.com/designers/dnes/sign-up" target="_blank">Copyright © 2020 by Dinesh Shrestha</a></p>
	
	    </article>
	  </section>
	</main>
</body>
</html>