package com.tinhocanhtrang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.tinhocanhtrang.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
	
	public Page<Product> findByProductIdLike(String producerId,Pageable pageble);
}
