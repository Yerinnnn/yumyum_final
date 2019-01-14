<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %> 

<%@ page import="bbs.Bbs" %>

<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="veiwport" content="width=device-width" , initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Montserrat:900" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:900" rel="stylesheet">

<style>
body {
            margin: 0;
            font-size: 28px;
        }

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

  /*slider*/

        .mySlides {
            display: none;
            z-index: 2;
            height: 500px;
        }

        .slider {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            width: 80%;
        }

        .slider:hover .w3-display-hover {
            display: block
        }

        .slider:hover span.w3-display-hover {
            display: inline-block
        }

        .sliderButton {
            text-align: center !important;
            padding: 0.01em 16px;
            margin-top: 16px !important;
            margin-bottom: 16px !important;
            font-size: 18px !important;
            color: #fff !important;
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translate(-50%, 0%);
            -ms-transform: translate(-50%, 0%);
        }

        .leftButton {
            float: left !important;
            margin-left: 20px;
            cursor: pointer;
            transition-duration: 0.7s;
        }

        .rightButton {
            float: right !important;
            margin-right: 20px;
            cursor: pointer;
            transition-duration: 0.7s;
        }

        .leftButton:hover {
            color: #b4aa50 !important
        }

        .rightButton:hover {
            color: #b4aa50 !important
        }

        .circleButton {
            background-color: rgb(255, 255, 255);
            color: #fff;
            display: inline-block;
            width: 10px;
            padding-left: 8px;
            padding-right: 8px;
            text-align: center;
            border-radius: 50%;
            border: 1px solid #ccc !important;
            background-color: transparent !important;
            height: 13px;
            width: 13px;
            padding: 0;
            cursor: pointer;
        }

        .circleButton:hover {
            background-color: #fff !important;
            cursor: pointer
        }

        .circleButtonWhite {
            color: #000 !important;
            background-color: #fff !important
        }



        /*접기기능*/
        #top25-logo {
            text-align: center;
        }

        #clock {
            text-align: center;
            margin-bottom: 90px;
            font-size: 23px;
        }

        #chart {
            padding-top:50px;
            padding-bottom: 50px;
            background-color: rgb(255, 255, 255);
            
            padding-bottom: 150px
        }

        .chart_button {
            background-color: rgb(255, 255, 255);
            color: rgb(190, 190, 190);
            cursor: pointer;
            padding: 20px;
            width: 90%;
            border: none;
            display: table;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
            outline: none;
            font-size: 17px;
            font-weight: bold;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition-property: background-color, color;
            transition-duration: 0.6s;
        }

        .chart_button:hover {
            background-color: rgb(255, 255, 255);
            color: black
        }

        .restaurantName {
            font-size: 23px;
            font-weight: bold;
            margin-left: 20px;
            margin-right: 20px;
            cursor: pointer;
            color: black
        }

        .category {
            font-size: 18px;
            font-weight: lighter;
            margin-right: 7px;
            cursor: pointer;
        }

        .restaurantAddress {
            font-size: 18px;
            font-weight: lighter;
            margin-top: 5px;
            margin-bottom: 5px;
            cursor: pointer;
            float: right;
        }

        .chart_content {
            padding: 20px;
            width: 85%;
            border: none;
            display: none;
            margin-left: auto;
            margin-right: auto;
            overflow: hidden;
            background-color: #f1f1f1;
        }


        #title {
            display: block;
            font-size: 3.5em;
            margin-top: 0.4em;
            margin-bottom: 0.4em;
            margin-left: 0;
            margin-right: 0;
            font-weight: bold;
        }



        /*board title list*/
        #board-logo {
            text-align: center;
        }

        #boardTitle_list {
            padding-top:50px;
            padding-bottom: 50px;
            background-color: rgb(255, 168, 87);
        }

        .board_title {
            background-color: rgb(255, 168, 87);
            color: rgb(0, 0, 0);
            cursor: pointer;
            padding: 20px;
            width: 90%;
            border: none;
            display: table;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
            outline: none;
            font-size: 17px;
            font-weight: bold;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition-property: background-color, color;
            transition-duration: 0.6s;
        }

        .board_button:hover {
            background-color: rgb(255, 255, 255);
            color: black
        }

        .No {
            font-size: 18px;
            font-weight: bold;
            margin-left: 20px;
            margin-right: 20px;
            cursor: pointer;
            color: black
        }

        .mainBoardTitle {
            font-size: 18px;
            font-weight: lighter;
            margin-right: 7px;
            cursor: pointer;
        }

        .mainBoardWriterName {
            font-size: 18px;
            font-weight: lighter;
            margin-top: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }

        .mainBoardWriteDate {
            font-size: 18px;
            font-weight: lighter;
            margin-top: 5px;
            margin-bottom: 5px;
            cursor: pointer;
            float: right;
        }


        /*about*/
        #about {
            width: 100%;
            height: 
        }



        /*footer*/

        #footer {
            width: 100%;
            height: 350px;
            padding: 70px;
            display: table;
            margin-left: auto;
            margin-right: auto;
            background-color: rgb(255, 123, 0);
        }

        .sns-icon {
            display: inline;
        }

        .sns-icon:hover {
            cursor: pointer;

        }



