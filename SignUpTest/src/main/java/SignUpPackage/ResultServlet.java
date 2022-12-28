package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import SignUpPackage.ProdDB;

/**
 * 
 * Servlet implementation class ResultServlet
 */
@WebServlet("/results.jsp")
public class ResultServlet extends HttpServlet {
	public static boolean isAuth;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if((request.getParameter("searchProds")==null) ? false : true){
		System.out.println("Input is entered! In home.jsp");
		String pName = (request.getParameter("searchProds").toString());
		
		System.out.println(pName);
		ProdDB pdb = new ProdDB();
		if(pdb.checkIfProdExistsInDB(pName)) {
			System.out.println("Item exists");
		}
		else {
			System.out.println("Item does not exist");
		}
		}
		try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {		

		
		
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		ProdDB pdb = new ProdDB();
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);	
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/results.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
	

}
