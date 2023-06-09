package com.tinhocanhtrang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, String> {
	public boolean existsByCategoryId(String categoryId);
}
