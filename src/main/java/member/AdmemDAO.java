package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Date;

public class AdmemDAO {

	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;

    public AdmemDAO() {
    	try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }


    public List<MemberVO> listMembers() throws ClassNotFoundException {
        List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "select * from pet_member";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String pw = rs.getString("PASSWORD");
				String pet_name = rs.getString("PET_NAME");
				String pet_gender = rs.getString("PET_GENDER");
				String pet_birth = rs.getString("PET_YY");
				int pet_month = rs.getInt("PET_MONTH");
				String ph = rs.getString("USER_PHONE");
				Date date = rs.getDate("JOIN_DAY");
				String addr = rs.getString("HOME_ADD");
				String eaddr = rs.getString("USER_EMAIL");
				MemberVO vo = new MemberVO();
				vo.setID(id);
				vo.setPASSWORD(pw);
				vo.setPET_NAME(pet_name);
				vo.setPET_GENDER(pet_gender);
				vo.setPET_YY(pet_birth);
				vo.setPET_MONTH(pet_month);
				vo.setUSER_PHONE(ph);
				vo.setJOIN_DAY(date);
				vo.setHOME_ADD(addr);
				vo.setUSER_EMAIL(eaddr);
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

}
