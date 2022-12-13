package com.boydlever.auth.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.boydlever.auth.models.Book;
import com.boydlever.auth.models.User;
import com.boydlever.auth.services.BookService;
import com.boydlever.auth.services.UserService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
    @GetMapping("/books")
    public String dashboard(HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userService.oneUser(userId));
    	
    	model.addAttribute("bookList", bookService.allBooks());
    	return "dashboard.jsp";
    }
    //Create book
    //display the form
    @GetMapping("/books/new")
    public String displayNewBookForm(@ModelAttribute("newBook")Book newBook, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	return "newBook.jsp";
    }
    //process the form
	@PostMapping("/books/new")
	public String processBookForm(@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId"); //technically it is not needed; we like to set things
			User user = userService.oneUser(userId); //utilizing the id that is already in session
			newBook.setUser(user);
			bookService.createBook(newBook);
			return "redirect:/books";
		}
	}
	//Edit book: 1. get id from path variable 2. get book from service 3. form
	//display the form
	@GetMapping("/books/edit/{id}")
	public String displayEditBookForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
		Book foundBook = bookService.oneBook(id);
		model.addAttribute("foundBook", foundBook);
		return "editBook.jsp";
	}
	//route to process the book edit form with put
	@PutMapping("/books/edit")
	public String processUpdate(@Valid @ModelAttribute("foundBook") Book book,
			BindingResult result) {
		if(result.hasErrors()) {
			return "editBook.jsp";
		}else {
			bookService.editBook(book);
			return "redirect:/books";
		}
	}
	//Delete
	@DeleteMapping("/books/delete/{id}")
	public String processdeleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
		}
	// Display a particular book's details
	@GetMapping("/books/{id}")
	public String displayBookDetails(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
		Book book = bookService.oneBook(id);
		model.addAttribute("book", book);
		return "bookDetails.jsp";
	}
}
