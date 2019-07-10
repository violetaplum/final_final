package gamelist;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gamedao.GameDAO;
import gamevo.GameVO;

public class getSearchInfo implements GameList{

	@Override
	public void createL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		GameDAO gdao1=null;
		ArrayList<GameVO> alist1 = new ArrayList<GameVO>();
		
		String src = (String)session.getAttribute("src");
		
		System.out.println(src);
		
		try {
			gdao1 = new GameDAO();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			alist1=gdao1.searchInfo(src);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("alist1", alist1);
		
	}

}
