package web.login.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.login.dao.RegisterDao;
import web.login.dao.RegisterDaoImp;

@WebServlet("/FundController")
public class FundController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FundController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int fromAccount = (int) session.getAttribute("AccountNumber"); // Retrieve logged-in user's account number
        String recipientName = request.getParameter("recipientName");
        int toAccount = Integer.parseInt(request.getParameter("toAccount"));
        float amount = Float.parseFloat(request.getParameter("amount"));

        RegisterDao dao = new RegisterDaoImp();
        boolean transferSuccess = dao.transferFunds(fromAccount, toAccount, amount);

        if (transferSuccess) {
            // Update session balance attribute after transfer
            float newBalance = dao.getAccountBalance(fromAccount); // Assuming you have this method in DAO
            session.setAttribute("accountBalance", newBalance);            
            request.getRequestDispatcher("transferSuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Transfer failed. Please check the account details and balance.");
            request.getRequestDispatcher("FundTransfer.jsp").forward(request, response);
        }
    }
}
