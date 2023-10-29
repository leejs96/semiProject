package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mem.do")
public class AdmemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    AdmemDAO admemDAO = new AdmemDAO();
 
	public void init(ServletConfig config) throws ServletException {
	}


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //여기 입력해야 한글 출력
        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().append("Served at: ").append(request.getContextPath());

		List<MemberVO> membersList;
		try {
			membersList = admemDAO.listMembers();
			request.setAttribute("membersList", membersList);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        RequestDispatcher dispatch = request.getRequestDispatcher("/admin_member.jsp");
        dispatch.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
