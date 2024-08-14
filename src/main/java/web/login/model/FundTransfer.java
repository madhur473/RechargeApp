package web.login.model;

public class FundTransfer {

	private String fromAccount;
	private String toAccount;
	private double amount;
	public FundTransfer(String fromAccount, String toAccount, double amount) {
		super();
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
		this.amount = amount;
	}
	public String toString() {
	    return "FundTransfer [fromAccount=" + fromAccount + ", toAccount=" + toAccount + ", amount=" + amount + "]";
	}

	public String getFromAccount() {
		return fromAccount;
	}
	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}
	public String getToAccount() {
		return toAccount;
	}
	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
