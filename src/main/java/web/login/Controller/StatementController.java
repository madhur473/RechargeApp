package web.login.Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.login.dao.RegisterDao;
import web.login.dao.RegisterDaoImp;
import web.login.model.FundTransfer;
import web.login.model.Recharge;

@WebServlet("/StatementController")
public class StatementController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StatementController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer accountNumber = (Integer) session.getAttribute("AccountNumber");

        if (accountNumber == null) {
            response.sendRedirect("Login.jsp"); // Redirect to login if not authenticated
            return;
        }

        RegisterDao dao = new RegisterDaoImp();
        
        try {
            // Retrieve the fund transfer history
            List<FundTransfer> fundTransfers = dao.getFundTransferHistory(accountNumber);

            // Retrieve the recharge history
            List<Recharge> recharges = dao.getRechargeHistory(accountNumber);

            // Set the retrieved data as request attributes
            request.setAttribute("fundTransfers", fundTransfers);
            request.setAttribute("recharges", recharges);

            // Forward to the JSP page
            request.getRequestDispatcher("Statement1.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
            request.setAttribute("errorMessage", "An error occurred while retrieving the statement. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
