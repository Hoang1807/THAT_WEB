package com.tinhocanhtrang.DAO;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.Image;

public interface ImageDAO extends JpaRepository<Image, Serializable>{

}
