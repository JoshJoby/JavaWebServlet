package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Redirect.jsp")
public class RedirectServlet extends HttpServlet {
	public static boolean isAuth;
	private static final long serialVersionUID = 1L;
    String pName;
    LinkedList<CartModel> chosenProds = new LinkedList<CartModel>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedirectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
//		System.out.println("\n\n" + request.getParameter("reloadTest") + "\n\n");
//		if(request.getParameter("reloadTest").equals("true")) {
//			System.out.println("page was refreshed ! ");
//		}
		
		Cookie cookie = null;
		Cookie cookies[] = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
        	cookie = cookies[i];
        	System.out.println(cookie.getName() + " : " + cookie.getValue());
        	
        }		
		ProdDB pdb = new ProdDB();
		if((request.getParameter("buttonProdCart") == null) ? false : true){

		   	CartModel cartmodel = null;
				System.out.println("Button is clicked! In home.jsp");
				String pName = (request.getParameter("buttonProdCart").toString());
				try {
					 cartmodel = new CartModel(
							pdb.getProdImage1(pName),
							pdb.getProdDesc(pName),
							pdb.getProdPrice(pName),
							pdb.getProdQuantity(pName),
							pdb.getProdPrice(pName)*pdb.getProdQuantity(pName));
					 HomeServlet.chosenProds.push(cartmodel);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("chosenProds", HomeServlet.chosenProds);
				for(CartModel cm : HomeServlet.chosenProds) {
				System.out.println("___________________________________");
				System.out.println(cm.getProdImage());
				System.out.println(cm.getProdDesc());
				System.out.println(cm.getProdCost());
				System.out.println(cm.getProdQuantity());
				System.out.println(cm.getTotalProdCost());
			}
		}
		isAuth = SignInServlet.isLoggedIn;
		String email = SignInServlet.userEmail;
		String name;
		UserDB udb = new UserDB();
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/Redirect.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
}
