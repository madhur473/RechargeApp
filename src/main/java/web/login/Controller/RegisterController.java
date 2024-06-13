package web.login.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.login.dao.RegisterDao;
import web.login.dao.RegisterDaoImp;
import web.login.model.Register;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accNumber = Integer.parseInt(request.getParameter("accNumber"));
        String accFname = request.getParameter("accFname");
        String accUname = request.getParameter("accUname");
        String accPassword = request.getParameter("accPassword");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        float accBal = Float.parseFloat(request.getParameter("accBal"));
        
        Register robj = new Register(accNumber, accFname, accUname, accPassword, gender, email, phone, accBal);
        List<Register> lstReg = new ArrayList<Register>();
        lstReg.add(robj);
        System.out.println(lstReg);
        RegisterDao rdao = new RegisterDaoImp();

        int i = rdao.createRecord(lstReg);
        request.getSession().setAttribute("accountBalance", accBal);
        request.getSession().setAttribute("Username", accUname);
        request.getSession().setAttribute("AccountNumber", accNumber);
        if(i > 0) {
            response.sendRedirect("Login.jsp");
        } else {
            response.sendRedirect("Error.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