</style>





<title>맛나맛나</title>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null ) {
        	userID = (String)session.getAttribute("userID");
        }
    %>
<%

int pageNumber = 1;

if (request.getParameter("pageNumber") != null){

	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

}


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
    <div id="header" style="text-align:center;margin-top:50px">
        <img src="images/logo/main_logo.png" width="700px">
    </div>
    <%
        
        if (session.getAttribute("userID") != null ) {
        	userID = (String)session.getAttribute("userID");
        }
    %>
        <!-- Navigation-->
    <div id="navbar">
        <a href="main.jsp">HOME</a>
        <a id="news" href="#chart">TOP25</a>
        <a href="#boardTitle_list">BOARD</a>
        <a href="#about">ABOUT</a>
    </div>
           
           
    <!--slider-->
    <div class="slider">
        <img class="mySlides" src="images/banner_food/dd.jpg" style="width:100%">
        <img class="mySlides" src="images/banner_food/tt.jpg" style="width:100%">
        <img class="mySlides" src="images/banner_food/ww.jpg" style="width:100%">
        <img class="mySlides" src="images/banner_food/rr.jpg" style="width:100%">
        <img class="mySlides" src="images/banner_food/.jpg" style="width:100%">
        <div class="sliderButton" style="width:100%;height:50%">
            <div class="leftButton" onclick="plusDivs(-1)">&#10094;</div>
            <div class="rightButton" onclick="plusDivs(1)">&#10095;</div>
        </div>
        <div class="sliderButton" style="width:100%">
            <span class="circleButton" onclick="currentDiv(1)"></span>
            <span class="circleButton" onclick="currentDiv(2)"></span>
            <span class="circleButton" onclick="currentDiv(3)"></span>
            <span class="circleButton" onclick="currentDiv(4)"></span>
            <span class="circleButton" onclick="currentDiv(5)"></span>
        </div>
    </div>
    
    <div style="text-align:center">
    <span id="weather" >
        <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            WIDTH="0" HEIGHT="0" id="naver" ALIGN="">
            <PARAM NAME=movie VALUE="http://weather.naver.com/newsnaver.swf?Data_File=http://weather.naver.com/newsnaver_data.txt">
            <PARAM NAME=quality VALUE=high>
            <PARAM NAME=bgcolor VALUE=#FFFFFF>
            <EMBED src="http://weather.naver.com/newsnaver.swf?Data_File=http://weather.naver.com/newsnaver_data.txt" quality="high"
                bgcolor="#FFFFFF" WIDTH="0" HEIGHT="0" NAME="naver" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
        </OBJECT>



        <EMBED pluginspage=http://www.macromedia.com/shockwave/download/ src=http://img.news.naver.com/image/weather/naver_w.swf
            width=250 height=300 type=application/x-shockwave-flash>
    </span>
    </div>
    
    
    <div id="chart">
        <div id="top25-logo">
            <img src="images/logo/top25.png" style="width:550px" />
        </div>
        <div id="clock"></div>
    
    
    
      <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/1.png" width="25px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">해드림 반찬 한식 부페</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">강남구 역삼동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/2.png" width="25px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">라이스스토리 세종로점</span>
                    <span class="category">기타/세계</span>
                    <span class="restaurantAddress">종로구 수송동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>



        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/3.png" width="25px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">모노치즈 분당정자점</span>
                    <span class="category">카페/주점</span>
                    <span class="restaurantAddress">성남시 분당구 정자동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>

        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/4.png" width="25px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">별양집</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">강남구 역삼동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>

        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/5.png" width="25px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">바심</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">종로구 세종로</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>

        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/6.png" width="30px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">신촌양푼이갈비</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">부산 부산진구 부전동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>

        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/7.png" width="30px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">인사동하나로회관</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">종로구 인사동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>

        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/8.png" width="30px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">라플랑끄(La Planque)</span>
                    <span class="category">양식</span>
                    <span class="restaurantAddress">용산구 이태원동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/9.png" width="30px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">오르막가든</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">제주 서귀포시 대포동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/10.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">숙자네 간장게장</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">부천시 원미구 상동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/11.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">엉클부대찌개 천안쌍용점</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">천안시 서북구 쌍용1동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/12.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">물고기자리 안성점</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">경기 안성시 금광면</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/13.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">청송양곱창</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">부산 수영구 광안동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/14.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">야끼니꾸명동</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">중구 을지로2가</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/15.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">강화나루한방민물장어</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">경기 광명시 하안동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px;width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>

        </div>
        
                <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/16.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">블랙 머그 도곡점</span>
                    <span class="category">카페/주점</span>
                    <span class="restaurantAddress">강남구 도곡동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/17.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">삼희불낙본점</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">용산구 이태원 1동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/18.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">라면점빵</span>
                    <span class="category">분식</span>
                    <span class="restaurantAddress">충남 서천군 서천읍</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/19.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">몬스터 쌀롱</span>
                    <span class="category">카페/주점</span>
                    <span class="restaurantAddress">경기 화성시 반월동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/20.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">오리정 순두부</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">광주 서구 치평동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/21.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">뉴옥 바닷가재 청담동</span>
                    <span class="category">양식</span>
                    <span class="restaurantAddress">강남구 청담동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/22.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">싱카이 여의도점</span>
                    <span class="category">중식</span>
                    <span class="restaurantAddress">영등포구 여의도동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/23.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">아이언</span>
                    <span class="category">카페/주점</span>
                    <span class="restaurantAddress">강남구 논현동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/24.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">타이티 카페</span>
                    <span class="category">카페/주점</span>
                    <span class="restaurantAddress">강남구 역삼동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        <button class="chart_button">
            <div>
                <span>
                    <img src="images/logo/25.png" width="40px" margin-right="5px" />
                </span>
                <span>
                    <span class="restaurantName">형제네 고기 마을</span>
                    <span class="category">한식</span>
                    <span class="restaurantAddress">종로구 내수동</span>

                </span>
            </div>
        </button>
        <div class="chart_content">
                <hr style="border-top: 1px solid #ddd;">
                <br>
                  <h5>댓글<font color = "deepskyblue"></font></h5>
                  <form action="replyAction.jsp" method="post" name="reply_form">
                    <input type="hidden" name="replyGroup" value="0">
                    <input type="hidden" name="replyStep" value="0">
                    <input type="hidden" name="replyIndent" value="0">
                    <textarea class="from-control" name="replyContent" placeholder="댓글을 입력해주세요" style="resize:none, height:100px; maxlength:50px; width:80%"></textarea>
                    <button type="button" class="btn btn-primary pull-right" onclick="reply_check(this.form)">등록</button>
                  </form>
        </div>
        
        
        
        </div>

        <div id="boardTitle_list">
            <div id="board-logo">
                <img src="images/logo/board.png" style="width:650px" />
            </div>
    
            
            

		<div class="row" style=";text-align: center;">

			<table class = "table table-striped" style="text-align: center; border: 1px solid #ddddd;width:85%;margin-left: auto;margin-right: auto">

				<thead>

					<tr>

						<th style="background-color:#ffffff; text-align: center;">번호</th>

						<th style="background-color:#ffffff; text-align: center;">제목</th>

						<th style="background-color:#ffffff; text-align: center;">작성자</th>

						<th style="background-color:#ffffff; text-align: center;">작성일</th>

					</tr>

				</thead>

				<tbody>

					<%

						BbsDAO bbsDAO = new BbsDAO();

						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

						for(int i = 0; i < list.size(); i++) {

					%>

					<tr>

						<td style="background-color:#ffffff; text-align: center;"><%= list.get(i).getBbsID() %></td>

						<td style="background-color:#ffffff; text-align: center;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>

						<td style="background-color:#ffffff; text-align: center;"><%= list.get(i).getUserID() %></td>

						<td style="background-color:#ffffff; text-align: center;"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>

					</tr>

					<%

						}

					%>

				</tbody>

			</table>
			</div>
			<div style="width:90%">
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			<a href="bbs.jsp" class="btn btn-primary pull-right">목록</a>
			</div>
		
