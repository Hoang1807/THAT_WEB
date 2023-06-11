package com.tinhocanhtrang.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Producer;

public interface ProducerRepository extends JpaRepository<Producer, String> {
	public boolean existsByProducerId(String producerId);
}
