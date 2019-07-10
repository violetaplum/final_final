<%@page import="board.BoardDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="gamevo.GameVO"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="java.util.ArrayList"%>

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
    <link href="css/owl.theme.default.css"  rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/jquery-3.4.1.js" type="text/javascript"></script>

    <style>

        tr{
            text-align:center}
        table{

        }

        img{
            width:100px;
            height:100px;
        }
        input:-ms-input-placeholder{color:#a8a8a8;}
        .search{
            height:60px;
            width:650px;
            border:1px solid #1b5ac2;
            background:#ffffff;}
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
        .jumbotron{
            background: #ffc107;
        }
    </style>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

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

String id = null; 
MemberDAO mdao = new MemberDAO();

if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
}
System.out.println(id);

String imgname = (String)request.getParameter("name");
System.out.println("가져온 값: "+imgname);
%>
</head>
<body id="page-top">
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
<!-- Header -->

<div align=center>

    <br><br><br><br><br><br>
    <div class="container" style="margin-top:5%;">
        <table class="table">
            <thead>
            <tr style="text-align:left;height:60px; background-color:#fec503;font-size:17px;border-color: #1a1a1a">
                <th colspan="9" style="text-align:left;height:60px; background-color:#ffdd00;font-size:17px;color:white;">SELECTED GAME</th>
            </tr>
            </thead>

           
                <%
               String equalN=null;
                int count=0;
                for(int i=0;i<gn.namearr.size();i++){
                	

                    if(gn.namearr.get(i).contains(imgname)){
                    	count=count+1;
                    	System.out.println(gn.namearr.get(i));
                    	equalN=gn.namearr.get(i);
                %>
                 <tr align=center>
                <td style="font-size:20px;font-weight: bold; font-style: italic;" width="10%"><%=count%></td>
                <td style="font-size:20px;font-weight: bold; font-style: italic;" width="10%"><img src="<%=gi.imgarr.get(i)%>"></td>
                <td style="text-align:left;font-size:20px;font-weight: bold; font-style: italic;" width="80%"><a href="rank.jsp?name=<%=gn.namearr.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>" style="color:black;"><%=gn.namearr.get(i)%></a></td>
				</tr>
				              
               <%
                           
                       }
                    if(gn.namearr.get(i).equals(imgname)){
                    	equalN=gn.namearr.get(i);
                    }

                   }
               %>
            
            <tr><td colspan="9" style="text-align:right;"><a href="Main.jsp" style="text-align:right;color:grey;">순위 전체보기</a></td></tr>
        </table>

       
    </div>
</div>
<br><br><br><br>


					<div class="container">
					<%if(equalN!=null){ %>
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
					
					<%
					BoardDAO bdao=new BoardDAO();
					ArrayList<BoardVO> blist = new ArrayList<>();
					blist=bdao.getLatestList();
					for(int i=0; i<5;i++){ %>
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

					<%} %>

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