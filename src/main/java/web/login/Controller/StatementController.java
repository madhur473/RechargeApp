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
        int accountNumber = (int) session.getAttribute("AccountNumber");

        RegisterDao dao = new RegisterDaoImp();
        List<FundTransfer> fundTransfers = dao.getFundTransferHistory(accountNumber);
        List<Recharge> recharges = dao.getRechargeHistory(accountNumber);

        request.setAttribute("fundTransfers", fundTransfers);
        request.setAttribute("recharges", recharges);
        request.getRequestDispatcher("statement.jsp").forward(request, response);
    }
}
