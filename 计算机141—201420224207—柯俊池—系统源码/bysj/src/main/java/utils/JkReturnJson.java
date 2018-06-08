package utils;

import com.alibaba.fastjson.JSONObject;

public class JkReturnJson {
	private boolean flag = false; // 是否操作成功,
	private String statusCode = "0000";// 是否成功0000不成功，1000成功
	private String statusMsg = "";// 系统异常信息，例如堆栈信息。

	private String userMsg = "操作成功";// 用户提示信息
	private Object data = "";// 其他信息
	private int total = 0; // 总数

	/**
	 * @return the statusCode
	 */
	public String getStatusCode() {
		return statusCode;
	}

	/**
	 * @param statusCode
	 *            the statusCode to set
	 */
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	/**
	 * @return the statusMsg
	 */
	public String getStatusMsg() {
		return statusMsg;
	}

	/**
	 * @param statusMsg
	 *            the statusMsg to set
	 */
	public void setStatusMsg(String statusMsg) {
		this.statusMsg = statusMsg;
	}

	/**
	 * @return the userMsg
	 */
	public String getUserMsg() {
		return userMsg;
	}

	/**
	 * @param userMsg
	 *            the userMsg to set
	 */
	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	/**
	 * @return the obj
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @param obj
	 *            the obj to set
	 */
	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * 转换成Json字符串
	 * 
	 * @MethodName: getJsonStr
	 * @Description:
	 * @return
	 */
	public String toJsonStr() {
		JSONObject obj = new JSONObject();
		obj.put("statusCode", this.getStatusCode());
		obj.put("statusMsg", this.getStatusMsg());
		obj.put("data", this.getData());
		obj.put("userMsg", this.getUserMsg());
		return obj.toJSONString();
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

}
