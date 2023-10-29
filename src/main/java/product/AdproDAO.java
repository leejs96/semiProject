package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdproDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	public AdproDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
	
			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    //상품리스트
    public List<ProductVO> listProducts() throws ClassNotFoundException {
        List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			con = dataFactory.getConnection();
				
			String sql = "select * from product";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String PImg = rs.getString("PIMG");
				int PCode = rs.getInt("PCODE");
				String PName = rs.getString("PName");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String category = rs.getString("category");
				float PKG = rs.getFloat("PKG");
				ProductVO vo = new ProductVO();
				vo.setPIMG(PImg);
				vo.setPCODE(PCode);
				vo.setPNAME(PName);
				vo.setPRICE(price);
				vo.setSTOCK(stock);
				vo.setCATEGORY(category);
				vo.setPKG(PKG);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return list;
    }
    
    //상품등록
    public void insertProducts(ProductVO product) throws ClassNotFoundException {
		try {
			con = dataFactory.getConnection();
				
			String sql = "Insert into product(PIMG, PCODE ,PNAME, PRICE, STOCK, CATEGORY, PKG, ANIMAL, SUB_CATEGORY)"+"values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getPIMG());
			pstmt.setInt(2, product.getPCODE());
			pstmt.setString(3, product.getPNAME());
			pstmt.setInt(4, product.getPRICE());
			pstmt.setInt(5, product.getSTOCK());
			pstmt.setString(6, product.getCATEGORY());
			pstmt.setFloat(7, product.getPKG());
			pstmt.setString(8, product.getANIMAL());
			pstmt.setString(9, product.getSUB_CATEGORY());

			pstmt.executeUpdate();
			System.out.println("리스트 업데이트 완료");
		
			pstmt.close();
			con.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
  }
}

