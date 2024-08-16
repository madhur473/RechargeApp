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
	int createRecharge(List<Recharge> relst, int accountNumber);
	boolean updateAccountBalance(float accountBalance, int AccountNumber);
	Register retrieveUserByUsername(String username);
    boolean transferFunds(int fromAccount, int toAccount, float amount);
	float getAccountBalance(int accountNumber);
    List<FundTransfer> getFundTransferHistory(int accountNumber); 
    List<Recharge> getRechargeHistory(int accountNumber); 



	

}
