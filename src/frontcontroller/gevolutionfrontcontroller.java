package frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gamedao.GameDAO;
import gamelist.GameList;
import gamelist.getAllInfo;
import gamelist.getSearchInfo;
import gamevo.GameVO;
import handle.HandleChangeInfoAction;
import handle.HandleImpl;
import handle.HandleJoinAction;
import handle.HandleLoginAction;
import handle.HandlePwChangAction;
import handle.HandleWriteAction;
import handle.HandlebbsAction;
import handle.HandledeleteAction;
import handle.HandlereviewAction;
import handle.HandlereviewListAction;
import handle.HandleupdateAction;
import handle.HandleviewAction;

/**
 * Servlet implementation class gameServlet
 */
@WebServlet("*.do")
public class gevolutionfrontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gevolutionfrontcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGameList(request,response);
	}

	private void doGameList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//스크립트 사용
		PrintWriter out = response.getWriter();
		String c1 = request.getRequestURI().substring(request.getContextPath().length());

		String src=request.getParameter("src");

		String game_name=request.getParameter("game_name");
		
		PrintWriter script = response.getWriter();
		String viewpage = null; //처리해서 보내는 페이지	
		HttpSession session=request.getSession(true);
		HandleImpl scmd1 = null;
		GameList g=null;
		int i=0;

		HandlereviewListAction hl=null;

		
		switch(c1) {
		case "/bbsAction.do":
			scmd1 = new HandlebbsAction();
			try {
				System.out.print("bbsAction 접근을 성공적으로 햇다.");
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "bbs.jsp";
			System.out.println("bbspage접근 성공");
			break;
			
		case "/viewAction.do":
			scmd1 = new HandleviewAction();
			try {
				scmd1.handle(request, response);
				System.out.print("viewAction 접근을 성공적으로 햇다.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "view.jsp";
			System.out.println("viewpage접근 성공");
			break;
			
		case "/deleteAction.do":
			scmd1 = new HandledeleteAction();
			try {
				scmd1.handle(request, response);
				System.out.print("deleteAction 접근을 성공적으로 햇다.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//viewpage = "bbs.jsp";
			viewpage = "bbsAction.do";
			
			System.out.println("delet 성공");
			/*script.println("location.href= 'bbsAction.do'");*/
			
			break;
			
		case "/updateAction.do":
			scmd1 = new HandleupdateAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "bbsAction.do";
			System.out.print("update접근 성공");
			break;
		case "/writeAction.do":
			scmd1 = new HandleWriteAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//db에러처리(알림창)
			if(Integer.parseInt(request.getAttribute("result").toString()) != 1) {
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script language='javascript'>");
				out.println("alert('제목을 입력해주세요');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				System.out.println("db에러확인");
			}
			
			viewpage = "bbsAction.do";
			System.out.println("write접근 성공");
			break;
			
			//리뷰 글쓰기 처리
		case "/reviewAction.do":
			
			scmd1 = new HandlereviewAction();
			System.out.print("review Action 접근을 성공적으로 햇다.");
			try {
				scmd1.handle(request, response);
				out.println("<script language='javascript'>");
				out.println("alert('complete!');");
				
				out.println("</script>");
				

				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			viewpage = "start.jsp";

			System.out.print("reviewwrite접근 성공");
			break;
			
		case "/reviewListAction.do":
			scmd1 = new HandlereviewListAction();
			src=request.getParameter("src");
			try {
				scmd1.handle(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(src.equals("rank")) {
				viewpage="rankSelect.jsp";
			}else {
			viewpage = "start.jsp";
			}
			System.out.print("reviewlist접근 성공");
			break;
			
		case "/loginAction.do":
			scmd1 = new HandleLoginAction();
			try {
				scmd1.handle(request, response);
				String result=(String)session.getAttribute("result");
				
				i= Integer.parseInt((session.getAttribute("i")).toString());
				System.out.print(i+"여기까지옴");
				
				switch(i) {
				case 1:
							String link=(String)session.getAttribute("link");
							viewpage = link;
							break;
						
				case 0:
						out.println("<script language='javascript'>");
						out.println("alert('Try Again');");
						out.println("history.back();");
						out.println("</script>");
						out.close();
						
				case -2:
					out.println("<script language='javascript'>");
					out.println("alert('Try Again');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					
				case -1:
					out.println("<script language='javascript'>");
					out.println("alert('Try Again');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					

						}
				break;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			break;
		
		case "/logoutAction.do":
		    
			session.invalidate();	
			g=new getAllInfo();
			
			try {
				g.createL(request,response);
				viewpage = "main.jsp";
				System.out.print("로그아웃 성공");

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;
		
		case "/infoChange.do":
			try {
				scmd1 = new HandleChangeInfoAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "changeInfo.jsp";
			System.out.print("정보변경성공");
			break;
		case "/pwChangeAction.do":
			try {
				scmd1 = new HandlePwChangAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i= Integer.parseInt(session.getAttribute("i").toString());
			switch(i) {
			case 1:
				out.println("<script language='javascript'>");
				out.println("alert('success');");
				out.println("location.href='changePW.jsp';");
				//location.href='abc.php' 
				out.println("</script>");
				out.close();	
				//String link1=(String)session.getAttribute("link");
				
				//viewpage = link1;

				break;
			case 0:
					out.println("<script language='javascript'>");
					out.println("alert('Try Again');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
	
			case 3:
				String link2=(String)session.getAttribute("link");
				viewpage = link2;
				break;
			case -1:
				out.println("<script language='javascript'>");
				out.println("alert('id check');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
	
			case -2:
				out.println("<script language='javascript'>");
				out.println("alert('pw check');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
	
					}
	
			break;
		case "/joinAction.do":
			
	
			try {
				scmd1 = new HandleJoinAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "login.jsp";
			System.out.print("정보변경성공");
			break;
		case "/getAllInfo.do":
			getAllInfo ga=new getAllInfo();
			
			try {
				ga.createL(request,response);
				if(src.equals("start")) {
					viewpage="main.jsp";
				}else if(src.equals("main")) {
					viewpage="ranking.jsp";
				}else {
					viewpage="main.jsp";
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
			
		
		case "/getSearchInfo.do":
			getSearchInfo gs=new getSearchInfo();
			try {
				gs.createL(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage="getAllinfo.jsp";
			break;
		}
		
		
		
		System.out.println("뷰페이지 : " + viewpage);
		RequestDispatcher rd1=request.getRequestDispatcher(viewpage);

		rd1.forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}