package com.Adminmodel;

public class AdminmodelMVC {

	
	private String username;
	private String currentPass;
	private String newpassword;
	private String Repeatpass;
	
	private String mateName;
	
	
	
	public AdminmodelMVC(String mateName) {
		super();
		this.mateName = mateName;
	}
	public AdminmodelMVC() {
		// TODO Auto-generated constructor stub
	}
	public String getMateName() {
		return mateName;
	}
	public void setMateName(String mateName) {
		this.mateName = mateName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCurrentPass() {
		return currentPass;
	}
	public void setCurrentPass(String currentPass) {
		this.currentPass = currentPass;
	}
	public String getNewpass() {
		return newpassword;
	}
	public void setNewpass(String newpass) {
		this.newpassword = newpass;
	}
	public String getRepeatpass() {
		return Repeatpass;
	}
	public void setRepeatpass(String repeatpass) {
		Repeatpass = repeatpass;
	}
	

}