</div>
    
<div id="about" style="width:100%;height:700px;background-color:white;text-align:center">
          <div id="top25-logo">
                <img src="images/logo/about.png" style="width:650px;margin-top:40px;">
            </div>
            <div">
            <h1>안녕하세요.</h1>
            <p>맛나맛나 홈페이지에 방문하신 것을 환영합니다.</p>
            <p>저희 맛나맛나 홈페이지는 음식을 사랑하는 마음으로 만들게 된 페이지입니다.</p>
    <p>음식을 사랑하고, 맛집 탐방을 즐겨하시는 분들!</p>
     <p>언제나 저희  홈페이지에서 도움을 드리겠습니다.</p>
   <p>즐거운 하루 보내세요.</p>
  <p>감사합니다 !</p>
                </div>
        </div>





    <div id="footer">
        <div id="location" style="width:50%;float:left">
            <h4 style="font-family: 'Montserrat', sans-serif;font-size:30px; text-align:center">LOCATION</h4>
            <p  style="font-family: 'Montserrat', sans-serif;font-size:24px; text-align:center">3825, Seodong-daero, Pyeongtaek-si, Gyeonggi-do, Republic of Korea</p>
        </div>
        <div id="sns-link" style="width:50%;float:right;border: 0px solid">
            <h4 style="font-family: 'Montserrat', sans-serif;font-size:30px; text-align:center">AROUND THE WEB</h4>
            <ul style="list-style-type: none;text-align:center;margin-right:6%">
                <li class="sns-icon">
                    <a href='https://www.facebook.com/'><img src="images/footer/facebook.png" width="60px" /></a>
                </li>
                <li class="sns-icon">
                    <a href='https://www.instagram.com/'><img src="images/footer/instagram.png" width="60px" /></a>
                </li>
                <li class="sns-icon">
                    <a href='https://www.google.com/'><img src="images/footer/google.png" width="60px" /></a>
                </li>
                <li class="sns-icon">
                    <a href='https://www.twitter.com/'><img src="images/footer/twitter.png" width="60px" /></a>
                </li>
                <li class="sns-icon">
                    <a href='https://www.tumblr.com/'><img src="images/footer/tumblr.png" width="60px" /></a>
                </li>
            </ul>
        </div>

    </div>
    
    
    
    
    
    
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 


