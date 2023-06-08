package com.tinhocanhtrang.entity;
// Generated Jun 8, 2023, 11:31:01 PM by Hibernate Tools 4.3.6.Final

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "PRODUCT", schema = "dbo", catalog = "THAT")
public class Product implements java.io.Serializable {

	private String productId;
	private Category category;
	private Producer producer;
	private Serializable productName;
	private int productQuantity;
	private double productPrice;
	private Set<BillDetail> billDetails = new HashSet<BillDetail>(0);
	private Set<Spec> specs = new HashSet<Spec>(0);
	private Set<Image> images = new HashSet<Image>(0);

	public Product() {
	}

	public Product(String productId, Category category, Producer producer, Serializable productName,
			int productQuantity, double productPrice) {
		this.productId = productId;
		this.category = category;
		this.producer = producer;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
	}

	public Product(String productId, Category category, Producer producer, Serializable productName,
			int productQuantity, double productPrice, Set<BillDetail> billDetails, Set<Spec> specs, Set<Image> images) {
		this.productId = productId;
		this.category = category;
		this.producer = producer;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.billDetails = billDetails;
		this.specs = specs;
		this.images = images;
	}

	@Id

	@Column(name = "product_id", unique = true, nullable = false, length = 20)
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "producer_id", nullable = false)
	public Producer getProducer() {
		return this.producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	@Column(name = "product_name", nullable = false)
	public Serializable getProductName() {
		return this.productName;
	}

	public void setProductName(Serializable productName) {
		this.productName = productName;
	}

	@Column(name = "product_quantity", nullable = false)
	public int getProductQuantity() {
		return this.productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Column(name = "product_price", nullable = false, precision = 53, scale = 0)
	public double getProductPrice() {
		return this.productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<BillDetail> getBillDetails() {
		return this.billDetails;
	}

	public void setBillDetails(Set<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "products")
	public Set<Spec> getSpecs() {
		return this.specs;
	}

	public void setSpecs(Set<Spec> specs) {
		this.specs = specs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

}
