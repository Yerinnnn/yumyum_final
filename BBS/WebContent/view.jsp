<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Montserrat:900" rel="stylesheet">
<title>맛나맛나</title>

<style>
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

        .content {
            padding: 16px;
        }

        .sticky {
            position: fixed;
            top: 0;
            width: 100%;
        }

        .sticky+.content {
            padding-top: 60px;
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
        }

        .button:hover {
            background-color: #ff8d6b;
            color: rgb(77, 77, 77);
        }
        
        
</style>


</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null ) {
        	userID = (String)session.getAttribute("userID");
        }
        int bbsID=0;
        if(request.getParameter("bbsID") != null) {
        	bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        if(bbsID==0) {
        	   PrintWriter script =response.getWriter();
        	   script.println("<script>");
        	   script.println("alert('유효하지 않은 글입니다')");
        	   script.println("location.href='bbs.jsp'");
        	   script.println("</script>");
        }
        Bbs bbs = new BbsDAO().getBbs(bbsID);
    %>
    
    <!-- Navigation-->
    <div id="navbar">
        <a href="main.jsp">HOME</a>
        <a id="news" href="#chart">TOP25</a>
        <a href="#boardTitle_list">BOARD</a>
        <a href="#about">ABOUT</a>
    </div>
    
    
    
    <div class="container">
    
    
        <div class="row" style="text-align:center;margin-top:30px;">
        
           <table class="table table-striped" style="text-align: center; border: 0px soild #dddddd">
                
                <tbody>
                     <tr>
                          <td style="font-size:15px;width: 7%;height:70px;vertical-align:middle">글 제목</td>
                          <td style="font-size:15px;width: 47%;vertical-align:middle" colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
                          <td style="font-size:15px;width: 7%;vertical-align:middle;">작성자</td>
                         <td style="font-size:15px;width: 10%;vertical-align:middle; colspan="2"><%=bbs.getUserID() %></td>
                         <td style="font-size:15px;width: 9%;vertical-align:middle">작성일자</td>
                         <td style="font-size:15px;width: 20%;vertical-align:middle; colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="min-height: 200px; text-align: left;font-size:20px"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
                                                
                     </tr>
                        
                        
                </tbody>
            </table>
            <a href="bbs.jsp" class="btn btn-primary">목록</a>
              <%
                 if(userID != null && userID.equals(bbs.getUserID())) {
              %>
                      <a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
                      <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
              <%
                 }
              %>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 

</body>
</html>