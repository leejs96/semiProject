package product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/upload.do") //상품등록
public class Adpro2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdproDAO adproDAO;
 
	 
	public void init(ServletConfig config) throws ServletException {
		adproDAO = new AdproDAO();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

// post로 변경하니까 됨 근데 또 price가 왜 두번 도는건가?!
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String encoding = "utf-8";
		String path = "C:\\ThisIsJava\\workspace\\semiProject\\src\\main\\webapp\\resource\\img";
		
		int maxSize = 1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//		factory.setRepository(currentDirPath);
//		factory.setSizeThreshold(1024 * 1024 * 1024);
//		
//		ServletFileUpload upload = new ServletFileUpload(factory);
		
		int PCode = 0;
		try {
			PCode = Integer.parseInt(multi.getParameter("PCode"));
		} catch (NumberFormatException e) {
			PCode = 0;
		}
		
//		try {
//			List items = upload.parseRequest(request);
//			System.out.println(items.size());
//			for (int i = 0; i < items.size(); i++) {
//				FileItem fileItem = (FileItem) items.get(i);
//				
//				if (fileItem.isFormField()) {
//					System.out.println(fileItem.getFieldName() + "==" + fileItem.getString(encoding));
//				} else {
//					System.out.println("매개변수이름:" + fileItem.getFieldName());
//					System.out.println("파일이름:" + fileItem.getName());
//					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
//					
//					if (fileItem.getSize() > 0) {
//						int idx = fileItem.getName().lastIndexOf("\\");
//						if (idx == -1) {
//							idx = fileItem.getName().lastIndexOf("/");
//						}
//						String fileName = fileItem.getName().substring(idx + 1);
//						System.out.println("FileName : " + fileName);
//						File uploadFile = new File(currentDirPath + "\\" + PCode + ".jpg");
//						fileItem.write(uploadFile);
//					} // end if
//				} // end if
//			} // end for
//		} catch (Exception e) {
//			e.printStackTrace();
//		}	
//		
		//값 입력받기
		
		String PImg = multi.getFilesystemName("PImg");
		if (PImg == null) {
			PImg = "";
		}
		
		
		
		String PName = multi.getParameter("PName");
		if (PName == null) {
			PName = "";
		}
		
		int price = 0;
		try {
			String price_c = multi.getParameter("price");
			price_c = price_c.replaceAll(",", "");
			price = Integer.parseInt(price_c);
		} catch (NumberFormatException e) {
			price = 0;
		}
		
		int stock = 0;
		try {
			stock = Integer.parseInt(multi.getParameter("stock"));
		} catch (NumberFormatException e) {
			stock = 0;
		}
		
		String category = multi.getParameter("category");
		if (category == null) {
			category = "";
		}
		
		int PKG = 0;
		try {
			PKG = Integer.parseInt(multi.getParameter("PKG"));
		} catch (NumberFormatException e) {
			PKG = 0;
		}
		
		String animal = multi.getParameter("animal");
		String sub_category = multi.getParameter("sub_category");
		
		// 입력 값 로그 출력
		System.out.println(">>PImg: " + PImg);
		System.out.println(">>PCode: " + PCode);
		System.out.println(">>PName: " + PName);
		System.out.println(">>price: " + price);
		System.out.println(">>stock: " + stock);
		System.out.println(">>category: " + category);
		System.out.println(">>PKG: " + PKG);
		
		
		
		if (PImg.trim().isEmpty() || PCode == 0 || PName.trim().isEmpty() || price == 0 || stock == 0 || category.trim().isEmpty() || PKG == 0) {
			PrintWriter out = response.getWriter();
			out. println("<script>alert('입력값이 올바르지 않습니다. 상품 등록을 다시 시도해주세요.'); location.href='admin_product2.jsp';</script>");
			out.close();
			return;
		}
		
		//AdproVO 객체 생성 및 값 설정
		ProductVO product = new ProductVO();
		product.setPIMG(PImg);
		product.setPCODE(PCode);
		product.setPNAME(PName);
		product.setPRICE(price);
		product.setSTOCK(stock);
		product.setCATEGORY(category);
		product.setSUB_CATEGORY(sub_category);
		product.setANIMAL(animal);
		product.setPKG(PKG);
		
		try {
			adproDAO.insertProducts(product);
			
			// 등록알림창
			PrintWriter out = response.getWriter();
			out.println("<script>alert('상품이 등록되었습니다.'); location.href='list.do';</script>");
			out.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.println("<script>alert('상품 등록 중 오류가 발생했습니다.'); location.href='admin_product2.jsp';</script>");
			out.close();
		}
	}
	
}
