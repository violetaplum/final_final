package handle;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import review.ReviewDAO;
import review.ReviewVO;

public class HandlereviewListAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		/*BoardDAO bdao = null;
		BoardVO b1 = null;*/
		ReviewDAO rdao = null;
		ReviewVO review = null;
		
		ArrayList<ReviewVO> rlist = null;
		String game_name = null;
		
		
		//����¡ ó�� ����
		int r_pageNumber = 1;
		int begin = 0;
		int end = 0;
		int rowSize = 10;   //���࿡�� ����� �� 
		
		
		if(request.getParameter("game_name") != null){
			game_name = (String)request.getParameter("game_name");
			System.out.println("1pass");}else {
				System.out.println("-1pass");
			}

		if(request.getParameter("r_pageNumber") != null){
			r_pageNumber = Integer.parseInt(request.getParameter("r_pageNumber"));
			System.out.println("���� ������ : " +r_pageNumber);System.out.println("2pass"); }
		try {
			begin = (r_pageNumber * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
			end =(r_pageNumber * rowSize); //(1*10) = 10 //to
			
			System.out.println("3pass");
			System.out.println(begin);
			System.out.println(end);
			System.out.println("���� �̸� : " +game_name);		
			System.out.println("������ : " +r_pageNumber);
			
		 	rdao = new ReviewDAO();
			//rlist = rdao.getListGame_name(game_name, begin, end);
			rlist = rdao.getList(begin, end);
			
			if(rlist ==null) {
				System.out.println("rlist���� �ΰ��̴�.");
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		session.setAttribute("rlist", rlist);
		request.setAttribute("r_pageNumber", r_pageNumber);
		request.setAttribute("game_name", game_name);
		
	}

}