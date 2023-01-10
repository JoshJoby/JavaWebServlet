package SignUpPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class InvoiceDB {
	Connection con;
	Statement s;
	ResultSet rs;
   	public static LinkedList<CartModel> existingProds = new LinkedList<CartModel>();

	public InvoiceDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/USERDB1", "root", "root");
			s = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			s.executeUpdate("CREATE DATABASE IF NOT EXISTS USERDB1");
			s.executeUpdate("USE USERDB1");
			System.out.println("Creating TRANSACTION table");
			
			s.executeUpdate("CREATE TABLE IF NOT EXISTS TRANSACTIONS(TRANSACTIONSID VARCHAR(10), EMAIL VARCHAR(30), PRODID VARCHAR(30), "
					+ "ADDRESS VARCHAR(100), DATEOFTRANSACTION DATE, "
					+ "PRODNAME VARCHAR(30), PRODCATEGORY VARCHAR(50), PRODCOST FLOAT(9,2), PRODSELECTEDQUANTITY INT, "
					+ "PRODTOTALCOST FLOAT(9,2),  "
					+ "FOREIGN KEY(EMAIL) REFERENCES USERS(EMAIL), "
					+ "FOREIGN KEY(PRODID) REFERENCES PRODUCTS(PRODID));");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void insertIntoCartDB(LinkedList<InvoiceModel> selectedProds) {
		try {
			for(InvoiceModel invoiceModel : selectedProds) {
			String command = "INSERT INTO TRANSACTIONS VALUES(\"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", %f, %d, %f)";
			command = String.format(command, invoiceModel.getTransactionID(), invoiceModel.getEmail(), invoiceModel.getProdID(),
					invoiceModel.getAddress(), invoiceModel.getDateOfPurchase(), invoiceModel.getProdName(),
					invoiceModel.getProdCategory(), invoiceModel.getProdCost(), invoiceModel.getProdQuantity(), invoiceModel.getProdTotalCost());
			s.executeUpdate(command);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
