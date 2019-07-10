package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVO;
import dbconn.DBconn;
/*import jdk.internal.dynalink.RelinkableCallSite;
*/
public class ReviewDAO {
	private Connection con;
	ResultSet rs = null;

	public ReviewDAO() throws ClassNotFoundException, SQLException {
		con = new DBconn().getConnection();
	}


	
	
	public int writeReview(String nickname, String r_content, String game_name, int rating) {
		
		String sql = "insert into REVIEW values(review_sequence1.NEXTVAL, ?, ?, to_char(SYSDATE, 'yy-mm-dd hh24:mi'), ?, ?)";
		//			  insert into review values(review_sequence1.NEXTVAL, '������', '�����̴��̰�', to_char(SYSDATE, 'yy-mm-dd hh24:mi'), '7���� ����', 4);
		try {
			/*	ResultSet rs = null;
				PreparedStatement pstmt = null;*/
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, nickname);
			pstmt.setString(2, r_content);
			pstmt.setString(3, game_name);
			pstmt.setInt(4, rating);
			
			return pstmt.executeUpdate();	//���� �Ϸ�Ǹ� 1�̻��� ���� ��ȯ
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -1; //db���� 
	}
	
	
	
	
	
	
	//������ �ۼ��� �۹�ȣ ���� �Լ�
	public int getNext() {
		
//		String sql = "select count(*) as totalCount from review";
		String sql = "select r_id from review order by r_id desc";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
		/*	PreparedStatement pstmt = null;*/
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù��° �Խù��� ��� 1�� ��ȯ
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; //db���� 
	}
	
	
	  
		/*
		//review 10������ ���
		public ArrayList<ReviewVO> r_getList(int r_pageNumber){
			ResultSet rs = null;
			
			String sql = "select * from(select * from review where r_id < ? order by r_id DESC) where rownum<=10";
			
			ArrayList<ReviewVO> rlist = new ArrayList<>();
			
			try {
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, r_getNext() - (r_pageNumber -1)*10);
				rs = pstmt.executeQuery();		//����.....
				
				while(rs.next()) {
					ReviewVO r1 = new ReviewVO();
					
					r1.setR_id(rs.getInt(1));
					r1.setNickname(rs.getString(2));
					r1.setR_content(rs.getString(3));
					r1.setDay(rs.getString(4));
					r1.setGame_name(rs.getString(rs.getString(5)));
					r1.setRating(rs.getInt(6));
				
					rlist.add(r1);
				}
			}catch(Exception e) {
					e.printStackTrace();}
			return rlist;
		}
		*/
		
		//���� �� �ֱ�(���� ���� + ������ ���� ó��)
	/*	public ArrayList<ReviewVO> r_getList(int r_pageNumber, String game_name){
			ResultSet rs = null;
			
			String sql = "select * from(select * from review where r_id < ? order by r_id DESC) where rownum<=10 and game_name=?";
			
			ArrayList<ReviewVO> rlist = new ArrayList<>();
			
			try {
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, r_getNext() - (r_pageNumber -1)*10);
				pstmt.setString(2, game_name);
				rs = pstmt.executeQuery();		
				
				while(rs.next()) {
					ReviewVO r1 = new ReviewVO();
					
					r1.setR_id(rs.getInt(1));
					r1.setNickname(rs.getString(2));
					r1.setR_content(rs.getString(3));
					r1.setDay(rs.getString(4));
					r1.setGame_name(rs.getString(rs.getString(5)));
					r1.setRating(rs.getInt(6));
				
					rlist.add(r1);
				}
			}catch(Exception e) {
					e.printStackTrace();}
			return rlist;
		}*/

	
	
