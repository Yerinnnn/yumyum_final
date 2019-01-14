<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %> 

<%@ page import="bbs.BbsDAO" %> 

<%@ page import="bbs.Bbs" %>

<%@ page import="java.util.ArrayList" %>     
<link rel="stylesheet" href="css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Montserrat:900" rel="stylesheet">
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name = "viewport" content="width=device－width", initial-scale="1">



<title>맛나맛나</title>

<style type="text/css">

	a, a:hover {

		color: #000000;

		text-decoration: none;

	}
	
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

</style>

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
        <a id="news" href="main.jsp">TOP25</a>
        <a href="#boardTitle_list">BOARD</a>
        <a href="main.jsp">ABOUT</a>
    </div>
           
       </div>
    </nay>

	<div class ="container">

		<div class="row">

			<table class = "table table-striped" style="text-align: center; border: 1px solid #dddddd">

				<thead>

					<tr>

						<th style="background-color:#eeeeee; text-align: center;">번호</th>

						<th style="background-color:#eeeeee; text-align: center;">제목</th>

						<th style="background-color:#eeeeee; text-align: center;">작성자</th>

						<th style="background-color:#eeeeee; text-align: center;">작성일</th>

					</tr>

				</thead>

				<tbody>

					<%

						BbsDAO bbsDAO = new BbsDAO();

						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

						for(int i = 0; i < list.size(); i++) {

					%>

					<tr>

						<td><%= list.get(i).getBbsID() %></td>

						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>

						<td><%= list.get(i).getUserID() %></td>

						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>

					</tr>

					<%

						}

					%>

				</tbody>

			</table>

			<%

				if(pageNumber != 1) {

			%>	

				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>

			<% 	

				} if(bbsDAO.nextPage(pageNumber + 1)) {

			%>

				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>	

			<% 	

				}

			%>

			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>

		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script src="js/bootstrap.js"></script>

</body>

</html>