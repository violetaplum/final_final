package handle;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;


public class HandlebbsAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		BoardDAO bdao = null;
		//BoardVO b1 = null;
		ArrayList<BoardVO> blist = null;
		
		int pageNumber = 1;	//�⺻ ������ ��ȣ
		int begin = 0;
		int end = 0;
		int rowSize = 10;   //���࿡�� ����� �� 
		
	
		/*	int id = Integer.parseInt(request.getParameter("id"));*/
		
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			System.out.println("�Ķ���� ������ : " +pageNumber);
		}
		
		try {
			begin = (pageNumber * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
			end =(pageNumber * rowSize); //(1*10) = 10 //to
			
			System.out.println(begin);
			System.out.println(end);
			
		 	bdao = new BoardDAO();
			blist = bdao.getList(begin, end);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("������ : " +pageNumber);
		request.setAttribute("blist", blist);
		/*request.setAttribute("id", id);*/
		request.setAttribute("pageNumber", pageNumber);
		
	}
	
}
		/*
		 * TelInfoDAO tidao1 = null; TelInfoVO tv = null;
		 */
		// String id = request.getParameter("id");
	/*	int pageSize = 0;		// �� ������ �� ������ �� ����
		int pageGroupSize = 0;	// �������׷���� ������ ���� ex) [����] 1 2 3 4 5 [����] �� ��� ������ ������ 5
		int pageCount = 0;		// �� ������ �� 
		
		String pageNumber = null;
		
		int currentPage = 0;	// ���� ������ ��ȣ(pageNumber)
		int startRow = 0;     	// �� �������� ���۱� ��ȣ
		int endRow = 0;			// �� �������� ������ �۹�ȣ
		int count = 0;			// �Խù� �� ����
		int number = 0;
		int pageGroupCount = 0;	// �������׷��� ����
								// ex) pageGroupSize�� 3�� ��� '[1][2][3]'�� pageGroupCount �� ��ŭ �ִ�.
		int numPageGroup = 0;	// ������ �׷� ��ȣ
								// ex) pageGroupSize�� 3�� ��� '[1][2][3]'�� �������׷��ȣ�� 1 �̰� '[2][3][4]'�� �������׷��ȣ�� 2�̴�.
		*/
		
		
		
		/*try {
			
			pageSize = 10;
			pageGroupSize = 10;
			pageNumber = request.getParameter("pageNumber");// ������ ��ȣ
			
			if (pageNumber == null) {
				pageNumber = "1";}
			currentPage = Integer.parseInt(pageNumber);
			 startRow = (currentPage - 1) * pageSize + 1;
			 endRow = currentPage * pageSize;
			
			 count = 0;
			 number = 0;
			ArrayList articleList = new ArrayList();
			count = bdao.getTotal();// ��ü ���� ��
			if (count > 0) {
				if (endRow > count)
					endRow = count;
				articleList = bdao.select(startRow, endRow);// ���� �������� �ش��ϴ� �� ���
			} else {
				articleList = null;
			}
			number = count - (currentPage - 1) * pageSize;// �۸�Ͽ� ǥ���� �۹�ȣ
			pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
			
			numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);
			
			pageCount = count / pageSize;
			if(count % pageSize > 0) pageCount++;
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
		
		
		// �ش� �信�� ����� �Ӽ�
		/*request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("pageCount", pageCount);
		
		
		request.setAttribute("number", new Integer(number));
		request.setAttribute("pageGroupSize", new Integer(pageGroupSize));
		request.setAttribute("numPageGroup", new Integer(numPageGroup));
		request.setAttribute("pageGroupCount", new Integer(pageGroupCount));
		request.setAttribute("articleList", articleList);*/
		
/*
		try {
			// tidao1 = new TelInfoDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// tv = tidao1.getInfo(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		// request.setAttribute("sname", name);
		// request.setAttribute("stv", tv);
	/*}
}
*/