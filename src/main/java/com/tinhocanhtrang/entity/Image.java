package com.tinhocanhtrang.entity;
// Generated Jun 5, 2023, 1:36:25 PM by Hibernate Tools 4.3.6.Final

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Image generated by hbm2java
 */
@Entity
@Table(name = "IMAGE", schema = "dbo", catalog = "THAT")
public class Image implements java.io.Serializable {

	private String productId;
	private Product product;
	private String imageLink;

	public Image() {
	}

	public Image(Product product) {
		this.product = product;
	}

	public Image(Product product, String imageLink) {
		this.product = product;
		this.imageLink = imageLink;
	}

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "product"))
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "product_id", unique = true, nullable = false, length = 20)
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "image_link", length = 255)
	public String getImageLink() {
		return this.imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

}
