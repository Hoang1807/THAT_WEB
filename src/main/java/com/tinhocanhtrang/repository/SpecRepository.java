package com.tinhocanhtrang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tinhocanhtrang.entity.Spec;

public interface SpecRepository extends JpaRepository<Spec, Integer> {
	public boolean existsBySpecIdOrSpecKeyLikeAndSpecValueLike(Integer specId, String specKey, String specValue);

	@Query("SELECT o FROM Spec o WHERE specKey LIKE ?1 AND specValue LIKE ?2")
	public List<Spec> findByName(String specKey, String specValue);

	public Page<Spec> findBySpecKeyContainingOrSpecValueContaining(String specKey, String specValue, Pageable pageable);

	public void deleteBySpecKeyLikeAndSpecValueLike(String specKey, String specValue);

}
