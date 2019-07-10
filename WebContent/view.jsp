<%@ page import="member.MemberDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="member.MemberDAO"%>

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
<title>Nantes - Onepage Business Template</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
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
<style>
	.btn-space {
    margin-right: 5px;
}

</style>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();

		MemberDAO mdao = new MemberDAO();

		BoardVO board = new BoardVO();
		BoardDAO bdao = new BoardDAO();

		String id = null;
		int b_id = 0; //게시판 아이디
		int pageNumber = 1; //기본 페이지 번호

		if (request.getAttribute("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getAttribute("pageNumber").toString());
			System.out.println("view에서 받은 페이지 번호 = " + pageNumber);
		}else{
			System.out.println("어트리뷰트 페이지 ㅇ벗음");
		}

		
		if (request.getAttribute("board") != null) {
		
			System.out.println("보드 받앗음 ");
		
		}
		
		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			System.out.println("아이디 출력 : " + id);
		}

		if (request.getParameter("b_id") != null) {
			b_id = Integer.parseInt(request.getParameter("b_id"));
			System.out.println("보드 아이디1 : " + b_id);
			System.out.println("회원 아이디 1: " + id);
		}

		if (request.getAttribute("b_id") != null) {
			System.out.println("어트리뷰트 보드아읻 : " + b_id);
			b_id = Integer.parseInt((String)request.getAttribute("b_id"));
			System.out.println("회원 아이디 1: " + id);
		}

		//가져온 글이 없는 경우 bbs페이지로 이동
		if (b_id == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbsAction.do'");
			script.println("</script>");
		}

		if (request.getAttribute("board") == null) {
			script.println("<script>");
			script.println("alert('board를 받아오지 못했습니다.')");
			script.println("location.href='bbsAction.do'");
			script.println("</script>");
		} else {
			//blist =(ArrayList<BoardVO>)request.getAttribute("blist");	//리스트 생성
			board = (BoardVO) request.getAttribute("board");
			System.out.println("board객체 불러오기 성공");
		}

		//board = bdao.getBoard(b_id);
		//board.getBoard(b_id);

		System.out.println("보드내용: " + board.getTitle());
		GameName gn=new GameName();
		GameImg gi=new GameImg();
		GameStar gs=new GameStar();
		gn.namearr.clear();
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
	

	%>


	<header> </header>
	<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
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
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" height="80%" width="auto" alt="Sanza theme logo"></a>
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
					
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					</ul>
					</div></div></nav>
</div></nav>
	<br>
	<br>
	<br>

	<!-- view  테이블 -->

	<div align=center>
		<div class="container">
			<table class="table">
				<thead>
					<tr
						style="text-align: left; height: 60px; background-color: #fec503; font-size: 20px; border-color: #1a1a1a; border: 1px">
						<th colspan="2"
							style="text-align: center; height: 60px; background-color: #5D5D5D; font-size: 20px; width: 8%; color: white;">
							COMUNITY</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td bgcolor="#fec503" width="14%">
							<div align="CENTER">
								<strong>글 제목</strong>
							</div>
						</td>

						<td colspan="2"><%=board.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>작성자</strong>
							</div>
						</td>
						<td colspan="2"><%=board.getNickname()%></td>
					</tr>
					<tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>작성일</strong>
							</div>
						</td>
						<td colspan="2"><%=board.getDay()%></td>
					</tr>
					
					<tr>
						<td colspan="2" bgcolor="#F3E2A9">
							<div align="CENTER">
								<strong>내용</strong>
							</div>
						</td>
					</tr>
					
					<tr
					style="text-align: left; height: 200px;  font-size: 15px; border-color: #1a1a1a; border: 3px">
						
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					    .replaceAll("\n", "<br>")%></td>
					</tr>
					
					<%-- <tr>
						<td bgcolor="#fec503">
							<div align="CENTER">
								<strong>내용</strong>
							</div>
						</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></td>
					</tr> --%>
				</tbody>
			</table>
			
			<div>
				<a href="bbsAction.do?pageNumber=<%=pageNumber%>"
					class="btn btn-danger pull-left">목록</a>
				<%
					if (id != null && mdao.getNickuseid(id).equals(board.getNickname())) {
				%>
				<a href="update.jsp?b_id=<%=b_id%>"
					class="btn  btn-danger pull-right">수정</a> 
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="deleteAction.do?b_id=<%=b_id%>"
					class="btn btn-danger pull-right">삭제</a>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
<br><br><br><br><br><br>

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
							<div class="item">
								<div class="partner-logo"><a href="FreeChart.jsp?name=<%=gn.namearr.get(p)%>"><img src="<%=gi.imgarr.get(p) %>" alt="partners"></a></div><br>
								<div class="partner-logo" style="font-size:15px;text-align:left;"><%=gs.stararr.get(p)%>★</div>
							</div>
							<%} %>
							
						</div>
					</div>
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
				 <p>This Homepage is powered by <span class="text-primary">2조</span> / Designed by <span class="text-primary">김민정 장희수 황상호 김시원</span></p>
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
						<h4 class="modal-title" id="Modal-label-4">김시원</h4>
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