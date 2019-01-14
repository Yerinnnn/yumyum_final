<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
/*Navigation*/

        #navbar {
            overflow: hidden;
            background-color: rgb(216, 83, 6);
            font-family: 'Montserrat', sans-serif;
            position: sticky;
            width: 100%;
            z-index: 1;
        }

        #navbar a {
            float: left;
            display: block;
            color: #ffffff;
            text-align: center;
            padding: 35px 50px;
            text-decoration: none;
            font-size: 17px;
            transition-property: background-color, color;
            transition-duration: 0.5s;
        }

        #navbar a:hover {
            color: rgba(0, 0, 0, 0.7);
        }

        #navbar a.active {
            background-color: rgb(231, 231, 231);
            color: rgb(0, 0, 0);
        }

        #navbar a.active:hover {
            background-color: rgb(231, 231, 231);
            color: rgb(216, 83, 6);
        }

        .content {
            padding: 16px;
        }


        .sticky+.content {
            padding-top: 60px;
        }
        
        #board_write_title {
            font-family: 'Gugi', cursive;
            background-color: rgba(255, 255, 255, 0);
            text-align: center;
            margin-top: 50px;
            margin-bottom: 30px;
        }
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
            float: right;
        }

        .button:hover {
            background-color: #ff8d6b;
            color: rgb(77, 77, 77);
        }

</style>


<title>맛나맛나</title>
</head>
<body>
    <%

int pageNumber = 1;

if (request.getParameter("pageNumber") != null){

	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

}

String userID = null;
               if(userID == null) {
           %>
                      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
           <a href="#" class="dropdown-toggle" 
            data-toggle="dropdown" role="button" aria-haspopup="true" 
            aria-expanded="false">접속하기 <span class="caret"></span></a>
        <ul class="dropdown-menu">
              <li><a href="login.jsp">로그인</a></li>
              <li><a href="join.jsp">회원가입</a></li>
            </ul>    
         </li>
       </ul>
           <%
               } else {
           %>	   
                          <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
           <a href="#" class="dropdown-toggle" 
            data-toggle="dropdown" role="button" aria-haspopup="true" 
            aria-expanded="false">회원관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
              <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>    
         </li>
       </ul>
           <%
               }
           %>

<!-- header -->
    <%
        
        if (session.getAttribute("userID") != null ) {
        	userID = (String)session.getAttribute("userID");
        }
    %>
        <!-- Navigation-->
    <div id="navbar">
        <a href="main.jsp">HOME</a>
        <a id="news" href="#chart">TOP15</a>
        <a href="#boardTitle_list">BOARD</a>
        <a href="#about">ABOUT</a>
    </div>
           
       </div>
    </nay>
    <div class="container">
        <div class="row">
        <div colspan="2" id="board_write_title" ><img src="images/logo/write.png" width="300px"></div>
          <form method="post" action="writeAction.jsp">
           <table = class="table " style="text-align: center; border: 0px soild #dddddd">
                
                <tbody>
                     <tr>
                          <td><input type="text" class="form-control" placehoder="글 제목" name="bbsTitle" maxlength="50"></td>
                     </tr>
                     <tr>
                          <td><textarea class="form-control" placehoder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px";></textarea></td>
                     </tr>

                </tbody>
            </table>
           <div style="width:100%"><input type="submit" class="button" value="글쓰기"></div>
          </form>
        </div>
    </div>
    <!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
-->

</body>
</html>