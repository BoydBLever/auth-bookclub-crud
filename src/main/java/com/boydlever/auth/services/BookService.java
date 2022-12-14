package com.boydlever.auth.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boydlever.auth.models.Book;
import com.boydlever.auth.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;
	
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	// find all
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	//find one
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}else {
			return null;
		}
	}
	//edit
	public Book editBook(Book book) {
		return bookRepo.save(book);
	}
	
	//delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
