package com.tinhocanhtrang.entity;
// Generated Jun 8, 2023, 11:31:01 PM by Hibernate Tools 4.3.6.Final

import java.io.Serializable;
import java.util.List;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * Product generated by hbm2java
 */
@Data
@AllArgsConstructor
@Entity
@Table(name = "PRODUCT", schema = "dbo", catalog = "THAT")
@NoArgsConstructor
public class Product implements Serializable {

	private String productId;
	private Category category;
	private Producer producer;
	private String productName;
	private int productQuantity;
	private double productPrice;
	private List<BillDetail> billDetails;
	private List<Spec> specs;
	private List<Image> images;
	
	
	

	@Id
	@Column(name = "product_id", unique = true, nullable = false, length = 20)
	public String getProductId() {
		return this.productId;
	}

	public void ListProductId(String productId) {
		this.productId = productId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void ListCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "producer_id", nullable = false)
	public Producer getProducer() {
		return this.producer;
	}

	public void ListProducer(Producer producer) {
		this.producer = producer;
	}

	@Column(name = "product_name", nullable = false)
	public String getProductName() {
		return this.productName;
	}

	public void ListProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "product_quantity", nullable = false)
	public int getProductQuantity() {
		return this.productQuantity;
	}

	public void ListProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Column(name = "product_price", nullable = false, precision = 53, scale = 0)
	public double getProductPrice() {
		return this.productPrice;
	}

	public void ListProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public List<BillDetail> getBillDetails() {
		return this.billDetails;
	}

	public void ListBillDetails(List<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "products")
	public List<Spec> getSpecs() {
		return this.specs;
	}

	public void ListSpecs(List<Spec> specs) {
		this.specs = specs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public List<Image> getImages() {
		return this.images;
	}

	public void ListImages(List<Image> images) {
		this.images = images;
	}

}
