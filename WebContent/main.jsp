<%@page import="review.ReviewVO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="gamevo.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="favicon.ico">
		<title>GameBoard</title>
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="css/owl.carousel.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="css/animate.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		
		<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
		
	</head>

	<script type="text/javascript">

function moreinfo(){
	var input = document.getElementById("search").value;
	var f=document.FreeChart;
	f.name.value=input;
	f.action="FreeChart.jsp";
	f.method="post";
	f.submit();


	
	
	alert(input);
	/* window.location.href="FreeChart.jsp?name="+input;
	 */
	
}




</script>
<%

GameName gn=new GameName();
GameImg gi=new GameImg();
GameStar gs=new GameStar();
gi.imgarr.clear();
gs.stararr.clear();
System.out.println(gi.imgarr.size());
System.out.println(gs.stararr.size());
String src="free";
String imgsrc="free_img";
String starsrc="free_star";

gn.create(src);
gi.create(imgsrc);
gs.create(starsrc);
System.out.println(gi.imgarr.size());
System.out.println(gs.stararr.size());

String id = null; 
MemberDAO mdao = new MemberDAO();
BoardDAO bdao=new BoardDAO();
ReviewDAO rdao=new ReviewDAO();

if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
}
System.out.println(id);
ArrayList<String> al=new ArrayList<String>();
ArrayList<GameVO> gl=new ArrayList<GameVO>();
for(int i=0;i<300;i++) {
GameVO gv=new GameVO();
gl=(ArrayList)request.getAttribute("alist1");
gv=gl.get(i);
al.add(gv.getName());

	//회원 아이디
//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.

}
ArrayList<BoardVO> blist = new ArrayList<>();
ArrayList<ReviewVO> rlist = new ArrayList<>();
blist=bdao.getLatestList();
rlist=rdao.getLatestList();




%>
	<style>
	#quote-carousel 
{
  padding: 0 10px 30px 10px;
  margin-top: 30px;
}

/* Control buttons  */
#quote-carousel .carousel-control
{
  background: none;
  color: #222;
  font-size: 2.3em;
  text-shadow: none;
  margin-top: 30px;
}
/* Previous button  */
#quote-carousel .carousel-control.left 
{
  left: -12px;
}
/* Next button  */
#quote-carousel .carousel-control.right 
{
  right: -12px !important;
}
    .searchbar{
    margin-bottom: auto;
    margin-top: auto;
    height: 60px;
    background: #ffd700 !important;
    border-radius: 30px;
    padding: 10px;
    /* width:600px;
     */}

    .search_input{
    color: black;
    border: 0;
    outline: 0;
    font-size:20px;
    background: none;
    width: 0;
    height:100%;
    caret-color:transparent;
    line-height: 40px;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_input{
    padding: 0 10px;
    width: 390px;/*450px*/
    caret-color:red;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_icon{
    background: white;
    color: #e74c3c;
    }

    .search_icon{
    height: 40px;
    width: 40px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    }
    @media (min-width:320px) {
	.intro-heading {
		margin-top:15%;
		font-weight: 800;
		line-height: 95px;
		font-size: 30px;
		margin-bottom: 50px;
	}
	.intro-lead-in{
		margin-top:15%;
		font-weight: 800;
		line-height: 95px;
		font-size: 15px;
		margin-bottom: 50px;
	}
	
	#c1{
	margin-left:25%;
	}
	td{
	font-size:20px;
	}
	#tdimg{
	width:150px;
	height:110px;
	}
	#bgimg{
	width:auto;
	height:500px;
	margin-top:auto;
	}
	table{
	
	margin-top:45%;margin-left:10%;
	}
	#tdnum{
	font-size:40px;
	}
	#ih{
	font-size:30px;
	
	}
	#starrating{
	CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(images/icon_star2_16.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 80px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	
	}
	#starrating1{
	 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(images/icon_star_16.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}
	#stardiv{
	margin-top:8%; margin-left:10%;
	
	}
	#item_{
	
	width:auto; 
	height:500px;
	margin-top:auto;
	
	}
	}
	@media (min-width:720px) {
	.intro-heading {
		margin-top:8%;
		font-weight: 800;
		line-height: 95px;
		font-size: 50px;
		margin-bottom: 50px;
		
	}
	#c1{
	margin-left:28%;
	}
	td{
	font-size:25px;
	px;
	}
	#tdimg{
	width:100px;
	height:100px;
	}
	table{
	
	margin-top:-7%;left:20%;
	}
	#tdnum{
	font-size:70px;
	}
	#ih{
	font-size:50px;
	
	}
	#starrating{
	CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(images/icon_star2_16.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH:80px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}
	#starrating1{
	 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(images/icon_star_16.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}
	#stardiv{
	margin-top:8%; margin-left:8%;
	
	}
	#bgimg{
	width:auto;
	height:500px;
	margin-top:auto;
	
	}
	}
	@media (min-width:1024px) {
	.intro-heading {
		margin-top:-8%;
		letter-spacing:50px;
		font-size: 80px;
		
		font-weight: 800;
		line-height: 95px;
		font-size: 150px;
		margin-bottom: 100px;
	}
	#c1{
		margin-left:10%;
	}
	td{
		font-size:60px;
	}
	#tdimg{
	width: 200px;
	height:auto;
	}
	table{
	
	margin-top:-7%;margin-left:30%;
	}
	#tdnum{
	font-size:100px;
	}
	#ih{
	font-size:80px;
	margin-top:-3%;
	}
	#il{
	margin-top:-5%;
	
	}
	#starrating{
	CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(images/icon_star2_16.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 80px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}
		#starrating1{
	 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(images/icon_star_16.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}
	#stardiv{
	margin-top:8%; margin-left:30%;
	
	}
	#bgimg{
	margin-top:auto;
	width:auto;
	height:500px;

	
	}
	}
}

	</style>
	<style type="text/css">
        /* carousel */

