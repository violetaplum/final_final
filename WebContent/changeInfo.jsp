<%@page import="member.MemberVO"%>
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


	%>

	<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container" >
		<!-- Brand and toggle get grouped for better mobile display -->
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

	<br>
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
		<a href="changeInfo.jsp" class="sidefont">개인정보 변경<span><img src="img/btn_lnb_expand2.jpg" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    <ul class="lastMenu">
	<li>
		<a href="changePW.jsp" class="sidefont">비밀번호 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
	</li>

	</ul>
	
	
	</div>
	


<div class="container2">
	<%
	MemberVO meminfo = new MemberVO();
	meminfo = mdao.getlist(id);
	String id2= meminfo.getId();
	String pw= meminfo.getPw();
	String gen=meminfo.getGender();
	String name= meminfo.getName();
	String nick= meminfo.getNickname();
	String age= Integer.toString(meminfo.getAge());
	String phone= meminfo.getPhone();
	String email= meminfo.getEmail();
	String btnPressMa="btn btn-primary";
	String btnPressFe="btn btn-primary";
	if(gen.equals("여"))
	{
		btnPressFe="btn btn-primary active";
	}
	else
	{
		btnPressMa="btn btn-primary active";
	}

	
	 %>
		<div class="container2">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="infoChange.do" method="post">
					<h2 style="text-align: center;"><strong>회원정보 수정<strong></h2>
					<hr class="hrclass">
					<div class="form-group">
						아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=id2 %>
						<br>		<hr>
						닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=nick %>
				<hr>
					</div>
					<div class="form-group">
						현재 비밀번호 입력 <input type="password" class="form-control" name="pw" maxlength="20" >
					</div>
					<div class="form-group">
						이름<input type="text" class="form-control" placeholder=<%=name %> name="name" maxlength="20" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="<%=btnPressMa %>">
								<input type="radio" name="gender" autocomplete="off" value="남"checked>남자
							</label>
							<label class="<%=btnPressFe %>">
								<input type="radio" name="gender" autocomplete="off" value="여">여자
							</label>
						</div>	
					</div>
					<div class="form-group">
						나이<input type="number" class="form-control" placeholder=<%=age %> name="age2" maxlength="20" >
					</div>
					<div class="form-group">
						전화번호<input type="text" class="form-control" placeholder=<%=phone %> name="phone" maxlength="20" >
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" placeholder=<%=email %> name="email" maxlength="20" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="정보수정 완료">
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
				 <p>This Homepage is powered by <span class="text-primary">2조</span> / Designed by <span class="text-primary">김민정 장희수 황상호 김시원</span></p>
			</div>
		</footer>

		<script src="js/jquery-3.4.1.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>

<%-- 
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>게시판 메인</title>

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
	ul{
	list-style:none;
}
.jumbotron {
  padding: 30px 15px;
  margin-bottom: 30px;
  color: inherit;
  background-color: white;
}
.form-control::-moz-placeholder {
  color: black;
  opacity: 1;
}
.form-control:-ms-input-placeholder {
  color: black;
}
.form-control::-webkit-input-placeholder {
  color: black;
}
</style>

</head>
<body>

	<%
	int count=0;
	PrintWriter script = response.getWriter();
	
	String id = null;
	//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}

	int pageNumber = 1;	//기본 페이지 번호 
	//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.
	
	//파라미터에 값이 넘어왔다면 페이지 넘버를 바꾼다.
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
	}
	
	%>


	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">gevolution</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
				<li><a href="rank.jsp">게임순위</a></li>
			</ul>
			
			<%
				//로그인이 되있지 않다면 로그인, 회원가입 드롭다운 메뉴를 생성
				if(id == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
				else{	//로그인이 된 경우
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="mypage.jsp">마이페이지</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			
			%>
		</div>
	</nav>

	<div class="mypage">
	<div class="sidebar">
	<h2>마이페이지</h2>	
	<hr class="hrclass">	
	<br>
	<ul class="firstMenu">
	<li>
		<a href="mypage.jsp" class="sidefont">작성글 보기<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    
	<ul class="secondMenu">
	<li>
		개인정보 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    <ul class="lastMenu">
	<li>
		<a href="changePW.jsp" class="sidefont">비밀번호 변경<span><img src="img/btn_lnb_expand.gif" class="imgg"></span></a>
	</li>

	</ul>
	
	
	</div>
	<div class="container2">
	<%
	MemberDAO mdao = new MemberDAO();
	MemberVO meminfo = new MemberVO();
	meminfo = mdao.getlist(id);
	String id2= meminfo.getId();
	String pw= meminfo.getPw();
	String gen=meminfo.getGender();
	String name= meminfo.getName();
	String nick= meminfo.getNickname();
	String age= Integer.toString(meminfo.getAge());
	String phone= meminfo.getPhone();
	String email= meminfo.getEmail();
	String btnPressMa="btn btn-primary";
	String btnPressFe="btn btn-primary";
	if(gen.equals("여"))
	{
		btnPressFe="btn btn-primary active";
	}
	else
	{
		btnPressMa="btn btn-primary active";
	}

	
	 %>
		<div class="container2">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="infoChange.do" method="post">
					<h2 style="text-align: center;"><strong>회원정보 수정<strong></h2>
					<hr class="hrclass">
					<div class="form-group">
						아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=id2 %>
						<br>		<hr>
						닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=nick %>
				<hr>
					</div>
					<div class="form-group">
						현재 비밀번호 입력 <input type="password" class="form-control" name="pw" maxlength="20" >
					</div>
					<div class="form-group">
						이름<input type="text" class="form-control" placeholder=<%=name %> name="name" maxlength="20" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="<%=btnPressMa %>">
								<input type="radio" name="gender" autocomplete="off" value="남"checked>남자
							</label>
							<label class="<%=btnPressFe %>">
								<input type="radio" name="gender" autocomplete="off" value="여">여자
							</label>
						</div>	
					</div>
					<div class="form-group">
						나이<input type="number" class="form-control" placeholder=<%=age %> name="age2" maxlength="20" >
					</div>
					<div class="form-group">
						전화번호<input type="text" class="form-control" placeholder=<%=phone %> name="phone" maxlength="20" >
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" placeholder=<%=email %> name="email" maxlength="20" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="정보수정 완료">
				</form>
			</div>
		</div>
	</div>


	


	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>

</div>
</body>
</html> --%>