	// �ֽ� ����10�� ���ϱ�
	public ArrayList<ReviewVO> getLatestList() {

		String sql = "select * from(select ROW_NUMBER() over(order by day desc)as rn, review.* from review) where rn >= 1 and rn <=10";

		ArrayList<ReviewVO> rlist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			//pstmt.setInt(1, begin);
			// pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO review = new ReviewVO();

				review.setR_id(rs.getInt(2));
				
				review.setNickname(rs.getString(3)); // ����...
				
				review.setR_content(rs.getString(4));
				
				review.setDay(rs.getString(5));
				review.setGame_name(rs.getString(6));
				review.setRating(rs.getInt(7));

				rlist.add(review);
			}
			System.out.println("����Ʈ ���� �Ϸ�");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rlist;
	}
	
		// ���Ӻ� ���� ���
		public ArrayList<ReviewVO> getList(int begin, int end){
			//String sql = "select * from(select * from review where r_id < ? order by r_id DESC) where rownum<=10 and game_name=?";     (���Ӻ� ���� �˻� ������)
			String sql = "select * from(select ROW_NUMBER() over(order by r_id desc)as rn, review.* from review) where rn >= ? and rn <=?";
			ArrayList<ReviewVO> rlist = new ArrayList<>();
			
			try {
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, begin);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();		
				
				while(rs.next()) {
					ReviewVO review = new ReviewVO();
					
					System.out.println(rs.getInt(2));
					System.out.println(rs.getString(3));
					System.out.println(rs.getString(4));
					System.out.println(rs.getString(5));
					System.out.println(rs.getString(6));
					System.out.println(rs.getInt(7));
					
					System.out.println("rs geet string");
					
					review.setR_id(rs.getInt(2));
					review.setNickname(rs.getString(3));
					review.setR_content(rs.getString(4));
					review.setDay(rs.getString(5));
					review.setGame_name(rs.getString(6));
					review.setRating(rs.getInt(7));
					
					rlist.add(review);
				}
			}catch(Exception e) {
				e.printStackTrace();}
			return rlist;
		}

		
		//���Ӻ� ����Ʈ ���
		public ArrayList<ReviewVO> getListGame_name(String game_name, int begin, int end){
			String sql = "select * from(select ROW_NUMBER() over(order by r_id desc)as rn, review.* from review where game_name = ?) where rn >= ? and rn <=?";
			ArrayList<ReviewVO> rlist = new ArrayList<>();
			try {
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, game_name);
				pstmt.setInt(2, begin);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();		
				
				while(rs.next()) {
					ReviewVO review = new ReviewVO();
					
					System.out.println(rs.getInt(2));
					System.out.println(rs.getString(3));
					System.out.println(rs.getString(4));
					System.out.println(rs.getString(5));
					System.out.println(rs.getString(6));
					System.out.println(rs.getInt(7));
					
					System.out.println("rsgeetstring");
					
					review.setR_id(rs.getInt(2));
					review.setNickname(rs.getString(3));
					review.setR_content(rs.getString(4));
					review.setDay(rs.getString(5));
					review.setGame_name(rs.getString(6));
					review.setRating(rs.getInt(7));
					
					rlist.add(review);
				}
			}catch(Exception e) {
				e.printStackTrace();}
			return rlist;
		}
		
		
		/*
		//���� �󼼰˻� ��������(���� �󼼰˻����������� �ش� ���並 �������� ���� �޼���)
		public ArrayList<ReviewVO> r_getListUsedGamename(String game_name){
			
			ResultSet rs = null;
			String sql =  "select * from review where game_name = ?";
			
			ArrayList<ReviewVO> rlist_game = new ArrayList<>();
			try {
				PreparedStatement pstmt = null;
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, game_name);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ReviewVO r1 = new ReviewVO();
					
					r1.setR_id(rs.getInt(1));
					r1.setNickname(rs.getString(2));
					r1.setR_content(rs.getString(3));
					r1.setDay(rs.getString(4));
					r1.setGame_name(rs.getString(rs.getString(5)));
					r1.setRating(rs.getInt(6));
					rlist_game.add(r1);
				}
			}catch(Exception e) {
				e.printStackTrace();}
			return rlist_game;
		}
		*/
		
		//���� ������ ��ȣ ���ϱ�
		public boolean nextPage(int r_pageNumber) {
			
			String sql = "select * from review where r_id < ?" ;
			try {
				
				PreparedStatement pstmt =  con.prepareStatement(sql);
				
				pstmt.setInt(1, getNext() - (r_pageNumber -1)*10);
				rs = pstmt.executeQuery();
				
				//����� �ϳ��� �����Ѵٸ� ������������ �Ѿ �� ������ ������
				if(rs.next()) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false; 
		}
		
		//�Խ��� �� ���� ���ؿ���
				public int getTotal() {
					String sql = "select count(*) as totalCount from review";
					try {
						PreparedStatement pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next()) {
							return rs.getInt(1);}
					}catch(Exception e) {
						e.printStackTrace();}
					return -1;	//db����
				}
				
				
				//����¡ ó��(1,2,3,4,5...)
				public int paging(int pageNumber) {
					
					return pageNumber;
					
				}
	
	
}