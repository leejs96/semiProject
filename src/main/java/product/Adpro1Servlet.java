package product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Adpro2Servlet
 */
@WebServlet("/list.do")
public class Adpro1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		AdproDAO adproDAO;
	
	public void init(ServletConfig config) throws ServletException {
		adproDAO = new AdproDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response); //get방식 요청시 다시 doHandle() 호출
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); //post방식 요청시 다시 doHandle() 호출
	}
	
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");

	    
		List<ProductVO> productsList;
		try {
			productsList = adproDAO.listProducts();
			request.setAttribute("productsList", productsList);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}     	
	
		RequestDispatcher dispatch = request.getRequestDispatcher("admin_product1.jsp");
		dispatch.forward(request, response);
	}
}
