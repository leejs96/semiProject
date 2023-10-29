package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;


/**
 * Servlet implementation class Home
 */
@WebServlet("/try")
public class Try extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Try() {
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
		String command = request.getParameter("command");
		String page = request.getParameter("page");
		
		
		System.err.println("command > "+ command);
		System.err.println("page > "+ page);
		if(command != null && command.equals("try")) {
			System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
			TryDAO dao = new TryDAO();
			List<TryVO> list;
			
			int count = dao.ImgCount();
			request.setAttribute("pageCount", (count/9)+1);
			
			if(page == null || page=="1") {
				list = dao.listImg(0);
			
			} else {
				int paging = Integer.parseInt(page);
				list = dao.listImg(0+(paging-1)*9);
			}
			
			request.setAttribute("listImg", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("imgTry.jsp");
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
