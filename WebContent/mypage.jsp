
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
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

	%>

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
					<li><a class="page-scroll" href="#start.jsp">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="logoutAction.do">Log out</a></li>
					<li><a class="page-scroll" href="mypage.jsp">My Page</a></li>
					<%
						}
						else if(id ==  null){ /*로그인 X 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					<%
						}
					%></ul>
					</div></div>

				
				<!-- /.navbar-collapse -->
			
			<!-- /.container-fluid -->
		</nav>

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
	
	
		<div class="container" ">

			<div class="myarticle">
				<div class="articleTotal" id="table" >
					<%
						String nickname = mdao.getNickuseid(id);
						ArrayList<BoardVO> blist = bdao.getBoardList(nickname);
						count = blist.size();
					%>
					* 전체 글 <strong><%=count%></strong>개를 작성하셨습니다.
				</div>
				<br>
				<br>
				<div class="articleTable">
					<div class="tblArticle">
						<form id="fmMultiProcess" name="fmMultiProcess" method="POST"
							action="myarticle.php">

							<br>

							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd; height:250px">
								<colgroup>
									<col class="boardName">
									<col class="articleCnt">
									<col class="commentCnt">
									<col class="lastDate">
								</colgroup>
								<thead >
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">작성일</th>
										<th style="background-color: #eeeeee; text-align: center;">조회</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < blist.size(); i++) {
									%>
									<tr>
										<td><%=blist.get(i).getB_id()%></td>
										<td><a href="view.jsp?b_id=<%=blist.get(i).getB_id()%>">
												<span style="color: blue"> <%=blist.get(i).getTitle()%></span>
										</a></td>
										<td><%=blist.get(i).getNickname()%></td>
										<td><%=blist.get(i).getDay()%></td>
										<td><%=blist.get(i).getHits()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</form>
					</div>
					<!--페이징  -->
					<ul class="pagination justify-content-center">
						<%
							if (pageNumber > block) { //처음, 이전 링크
						%>
						<li><a href="bbsAction.do?pageNumber=<%=fromPage - 1%>"></a></li>
						<%
							}
							if (pageNumber == 1) {
						%>
						<li class="page-item disabled"><a href="#">Previous</a></li>
						<%
							} else {
						%>
						<li><a href="bbsAction.do?pageNumber=<%=pageNumber - 1%>">Previous</a></li>
						<%
							}
							for (int i = fromPage; i <= toPage; i++) {
								if (i == pageNumber) {
						%>
						<li class="active"><a href="#"><%=i%></a></li>
						<%
							} else {
						%>
						<li><a href="bbsAction.do?pageNumber=<%=i%>"><%=i%></a></li>

						<%
							}
							}
							if (bdao.getTotal() > 1 && pageNumber != allPage) {
						%>

						<li><a href="bbsAction.do?pageNumber=<%=pageNumber + 1%>">Next</a></li>
						<%
							} else {
						%>
						<li class="page-item disabled"><a href="#">Next</a></li>
						<%
							}
							if (toPage < allPage) {
						%>

						<li><a href="bbsAction.do?pageNumber=<%=toPage + 1%>">>></a></li>
						<%
							}
						%>

					</ul>


				</div>
			</div>
		</div></div></div>
		
	<br><br><br><br><br><br>	<br><br><br><br><br><br>

		
		

		
		<section id="contact" class="dark-bg" style="margin-top:80%">
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