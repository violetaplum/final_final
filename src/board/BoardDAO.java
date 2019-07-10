package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;

public class BoardDAO {
	private Connection con;
	/* PreparedStatement pstmt = null; */
	ResultSet rs = null;

	// DB ����
	public BoardDAO() throws ClassNotFoundException, SQLException {
		con = new DBconn().getConnection();
	}

	public int writeBoard(String title, String nickname, String content, String b_type) {

		String sql = "insert into board1 values(board_sequence1.NEXTVAL, ?, ?, ?, to_char(SYSDATE, 'yy-mm-dd hh24:mi'), 0, '', ?, '')";
		try {
			/*
			 * ResultSet rs = null; PreparedStatement pstmt = null;
			 */
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, nickname);
			pstmt.setString(4, b_type);
			return pstmt.executeUpdate(); // ���� �Ϸ�Ǹ� 1�� ��ȯ
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // db����
	}

	// ������ �ۼ��� �۹�ȣ ���� �Լ�
	public int getNext() {

		String sql = "select b_id from board1 order by b_id desc";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù��° �Խù��� ��� 1�� ��ȯ
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // db����
	}

	// ���� ������ ��ȣ ���ϱ�
	public boolean nextPage(int pageNumber) {

		String sql = "select * from board1 where b_id < ?";
		try {

			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			// ����� �ϳ��� �����Ѵٸ� ������������ �Ѿ �� ������ ������
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/*
	 * //������ �ۼ��� �۹�ȣ ���� �Լ� public int getNext() {
	 * 
	 * String sql = "select count(*) as totalCount from board"; try {
	 * PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = null;
	 * PreparedStatement pstmt = null; rs = pstmt.executeQuery(); if(rs.next()) {
	 * return rs.getInt(1) + 1; } return 1; //ù��° �Խù��� ��� 1�� ��ȯ } catch
	 * (SQLException e) { e.printStackTrace(); } return -1; //db���� }
	 */

	// �Խù� ��������(mysql)
	/*
	 * public ArrayList<BoardVO> listBoard(int begin, int end){
	 * 
	 * ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	 * 
	 * Connection con = null; PreparedStatement ps = null; ResultSet rs = null;
	 * 
	 * //String sql = "select * from board order by num desc"; String sql =
	 * "select rn, num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab "
	 * + "  from (select " +
	 * "  Rownum as rn, num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab "
	 * + "  from(    " +
	 * "        select num,name,email,pwd,subject,content,regdate,hit,parent,sort,tab  "
	 * + "        from board " + "        order by parent desc,sort desc " + //�⺻��
	 * ���� ���� "        )" + "    )" + "where RN >=? and RN <=?";
	 * System.out.println(sql);
	 * 
	 * try {
	 * 
	 * con = getCon(); ps = con.prepareStatement(sql); ps.setInt(1, begin);
	 * ps.setInt(2, end);
	 * 
	 * rs = ps.executeQuery();
	 * 
	 * while(rs.next()) {
	 * 
	 * BoardDTO dto = new BoardDTO();
	 * 
	 * dto.setNum(rs.getInt("num")); dto.setName(rs.getString("name"));
	 * dto.setEmail(rs.getString("email")); dto.setPwd(rs.getString("pwd"));
	 * dto.setSubject(rs.getString("subject"));
	 * dto.setContent(rs.getString("content"));
	 * dto.setRegdate(rs.getDate("regdate")); dto.setHit(rs.getInt("hit"));
	 * dto.setParent(rs.getInt("parent")); dto.setSort(rs.getInt("sort"));
	 * dto.setTab(rs.getInt("tab"));
	 * 
	 * list.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally { dbClose(con, ps, rs);
	 * }
	 * 
	 * 
	 * return list;
	 * 
	 * 
	 * }
	 */

	/*
	 * //�Խ��� ���������� ����� ���� ������ �������� public ArrayList<BoardVO> getList(int
	 * pageNumber){ ResultSet rs = null; PreparedStatement pstmt = null;
	 * 
	 * 
	 * String sql =
	 * "select * from(select * from board where b_id < ? order by b_id DESC) where rownum<=10"
	 * ; //String sql =
	 * "select * from(select * from board where b_id < ? order by b_id DESC) where rownum<=10"
	 * ; String sql =
	 * "select * from(select * from board order by b_id DESC) where rownum<=10 and rownum >=2"
	 * ; //String sql =
	 * "select * from board where b_id < ? AND ROWNUM <= 10 order by b_id DESC";
	 * ArrayList<BoardVO> blist = new ArrayList<>();
	 * 
	 * try { PreparedStatement pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, getNext() - (pageNumber -1)*10); rs = pstmt.executeQuery();
	 * //����.....
	 * 
	 * System.out.println("db���� �߻�1"); System.out.println(pageNumber);
	 * System.out.println(getNext() - (pageNumber -1)*10);
	 * 
	 * while(rs.next()) { BoardVO b1 = new BoardVO();
	 * System.out.println("b_id :"+rs.getInt(1));
	 * System.out.println("b_id :"+rs.getString(2));
	 * 
	 * 
	 * 
	 * b1.setB_id(rs.getInt(1)); //System.out.println("db���� �߻�2");
	 * 
	 * b1.setTitle(rs.getString(2)); //����... //System.out.println("db���� �߻�2");
	 * b1.setContent(rs.getString(3)); //System.out.println("db���� �߻�2");
	 * b1.setNickname(rs.getString(4)); //System.out.println("db���� �߻�2");
	 * b1.setDay(rs.getString(5)); b1.setHits(rs.getInt(6));
	 * b1.setComment(rs.getString(7)); b1.setB_type(rs.getString(8));
	 * b1.setGame_name(rs.getString(9));
	 * 
	 * blist.add(b1); //System.out.println("db���� �߻�3"); } //
	 * System.out.println("db���� �߻�4"); } catch (SQLException e) {
	 * e.printStackTrace(); //System.out.println("db���� �߻�5"); } return blist; }
	 */

	
	
	// �Խ��� ���������� ����� ���� ������ ��������
	public ArrayList<BoardVO> getList(int begin, int end) {

		String sql = "select * from(select ROW_NUMBER() over(order by b_id desc)as rn, board1.* from board1) where rn >= ? and rn <=?";

		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, begin);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO b1 = new BoardVO();

				b1.setB_id(rs.getInt(2));
				// System.out.println("db���� �߻�2");
				b1.setTitle(rs.getString(3)); // ����...
				// System.out.println("db���� �߻�2");
				b1.setContent(rs.getString(4));
				// System.out.println("db���� �߻�2");
				b1.setNickname(rs.getString(5));
				// System.out.println("db���� �߻�2");
				b1.setDay(rs.getString(6));
				b1.setHits(rs.getInt(7));
				b1.setComment(rs.getString(8));
				b1.setB_type(rs.getString(9));
				b1.setGame_name(rs.getString(10));

				blist.add(b1);
			}
			System.out.println("����Ʈ ���� �Ϸ�");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blist;
	}

