package com.tinhocanhtrang.repositoty;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tinhocanhtrang.entity.User;

public interface UserRepository extends JpaRepository<User, String> {
	public boolean existsByUserPhone(String userPhone);

	public boolean existsByUserPhoneAndUserPassword(String userPhone, String userPassword);
}
