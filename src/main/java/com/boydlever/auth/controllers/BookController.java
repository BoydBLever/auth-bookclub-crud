package com.boydlever.auth.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.boydlever.auth.models.Book;
import com.boydlever.auth.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
    @GetMapping("/books")
    public String dashboard(HttpSession session, Model model) {
    	if(session.getAttribute("userId") ==null) {
    		return "redirect:/";
    	}
    	model.addAttribute("bookList", bookService.allBooks());
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
			return "redirect:/books";
		}
	}
	//Edit book: 1. get id from path variable 2. get book from service 3. form
	//display the form
	@GetMapping("/books/edit/{id}")
	public String displayEditBookForm(@PathVariable("id")Long id, Model model) {
		Book foundBook = bookService.oneBook(id);
		model.addAttribute("foundBook", foundBook);
		return "editBook.jsp";
	}
	//route to process the book edit form with put
	@PutMapping("/books/edit/{id}")
	public String processUpdate(@Valid @ModelAttribute("foundBook") Book book,
			BindingResult result) {
		if(result.hasErrors()) {
			return "editBook.jsp";
		}else {
			bookService.editBook(book);
			return "redirect:/books";
		}
	}
	//Delete Book
	@GetMapping("/books/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
		}
}
