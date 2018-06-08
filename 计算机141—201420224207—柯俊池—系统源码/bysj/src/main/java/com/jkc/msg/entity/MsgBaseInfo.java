package com.jkc.msg.entity;

/**
@Author:kjc
@version  @Date:2018年4月6日下午9:54:13
@Information:

*/
import java.util.Date;

public class MsgBaseInfo {
	private String id;

	private String userid;

	private String usertype;

	private String contenttype;

	private String transpondmsgid;

	private Date releasetime;

	private String privilege;

	private String content;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
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

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype == null ? null : contenttype.trim();
	}

	public String getTranspondmsgid() {
		return transpondmsgid;
	}

	public void setTranspondmsgid(String transpondmsgid) {
		this.transpondmsgid = transpondmsgid == null ? null : transpondmsgid.trim();
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege == null ? null : privilege.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}
}
