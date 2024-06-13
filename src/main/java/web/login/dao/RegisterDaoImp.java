package web.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import web.login.model.Login;
import web.login.model.Recharge;
import web.login.model.Register;

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
	public int createRecharge(List<Recharge> relst) {
		int i=0;
		Connection con=DBConnection.myConnection();
		Recharge remodel=relst.get(0);
		
		// Assuming you have established a connection named "con"
		try {
			PreparedStatement pstate = con.prepareStatement("INSERT INTO RechargeDetails (phoneNumber, provider, selectedPlan, planAmount) VALUES (?, ?, ?, ?)");
			pstate.setString(1, remodel.getPhoneNumber());
			pstate.setString(2, remodel.getProvider());
			pstate.setString(3, remodel.getSelectedPlan());
			pstate.setFloat(4, remodel.getPlanAmount());

			i = pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	@Override
	public int deleteRecord(int accNumber) {
		Connection con=DBConnection.myConnection();
		int i=0;

		try {
			PreparedStatement pstate=con.prepareStatement("delete from bank where acc_number=?");
			pstate.setInt(1, accNumber);
			i=pstate.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int updateRecord(List<Register> lst) {
		Connection con=DBConnection.myConnection();
		con=DBConnection.myConnection();
		for(Register b:lst)
		{
			try {
				PreparedStatement pstate=con.prepareStatement("update bank set acc_bal=? where acc_number=?");
				pstate.setInt(2, b.getAccNumber());
				pstate.setFloat(1, b.getAccBal());
				int result=pstate.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public List<Register> retriveRecord(int accNumber) {
		List<Register> lst=null;
		Connection con=DBConnection.myConnection();
		
		try {
			PreparedStatement pstate=con.prepareStatement("Select * from bank where acc_Number=?");
			pstate.setInt(1, accNumber);
			result=pstate.executeQuery();
			lst=new ArrayList<Register>();
			if(result.next())
			{
				System.out.println("Result found.....");
				//lst.add(new Register(result.getInt(1),result.getString(2),result.getString(3),result.getString(4),result.getFloat(5)));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<Register> displayAll() {
	    List<Register> lst = new ArrayList<>();
	    Connection con = DBConnection.myConnection();
	    ResultSet result = null; // Initialize ResultSet
	    
	    try {
	        PreparedStatement pstate = con.prepareStatement("SELECT * FROM bank");
	        result = pstate.executeQuery();
	        
	        while (result.next()) {
	            // Create a new Register object for each record and add it to the list
//	            lst.add(new Register(result.getInt(1), result.getString(2), result.getString(3), result.getString(4), result.getFloat(5)));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close ResultSet, PreparedStatement, and Connection
	        try {
	            if (result != null) result.close();
	            if (pstate != null) pstate.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return lst;
	}

	
}
