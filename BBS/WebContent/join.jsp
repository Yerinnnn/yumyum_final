<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


        /*회원가입 링크*/

        #signPage_div {
            text-align: right;
        }

        #signPage:hover {
            color: rgb(130, 130, 130);
        }

        #signPage {
            color: rgb(40, 40, 40);
            text-decoration: none;
            font-size: 14px;
        }


        /*입력칸*/

        .inputBox {
            padding: 10px 20px;
            margin: 3px 50px;
            float: right;
            width: 350px;
            height: 50px;
            text-align: left;
            font-family: sans-serif;
            font-weight: bold;
            background: #fff;
            color: #888;
        }
        
        #inputPass {
            margin-bottom: 40px;
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



        /*div클래스*/

        .formDiv {
            padding: 3px;
            width: 300px;
            margin: 0px 0px;
        }

        .formDiv p {
            /*보이는대로 입력해주세요*/
            font-size: 13px;
            margin: 0px 50px;
            margin-right: 0px;
            float: right;
        }


        /*span클래스*/

        .formBox {
            float: left;
        }

       
</style>


</head>
<body>
    
    <div class="container">
    <div class="col-lg-4"></div>
       <div class="col-lg-4">
       
             <form method="post" action="joinAction.jsp">
             <div id="header">
            <img src="images/logo/main_logo.png" width="280px" />
        </div>
                
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                 </div>
                 <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
                </div>
               <div class="form-group" style="text-align: center;">
                  <div class="btn-group" data-toggle="buttons">
                       <label class="btn btn-primary active">
                          <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
                       </label>
                       <label class="btn btn-primary">
                          <input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
                       </label>
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
                </div>
                 <input type="submit" class="button" value="회원가입">
             </form>
             </div>
          </div>
       <div class="col-lg-4"></div>
       </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> 
    
</body>
</html>