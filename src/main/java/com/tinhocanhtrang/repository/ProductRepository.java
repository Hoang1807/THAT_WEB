package com.tinhocanhtrang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.entity.Spec;


public interface ProductRepository extends JpaRepository<Product, String> {
	@Procedure(name = "dbo.SP_FilterProAndPrice")
	@Query(value = "CALL dbo.SP_FilterProAndPrice()", nativeQuery = true)
    List<Product> SP_FilterProAndPrice(String dm,String sx);
	
	@Query(value="Select o From Product o Where o.category.categoryId=?1 and o.producer.producerId=?2")
	List<Product> findProductRelate(String cate,String produc);

	@Query(value="select o from Product o where o.category.categoryId=?1")
	Page<Product> findbyCategory(String cate,Pageable pageable);
	
	@Query(value="select o from Product o where o.category.categoryId=?1 and o.producer.producerId=?2")
	Page<Product> findbyCategoryandProducer(String cate,String prod,Pageable pageable);

	@Query(value="select o from Product o where o.productId=?1")
	Product findProdById(String id);
}
