package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//여기가 서블릿
/**
 * Servlet implementation class Join
 */
@WebServlet("/member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Member() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		
		if(command != null & command.equals("join")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String pet_name = request.getParameter("pet_name");
			String sex = request.getParameter("sex");
			String pet_yy = request.getParameter("pet_yy");
			int year = Integer.parseInt(request.getParameter("year"));
			String user_phone = request.getParameter("user_phone");
			String home_add = request.getParameter("home_add");
			String user_email = request.getParameter("user_email");
			
			
			MemberVO vo = new MemberVO();
			MemberDAO dao = new MemberDAO();
			vo.setID(id);
			vo.setPASSWORD(password);
			vo.setPET_NAME(pet_name);
			vo.setPET_GENDER(sex);
			vo.setPET_YY(pet_yy);
			vo.setPET_MONTH(year);
			vo.setUSER_PHONE(user_phone);
			vo.setHOME_ADD(home_add);
			vo.setUSER_EMAIL(user_email);
			
			dao.joinMember(vo);
			
			out.print("<html><body>");
			out.print("<script>"
					+ "alert('회원가입이 완료되었습니다.'); window.location.href='dogcat';");
			out.print("</script>");
			out.print("</body></html>");
			
		} else  if(command != null & command.equals("login")) {
			HttpSession session = request.getSession();
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			LoginDAO dao = new LoginDAO();
			
			if (id.equals("admin") && password.equals("0000")) {
				out.print("<html><body>");
				out.print("<script>alert('관리자이름으로 로그인합니다.');"
						+ "window.location.href='admin_main.jsp'</script>");
				out.print("</body></html>");
				
			} else if (dao.login(id, password)) {
				session.setAttribute("id", id);
				out.print("<html><body>");
				out.print("<script>"
						+ "alert('로그인이 완료되었습니다.'); window.location.href='dogcat';");
				out.print("</script>");
				out.print("</body></html>");
			} else {
				out.print("<html><body>");
				out.print("<script>"
						+ "alert('아이디와 비밀번호가 일치하지 않습니다.'); history.back();");
				out.print("</script>");
				out.print("</body></html>");
			}
			
		}
	}

}
