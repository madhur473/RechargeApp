package web.login.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.login.dao.RegisterDao;
import web.login.dao.RegisterDaoImp;
import web.login.model.Recharge;

/**
 * Servlet implementation class RechargeFinalController
 */
@WebServlet("/RechargeFinalController")
public class RechargeFinalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechargeFinalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedPlan = request.getParameter("plan");
	    
	    // Retrieve session object from request
	    HttpSession session = request.getSession();

	    String phoneNumber = (String) session.getAttribute("phone");
	    String provider = (String) session.getAttribute("provider");
	    System.out.println(phoneNumber);
	    float accountBalance = Float.parseFloat(session.getAttribute("accountBalance").toString());
	    int AccountNumber = Integer.parseInt(session.getAttribute("AccountNumber").toString());

	    float planAmount = 0;
	    switch (selectedPlan) {
	    case "plan1":
	        planAmount = 100; 
	        break;
	    case "plan2":
	        planAmount = 50; 
	        break;
	    case "plan3":
	        planAmount = 147; 
	        break;
	    case "plan4":
	        planAmount = 187; 
	        break;
	    case "plan5":
	        planAmount = 197; 
	        break;
	    case "plan6":
	        planAmount = 397; 
	        break;
	    case "plan7":
	        planAmount = 319; 
	        break;
	    case "plan8":
	        planAmount = 153; 
	        break;
	    case "plan9":
	        planAmount = 499; 
	        break;
	    case "plan10":
	        planAmount = 139; 
	        break;
	    case "plan11":
	        planAmount = 298; 
	        break;
	    case "plan12":
	        planAmount = 399; 
	        break;
	    }
	    request.getSession().setAttribute("Phone",phoneNumber );
	    request.getSession().setAttribute("Provider", provider);
	    request.getSession().setAttribute("Plan", selectedPlan);
	    request.getSession().setAttribute("Amount", planAmount);
	    
	    Recharge reobj=new Recharge(phoneNumber, provider, selectedPlan, planAmount);
	    List<Recharge> relst=new ArrayList<Recharge>();
	    relst.add(reobj);
	   
	    RegisterDao redao =new RegisterDaoImp();
		
		int r=redao.createRecharge(relst, AccountNumber);

	    // Deduct the plan amount from the account balance
	    accountBalance -= planAmount;

	    // Update the account balance in the session
	    session.setAttribute("accountBalance", accountBalance);
	    
	    boolean updated = redao.updateAccountBalance(accountBalance, AccountNumber);



	    
	    // Redirect to a confirmation page
	    response.sendRedirect("Confirmation.jsp");
	}
			
		}


