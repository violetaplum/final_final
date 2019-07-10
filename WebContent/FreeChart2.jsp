<%@page import="review.ReviewDAO"%>
<%@page import="review.ReviewVO"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="gamefile.GameInfor" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Custom styles for this template -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.default.min.css"  rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="css/custom.css" />
    <link
            href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
            rel="stylesheet">

    <style type="text/css">
    body{ align-content: center}
    tr{
        text-align:center}

    img{
        width:100px;
        height:100px;
    }
    .jumbotron{
        background: #ffc107;
    }
    input:-ms-input-placeholder{color:#a8a8a8;}
    .search{
        height:60px;
        width:650px;
        border:1px solid #1b5ac2;
        background:#ffffff;
       }
    input{
        font-size:20px;
        width:588px;
        height:100%;
        padding:10px;
        border:0px;
        outline:none;
        float:left;}
    button{
        width:60px;
        height:100%;
        border:0px;
        background:#1b5ac2;
        outline:none;
        float:right;
        color:#ffffff;}
tr,th{
text-align:center}


	#starrating{
	CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(images/icon_star2_16.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 80px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	
	}
	#starrating1{
	 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(images/icon_star_16.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 16px;
	}

</style>


</head>
<body id="page-top">
<%
    PrintWriter script = response.getWriter();

    String id = null;//회원 아이디

    String game_name = null;//게임 네임

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

    BoardDAO bdao = new BoardDAO();
    MemberDAO mdao = new MemberDAO();
    ReviewDAO rdao = new ReviewDAO();


		int r_pageNumber = 1; //기본 페이지 번호 
		//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.

		ArrayList<ReviewVO> rlist = new ArrayList<>();

		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			System.out.println("리뷰 회원 아이디 : " + id);
		}

		//game_name
		if (request.getAttribute("game_name") != null) {
			game_name = request.getAttribute("game_name").toString();
			System.out.println("리뷰 게임: " + game_name);
		} else if (request.getParameter("game_name") != null) {
			game_name = request.getParameter("game_name");
		} else {
			System.out.println("게임이름을 받아오지 못했습니다.");
		}

		//리뷰 페이지 번호받기
		if (request.getAttribute("r_pageNumber") != null) {
			r_pageNumber = Integer.parseInt(request.getAttribute("r_pageNumber").toString());
			System.out.println("받아온 리뷰 페이지 : " + r_pageNumber);
		} else {
			System.out.println("어트리뷰트 리뷰 페이지 못받아옴");
		}

		

		//페이징 처리 변수들

		int rowSize = 10; //게시물 숫자 
		int from = (r_pageNumber * rowSize) - (rowSize - 1); //(1*10)-(10-1)=10-9=1 //from
		int to = (r_pageNumber * rowSize); //(1*10) = 10 //to

		int total = rdao.getTotal(); //총 게시물 수
		int allPage = (int) Math.ceil(total / (double) rowSize); //총 페이지수

		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((r_pageNumber - 1) / block * block) + 1; //보여줄 페이지의 시작
		int toPage = ((r_pageNumber - 1) / block * block) + block; //보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		System.out.println("전체 페이지수 : " + allPage);
		System.out.println("현제 페이지 : " + r_pageNumber);
		System.out.println("페이지시작 : " + fromPage + " / 페이지 끝 :" + toPage);
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
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" style="height: 43px; width:auto" alt="Sanza theme logo"></a>
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

<%

String name=request.getParameter("name");
String img=request.getParameter("img");
String star=request.getParameter("star");
String info="gameinfo";

    gi.create(info);

double sd=(Double.parseDouble(star)*20);
int si=(int)sd;
%>

<div class="container" style="margin-top:100px">

    <table class="table" style="margin-top:5%">
    <thead>
    <tr>
        <th colspan="9" style="text-align:left;height:60px; background-color:#5D5D5D;font-size:17px;color:white">GAME INFO</th>
    </tr>
    </thead>
    <tr align="center">
        <td style="font-size:20px;font-weight: bold; font-style: italic;display:" width="50px">
            <img src="<%=img%>" width="150px" height="150px"><br><br>
            <h4><strong><%=name%></strong></h4><br>
            <div id="starrating" style="display:inline-block" >
            <%Double rate=Double.valueOf(star);
            rate=rate*20;%>
			<p id="starrating1" style="WIDTH: <%=rate%>%;"></p>
												
		</div>
        </td>
        <td><h4>
                <%for(int i=0;i<gi.infoarr.size();i++)
                {
                    %>
            <%=gi.infoarr.get(i)%>
            <%
                }%>
        </h4>
        </td>
    </tr>
    <tr>
  <td>

  </td>
 </tr>
    <tr><td colspan="9" style="text-align:right;"><a href="Main.jsp" style="text-align:right;color:grey;">순위 전체보기</a></td></tr>
</table>
<div style="margin-left:-1000px; width:2000px;height:300px; overflow:hidden;margin:auto"> 
<iframe style="position:relative; top:-480px; left:-20px;" width="980px" height="845px" src="http://www.gevolution.co.kr/app/?svc=649619#game_score" scrolling="no"></iframe>
</div>

</div>



<div align="center">
		<div class="container">
			<div align="left">
				<h3>
					<strong>Game Review</strong>
				</h3>

			</div>
				<hr style="background-color:#ddd;">
			<!-- 			<table frame=void class="table" > -->
			<table border=0 class="table">
				<%
					for (int i = 0; i < rlist.size(); i++) {
				%>
				<tbody>
					<tr style="height: 7px; font-size: 13px;">
						<td style="text-align: left; font-weight: 800; font-size: 13px;">
							&nbsp;&nbsp;&nbsp;&nbsp;<%=rlist.get(i).getNickname()%>
						</td>
						<%int r=rlist.get(i).getRating();
						r=r*10;%>
						<td style="text-align: left; font-weight: 800; font-size: 13px;">
							<div id="starrating" >
				    		<p id="starrating1" style="WIDTH: <%=r%>%;"></p>
												
							</div>
						</td>
						<td style="text-align: right; font-size: 13px;"><%=rlist.get(i).getDay()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr style="height: 40px;">
						<td colspan="3" style="text-align: left">
							&nbsp;&nbsp;&nbsp;&nbsp;<%=rlist.get(i).getR_content()%>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
				
			</table>
		</div>
	</div>





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