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
 * Servlet implementation class Product
 */
@WebServlet("/product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
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
		String animal = request.getParameter("animal");
		String command = request.getParameter("command");
		String category = request.getParameter("category");
		String page = request.getParameter("page");
		
		if(command != null && command.equals("search")) {
			String word = request.getParameter("word");
			String order = request.getParameter("order");
			String kg1 = request.getParameter("kg1");
			String kg2 = request.getParameter("kg2");
			String price1 = request.getParameter("price1");
			String price2 = request.getParameter("price2");
			String[] sub_category = request.getParameterValues("sub_category");
			
			float fkg1 = 0;
			float fkg2 = 0;
			
			int startPrice = 0;
			int endPrice = 0;
			
			if(kg1 != "" && kg2 != "") {
				
				fkg1 = Float.parseFloat(kg1);
				fkg2 = Float.parseFloat(kg2);
			}
	
			if(price1 != "" && price2 != "") {
				startPrice = Integer.parseInt(price1);
				endPrice = Integer.parseInt(price2);
			}
			
			ProductDAO dao = new ProductDAO();
			List<ProductVO> list;
			
			int count = dao.SearchCount(word, category, animal, order, fkg1, fkg2, startPrice, endPrice, sub_category);
			request.setAttribute("pageCount", (count/9)+1);
			
			if(page == null || page == "1") {
				list = dao.listProduct(0, word, category, animal, order, fkg1, fkg2, startPrice, endPrice, sub_category);
			} else {
				int paging = Integer.parseInt(page);
				list = dao.listProduct((paging-1)*9, word, category, animal, order, fkg1, fkg2, startPrice, endPrice, sub_category);
			}
				
			request.setAttribute("listProduct", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("Product.jsp");
			dispatch.forward(request, response);
			
		} else if(animal != null && (animal.equals("dog") || animal.equals("cat"))) {
			
			ProductDAO dao = new ProductDAO();
			List<ProductVO> list;
			int count = dao.Count(category, animal);
			
			request.setAttribute("pageCount", (count/9)+1);
			
			if(page == null || page == "1") {
				list = dao.listProduct(0,category, animal);
			} else {
				int paging = Integer.parseInt(page);
				list = dao.listProduct((paging-1)*9,category, animal);
			}
			
			request.setAttribute("listProduct", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("Product.jsp");
			dispatch.forward(request, response);
			
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
