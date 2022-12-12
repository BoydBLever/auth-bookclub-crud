package com.boydlever.auth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.boydlever.auth.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
    @GetMapping("/books")
    public String dashboard(HttpSession session) {
    	if(session.getAttribute("userId") ==null) {
    		return "redirect:/";
    	}
    	return "dashboard.jsp";
    }
}
