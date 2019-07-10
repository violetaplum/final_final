<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%	


GameName gn=new GameName();
GameImg gi=new GameImg();
GameStar gs=new GameStar();
gn.namearr.clear();
gi.imgarr.clear();
gs.stararr.clear(); 



/* System.out.println("여기까지 애플!!!!!!!!!!"+gn.namearr.size()); */

%>
<body>
<ul class="nav nav-tabs">
<li class="active"><a href=“#tab1″ data-toggle="tab">Home</a></li>
<li><a href=“#tab2″ data-toggle="tab">menu1</a></li>
<li><a href="#tab3″ data-toggle="tab">menu2</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active"id= "tab1">
<p>home 부분입니다.</p>
</div>
<div class="tab-pane" id="tab2">
<p>menu1 부분입니다.</p>
</div>
<div class="tab-pane" id="tab3">
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
gi.imgarr.clear();


String [] imgsrc2={"free_img_a","charged_img_a","bestseller_img_a"};



for(int p=0;p<3;p++){

	gn.create("free");
	gi.create(imgsrc2[p]);
	gs.create("free_star");
	
}

for(int z=0;z<50;z++){
%><tr>

<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z)%>"><img src="<%=gi.imgarr.get(z)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z)%>" style="color:black;"><%=gn.namearr.get(z) %></a></td>


<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z+50)%>"><img src="<%=gi.imgarr.get(z+50)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z+50)%>" style="color:black;"><%=gn.namearr.get(z+50) %></a></td>


<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z+100)%>"><img src="<%=gi.imgarr.get(z+100)%>"></a></td>
<td><a href="FreeChart2.jsp?name=<%=gn.namearr.get(z)%>&img=<%=gi.imgarr.get(z+100)%>" style="color:black;"><%=gn.namearr.get(z+100) %></a></td>



<% }%>



</tr>

</table> 
</div>
</div>


</body>
</html>