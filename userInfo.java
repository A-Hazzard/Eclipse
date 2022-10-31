package Servlets;

public class userInfo {
    protected String fName, lName, pwd, email, phone;
    
    public userInfo(String _fName, String lName, String _pwd, String _email, String _phone) {
        this.fName = _fName;
        this.lName = lName;
        this.pwd = _pwd;
        this.email = _email;
        this.phone = _phone;
    } 


    public String getFName() {return fName; }
    public String getLName() { return lName; }
    public String getPwd() { return pwd; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    
    public void setFName(String _fName) { this.fName = _fName; }
    public void setLName(String _lName){ this.lName = _lName;}
    public void setPwd(String _pwd) { this.pwd = _pwd; }
    public void setEmail(String _email) { this.email = _email; }
    public void setPhone(String _phone) { this.phone = _phone; }

    public String toString(){
        return "First name:" + fName + "\nLast name:" + lName + "\nEmail:" + 
        email + "\nPhone:" + phone;
    }
}//end userInfo class