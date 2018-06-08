package com.jkc.msg.entity;

/**
@Author:kjc
@version  @Date:2018年4月6日下午9:56:15
@Information:

*/
import java.util.Date;

public class MsgReferTo {
	private String id;

	private String msgid;

	private String userid;

	private String usertype;

	private String status;

	private Date releasetime;

	private String refertype;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getMsgid() {
		return msgid;
	}

	public void setMsgid(String msgid) {
		this.msgid = msgid == null ? null : msgid.trim();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid == null ? null : userid.trim();
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype == null ? null : usertype.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public String getRefertype() {
		return refertype;
	}

	public void setRefertype(String refertype) {
		this.refertype = refertype == null ? null : refertype.trim();
	}
}
