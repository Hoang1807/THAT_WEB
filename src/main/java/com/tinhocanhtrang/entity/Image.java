package com.tinhocanhtrang.entity;
// Generated Jun 8, 2023, 11:31:01 PM by Hibernate Tools 4.3.6.Final

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
<<<<<<< HEAD
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
=======
import jakarta.persistence.Table;
>>>>>>> df1cbf8853dfec96a40bd4451cb6f0b7404b7d71

/**
 * Image generated by hbm2java
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "IMAGE", schema = "dbo", catalog = "THAT")
<<<<<<< HEAD
public class Image implements Serializable {
	
	@Id
	@Column(name = "image_link", length = 255)
	private String image_link;
	
	
	@ManyToOne
    @JoinColumn(name = "product_id" , insertable = false, updatable = false)
    private Product product;
=======
public class Image implements java.io.Serializable {

	private String imageLink;
	private Product product;

	public Image() {
	}

	public Image(String imageLink, Product product) {
		this.imageLink = imageLink;
		this.product = product;
	}

	@Id

	@Column(name = "image_link", unique = true, nullable = false)
	public String getImageLink() {
		return this.imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

>>>>>>> df1cbf8853dfec96a40bd4451cb6f0b7404b7d71
}
