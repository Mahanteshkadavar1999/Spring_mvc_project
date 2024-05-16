package com.aepl_test.controller;

import java.io.File;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.aepl_test.dao.UserDao;
import com.aepl_test.dto.UserRegistration;

@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(@ModelAttribute UserRegistration userRegistration) {
//		 MultipartFile resumeFile = userRegistration.getFile();
//	        if (resumeFile != null && !resumeFile.isEmpty()) {
//	            try {
//	                // Save the file to a directory on the server
//	                String uploadPath = "C:\\Users\\Mahantesh\\OneDrive\\Desktop\\Files"; // Change this to your directory path
//	                String fileName = System.currentTimeMillis() + "_" + resumeFile.getOriginalFilename();
//	                File file = new File(uploadPath, fileName);
//	                resumeFile.transferTo(file);
//	                
//	                // Set the file path in the UserRegistration object
//	                userRegistration.setFile(resumeFile);
//	            } catch (Exception e) {
//	                e.printStackTrace();
//	                return "Error uploading file";
//	            }
//	        }
	        
		long num=userRegistration.getMobilenumber();
		return userDao.find(num, userRegistration);
	}
	

	
}
