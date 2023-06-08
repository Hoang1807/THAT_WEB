package com.tinhocanhtrang.DAO;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Serializable>{

}
