package com.boydlever.auth.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.boydlever.auth.models.Book;
import com.boydlever.auth.models.User;
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
    //Create book
    //display the form
    @GetMapping("/books/new")
    public String displayNewBookForm(@ModelAttribute("newBook")Book newBook) {
    	return "newBook.jsp";
    }
    //process the form
	@PostMapping("/books/new")
	public String processBookForm(@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		}else {
			bookService.createBook(newBook);
			return "redirect:/dashboard";
		}
	}
}
