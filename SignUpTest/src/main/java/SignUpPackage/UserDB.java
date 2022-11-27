package SignUpPackage;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
public class UserDB {
	Connection con;
	Statement s;
	ResultSet rs;
	
	public UserDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/MVC_JOSH", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			s.executeUpdate("CREATE TABLE IF NOT EXISTS USERS (EMAIL VARCHAR(30), PASSWORD VARCHAR(30), NAME1 VARCHAR(30), NAME2 VARCHAR(30), GENDER VARCHAR(10), COUNTRY VARCHAR(30), TOC INT(2), NEWS INT(2))");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public boolean checkIfUserExistsInDB(String email) {
		boolean flag = false;
		try {
			System.out.println(email);
			rs = s.executeQuery("SELECT EMAIL FROM USERS");
			
			int x = 0;
			while(rs.next())
				x++;
			if(x==0) 
				return false;
			
			rs.beforeFirst();
			while(rs.next()) {
				String testName;
				testName = rs.getString(1);
				if(testName.equals(email)) {
					System.out.println("exists");
					return true;
				}
				else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean insertUserIntoDB(UserModel user1) {
		String testName = user1.getName1() + user1.getName2();
		try {
			
			String command = "INSERT INTO USERS VALUES(\"%s\", \"%s\",\"%s\",\"%s\",\"%s\",\"%s\", %s, %s)";
			command = String.format(command, user1.getEmail(), user1.getPassword(), user1.getName1(), 
					user1.getName2(), user1.getGender(), user1.getCountry(), user1.getToc(),
					user1.getNews());
			s.executeUpdate(command);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
  	}
	
	public boolean loginCheck(String email, String password) throws SQLException {
		boolean flag = false;
		String passwordEncrypted = "";
		if(checkIfUserExistsInDB(email)) {
			rs = s.executeQuery("SELECT PASSWORD FROM USERS WHERE EMAIL = \"" + email + "\"");
			while(rs.next()) {
				passwordEncrypted = rs.getString(1);	
			}
//			System.out.println(passwordEncrypted);

			char dec[] = passwordEncrypted.toCharArray();
			char test[] = new char[dec.length];
			int i = 0;
			for(char c : dec) {
				c -= 7;
				test[i++] = c;
			}
			String passwordDecrypted = new String(test);
			System.out.println(password);
			System.out.print(passwordDecrypted);
			
			if(password.equals(passwordDecrypted)) {
				System.out.print("Succesful login");
				return true;
			}
			else {
				System.out.print("Incorrect Password");
				return false;
			}
		}
		else {
			System.out.println("User does not exist");
		return flag;
		}
	}
	
	public String getName(String email) throws SQLException {
		String usernamel = "";
		rs = s.executeQuery("SELECT NAME1 FROM USERS WHERE EMAIL = \"" + email + "\"");
		while(rs.next()) {
			usernamel = rs.getString(1);	
		}
		return usernamel;
	}
}
