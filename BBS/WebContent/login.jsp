<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>맛나맛나</title>

<style>
#header {
            text-align: center;
            padding: 10px;
        }




        /*전체 폼 div태그*/

        #form {
            margin-right: auto;
            margin-left: auto;
            width: 500px;
            float: center;
            background-color: #ffffff
        }


        #header img {
            margin: 20px;
        }
        
         #randomNumber {
            font-size: 37px;
            font-style: italic;
            text-align: right;
            margin: 0px 70px;
            margin-left: 110px;
            height: 30px;
        }
        
        /*로그인 버튼*/

        .button {
            width: 350px;
            height: 55px;
            border: 0px;
            margin-top:30px;
            outline: 0px;
            background: #ff7348;
            color: rgb(255, 255, 255);
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            font-family: sans-serif;
            font-weight: bold;
        }

        .button:hover {
            background-color: #ff8d6b;
            color: rgb(77, 77, 77);
        }

</style>

</head>
<body>
    
    <div class="container">
       <div class="col-lg-4"></div>
       <div class="col-lg-4">
          <div style="padding-top: 20px;">
          
          <div id="header">
            <img src="images/logo/main_logo.png" width="280px" />
        </div>
             <form method="post" action="loginAction.jsp">
                
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                 </div>
                 <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                </div>
                
                
                
                
                 <div id="randomNumberDiv"> 
                    <p style="text-align:center;">보이는대로 입력해주세요</p>
                    <span id="randomNumber"></span>
                </div>
                <span class="formBox">
                    <input type="text" class="form-control" id="randomNumberInput" size=30/>
                </span>
                <div>
                 <input type="submit" id="login_ok" class="button" value="로그인">
                 </div>
             </form>
             </div>
          </div>
       <div class="col-lg-4"></div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
<script>
            window.onload = function () {
                var getRandomNumberId = document.getElementById("randomNumber");
                var randomNumber = Math.floor(Math.random() * 1000000 + 1);
    
                getRandomNumberId.innerHTML = randomNumber;
    
    
                var getLoginButtonId = document.getElementById("login_ok");
    
                getLoginButtonId.onclick = function () {
                    LoginEvent();
                }
    
                var LoginEvent = function () {
                    var getRandomNumberInputId = document.getElementById("randomNumberInput");
                    var getUserNumberValue = getRandomNumberInputId.value; //받은 숫자 값을 변수에 넣음
                    var getLoginFormId = document.getElementById("login_ok");
    
                    if (randomNumber == getUserNumberValue) { //받은 숫자와 랜덤 넘버 비교
                        getLoginFormId.submit();
                    } else {
                        alert("입력한 숫자가 다릅니다.");
                        getLoginFormId.reset();
                    }
                }
            }
</script>

</body>
</html>