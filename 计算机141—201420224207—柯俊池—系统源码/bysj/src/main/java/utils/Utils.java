package utils;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author:kjc
 * @version @Date:2018年3月23日下午9:52:41
 * @Information:
 * 
 */
public class Utils {

	/**
	 * 封装request请求参数到Map里
	 *
	 * @param request
	 * @return
	 */
	public static Map<String, String> paramsToMap(HttpServletRequest request) {
		Map<String, String> params = new HashMap<String, String>();
		// 得到枚举类型的参数名称，参数名称若有重复的只能得到第一个
		Enumeration em = request.getParameterNames();
		while (em.hasMoreElements()) {
			String paramName = (String) em.nextElement();
			String paramValue = request.getParameter(paramName);
			// 形成键值对应的map
			params.put(paramName, paramValue);
		}
		return params;
	}

	/**
	 * 验证手机号码
	 *
	 * 移动号码段:139、138、137、136、135、134、150、151、152、157、158、159、182、183、187、188、147
	 * 联通号码段:130、131、132、136、185、186、145 电信号码段:133、153、180、189
	 *
	 * @param cellphone
	 * @return
	 */
	public static boolean checkCellphone(String cellphone) {
		String regex = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0-9]))\\d{8}$";
		return Pattern.matches(regex, cellphone);
	}

}
