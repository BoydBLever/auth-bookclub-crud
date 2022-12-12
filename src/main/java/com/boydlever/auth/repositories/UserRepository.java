package com.boydlever.auth.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.boydlever.auth.models.User;

@Repository
public interface UserRepository extends CrudRepository <User,Long>{
	Optional<User> findByEmail(String email);
	
}
	
	//Relationship between user and book is one to many
	//Foreign key is stored in book: book_id
	//MySQL database for the user will not change