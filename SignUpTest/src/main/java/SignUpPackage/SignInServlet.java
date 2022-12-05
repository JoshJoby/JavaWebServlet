package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignIn.jsp")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static boolean isAuth;
    public static boolean isLoggedIn;
    static String userEmail;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
    	isLoggedIn = false;
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);	
		
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}
	
	String getUserName(String email) throws SQLException {
		UserDB udb = new UserDB();
		return udb.getName(email);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		isLoggedIn = false;
		UserDB udb = new UserDB();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(password);
		try {
			if(udb.loginCheck(email, password)) {
				System.out.println("Success");
				isAuth = false;
				isLoggedIn = true;
				userEmail = email;
//				request.setAttribute("isAuth", isAuth);
				request.setAttribute("email", email);
				response.sendRedirect("index.jsp");
				return;
			}
			else {
				isAuth = true;
				isLoggedIn = true;
				request.setAttribute("isAuth", isAuth);
				
				System.out.println("Failure");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		processRequest(request, response);	
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("isAuth", isAuth);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/SignIn.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
