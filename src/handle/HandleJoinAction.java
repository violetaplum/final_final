package handle;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class HandleJoinAction implements HandleImpl{
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter script = response.getWriter();
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		HttpSession session=request.getSession(true);
		  
		  MemberVO member= new MemberVO();
		/*  <jsp:setProperty name="member" property="id"/>	<!--property�� id�� login.jsp���� input�� name���� �޾ƿ� id�� ���� member��ü��  id�ȿ� �����ϰ� �ȴ�. (�̸��� �����ϱ�) -->
		  <jsp:setProperty name="member" property="pw"/>
		  <jsp:setProperty name="member" property="name"/>
		  <jsp:setProperty name="member" property="nickname"/>
		  <jsp:setProperty name="member" property="gender"/>
		  <jsp:setProperty name="member" property="age"/>
		  <jsp:setProperty name="member" property="phone"/>
		  <jsp:setProperty name="member" property="email"/>*/
		  
		  
		  member.setId(request.getParameter("id"));
		  member.setPw(request.getParameter("pw"));
		  member.setName(request.getParameter("name"));
		  member.setNickname(request.getParameter("nickname"));
		  member.setGender(request.getParameter("gender"));
		  member.setAge(Integer.parseInt(request.getParameter("age")));
		  member.setPhone(request.getParameter("phone"));
		  member.setEmail(request.getParameter("email"));
		  
		  System.out.println("�Է��� ȸ�� ���� ���");
		  System.out.println(member.getId());
		  System.out.println(member.getPw());
		  System.out.println(member.getName());
		  System.out.println(member.getNickname());
		  System.out.println(member.getGender());
		  System.out.println(member.getAge());
		  System.out.println(member.getPhone());
		  System.out.println(member.getEmail());
		  
		  
		  
			
			
			String id = null;
			//�α����� �̹� �� ���¸� ���� id�� session���� ���� �޾ƿ� id���� �־��ش�.
			if(session.getAttribute("id") != null){
				id = (String)session.getAttribute("id");
			}
			
			//�α����� �� ���°� �ƴϸ�
			if(id != null){
				script.println("<script>");
				script.println("alert('�̹� �α����� �Ǿ��ֽ��ϴ�..')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
				script.close();
			}
		
			if(member.getId() == null || member.getPw() == null || member.getName() == null ||member.getNickname() == null
				|| member.getGender() == null || member.getAge() == 0 || member.getPhone() == null || member.getEmail() == null){
				script.println("<script>");
				script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			}
			else{
				MemberDAO mdao = new MemberDAO();
				int result = mdao.join(member);
				
				if(result == -1){ 	//db����, ȸ������ ����
					script.println("<script>");
					script.println("alert('�̹� �����ϴ� ���̵��Դϴ�.')");
					script.println("history.back()");
					script.println("</script>");
					script.close();
				}
				else  { //���� ȸ������ ����
					//session.setAttribute("id", member.getId());	//�α��� ������ ������������ ���ǰ����� id�� �����ش�.
					script.println("<script>");
					script.println("location.href= 'login.jsp'");	//ȸ������ ������ login�������� �̵���
					script.println("</script>");
					script.close();
				}
			}

			
	
	}

	}
	

