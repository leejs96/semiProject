package cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		int PCode = Integer.parseInt(request.getParameter("PCode"));
		String id = (String)session.getAttribute("id");
		
		System.err.println(PCode);
		CartDAO cart = new CartDAO();
		CartVO vo = new CartVO();
		
		int count = cart.checkCart(id, PCode);
		
		if (count != 0) {
			out.print("<html><body>");
			out.print("<script>alert('이미 담겨있는 상품입니다.');"
					+ "history.back();"
					+ "</script>");
			out.print("</body></html>");
		} else {
			vo.setPCODE(PCode);
			vo.setID(id);
			vo.setQUANTITY(1);
			cart.addCart(vo);
			out.print("<html><body>");
			out.print("<script>alert('장바구니에 상품이 담겼습니다.');"
					+ "history.back();"
					+ "</script>");
			out.print("</body></html>");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
