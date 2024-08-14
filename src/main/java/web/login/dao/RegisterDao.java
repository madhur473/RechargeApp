package web.login.dao;

import java.util.List;

import web.login.model.FundTransfer;
import web.login.model.Login;
import web.login.model.Recharge;
import web.login.model.Register;
import web.login.model.Transaction;

public interface RegisterDao {
	
	int createRecord(List<Register> lst);
	boolean validateUser(List<Login> lstList);
	int deleteRecord(int accNumber);
	int updateRecord(List<Register> lst);
	List<Register> retriveRecord(int accNumber);
	List<Register> displayAll();
	int createRecharge(List<Recharge> relst, int accountNumber);
	boolean updateAccountBalance(float accountBalance, int AccountNumber);
	Register retrieveUserByUsername(String username);
    boolean transferFunds(int fromAccount, int toAccount, float amount);
	float getAccountBalance(int accountNumber);
	// Method to get transaction history (combined or separate, as per your design)
    List<Transaction> getTransactionHistory(int accountNumber); // General transaction history if you have a unified model

    // Separate methods for fund transfer and recharge histories, if necessary
    List<FundTransfer> getFundTransferHistory(int accountNumber); // Add this if you track transfers separately
    List<Recharge> getRechargeHistory(int accountNumber); // Track recharges separately if needed



	

}
