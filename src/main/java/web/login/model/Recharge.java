package web.login.model;

public class Recharge {
	
	private String phoneNumber;
	private String provider;
	private String selectedPlan;
	private float planAmount;
	public Recharge(String phoneNumber, String provider, String selectedPlan, float planAmount) {
		super();
		this.phoneNumber = phoneNumber;
		this.provider = provider;
		this.selectedPlan = selectedPlan;
		this.planAmount = planAmount;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public String getSelectedPlan() {
		return selectedPlan;
	}
	public void setSelectedPlan(String selectedPlan) {
		this.selectedPlan = selectedPlan;
	}
	public float getPlanAmount() {
		return planAmount;
	}
	public void setPlanAmount(float planAmount) {
		this.planAmount = planAmount;
	}
	
	
}