package com.tinhocanhtrang.DAO;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import com.tinhocanhtrang.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Serializable>{
	
	@Procedure(name = "dbo.SP_FilterProAndPrice")
	@Query(value = "CALL dbo.SP_FilterProAndPrice()", nativeQuery = true)
    List<Product> SP_FilterProAndPrice(String dm,String sx);
	
	@Query(value="Select o From Product o Where o.category.categoryId=?1 and o.producer.producerId=?2")
	List<Product> findProductRelate(String cate,String produc);
}
