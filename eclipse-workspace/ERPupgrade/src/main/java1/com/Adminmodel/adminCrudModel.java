package com.Adminmodel;

public class adminCrudModel {
	
	protected int id;
	protected String name;
	protected String category;
	
	protected String truckNumber;
	protected String mateName;
	
	
	public adminCrudModel(int id, String name, String category) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		
	}

	public adminCrudModel(String truckNumber) {
		super();
		this.truckNumber = truckNumber; 
	}
	

	public adminCrudModel(String name, String category) {
		super();
		this.name = name;
		this.category = category;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getTruckNumber() {
		return truckNumber;
	}

	public void setTruckNumber(String truckNumber) {
		this.truckNumber = truckNumber;
	}

	public String getMateName() {
		return mateName;
	}

	public void setMateName(String mateName) {
		this.mateName = mateName;
	}
	

}
