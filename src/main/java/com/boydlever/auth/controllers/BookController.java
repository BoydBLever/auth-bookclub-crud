package com.boydlever.auth.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.boydlever.auth.models.Book;
import com.boydlever.auth.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
    	if(session.getAttribute("userId") ==null) {
    		return "redirect:/";
    	}
    	return "dashboard.jsp";
    }
    //Create book
    //display the form
    @GetMapping("/books/new")
    public String displayNewBookForm(@ModelAttribute("newBook")Book book) {
    	return "newBook.jsp";
    }
}
