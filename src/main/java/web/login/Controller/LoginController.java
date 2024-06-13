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

import org.apache.tomcat.jni.Sockaddr;

import web.login.dao.RegisterDao;
import web.login.dao.RegisterDaoImp;
import web.login.model.Login;
import web.login.model.Register;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Login lobj = new Login(username, password);
        List<Login> lstLogin = new ArrayList<Login>();     
        lstLogin.add(lobj);
        RegisterDao rdao = new RegisterDaoImp();
        boolean isValidUser = rdao.validateUser(lstLogin);
        
        if(isValidUser) {    
            Register user = rdao.retrieveUserByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("accountBalance", user.getAccBal());
            session.setAttribute("Username", user.getAccUname());
            session.setAttribute("AccountNumber", user.getAccNumber());
            request.getSession().setAttribute("Username", username);
            response.sendRedirect("Dashboard.jsp");
        } else {
            response.sendRedirect("Error.jsp");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
