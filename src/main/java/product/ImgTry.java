package product;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ImgTry
 */
@WebServlet("/imgTry")
public class ImgTry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgTry() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		

		// 예 : upload_test.jsp 파일의 내용



		// 100MB
		int maxSize = 1024*1024*100;


		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\sunny\\Desktop\\try", maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
//		File currentDirPath = new File("C:\\Users\\sunny\\Desktop\\try");
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//		factory.setRepository(currentDirPath);
//		factory.setSizeThreshold(1024 * 1024);
//		
//		ServletFileUpload upload = new ServletFileUpload(factory);
//		try {
//			List items = upload.parseRequest(request);
//			for (int i = 0; i < items.size(); i++) {
//				FileItem fileItem = (FileItem) items.get(i);
//
//				if (fileItem.isFormField()) {
//					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
//				} else {
//					System.out.println("파라미터명:" + fileItem.getFieldName());
//					System.out.println("파일명:" + fileItem.getName());
//					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
//
//					if (fileItem.getSize() > 0) {
//						int idx = fileItem.getName().lastIndexOf("\\");
//						if (idx == -1) {
//							idx = fileItem.getName().lastIndexOf("/");
//						}
//						String fileName = fileItem.getName().substring(idx + 1);
//						File uploadFile = new File(currentDirPath + "\\" + fileName);
//						fileItem.write(uploadFile);
//					} // end if
//				} // end if
//			} // end for
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String img2 = multi.getFilesystemName("img");
		String name2 = multi.getParameter("name");
		System.out.println(img);
		System.out.println(name);
		System.out.println(img2);
		System.out.println(name2);
	}

}
