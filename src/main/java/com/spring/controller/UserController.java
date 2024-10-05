package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.UserBean;
import com.spring.repository.UserRepository;

@Controller

@RequestMapping(value="/user")

public class UserController {

	@Autowired
	private UserRepository repo;
	 
	@GetMapping(value="/register")
	public ModelAndView showRegister() {
		return new ModelAndView("register" , "userObj" , new UserBean());
	}
	@PostMapping(value="/insert")
	public String doRegister(@ModelAttribute("userObj")UserBean bean , Model model) {
		
		int i = repo.insertUser(bean);
		
		if(i>0) {
			
			return "redirect:/";
		}
		else {
			model.addAttribute("error", "An error occurred while creating the account. Please try again.");
			return "register";	
		}
	}
	
}
