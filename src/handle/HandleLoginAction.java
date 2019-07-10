package handle;

import java.io.PrintWriter;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gamelist.GameList;
import gamelist.getAllInfo;
import member.MemberDAO;


public class HandleLoginAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	      HttpSession session=request.getSession(true);
	      PrintWriter out = response.getWriter();
	      GameList g=null;

		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String link=null;
		int i=1;
	
	
	
		MemberDAO mdao = new MemberDAO();
		
		int result = mdao.login(id,pw);
		
		System.out.println("리절트값 : " +result);
		
		if(result == 1){ //로그인 성공시
				//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
			//session.setAttribute("nickname", member.getNickname());
			
			link="main.jsp";
			g=new getAllInfo();
			
			try {
				g.createL(request,response);
				session.setAttribute("result", "1");
				session.setAttribute("id", id);//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
				session.setAttribute("link", link);//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.


			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(result ==0){
		
			link="login.jsp";
			session.setAttribute("link", link);
			i=0;					
		}
		else if(result == -1){			
	
			link="login.jsp";
			session.setAttribute("link", link);
			i=(-1);
			
		}
		else if(result == -2){
			link="login.jsp";
			session.setAttribute("link", link);
			i=(-2);
		}
		session.setAttribute("i", i);
	}
	
}