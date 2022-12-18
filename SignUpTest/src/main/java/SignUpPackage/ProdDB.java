package SignUpPackage;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
public class ProdDB {
	Connection con;
	Statement s;
	ResultSet rs;
	
	public ProdDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			s.executeUpdate("CREATE TABLE IF NOT EXISTS PRODUCTS (PRODID VARCHAR(30) PRIMARY KEY, PRODNAME VARCHAR(30), PRODPRICE FLOAT(9,2), PRODRATING INT, PRODIMAGE1 VARCHAR(100), PRODIMAGE2 VARCHAR(100),PRODIMAGE3 VARCHAR(100), PRODQUANTITY INT, PRODDESC VARCHAR(255))");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
//	public boolean checkIfUserExistsInDB(String email) {        imma use for search results
//		boolean flag = false;
//		try {
//			System.out.println(email);
//			rs = s.executeQuery("SELECT EMAIL FROM USERS");
//			
//			int x = 0;
//			while(rs.next())
//				x++;
//			if(x==0) 
//				return false;
//			
//			rs.beforeFirst();
//			while(rs.next()) {
//				String testName;
//				testName = rs.getString(1);
//				if(testName.equals(email)) {
//					System.out.println("exists");
//					return true;
//				}
//				else {
//					flag = false;
//				}
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return flag;
//	}
//	
//	
	public String getProdID(String prodID) {
		return prodID;
	}
	
	public String getProdName(String prodID) throws SQLException {
		String prodName = "";
		rs = s.executeQuery("SELECT PRODNAME FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodName = rs.getString(1);	
		}
		return prodName;
	}
	public float getProdPrice(String prodID) throws SQLException {
		float prodPrice = 0.0f;
		rs = s.executeQuery("SELECT PRODPRICE FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodPrice = rs.getFloat(1);	
		}
		return prodPrice;
	}
	public int getProdRating(String prodID) throws SQLException {
		int prodRating = 0;
		rs = s.executeQuery("SELECT PRODRATING FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodRating = rs.getInt(1);	
		}
		return prodRating;
	}
	public String getProdImage1(String prodID) throws SQLException {
		String prodImage1 = "";
		rs = s.executeQuery("SELECT PRODIMAGE1 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage1 = rs.getString(1);	
		}
		return prodImage1;
	}
	public String getProdImage2(String prodID) throws SQLException {
		String prodImage2 = "";
		rs = s.executeQuery("SELECT PRODIMAGE2 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage2 = rs.getString(1);	
		}
		return prodImage2;
	}
	public String getProdImage3(String prodID) throws SQLException {
		String prodImage3 = "";
		rs = s.executeQuery("SELECT PRODIMAGE3 FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodImage3 = rs.getString(1);	
		}
		return prodImage3;
	}
	public int getProdQuantity(String prodID) throws SQLException {
		int prodQuantity = 0;
		rs = s.executeQuery("SELECT PRODQUANTITY FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodQuantity = rs.getInt(1);	
		}
		return prodQuantity;
	}
	public String getProdDesc(String prodID) throws SQLException {
		String prodDesc = "";
		rs = s.executeQuery("SELECT PRODDESC FROM PRODUCTS WHERE PRODID = \"" + prodID + "\"");
		while(rs.next()) {
			prodDesc = rs.getString(1);	
		}
		return prodDesc;
	}
}
