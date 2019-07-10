package gamelist;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gamedao.GameDAO;
import gamevo.GameVO;

public class getAllInfo implements GameList{

	

	@Override
	public void createL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		GameDAO gdao1=null;
		ArrayList<GameVO> alist1 = new ArrayList<GameVO>();
		ArrayList<GameVO> alist_g = new ArrayList<GameVO>();
		ArrayList<GameVO> alist_a = new ArrayList<GameVO>();
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
			alist1=gdao1.getAllInfo();
			alist_g=gdao1.getGoogleInfo();
			alist_a=gdao1.getAppInfo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("alist1", alist1);
		request.setAttribute("alist_g", alist_g);
		request.setAttribute("alist_a", alist_a);
	}


}
