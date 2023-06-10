package com.tinhocanhtrang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
    
}
