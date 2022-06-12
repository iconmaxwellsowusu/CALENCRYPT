package com.Adminmodel;


public class tripModel {
	
	protected int id;
	protected String name;
	protected String loading_date;
	protected String waybill;
	protected String truckNumber;
	protected String prdt;
	protected String qty;
	protected String loading_pnt;
	protected String discharging_pnt;
	protected String shortage;
	protected String fuel;
	
	public tripModel(int id, String name, String loading_date, String waybill, String truckNumber, String prdt,
			String qty, String loading_pnt, String discharging_pnt, String shortage, String fuel) {
		super();
		this.id = id;
		this.name = name;
		this.loading_date = loading_date;
		this.waybill = waybill;
		this.truckNumber = truckNumber;
		this.prdt = prdt;
		this.qty = qty;
		this.loading_pnt = loading_pnt;
		this.discharging_pnt = discharging_pnt;
		this.shortage = shortage;
		this.fuel = fuel;
	}

	public tripModel(String name, String loading_date, String waybill, String truckNumber, String prdt, String qty,
			String loading_pnt, String discharging_pnt, String shortage, String fuel) {
		super();
		this.name = name;
		this.loading_date = loading_date;
		this.waybill = waybill;
		this.truckNumber = truckNumber;
		this.prdt = prdt;
		this.qty = qty;
		this.loading_pnt = loading_pnt;
		this.discharging_pnt = discharging_pnt;
		this.shortage = shortage;
		this.fuel = fuel;
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

	public String getLoading_date() {
		return loading_date;
	}

	public void setLoading_date(String loading_date) {
		this.loading_date = loading_date;
	}

	public String getWaybill() {
		return waybill;
	}

	public void setWaybill(String waybill) {
		this.waybill = waybill;
	}

	public String getTruckNumber() {
		return truckNumber;
	}

	public void setTruckNumber(String truckNumber) {
		this.truckNumber = truckNumber;
	}

	public String getPrdt() {
		return prdt;
	}

	public void setPrdt(String prdt) {
		this.prdt = prdt;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getLoading_pnt() {
		return loading_pnt;
	}

	public void setLoading_pnt(String loading_pnt) {
		this.loading_pnt = loading_pnt;
	}

	public String getDischarging_pnt() {
		return discharging_pnt;
	}

	public void setDischarging_pnt(String discharging_pnt) {
		this.discharging_pnt = discharging_pnt;
	}

	public String getShortage() {
		return shortage;
	}

	public void setShortage(String shortage) {
		this.shortage = shortage;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

}