<!--Navigation-->
    <script>
        window.onscroll = function () {
            myFunction()
        };

        var navbar = document.getElementById("navbar");
        var header = document.getElementById("header");
        var sticky = header.offsetTop + header.offsetHeight; //sticky=header의 상단부터 픽셀 수


        //닿으면 sticky
        function myFunction() {
            if (window.pageYOffset >= sticky) { //pageYOFFset=상단으로부터 스크롤 된 픽셀 수
                navbar.classList.add("sticky")
            } else {
                navbar.classList.remove("sticky");
            }
        }
    </script>
    
     <!--slider-->
    <script>
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function currentDiv(n) {
            showDivs(slideIndex = n);

        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("circleButton");
            if (n > x.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = x.length
            }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" circleButtonWhite", "");
            }
            x[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " circleButtonWhite";
        }
    </script>



<!--현재시간-->
<script type="text/javascript">
    function printTime(){
        var clock = document.getElementById("clock");  //id값인 <span>태그를 변수clock에 저장
        var now = new Date(); //객체 생성
        clock.innerHTML =     //태그내부에 태그 설정
         now.getFullYear() + "/"+
         (now.getMonth()+1) + "/"+
         now.getDate()+" "+
         now.getHours()+":"+
         now.getMinutes()+":"+
         now.getSeconds();
        setTimeout("printTime()", 1000);  //1초마다 printTime()함수 호출
       }
       window.onload = function(){ //html 로딩시 콜백함수 호출
        printTime();
       }
    </script>



    <!--접기기능-->
    <script>
        var coll = document.getElementsByClassName("chart_button");
        var a;

        for (a = 0; a < coll.length; a++) {
            coll[a].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script>

    <script>
        $(window).scroll(function () { // 스크롤 이벤트가 발생할 때마다 인식
            if ($(window).scrollTop() == $(document).height() - $(window).height()) { // 스크롤이 끝에 닿는걸 인식
                console.log("스크롤 인식");
                page++;
                if (statueFilter == false) { // 필터가 안된 상태이면 내 관심사에 따라서 타임라인에 뿌려줌
                    console.log("statueFilter false");
                    listAll(page, keywords);
                } else if (statueFilter == true) { // 필터가 적용되면 필터를 계산한 값을 뿌려줌
                    listFilter(page, allData);
                }
                var height = $(document).scrollTop();
                $('html, body').animate({
                    scrollTop: height + 400
                }, 600);
            }
        });
    </script>

    

</body>
</html>