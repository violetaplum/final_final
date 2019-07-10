package handle;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;
import review.ReviewDAO;
import review.ReviewVO;

public class HandlereviewAction implements HandleImpl{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter script = response.getWriter();
		HttpSession session = request.getSession();

		ReviewDAO rdao = null;
		ReviewVO review = null;
		
		int result = -1;
		String id = null;	//ȸ�� ���̵�

		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else if (id == null) {// �α��� �ȵ��ִٸ�
/*		script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='login.jsp'");
			script.println("</script>");*/
		}
		
		
		if(request.getParameter("r_content")== null){
/*			script.println("<script>");
			script.println("alert('������ �Է����ּ���')");
			script.println("</script>");
			System.out.println("������ �Է��϶�");
			script.println("history.back()");*/
		}
		
		
		String nickname = request.getParameter("nickname");
		String r_content = request.getParameter("r_content");
		String game_name = request.getParameter("game_name");
		int rating= Integer.parseInt(request.getParameter("star_input"));
		
		System.out.println(nickname);

		try {
			rdao = new ReviewDAO();
			/*board = new BoardVO();
			mdao = new MemberDAO();*/
			
			result = rdao.writeReview(nickname, r_content, game_name, rating);
			
			System.out.println("����write�Ϸ�");

		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("r_pageNumber", 1);
		request.setAttribute("game_name", game_name);

	}

}