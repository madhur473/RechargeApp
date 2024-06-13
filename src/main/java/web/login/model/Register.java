package web.login.model;

public class Register {
    private int accNumber;
    private String accFname;
    private String accUname;
    private String accPassword;
    private String gender;
    private String email;
    private String phone;
    private float accBal;
    
    public Register() {
        
    }
    
    public Register(int accNumber, String accFname, String accUname, String accPassword, String gender, String email, String phone, float accBal) {
        super();
        this.accNumber = accNumber;
        this.accFname = accFname;
        this.accUname = accUname;
        this.accPassword = accPassword;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.accBal = accBal;
    }

    public int getAccNumber() {
        return accNumber;
    }
    public void setAccNumber(int accNumber) {
        this.accNumber = accNumber;
    }
    public String getAccFname() {
        return accFname;
    }
    public void setAccFname(String accFname) {
        this.accFname = accFname;
    }
    public String getAccUname() {
        return accUname;
    }
    public void setAccUname(String accUname) {
        this.accUname = accUname;
    }
    public String getAccPassword() {
        return accPassword;
    }
    public void setAccPassword(String accPassword) {
        this.accPassword = accPassword;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public float getAccBal() {
        return accBal;
    }
    public void setAccBal(float accBal) {
        this.accBal = accBal;
    }
}
