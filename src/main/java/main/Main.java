package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.ProductDAO;
import product.ProductVO;
import cart.CartDAO;
import cart.CartVO;

/**
 * Servlet implementation class Main
 */
@WebServlet("/dogcat")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		
		if(command != null && command.equals("logout")) {
			request.getSession().invalidate();
			
			out.print("<html><body>");
			out.print("<script>alert('로그아웃되었습니다.');"
					+ "window.location.href='dogcat';</script>");
			out.print("</body></html>");
		}else {
			ProductDAO product = new ProductDAO();
			List<ProductVO> list;
			Date date = java.sql.Date.valueOf(LocalDate.now().minusMonths(1));
			list = product.newProduct(date);
			
			request.setAttribute("listProduct", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("main.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String login = request.getParameter("login");
		String id = request.getParameter("id");
		
		if (login != null && login.equals("pass")) {
			HttpSession session = request.getSession();
			if(!session.isNew()) {
				session.setAttribute("id", id);
				
				out.print("<html><body>");
				out.print("<script>"
						+ "window.location.href='./dogcat'</script>");
				out.print("</body></html>");
			}
		}
		
	}

}
