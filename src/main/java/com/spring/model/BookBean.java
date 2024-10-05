package com.spring.model;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BookBean {

	private int id;
	@NotNull
	private String title;
	@NotNull
	private String author;
	@NotNull
	private double price;
	@NotNull
	private int quantity;
}
