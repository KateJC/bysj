package com.jkc.msg.entity;

import java.util.Date;

public class Praise {
	private String id;

	private String praiseUserId;

	private String praiseType;

	private String praiseId;

	private Date praiseTime;

	private String praiseUserType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getPraiseUserId() {
		return praiseUserId;
	}

	public void setPraiseUserId(String praiseUserId) {
		this.praiseUserId = praiseUserId == null ? null : praiseUserId.trim();
	}

	public String getPraiseType() {
		return praiseType;
	}

	public void setPraiseType(String praiseType) {
		this.praiseType = praiseType == null ? null : praiseType.trim();
	}

	public String getPraiseId() {
		return praiseId;
	}

	public void setPraiseId(String praiseId) {
		this.praiseId = praiseId == null ? null : praiseId.trim();
	}

	public Date getPraiseTime() {
		return praiseTime;
	}

	public void setPraiseTime(Date praiseTime) {
		this.praiseTime = praiseTime;
	}

	public String getPraiseUserType() {
		return praiseUserType;
	}

	public void setPraiseUserType(String praiseUserType) {
		this.praiseUserType = praiseUserType == null ? null : praiseUserType.trim();
	}
}