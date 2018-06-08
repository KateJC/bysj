package com.jkc.fileUpload;

import java.awt.List;
/**
@Author:kjc
@version  @Date:2018年5月5日下午3:32:24
@Information:

*/
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/fileUploadController")
public class fileUploadController {

	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList fileUpload(@RequestParam MultipartFile[] file, HttpServletRequest request) {
		ArrayList imgList = new ArrayList();
		if (file != null) {
			String path = null;// 文件路径
			String type[] = new String[file.length];
			String fileName[] = new String[file.length];
			for (int i = 0; i < fileName.length; i++) {
				fileName[i] = file[i].getOriginalFilename();
				type[i] = fileName[i].indexOf(".") != -1
						? fileName[i].substring(fileName[i].lastIndexOf(".") + 1, fileName[i].length()) : null;
			}
			String realPath = "E:\\bysj\\images\\";
			String loadPath = "http://localhost:8888/images/";

			System.out.println(realPath);
			// realPath+="images/";
			String realImgPath[] = new String[file.length];
			String requstPath[] = new String[file.length];
			for (int i = 0; i < file.length; i++) {
				String uuid = UUID.randomUUID().toString();
				realImgPath[i] = realPath + uuid + "." + type[i];
				requstPath[i] = loadPath + uuid + "." + type[i];
			}
			try {
				for (int i = 0; i < file.length; i++) {
					file[i].transferTo(new File(realImgPath[i]));
					imgList.add(requstPath[i]);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(imgList);
		return imgList;
	}

}
