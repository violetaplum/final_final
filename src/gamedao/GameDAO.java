package gamedao;

import java.sql.*;
import java.util.ArrayList;
//import java.util.Date;

import dbconn.DBconn;
import gamevo.GameVO;


public class GameDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public GameDAO() throws ClassNotFoundException, SQLException {
		con = new DBconn().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null)
			pstmt.close();
	}

	public void getAllInfoClose() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public ArrayList<GameVO> getAllInfo() throws SQLException {
		ArrayList<GameVO> tiarray = new ArrayList<GameVO>();// generic
		String [] src= {"free","charged","bestseller","free_a","charged_a","bestseller_a"};
		
		for(int i=0;i<6;i++) {
		pstmt =null;
		String sql = "Select * from "+src[i];

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			
			String name1 = rs.getString("name");

			GameVO tv = new GameVO(name1);
			tiarray.add(tv);//Array collection에 객체넣기
		}
		//해당 컬렉션 리턴
		}
		return tiarray;
	}
	public ArrayList<GameVO> getGoogleInfo() throws SQLException {
		ArrayList<GameVO> tiarray = new ArrayList<GameVO>();// generic
		String [] src= {"free","charged","bestseller"};
		
		for(int i=0;i<3;i++) {
		pstmt =null;
		String sql = "Select * from "+src[i];

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			
			String name1 = rs.getString("name");

			GameVO tv = new GameVO(name1);
			tiarray.add(tv);//Array collection에 객체넣기
		}
		//해당 컬렉션 리턴
		}
		return tiarray;
	}
	public ArrayList<GameVO> getAppInfo() throws SQLException {
		ArrayList<GameVO> tiarray = new ArrayList<GameVO>();// generic
		String [] src= {"free_a","charged_a","bestseller_a"};
		
		for(int i=0;i<3;i++) {
		pstmt =null;
		String sql = "Select * from "+src[i];

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			
			String name1 = rs.getString("name");

			GameVO tv = new GameVO(name1);
			tiarray.add(tv);//Array collection에 객체넣기
		}
		//해당 컬렉션 리턴
		}
		return tiarray;
	}

	public ArrayList<GameVO> searchInfo(String src1) throws SQLException {
		ArrayList<GameVO> tiarray = new ArrayList<GameVO>();// generic
		pstmt = null;
		String sql = "Select * from "+src1;

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			
			String name = rs.getString("name");

			GameVO tv = new GameVO(name);
			tiarray.add(tv);//Array collection에 객체넣기
		}
		return tiarray;//해당 컬렉션 리턴

	}

	private PreparedStatement setString(int i, String name3) {
		// TODO Auto-generated method stub
		return null;
	}

}