section {
    padding-top: 100px;
    padding-bottom: 100px;
}

.quote {
    color: rgba(0,0,0,.1);
    text-align: center;
    margin-bottom: 30px;
}

/*-------------------------------*/
/*    Carousel Fade Transition   */
/*-------------------------------*/
#quote-carousel .carousel-control
{
  background: none;
  color: #222;
  font-size: 2.3em;
  text-shadow: none;
  margin-top: 30px;
}
/* Previous button  */
#quote-carousel .carousel-control.left 
{
  left: -12px;
}
/* Next button  */
#quote-carousel .carousel-control.right 
{
  right: -12px !important;
}
#fade-quote-carousel.carousel {
  padding-bottom: 60px;
}
#fade-quote-carousel.carousel .carousel-inner .item {
  opacity: 0;
  -webkit-transition-property: opacity;
      -ms-transition-property: opacity;
          transition-property: opacity;
}
#fade-quote-carousel.carousel .carousel-inner .active {
  opacity: 1;
  -webkit-transition-property: opacity;
      -ms-transition-property: opacity;
          transition-property: opacity;
}
#fade-quote-carousel.carousel .carousel-indicators {
  bottom: 10px;
}
#fade-quote-carousel.carousel .carousel-indicators > li {
  background-color: #e84a64;
  border: none;
}
#fade-quote-carousel blockquote {
    text-align: center;
    border: none;
    
}
#fade-quote-carousel .profile-circle {
    width: 150px;
    height: 150px;
    margin: 0 auto;
    border-radius: 100px;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<head>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	</head>
	<body>

	
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#eaeaea;">
			<div class="container" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" height="90%" width="auto" alt="Sanza theme logo"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" style="display:inline-block;">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>

						<!-- <li>
							<a class="page-scroll" href="#contact">Contact</a>
						</li> -->
						<%
						if(id !=  null){  /*로그인 O 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top"><%=mdao.getNickuseid(id)%>님</a></li>
					<li><a class="page-scroll" href="start.jsp">Home</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="getAllInfo.do?src=main">GameRank()</a></li>
					<li><a class="page-scroll" href="logoutAction.do">Log out</a></li>
					<li><a class="page-scroll" href="mypage.jsp">My Page</a></li>
					<%
						}
						else if(id ==  null){ /*로그인 X 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					<%
						}
					%></ul>
					</div></div>

				
				<!-- /.navbar-collapse -->
			
			<!-- /.container-fluid -->
		</nav>
		<form name="FreeChart">
	<div style="float:right;margin-top:8%;margin-right:-18%;">
	<div class="box">
    <div class="container h-100" >
      <div class="d-flex justify-content-center h-100">
        <div class="searchbar">
          <input class="search_input" type="text" id="search" name="search" placeholder="Search..." >
 			<input type="hidden" name="name"/>


          <a href="#" class="search_icon"><i class="fas fa-search" onclick="moreinfo()"></i></a>
        </div>
        </div>
      </div>
    </div>
    </div></form><br>					
		<!-- Header -->
		<header  id="carousel" style="height:500px;background-color:black;margin-top:11%;">

	<div class="container" id="slide_" height="500px">
		<div class="row ">
			<div class="col-md-8 col-md-offset-2">
			    <%
    Calendar t = Calendar.getInstance();

    String month = Integer.toString((t.get(Calendar.MONTH) + 1));

   String WeekDay = Integer.toString(t.get(Calendar.WEEK_OF_MONTH));

    %>
    
               
				<div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000">
				  <!-- Carousel indicators -->
                  <ol class="carousel-indicators">
				    <li data-target="#fade-quote-carousel" data-slide-to="0" class="active"></li>
				    <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
				    <li data-target="#fade-quote-carousel" data-slide-to="2"></li>
                    <li data-target="#fade-quote-carousel" data-slide-to="3"></li>
                    <li data-target="#fade-quote-carousel" data-slide-to="4"></li>
 					<li data-target="#fade-quote-carousel" data-slide-to="5"></li>	
				  </ol>


				  <!-- Carousel items -->
				  <div class="carousel-inner">
				  
				    <div class="active item">
						<img id="bgimg" src="images/FIRST.png" class="img-responsive" >
						
				    </div>
				    <div class="item"><br><br>
				    <div class="quote" ><img src="images/trophy.png"><br><h1 style="color:white;display:inline-block;"><%=month%>월 <%=WeekDay%>주차 Top 5 - </h1><h1 style="color:gold;display:inline-block;">1위</h1></div>
				 
                        <a href="FreeChart.jsp?name=<%=al.get(0)%>"><img class="profile-circle" src="<%=gi.imgarr.get(0)%>"></a><br>
                        
				    	<blockquote>
				    		<p style="font-size:25px; display:inline-block;color:white;"><strong><%=al.get(0)%></strong></p>
				    		<div style="display:inline-block; margin-left:10px;">
				    		<div id="starrating" >
				    		<p id="starrating1" style="WIDTH: <%=Double.parseDouble(gs.stararr.get(0))*20%>%;"></p>
												
							</div>&nbsp;&nbsp;<p style="display:inline-block;color:white;"><%=gs.stararr.get(0)%></p></div> 
							
				    		<p style="color:white;">지하철이나 버스에서 하기 좋은 게임! 재밌어요</p>
				    		<small style="color:white;">김민정</small>
						
				    	</blockquote>	
				    </div>
				    <div class="item" id="item_"><br><br>
                      <div class="quote" ><img src="images/top-rated.png"><h1 style="color:white;"><%=month%>월 <%=WeekDay%>주차 Top 5 - 2위</h1></div>
				 
                        <a href="FreeChart.jsp?name=<%=al.get(1)%>"><img class="profile-circle" src="<%=gi.imgarr.get(1)%>"></a><br>
				    	<blockquote>
				    		<p style="font-size:25px; display:inline-block;color:white;"><strong><%=al.get(1)%></strong></p>
				    		<div style="display:inline-block; margin-left:10px;margin-top:5px;">
				    		<div id="starrating" style="display:inline-block;">
												
							<p id="starrating1" style="WIDTH: <%=Double.parseDouble(gs.stararr.get(1))*20%>%;font-size:10px;"></p>
												
							</div>&nbsp;&nbsp;<p style="display:inline-block;color:white;"><%=gs.stararr.get(1)%></p></div> 
							
				    		<p style="color:white;">지하철이나 버스에서 하기 좋은 게임! 재밌어요</p>
				    		<small style="color:white;">김민정</small>
						
				    	</blockquote>
				    </div>
				    <div class="item"><br><br>
                    <div class="quote" ><img src="images/top-rated.png"><h1 style="color:white;"><%=month%>월 <%=WeekDay%>주차 Top 5 - 3위</h1></div>
				 
                        <a href="FreeChart.jsp?name=<%=al.get(2)%>"><img class="profile-circle" src="<%=gi.imgarr.get(2)%>"></a><br>
				    	<blockquote>
				    	<p style="font-size:25px; display:inline-block;color:white;"><strong><%=al.get(2)%></strong></p>
				    		<div style="display:inline-block; margin-left:10px;margin-top:5px;">
				    		<div id="starrating" >
												
							<p id="starrating1" style="WIDTH: <%=Double.parseDouble(gs.stararr.get(2))*20%>%;"></p>
												
							</div>&nbsp;&nbsp;<p style="color:white;display:inline-block;"><%=gs.stararr.get(2)%></p></div> 
							
				    		<p style="color:white;">지하철이나 버스에서 하기 좋은 게임! 재밌어요</p>
				    		<small style="color:white;">김민정</small>
						
				    	</blockquote>
				    </div>
                    <div class="item"><br><br>
                     <div class="quote" ><img src="images/top-rated.png"><h1 style="color:white;"><%=month%>월 <%=WeekDay%>주차 Top 5 - 4위</h1></div>
				 
                        <a href="FreeChart.jsp?name=<%=al.get(3)%>"><img class="profile-circle" src="<%=gi.imgarr.get(3)%>"></a><br>
    			    	<blockquote>
				    	<p style="font-size:25px; display:inline-block;color:white;"><strong><%=al.get(3)%></strong></p>
				    		<div style="display:inline-block; margin-left:10px;margin-top:5px;">
				    		<div id="starrating" >
												
							<p id="starrating1" style="WIDTH: <%=Double.parseDouble(gs.stararr.get(3))*20%>%;"></p>
												
							</div>&nbsp;&nbsp;<p style="display:inline-block;color:white;"><%=gs.stararr.get(3)%></p></div> 
							
				    		<p style="color:white;">지하철이나 버스에서 하기 좋은 게임! 재밌어요</p>
				    		<small style="color:white;">김민정</small>
						
				    	</blockquote></div>
                    <div class="item"><br><br>
                    <div class="quote" ><img src="images/top-rated.png"><h1 style="color:white;"><%=month%>월 <%=WeekDay%>주차 Top 5 - 5위</h1></div>
				 
                        <a href="FreeChart.jsp?name=<%=al.get(4)%>"><img class="profile-circle" src="<%=gi.imgarr.get(4)%>"></a><br>
    			    	<blockquote>
				    	<p style="font-size:25px; display:inline-block;color:white;"><strong><%=al.get(4)%></strong></p>
				    		<div style="display:inline-block; margin-left:10px;margin-top:5px;">
				    		<div id="starrating" >
												
							<p id="starrating1" style="WIDTH: <%=Double.parseDouble(gs.stararr.get(4))*20%>%;"></p>
												
							</div>&nbsp;&nbsp;<p style="display:inline-block;color:white;"><%=gs.stararr.get(4)%></p></div> 
							
				    		<p style="color:white;">지하철이나 버스에서 하기 좋은 게임! 재밌어요</p>
				    		<small style="color:white;">김민정</small>
						
				    	</blockquote>
				    </div></div>
						 <a class="left carousel-control" onclick="$('#slide_').carousel('prev')" style="height:500px;color:white;"><img src="images/left.png" style="margin-top:200px; margin-left:-500px"></a>
						<a class="right carousel-control" onclick="$('#slide_').carousel('next')" style="height:500px;color:white;"><img src="images/right.png" style="margin-top:200px; margin-right:-500px"></a>
				    </div>
				     
				  </div>
	
				</div>
			</div>							
		
	</div>

</header>



		
	<section id="category" class="light-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>Category</h2>
						<p>Those game are included in the game category of each market and is the basic service of the game.<br><strong>Click to go to the appropriate page you selected.</strong></p>
						 </div>
					</div>
				</div><br><br>
				<div class="container" id="c1" >
					<!--  module -->
					
					<div class="col-md-3 text-center" style="width:33.33333%;height:auto;">
						<div class="mz-module" style="background-color:#eaeaea;width:100%;height:auto;"><br>
							
								<i class="glyphicon glyphicon-equalizer color2 fa-5x ot-circle"></i><br>
                            <h3>순위</h3><br><br><br>
                            <!--<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>-->
                        
                        <a href="getAllInfo.do?src=main" class="mz-module-button">more..</a>
                    </div>
                </div>
					<!-- end  module -->
					<!--  module -->
					<div class="col-md-3 text-center" style="width:33.33333%;height:auto;">
						<div class="mz-module" style="background-color:#eaeaea;width:100%;height:auto;"><br>
							
                            <i class="glyphicon glyphicon-hand-right color1 fa-5x ot-circle"></i><br>   <!--fa fa-photo color2 ot-circle-->
                            <h3>리뷰</h3><br><br><br>
                            <!--<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>-->
                        
                        <a href="reviewListAction.do?src=rank" class="mz-module-button">more..</a>
                    </div>
                </div>
					<!-- end  module -->
					<!--  module -->
					<div class="col-md-3 text-center" style="width:33.33333%;height:auto;">
						<div class="mz-module" style="background-color:#eaeaea;width:100%;height:auto;"><br>
							
                            <i class="glyphicon glyphicon-list color4 fa-5x ot-circle"></i><br>
                            <h3>게시판</h3><br><br><br>
                            <!--<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis</p>-->
                        
							<a href="bbsAction.do" class="mz-module-button">read more</a>
						</div>
					</div>
					<!-- end  module -->
					<!--  module -->

					<!-- end  module -->
				
			</div>
			</div>
			<!-- /.container -->
		</section>

		<section id="features" class="section-features">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 text-center">
						<div class="section-title" style="display:inline-block">
							<h2>최근 게시글</h2>
						</div>
						
					
				
				<div class="row row-gutter">
					<div class="container">
					<table class="table table-striped table-hover" style="width:100%;height:auto; margin:auto;margin-left:auto;font-size:20px;">
					<thead ><tr style="text-align:center;">
					<th style="text-align:center;">번호</th>
					<th style="text-align:center;">제목</th>
					<th style="text-align:center;">작성자</th>
					<th style="text-align:center;">작성날짜</th>
					<th style="text-align:center;">조회수</th></tr>
					</thead>
					<tbody >
					
					<%for(int i=0; i<5;i++){ %>
					<tr >
					<td style="font-size:20px;"><%=blist.get(i).getB_id() %></td>
					<td style="font-size:20px;"><%=blist.get(i).getTitle() %></td>
					<td style="font-size:20px;"><%=blist.get(i).getNickname()  %></td>
					<td style="font-size:20px;"><%=blist.get(i).getDay() %></td>
					<td style="font-size:20px;"><%=blist.get(i).getHits() %></td>
					</tr>
					<% }%>
				
					</tbody>
					
					</table>

					</div>
				</div>
				</div>
				<div class="col-lg-6 text-center">
				<div class="section-title" style="display:inline-block">
							<h2>최근 리뷰</h2>
						</div>
				<div class="row row-gutter">
					<div class="container">
					<table class="table table-striped table-hover" style="width:100%;height:auto; margin:auto;margin-left:auto;font-size:20px;">
					<thead ><tr>
					<th style="text-align:center;">번호</th>
					<th style="text-align:center;">게임</th>
					<th style="text-align:center;">작성자</th>
					<th style="text-align:center;">작성날짜</th>
					<th style="text-align:center;">평점</th></tr>
					</thead>
					<tbody >
					<%for(int i=0; i<5;i++){ %>
					<tr >
					<td style="font-size:20px;"><%=rlist.get(i).getR_id() %></td>
					<td style="font-size:20px;"><%=rlist.get(i).getGame_name() %></td>
					<td style="font-size:20px;"><%=rlist.get(i).getNickname()  %></td>
					<td style="font-size:20px;"><%=rlist.get(i).getDay() %></td>
					<% %>
					<td style=>
					<div id="starrating" >
						<p id="starrating1" style="WIDTH: <%=rlist.get(i).getRating()*10%>%;"></p>
					</div></td>
					</tr>
					<% }%>
					
					</tbody>
					
					</table>

					</div>
				</div>
			</div></div>
			</div>
		</section>


		<section id="partners">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>신규 인기 게임</h2>
							<p>오늘의 신작</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="owl-partners owl-carousel">
						<%for(int p=0;p<15;p++){ %>
							<div class="item" >
								<div class="partner-logo"><a href="FreeChart.jsp?name=<%=gn.namearr.get(p)%>"><img src="<%=gi.imgarr.get(p) %>" alt="partners"></a></div><br>
								<div class="partner-logo" style="font-size:15px;text-align:left;"><%=gs.stararr.get(p)%>★</div>
							</div>
							<%} %>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		
				<section class="dark-bg short-section stats-bar">
			<div class="container text-center">
				<div class="row">
					<div class="col-md-3 mb-sm-30"  style="width:25%">
						<div class="counter-item">
							<h2 class="stat-number" data-n="<%=mdao.getTotal() %>"><%=mdao.getTotal() %></h2>
							<h6>Member</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30" style="width:25%">
						<div class="counter-item">
		
							<h2 class="stat-number" data-n="26">26</h2>
							<h6>Visitor</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30" style="width:25%">
						<div class="counter-item">
							<h2 class="stat-number" data-n="<%=bdao.getTotal() %>"><%=bdao.getTotal() %></h2>
							<h6>Board</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30" style="width:25%">
						<div class="counter-item">
							<h2 class="stat-number" data-n="<%=rdao.getTotal() %>"><%=rdao.getTotal() %></h2>
							<h6>Review</h6>
						</div>
					</div>
				</div>
			</div>
		</section>		
		
		<section id="team" class="light-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>Our Team</h2>
						<!-- 	<p>A creative agency based on Candy Land, ready to boost your business with some beautifull templates. MOOZ Agency is one of the best in town see more you will be amazed.</p>
						 --></div>
					</div>
				</div>
				<div class="row-0-gutter">
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter" style="width:25%;">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-1.jpg" alt="img02" class="img-responsive"/>
							<figcaption>
							<h2 style="color:white;margin-top:-15px;">김민정</h2>
								<p style="color:white;">화면 구성 및 웹 크롤링</p>
		
							 --></figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter" style="width:25%;">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-2.jpg" alt="img02" class="img-responsive" />
							<figcaption>
							<h2 style="color:white;margin-top:-15px;">장희수</h2>
								<p style="color:white;">화면 구성 및 웹 크롤링</p>
	
							 --></figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter" style="width:25%;">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-3.jpg" alt="img02" class="img-responsive" />
							<figcaption>
							<h2 style="color:white;margin-top:-15px;">황상호</h2>
								<p style="color:white;">화면 구성 및 DB 구성</p>
							<!-- 	<a href="#" data-toggle="modal" data-target="#Modal-3">View more</a>
							 --></figcaption>
							 
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-0-gutter" style="width:25%;">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-4.jpg" alt="img02" class="img-responsive" />
							<figcaption >
							<h2 style="color:white;margin-top:-15px;">박시원</h2>
								<p style="color:white;">화면 구성 및 DB 구성</p>

							 --></figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
		
				</div>
		</section>

		
		<section id="contact" class="dark-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>Mid Project</h2>
							
						</div>
					</div>
				</div>
				<div class="row" style="margin-left:10%">
					<div class="col-lg-6">
						<div class="section-text">
							<h4>KGITBANK</h4>
							<p>서울특별시 종로구 돈화문로 26, 5층(묘동, 단성사)</p>
							<p><i class="fa fa-phone"></i>1566-8497</p>
							<p><i class="fa fa-envelope"></i>FAX : 02-3672-5615</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="section-text">
							<h4>Business Hours</h4>
							<p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>3pm to 10pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>Closed</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
		<footer>
			<div class="container text-center">
				 <p>This Homepage is powered by <span class="text-primary">2조</span> / Designed by <span class="text-primary">김민정 장희수 황상호 박시원</span></p>
			</div>
		</footer>

		<!-- Modal for portfolio item 1 -->
		<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-1">김민정</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-1.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 2 -->
		<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-2">장희수</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-2.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 3 -->
		<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog" aria-labelledby="Modal-label-3">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-3">황상호</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-3.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 4 -->
		<div class="modal fade" id="Modal-4" tabindex="-1" role="dialog" aria-labelledby="Modal-label-4">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-4">박시원</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-4.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 5 -->
		<div class="modal fade" id="Modal-5" tabindex="-1" role="dialog" aria-labelledby="Modal-label-5">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-5">Fast People</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-5.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>

				</div>
			</div>
		</div>
		<script src='js/jquery-3.4.1.js' type='text/javascript'></script>
<script type="text/javascript">
var arr = [];
<%
for(int i=0;i<300;i++){%>
arr[<%=i%>]="<%=al.get(i)%>";
<%}%>

alert(arr[1]);
var uniqueNames = [];
$.each(arr, function(i, el){
        if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
});


$("#search").autocomplete({

    source: arr,

    select: function(event, ui) {

        console.log(ui.item);

    },

    focus: function(event, ui) {

        return false;

        //event.preventDefault();

    }

});



</script>
		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/cbpAnimatedHeader.js"></script>
		<script src="js/jquery.appear.js"></script>
		<script src="js/SmoothScroll.min.js"></script>
		<script src="js/theme-scripts.js"></script>
	</body>
</html>