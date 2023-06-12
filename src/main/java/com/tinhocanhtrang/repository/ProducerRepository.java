package com.tinhocanhtrang.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Producer;

public interface ProducerRepository extends JpaRepository<Producer, String> {
	public boolean existsByProducerId(String producerId);
	
	public Page<Producer> findByProducerNameLikeOrProducerIdLike(String producerName, String producerId,Pageable pageble);
}
