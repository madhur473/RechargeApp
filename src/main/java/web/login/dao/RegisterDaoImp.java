package web.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import web.login.model.FundTransfer;
import web.login.model.Login;
import web.login.model.Recharge;
import web.login.model.Register;
import web.login.model.Transaction;

public class RegisterDaoImp implements RegisterDao {
	int i=0;
	private Connection con=null;
	private PreparedStatement pstate;
	private ResultSet result;
	
	@Override
	public int createRecord(List<Register> lst) {
		
		int i=0;
		Connection con=DBConnection.myConnection();
		Register rmodel=lst.get(0);
		
		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO RechargeApp (accNumber, accFname, accUname, accPassword, gender, email, phone, accBal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			pstate.setInt(1,rmodel.getAccNumber());
			pstate.setString(2, rmodel.getAccFname());
			pstate.setString(3, rmodel.getAccUname());
			pstate.setString(4, rmodel.getAccPassword());
			pstate.setString(5, rmodel.getGender());
			pstate.setString(6, rmodel.getEmail());
			pstate.setString(7, rmodel.getPhone());
			pstate.setFloat(8, rmodel.getAccBal());
			i = pstate.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public boolean validateUser(List<Login> lstLogin) {
	    boolean isValidUser = false;

	    try (Connection con = DBConnection.myConnection();
	         PreparedStatement pstate = con.prepareStatement("SELECT * FROM RechargeApp WHERE accUname=? AND accPassword=?")) {

	        Login lobj = lstLogin.get(0);
	        pstate.setString(1, lobj.getUserName());
	        pstate.setString(2, lobj.getPassword());

	        try (ResultSet result = pstate.executeQuery()) {
	            isValidUser = result.next(); // If there's any result, set isValidUser to true
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Handle this exception more gracefully in production
	    }

	    return isValidUser;
	}
	   @Override
	    public Register retrieveUserByUsername(String username) {
	        Register user = null;
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            con = DBConnection.myConnection();
	            ps = con.prepareStatement("SELECT * FROM RechargeApp WHERE accUname = ?");
	            ps.setString(1, username);
	            rs = ps.executeQuery();

	            if (rs.next()) {
	                user = new Register(
	                    rs.getInt("accNumber"),
	                    rs.getString("accFname"),
	                    rs.getString("accUname"),
	                    rs.getString("accPassword"),
	                    rs.getString("gender"),
	                    rs.getString("email"),
	                    rs.getString("phone"),
	                    rs.getFloat("accBal")
	                );
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Close resources
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return user;
	    }
	
	@Override
	public int createRecharge(List<Recharge> relst, int accountNumber) {
	    int i = 0;
	    Connection con = DBConnection.myConnection();
	    Recharge remodel = relst.get(0);
	    
	    try {
	        PreparedStatement pstate = con.prepareStatement("INSERT INTO RechargeDetails (accountNumber, phoneNumber, provider, selectedPlan, planAmount) VALUES (?, ?, ?, ?, ?)");
	        pstate.setInt(1, accountNumber);
	        pstate.setString(2, remodel.getPhoneNumber());
	        pstate.setString(3, remodel.getProvider());
	        pstate.setString(4, remodel.getSelectedPlan());
	        pstate.setFloat(5, remodel.getPlanAmount());

	        i = pstate.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return i;
	}

	@Override
		 public boolean updateAccountBalance(float accountBalance, int AccountNumber) {
		        boolean updated = false;
		        Connection con = null;
		        try {            
		            con = DBConnection.myConnection(); // Establish database connection
		            PreparedStatement statement = con.prepareStatement("UPDATE RechargeApp SET accbal = ? WHERE accNumber = ?");
		            statement.setFloat(1, accountBalance);
		            statement.setInt(2, AccountNumber); 

		            int rowsUpdated = statement.executeUpdate();
		            updated = rowsUpdated > 0;
		        } catch (SQLException e) {
		            e.printStackTrace(); // Handle SQL exceptions appropriately
		        } finally {
		            try {
		                if (con != null) {
		                    con.close(); // Close connection
		                }
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		        return updated;
		    
    }





	
	
	public boolean transferFunds(int fromAccount, int toAccount, float amount) {
        boolean success = false;
        Connection con = null;
        PreparedStatement pstate = null;
        ResultSet result = null;

        try {
            con = DBConnection.myConnection();
            con.setAutoCommit(false); // Start transaction

            // Check sender's balance
            pstate = con.prepareStatement("SELECT accBal FROM RechargeApp WHERE accNumber = ?");
            pstate.setInt(1, fromAccount);
            result = pstate.executeQuery();
            if (!result.next()) {
                return false; // Sender account does not exist
            }
            float fromBalance = result.getFloat("accBal");

            if (fromBalance < amount) {
                return false; // Insufficient funds
            }

            // Deduct from sender
            pstate = con.prepareStatement("UPDATE RechargeApp SET accBal = accBal - ? WHERE accNumber = ?");
            pstate.setFloat(1, amount);
            pstate.setInt(2, fromAccount);
            pstate.executeUpdate();

            // Check recipient account
            pstate = con.prepareStatement("SELECT accBal FROM RechargeApp WHERE accNumber = ?");
            pstate.setInt(1, toAccount);
            result = pstate.executeQuery();
            if (!result.next()) {
                con.rollback(); // Recipient account does not exist, rollback
                return false;
            }

            // Add to recipient
            pstate = con.prepareStatement("UPDATE RechargeApp SET accBal = accBal + ? WHERE accNumber = ?");
            pstate.setFloat(1, amount);
            pstate.setInt(2, toAccount);
            pstate.executeUpdate();
            
            // Insert transaction record
            pstate = con.prepareStatement("INSERT INTO FundTransfers (fromAccount, toAccount, amount) VALUES (?, ?, ?)");
            pstate.setInt(1, fromAccount);
            pstate.setInt(2, toAccount);
            pstate.setFloat(3, amount);
            pstate.executeUpdate();

            con.commit(); // Commit transaction
            success = true;
        } catch (SQLException e) {
            try {
                if (con != null) con.rollback(); // Rollback on error
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (result != null) result.close();
                if (pstate != null) pstate.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    @Override
    public float getAccountBalance(int accountNumber) {
        float balance = 0;
        Connection con = null;
        PreparedStatement pstate = null;
        ResultSet result = null;

        try {
            con = DBConnection.myConnection();
            pstate = con.prepareStatement("SELECT accBal FROM RechargeApp WHERE accNumber = ?");
            pstate.setInt(1, accountNumber);
            result = pstate.executeQuery();
            if (result.next()) {
                balance = result.getFloat("accBal");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (result != null) result.close();
                if (pstate != null) pstate.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return balance;
    }
    @Override
    public List<FundTransfer> getFundTransferHistory(int accountNumber) {
        List<FundTransfer> transferList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstate = null;
        ResultSet result = null;

        try {
            con = DBConnection.myConnection();
            pstate = con.prepareStatement("SELECT fromAccount, toAccount, amount FROM FundTransfers WHERE fromAccount = ? OR toAccount = ? ORDER BY transferDate DESC");
            pstate.setInt(1, accountNumber);
            pstate.setInt(2, accountNumber);
            result = pstate.executeQuery();

            while (result.next()) {
                transferList.add(new FundTransfer(
                    result.getString("fromAccount"),
                    result.getString("toAccount"),
                    result.getDouble("amount")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (result != null) result.close();
                if (pstate != null) pstate.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return transferList;
    }

    @Override
    public List<Recharge> getRechargeHistory(int accountNumber) {
        List<Recharge> rechargeList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstate = null;
        ResultSet result = null;

        try {
            con = DBConnection.myConnection();
            // Ensure the SQL query includes the 'selectedPlan' column if it exists
            pstate = con.prepareStatement("SELECT phoneNumber, provider, selectedPlan, planAmount FROM RechargeDetails WHERE accountNumber = ?");
            pstate.setInt(1, accountNumber);
            result = pstate.executeQuery();

            while (result.next()) {
                rechargeList.add(new Recharge(
                    result.getString("phoneNumber"),
                    result.getString("provider"),
                    result.getString("selectedPlan"),
                    result.getFloat("planAmount")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (result != null) result.close();
                if (pstate != null) pstate.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return rechargeList;
    }

}
