

<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="member.MemberDAO"%>


<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.io.PrintWriter"%>
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
<title>Nantes - Onepage Business Template</title>

<!-- Bootstrap core CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.default.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>


<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}

	ul {
		list-style: none;
	}
	.container {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  
}
.table{
	width:100%;
}
.mypage{
	padding-top:20%;
	padding-left:14%;
	padding-right:14%;
	margin-right: auto;
    margin-left: auto;
}
.hrclass{
	height:2px;
	background-color:gray;


}
.sidebar{
	padding-right: 40px;

	 float: left;

   width:30%;

}
 ::selection {
	text-shadow: none;
	background: #fff;
}
.sidefont{
	 style="font-size:18";
}

.container2 {
	 float: left;
  width: 70%;
  padding-top:2%;
}
.section-cta {
	padding: 40px 0;
	color: #fff;
	background-color: #fff;
}
.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
.navbar-default .navbar-toggle {
    background-color: black;
    border-color: black;
}
 .container2 {
    width: 100%;

  }
  ul, ol {
    margin-top: 0;
    margin-bottom: 0px;
}
ul {
    padding-left: 0;
    padding-top: 0px;
}
/* @media (min-width: 360px) { */
.sidebar {
    padding-right: 40px;
    float: left;
    width: 100%;
}

@media (min-width: 768px) {

  .container {
    width: 750px;
  }
  .navbar-default .navbar-toggle {
    background-color: black;
    border-color: black;
}
  .btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
  .sidebar{
   width:30%;

  }
      .container2 {
    width: 70%;

  }
   ::selection {
	text-shadow: none;
	background: #fff;
}

}
.section-cta {
	padding: 40px 0;
	color: #fff;
	background-color: #fff;
}
@media (min-width: 992px) {
	.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
  .container {
    width: 970px;
  }
  
   .sidebar{
   width:30%;

  }
      .container2 {
    width: 70%;

  }
 ::selection {
	text-shadow: none;
	background: #fff;
}

.imgg{
	padding-left:50px;
}
.imgg2{
	padding-left:65px;
}
.imgg3{
	padding-left:20px;
}
.section-cta {
	padding: 40px 0;
	color: #fff;
	background-color: #fff;
}
.mypage{
	padding-top:60%;
	padding-left:14%;
	padding-right:14%;
	margin-right: auto;
    margin-left: auto;
}

@media (min-width: 1200px) {	/*화면 넓이가 1200이상일때에만 적용(최소가 1200이므로 최소 밑으로가면 적용이 안된다는 의미)  */
  .container {
    width: 1170px;
  }
 ::selection {
	text-shadow: none;
	background: #fff;
}
 .sidebar{
   width:30%;

  }
      .container2 {
    width: 70%;

  }
}
.container-fluid {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
.row {
  margin-right: -15px;
  margin-left: -15px;
}
	.section-cta {
	padding: 40px 0;
	color: #fff;
	background-color: #fff;
}
.btn-primary {
  color: #fff;
  background-color: black;
  border-color: black;
}
.mypage{
	padding-top:8%;
	padding-left:14%;
	padding-right:14%;
	margin-right: auto;
    margin-left: auto;
}
</style>

</head>
<body>
	<%
		int count = 0;
		PrintWriter script = response.getWriter();

		MemberDAO mdao = new MemberDAO();
		BoardDAO bdao = new BoardDAO();

		String id = null;
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}

		int pageNumber = 1; //기본 페이지 번호 
		//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.

		//파라미터에 값이 넘어왔다면 페이지 넘버를 바꾼다.
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

		//페이징 처리 변수들
		int rowSize = 10; //게시물 숫자 
		int from = (pageNumber * rowSize) - (rowSize - 1); //(1*10)-(10-1)=10-9=1 //from
		int to = (pageNumber * rowSize); //(1*10) = 10 //to

		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int total = bdao.getTotal(); //총 게시물 수
		int allPage = (int) Math.ceil(total / (double) rowSize); //총 페이지수
		int block = 10; //한페이지에 보여줄  범위
		System.out.println("전체 페이지수 : " + allPage);
		System.out.println("현제 페이지 : " + pageNumber);
		int fromPage = ((pageNumber - 1) / block * block) + 1; //보여줄 페이지의 시작
		int toPage = ((pageNumber - 1) / block * block) + block; //보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		System.out.println("페이지시작 : " + fromPage + " / 페이지 끝 :" + toPage);
	%>

	<!-- Navigation -->
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#eaeaea;height:70px;">
			<div class="container" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" style="height:43px; width:auto;" alt="Sanza theme logo"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" style="display:inline-block;">
						



			<%
				//로그인이 되있지 않다면 로그인, 회원가입 드롭다운 메뉴를 생성
				if (id == null) {
			%>
				<li><a href="start.jsp">Home</a></li>
				<li><a href="bbsAction.do">Community</a></li>
				<li class="active"><a href="reviewListAction.do">Review</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>


			<%
				} else { //로그인이 된 경우
			%>
				<li>
				<a href="mypage.jsp"><%=mdao.getNickuseid(id)%>님</a>
				</li>
				<li><a href="start.jsp">Home</a></li>
				<li><a href="bbsAction.do">Community</a></li>
				<li class="active"><a href="reviewListAction.do">Review</a></li>
						<li><a href="mypage.jsp">My Page</a></li>
						<!-- active :현재 선택됨  -->
						<li><a href="logoutAction.jsp">Sign out</a></li>


			<%
				}
			%></ul>
		</div></div>
	</nav></div></nav>
	<div class="mypage">
	<div class="sidebar">
	<h2>마이페이지</h2>	
	<hr class="hrclass">	
	<br>
	<ul class="firstMenu">
	<li>
		<a href="mypage.jsp" class="sidefont">작성글 보기<span><img src="img/btn_lnb_expand.gif" class="imgg2"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    
	<ul class="secondMenu">
	<li>
		<a href="changeInfo.jsp" class="sidefont">개인정보 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    <ul class="lastMenu">
	<li>
		비밀번호 변경<span><img src="img/btn_lnb_expand2.jpg" class="imgg"></span></a>
	</li>

	</ul>
	
	
	</div>
	<div class="container2">

		<div class="container2">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="pwChangeAction.do" method="post">
					<h2 style="text-align: center;"><strong>새 비밀번호 입력<strong></h2>
					<div class="form-group">
					 <input type="text" class="form-control" placeholder="새 패스워드 입력" name="pw3" maxlength="20" >
					</div>
					<div class="form-group">
					<input type="password" class="form-control" placeholder="새 패스워드 확인"name="pw4" maxlength="20" >
					</div>
			
					<input type="submit" class="btn btn-primary form-control" value="수정하러 가기">
				</form>
			</div>
		</div>
	</div>


	


	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>

</div>
				
		
		
		<section class="section-cta">
		<div class="container">
			
		</div>
	</section>


	
<section id="contact" class="dark-bg" margin-top="20%">
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
				 <p>This Homepage is powered by <span class="text-primary">2조</span> / Designed by <span class="text-primary">김민정 장희수 황상호 김시원</span></p>
			</div>
		</footer>

		<script src="js/jquery-3.4.1.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>