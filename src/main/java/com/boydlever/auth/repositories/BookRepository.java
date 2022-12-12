package com.boydlever.auth.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.boydlever.auth.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
}
