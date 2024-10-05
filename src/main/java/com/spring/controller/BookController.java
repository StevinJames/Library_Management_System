package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BookBean;
import com.spring.model.UserBean;
import com.spring.repository.BookRepository;


@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookRepository bookRepo;
	
	@GetMapping(value="/showBook")
	public String showAllbooks(BookBean book , Model model,HttpSession session) {
		
		List<BookBean> list = bookRepo.showAllBook();
		if(list.size() > 0) {
			
			model.addAttribute("list" , list);
			UserBean obj = (UserBean) session.getAttribute("user");
			
			if(obj.getRole()!= null && obj.getRole().equals("admin")) {
				
				return "bookList";
				
			}
			else {
				return "userBookList";	
			}
		}
		else {
			
			model.addAttribute("error" , "No book avaliable now.");
			return "bookList";
			
		}
	
	}
	@GetMapping("/insertBook")
	public ModelAndView insertBook(BookBean bean , Model model) {
		
		
		model.addAttribute("bean" , bean);
		return new ModelAndView("addBook","bean",new BookBean());
		
	}
	
	@PostMapping(value="/addBook")
	public String addBook(@ModelAttribute("bean")BookBean book , Model model , BindingResult br) {
		
		if (br.hasErrors()) {
	       
	        model.addAttribute("error", "Validation errors occurred. Please correct the details.");
	        return "redirect:/book/addBook";
	    }
		
		int i = bookRepo.insertBook(book);
		
		if(i>0) {
			return "redirect:/book/showBook";
		}
		else {
			
			model.addAttribute("error","Adding book failed!!");
			return "redirect:/book/addBook";
		}
		
	}
	
	
	@GetMapping(value="/editBook/{id}")
	public String selectBookbyId( @PathVariable("id")int id , Model model) {
		
		BookBean obj = bookRepo.showBookbyId(id);
		model.addAttribute("obj" , obj);
		return "editBook";
		
	}
	
	@PostMapping(value="/editBook")
	public String editBook(@ModelAttribute("obj") @Validated BookBean bean , Model model) {
		
		int i = bookRepo.updateBook(bean); 

		if(i>0) {
			return "redirect:/book/showBook";
		}
		else {
			model.addAttribute("error", "Book edit failed!!");
			return "editBook";
		}

	}
	@GetMapping("/deleteBook/{id}")
	public String deleteBook(@PathVariable int id , Model model) {
		
		BookBean book = new BookBean();
		book.setId(id);
		
		int i = bookRepo.deleteBook(id);
		
		if(i == 0) {
			model.addAttribute("error" , "Failed to delete!!");
		}
		return "redirect:/book/showBook";
	}
	
	@GetMapping(value="/showDeletedBooks")
	public String showDeletedBooks(BookBean book , Model model) {
		
		List<BookBean> list = bookRepo.showDeletedBooks();
		if(list.size() > 0) {
			model.addAttribute("list" , list);
			
			return "deleteHistory";
		}
		else {
			
			model.addAttribute("error" , "No book avaliable now.");
			return "deleteHistory";
			
		}
	
	}
	
	
	@GetMapping(value="/restoreBook/{id}")
	public String restoreBook(@PathVariable int id , Model model) {
		
		int i = bookRepo.restoreBook(id);
		
		return "redirect:/book/showBook";
	}
		
}
