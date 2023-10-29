package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Date;

public class TryDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	
	public TryDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<TryVO> listImg(int start){
		List<TryVO> list = new ArrayList<TryVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM t_img"
					+ " LIMIT " + start + ",9";
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				TryVO img = new TryVO();
				String imgPath = rs.getString("imgPath");
				String imgContent = rs.getString("imgContent");
				
				img.setImgPath(imgPath);
				img.setImgContent(imgContent);
				
				
				list.add(img);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int ImgCount() {
		int count = 0; 
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM t_img";
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
}
