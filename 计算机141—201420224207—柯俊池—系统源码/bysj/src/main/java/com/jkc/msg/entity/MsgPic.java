package com.jkc.msg.entity;

import java.util.Date;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:55:35
 * @Information:
 * 
 */
public class MsgPic {
	private String id;

	private String minurl;

	private String url;

	private String msgid;

	private Date releasetime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getMinurl() {
		return minurl;
	}

	public void setMinurl(String minurl) {
		this.minurl = minurl == null ? null : minurl.trim();
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public String getMsgid() {
		return msgid;
	}

	public void setMsgid(String msgid) {
		this.msgid = msgid == null ? null : msgid.trim();
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}
}
