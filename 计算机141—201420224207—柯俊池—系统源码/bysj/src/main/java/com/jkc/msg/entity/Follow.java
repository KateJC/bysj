package com.jkc.msg.entity;

import java.util.Date;

public class Follow {
	private String initiativeUserID;

	private String passivityUserId;

	private Date operationTime;

	private String initiativeUserType;

	private String passivityUserType;

	public String getInitiativeUserID() {
		return initiativeUserID;
	}

	public void setInitiativeUserID(String initiativeUserID) {
		this.initiativeUserID = initiativeUserID == null ? null : initiativeUserID.trim();
	}

	public String getPassivityUserId() {
		return passivityUserId;
	}

	public void setPassivityUserId(String passivityUserId) {
		this.passivityUserId = passivityUserId == null ? null : passivityUserId.trim();
	}

	public Date getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}

	public String getInitiativeUserType() {
		return initiativeUserType;
	}

	public void setInitiativeUserType(String initiativeUserType) {
		this.initiativeUserType = initiativeUserType == null ? null : initiativeUserType.trim();
	}

	public String getPassivityUserType() {
		return passivityUserType;
	}

	public void setPassivityUserType(String passivityUserType) {
		this.passivityUserType = passivityUserType == null ? null : passivityUserType.trim();
	}
}