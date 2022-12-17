package SignUpPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart.jsp")
public class CartServlet extends HttpServlet {
	public static boolean isAuth;
	private static final long serialVersionUID = 1L;
    String pName;
    LinkedList<CartModel> chosenProds = new LinkedList<CartModel>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProdDB pdb = new ProdDB();
		CartModel cartmodel = null;
		if((request.getParameter("buttonProd") == null) ? false : true){
			System.out.println("Button is clicked! In Cart.jsp");
			pName = (request.getParameter("buttonProd").toString());
			try {
				 cartmodel = new CartModel(
						pdb.getProdImage1(pName),
						pdb.getProdDesc(pName),
						pdb.getProdPrice(pName),
						pdb.getProdQuantity(pName),
						pdb.getProdPrice(pName)*pdb.getProdQuantity(pName));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			chosenProds.push(cartmodel);
			for(CartModel cm : chosenProds) {
				System.out.println("___________________________________");
				System.out.println(cm.getProdImage());
				System.out.println(cm.getProdDesc());
				System.out.println(cm.getProdCost());
				System.out.println(cm.getProdQuantity());
				System.out.println(cm.getTotalProdCost());

			}
			request.setAttribute("chosenProds", chosenProds);
//			System.out.println((request.getParameter("buttonProd").toString()));
			request.setAttribute("product", pName);
			}
			else{System.out.println("Button is not clicked!");}
		
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
		name = udb.getName(email);
		System.out.print(isAuth);
		request.setAttribute("isAuth", isAuth);
		request.setAttribute("name", name);			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
}