	// �г������� �Խ��� ����Ʈ ���
	public ArrayList<BoardVO> getBoardList(String nick) {
		/*
		 * ResultSet rs = null; PreparedStatement pstmt = null;
		 */
		String sql = "select * from(select * from board1 where nickname=? order by b_id DESC) where rownum<=10";
		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, nick);
			rs = pstmt.executeQuery(); // ����.....

			while (rs.next()) {
				BoardVO b1 = new BoardVO();
				b1.setB_id(rs.getInt(1));
				System.out.println("db���� �߻�2");
				b1.setTitle(rs.getString(2)); // ����...
				System.out.println("db���� �߻�2");
				b1.setContent(rs.getString(3));
				System.out.println("db���� �߻�2");
				b1.setNickname(rs.getString(4));
				System.out.println("db���� �߻�2");
				b1.setDay(rs.getString(5));
				b1.setHits(rs.getInt(6));
				b1.setComment(rs.getString(7));
				b1.setB_type(rs.getString(8));
				b1.setGame_name(rs.getString(9));

				blist.add(b1);
				System.out.println("db���� �߻�3");
			}
			System.out.println("db���� �߻�4");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db���� �߻�5");
		}
		return blist;
	}

	
	// �ֽ� �Խ��� 10�� ���ϱ�
	public ArrayList<BoardVO> getLatestList() {

		String sql = "select * from(select ROW_NUMBER() over(order by day desc)as rn, board1.* from board1) where rn >= 1 and rn <=10";

		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);

			//pstmt.setInt(1, begin);
			// pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO b1 = new BoardVO();

				b1.setB_id(rs.getInt(2));
				
				b1.setTitle(rs.getString(3)); // ����...
				
				b1.setContent(rs.getString(4));
				
				b1.setNickname(rs.getString(5));
				
				b1.setDay(rs.getString(6));
				b1.setHits(rs.getInt(7));
				b1.setComment(rs.getString(8));
				b1.setB_type(rs.getString(9));
				b1.setGame_name(rs.getString(10));

				blist.add(b1);
			}
			System.out.println("����Ʈ ���� �Ϸ�");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blist;
	}
	
	

	// �Խ��� �� ���� ���ؿ���
	public int getTotal() {
		String sql = "select count(*) as totalCount from board1";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db����
	}

	// �Խ��� ���� �ϳ� �ҷ�����(view.jsp)
	public BoardVO getBoard(int b_id) {

		String sql = "select * from board1 where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			// ����� �ϳ��� �����Ѵٸ� ������������ �Ѿ �� ������ ������
			if (rs.next()) {
				BoardVO b1 = new BoardVO();
				b1.setB_id(rs.getInt(1));
				b1.setTitle(rs.getString(2));
				b1.setContent(rs.getString(3));
				b1.setNickname(rs.getString(4));
				b1.setDay(rs.getString(5));
				b1.setHits(rs.getInt(6));
				b1.setComment(rs.getString(7));
				b1.setB_type(rs.getString(8));
				b1.setGame_name(rs.getString(9));

				System.out.println("getBoard()�Ϸ�");
				return b1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int hitsUpdate(int b_id) {
		String sql = "update board1 set hits = hits+1 where b_id = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return -1; // db����
	}

	public int update(int b_id, String title, String content) {
		String sql = "update board1 set title =?, content=? where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, b_id);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB����

	}

	public int delete(int b_id) {
		String sql = "delete from board1 where b_id=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB����
	}
	public ArrayList<BoardVO> getNewestBoard() {

		String sql = "SELECT * FROM board WHERE ROWNUM <= 5 ORDER BY b_id DESC";

		ArrayList<BoardVO> blist = new ArrayList<>();

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO b1 = new BoardVO();

				b1.setB_id(rs.getInt(1));
				b1.setTitle(rs.getString(2)); 
				b1.setContent(rs.getString(3));
				b1.setNickname(rs.getString(4));
				b1.setDay(rs.getString(5));
				b1.setHits(rs.getInt(6));
				b1.setComment(rs.getString(7));
				b1.setB_type(rs.getString(8));
				b1.setGame_name(rs.getString(9));
				blist.add(b1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blist;
	}



	/*
	 * public void pstmtClose() throws SQLException { PreparedStatement pstmt =
	 * null; if(pstmt != null) { pstmt.close(); } }
	 */

}