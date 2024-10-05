package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spring.model.BookBean;



public class BookRepository {

	public List<BookBean> showAllBook() {
		List<BookBean> bookList = new ArrayList<BookBean>();
		
		BookBean book = null;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM book where status<>0");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				book = new BookBean();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setQuantity(rs.getInt(6));
				
				bookList.add(book);
				
			}
			
		} catch (SQLException e) {
			System.out.println("Book List : " + e.getMessage());
		}
		
		return bookList;
	}
	
	public BookBean showBookbyId(int bookId) {
		
		BookBean book = null;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM book where id=?");
			ps.setInt(1, bookId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				book = new BookBean();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setQuantity(rs.getInt(6));
	
			}
			
		} catch (SQLException e) {
			System.out.println("Book List : " + e.getMessage());
		}
		
		return book;
	}
	
	public int insertBook(BookBean bean) {
		
		int i = 0;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into book(title,author,price,quantity) values(?,?,?,?)");
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setDouble(3, bean.getPrice());
			ps.setInt(4, bean.getQuantity());
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Book insert error : " + e.getMessage());
	  }
		
		return i;
	}
	
	public int updateBook(BookBean bean) {
		
		int i = 0;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update book set title=? , author=? , price=? , quantity=? where id=?");
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setDouble(3, bean.getPrice());
			ps.setInt(4, bean.getQuantity());
			ps.setInt(5, bean.getId());
			
			i = ps.executeUpdate();
			System.out.println("The book was updated successfully.");
			} catch (SQLException e) {
			System.out.println("Update book : " + e.getMessage());
			}
		
		return i;
		}
	
	public int deleteBook(int id) {
		
		int i = 0;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update book set status=0 where id=?");
			ps.setInt(1,id);
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete book : " + e.getMessage());
		}
		
		return i;
	}

	public List<BookBean> showDeletedBooks() {
		List<BookBean> bookList = new ArrayList<BookBean>();
		
		BookBean book = null;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM book where status=0");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				book = new BookBean();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setQuantity(rs.getInt(6));
				bookList.add(book);
				
			}
			
		} catch (SQLException e) {
			System.out.println("Book List : " + e.getMessage());
		}
		
		return bookList;
	}

	public int restoreBook(int id) {
		
		int i = 0;
		Connection con = UserConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update book set status=1 where id=?");
			ps.setInt(1,id);
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Restore book : " + e.getMessage());
		}
		
		return i;
	}
}
