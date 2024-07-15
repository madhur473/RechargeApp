package web.login.model;

public class Transaction {
    private String date;
    private String type;
    private float amount;
    private String recipientOrSender;
    private float balance;

    public Transaction(String date, String type, float amount, String recipientOrSender, float balance) {
        this.date = date;
        this.type = type;
        this.amount = amount;
        this.recipientOrSender = recipientOrSender;
        this.balance = balance;
    }

    // Getters and Setters
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getRecipientOrSender() {
        return recipientOrSender;
    }

    public void setRecipientOrSender(String recipientOrSender) {
        this.recipientOrSender = recipientOrSender;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }
}
