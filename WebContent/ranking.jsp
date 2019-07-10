<%@page import="review.ReviewDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="review.ReviewVO"%>
<%@page import="gamevo.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap 4</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<style>
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
		p { margin:20px 0px; }
		tr,th{
			text-align:center}
		img{
			width:100px;
			height:100px;
		}
	</style>

	<%
		PrintWriter script = response.getWriter();
		String id = null;//회원 아이디
		MemberDAO mdao = new MemberDAO();
		ArrayList<ReviewVO> rlist = new ArrayList<>();
//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			System.out.println("리뷰 회원 아이디 : " + id);
		}
		GameImg gi=new GameImg();
		GameStar gs=new GameStar();
		gi.imgarr.clear();
		gs.stararr.clear();
		ArrayList<String> al=new ArrayList<String>();
		ArrayList<String> al2=new ArrayList<String>();
		ArrayList<GameVO> gl=new ArrayList<GameVO>();
		al.clear();
		al2.clear();
		gl.clear();
		for(int i=0;i<150;i++) {
			GameVO gv=new GameVO();
			gl=(ArrayList)request.getAttribute("alist_g");
			gv=gl.get(i);
			al.add(gv.getName());
			/* System.out.println(al.get(i)); */
		}
		gl.clear();
		/* System.out.println("여기까지 구글!!!!!!!!!!"+al.size()); */
		for(int j=0;j<150;j++){
			GameVO gv=new GameVO();
			gl=(ArrayList)request.getAttribute("alist_a");
			gv=gl.get(j);
			al2.add(gv.getName());
			/* 	System.out.println(al2.get(j)); */
		}
		/* System.out.println("여기까지 애플!!!!!!!!!!"+al2.size()); */
	%>


</head>
<body>


<!-- Brand and toggle get grouped for better mobile display -->
<nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#eaeaea;height:108px;">
	<div class="container" >
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" style="height:43px; width:auto;display:inline-block;" alt="Sanza theme logo"></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right" style="display:inline-block;">




				<%
					//로그인이 되있지 않다면 로그인, 회원가입 드롭다운 메뉴를 생성
					if (id == null) {
				%>
				<li><a href="main.jsp">Home</a></li>
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
				<li><a href="main.jsp">Home</a></li>
				<li><a href="bbsAction.do">Community</a></li>
				<li class="active"><a href="reviewListAction.do">Review</a></li>
				<li><a href="mypage.jsp">My Page</a></li>
				<!-- active :현재 선택됨  -->
				<li><a href="logoutAction.jsp">Sign out</a></li>


				<%
					}
				%></ul>
		</div></div>
</nav>


<br><br><br>

<div class="container" style="margin-top:8%;">
	<div class="row">
		<div class="col">
			<img src="images/top-rated.png">
			<p><h1><strong>게임 전체 순위</strong></h1></p>
			<br><br>
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#google1">GOOGLE</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#apple1">APPLE</a>
				</li>
			</ul>

			<div class="contain">
				<div class="tab-content">
					<div class="active" id="google1">
					<br>
					<%
						java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy"+"년 "+"MM"+"월 "+"dd"+"일");
						String today = formatter.format(new java.util.Date()); %>
					<p><h3 style="display:inline-block">구글 플레이스토어 게임 순위 </h3>(한국)-<%=today %>기준</p>
					<table class="table">
						<thead>
						<tr style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">
							<th style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;width:8%;">순위</th>
							<th colspan="2" >무료</th>
							<th colspan="2" >유료</th>
							<th colspan="2" >최고매출</th>
						</tr>
						</thead>
						<tr align=center>
						<%
							String [] imgsrc={"free_img","charged_img","bestseller_img"};
							String [] starsrc={"free_star","charged_star","bestseller_star"};
							for(int p=0;p<3;p++){
								gi.create(imgsrc[p]);
								gs.create(starsrc[p]);
							}
							for(int i=0;i<15;i++){
						%><tr>
						<%if(i<=3){ %>
						<td style="color:red;font-size:20px;font-weight: bold; font-style: italic;text-align:center;">
								<%}else{ %>
						<td style="font-size:20px;font-weight: bold; font-style: italic; text-align:center;">
							<%}%><%=i+1%></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>"><img src="<%=gi.imgarr.get(i)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>" style="color:black;"><%=al.get(i) %></a></td>

						<td><a href="FreeChart2.jsp?name=<%=al.get(i+15)%>&img=<%=gi.imgarr.get(i+15)%>&star=<%=gs.stararr.get(i+15)%>"><img src="<%=gi.imgarr.get(i+15)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i+15)%>&img=<%=gi.imgarr.get(i+15)%>&star=<%=gs.stararr.get(i+15)%>" style="color:black;"><%=al.get(i+15) %></a></td>

						<td><a href="FreeChart2.jsp?name=<%=al.get(i+30)%>&img=<%=gi.imgarr.get(i+30)%>&star=<%=gs.stararr.get(i+30)%>"><img src="<%=gi.imgarr.get(i+30)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i+30)%>&img=<%=gi.imgarr.get(i+30)%>&star=<%=gs.stararr.get(i+30)%>" style="color:black;"><%=al.get(i+30) %></a></td>

						<%} %>
					</tr>
					</table>
				</div>
					<div class="active" id="apple1">
					<br>
					<p><h3 style="display:inline-block">앱스토어 게임 순위 </h3>(한국)-<%=today %>기준</p>
					<table class="table" >
						<thead>

						<tr style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">
							<th style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;width:8%;">순위</th>
							<th colspan="2" >무료</th>
							<th colspan="2" >유료</th>
							<th colspan="2" >최고매출</th>
						</tr>
						</thead>
						<tr align=center>
						<%
							for(int i=0;i<15;i++){
						%><tr>
						<%if(i<=3){ %>
						<td style="color:red;font-size:20px;font-weight: bold; font-style: italic;text-align:center;">
								<%}else{ %>
						<td style="font-size:20px;font-weight: bold; font-style: italic; text-align:center;">
							<%}%><%=i+1%></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>"><img src="<%=gi.imgarr.get(i)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>" style="color:black;"><%=al.get(i) %></a></td>

						<td><a href="FreeChart2.jsp?name=<%=al.get(i+15)%>&img=<%=gi.imgarr.get(i+15)%>&star=<%=gs.stararr.get(i+15)%>"><img src="<%=gi.imgarr.get(i+15)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i+15)%>&img=<%=gi.imgarr.get(i+15)%>&star=<%=gs.stararr.get(i+15)%>" style="color:black;"><%=al.get(i+15) %></a></td>

						<td><a href="FreeChart2.jsp?name=<%=al.get(i+30)%>&img=<%=gi.imgarr.get(i+30)%>&star=<%=gs.stararr.get(i+30)%>"><img src="<%=gi.imgarr.get(i+30)%>"></a></td>
						<td><a href="FreeChart2.jsp?name=<%=al.get(i+30)%>&img=<%=gi.imgarr.get(i+30)%>&star=<%=gs.stararr.get(i+30)%>" style="color:black;"><%=al.get(i+30) %></a></td>

						<%} %>
					</tr>

					</table>




				</div>
				</div>
			</div>
		</div>
	</div>
</div>


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