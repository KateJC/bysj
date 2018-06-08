package com.jkc.msg.entity;

import java.util.Date;

public class Collect {
	private String msgId;

	private String collectUserId;

	private String collectUserType;

	private Date collectTime;

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId == null ? null : msgId.trim();
	}

	public String getCollectUserId() {
		return collectUserId;
	}

	public void setCollectUserId(String collectUserId) {
		this.collectUserId = collectUserId == null ? null : collectUserId.trim();
	}

	public String getCollectUserType() {
		return collectUserType;
	}

	public void setCollectUserType(String collectUserType) {
		this.collectUserType = collectUserType == null ? null : collectUserType.trim();
	}

	public Date getCollectTime() {
		return collectTime;
	}

	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
}