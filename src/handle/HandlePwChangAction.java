package handle;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.MemberDAO;



public class HandlePwChangAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession(true);
		  PrintWriter script = response.getWriter();
			String id = null;
			String pw=null;
			String pw2=null;
			String pw3=null;
			String pw4=null;
			String link=null;
			id = (String)session.getAttribute("id");
			pw=request.getParameter("pw");
			pw2=request.getParameter("pw2");
			pw3=request.getParameter("pw3");
			pw4=request.getParameter("pw4");
			int i=0;

			MemberDAO mdao = new MemberDAO();
			if(pw3!=null){
				if(pw3.equals(pw4)){
					int result=mdao.changePw(pw3, id);
					if(result==1){
						i=1;
						link="changePW.jsp";
						session.setAttribute("link", link);
						session.setAttribute("i", i);
						return;
					}
			
					i=(-1);
					link="changePW2.jsp";
					session.setAttribute("link", link);
					session.setAttribute("i", i);
					return;
				}
				else {
					i=0;
					link="changePW2.jsp";
					session.setAttribute("link", link);
					session.setAttribute("i", i);
					return;
				}
			}else if(pw.equals(pw2)){
				
			int result = mdao.checkPw(id, pw);
			
			if(result == 1){ 
				session.setAttribute("PW", pw);	
				i=3;
				link="changePW2.jsp";
				session.setAttribute("link", link);
				session.setAttribute("i", i);
				return;
			}
			else if(result ==0){
	
				i=(-2);
				session.setAttribute("i", i);
				return;
			}
			}

			i=0;
			link="changePW.jsp";
			session.setAttribute("link", link);
			session.setAttribute("i", i);
			
	
	}
	
}
