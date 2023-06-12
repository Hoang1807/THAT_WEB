package com.tinhocanhtrang.entity;
// Generated Jun 8, 2023, 11:31:01 PM by Hibernate Tools 4.3.6.Final

import java.util.List;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * Category generated by hbm2java
 */
@Entity
@Table(name = "CATEGORY", schema = "dbo", catalog = "THAT")
@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category implements java.io.Serializable {

	@Id
	@Column(name = "category_id", unique = true, nullable = false, length = 10)
	private String categoryId;
	@Column(name = "category_name", nullable = false, length = 50)
	private String categoryName;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	private List<Product> products ;

	public Category(String categoryId, String categoryName) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
}
