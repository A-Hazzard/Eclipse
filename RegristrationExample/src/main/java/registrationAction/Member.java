
package registrationAction;

public class Member {
	private String uname, password, email, phone ;

	public Member(){
		super();
	}

	public Member(String _uname, String _password, String _email, String _phone){
		super();
		this.uname = _uname;
        this.password = _password;
		this.email = _email;
		this.phone = _phone;
	}//end Member
		
		public String getUname(){
			return uname;
		}

		public String getPassword(){
			return password;
		}

		public String getPhone(){
			return phone;
		}

		public String getEmail(){
			return email;
		}

		public void setUname(String _uname){
			this.uname = _uname;
		}

		public void setPassword(String _password){
			this.password = _password;
		}

		public void setPhone(String _phone){
            this.phone = _phone;
        }

		public void setEmail(String _email){
            this.email = _email;
        }

	
}
