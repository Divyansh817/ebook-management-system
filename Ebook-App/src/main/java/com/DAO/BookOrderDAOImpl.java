package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderDAOImpl implements BookOrderDAO {

	private Connection conn;

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i = 1;
		try {
			String sql = "Select * From book_order";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {

			String sql = "Insert into book_order(order_id, user_name, email, address, phone, book_name, author, price, payment) Values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for (Book_Order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getPhno());
				ps.setString(6,  b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setDouble(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
				
			}
			
			ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Order> getOrderByEmail(String email) {
		List<Book_Order> blist = new ArrayList<Book_Order>();
		Book_Order b = null;
		
		try {
			
			String sql = "Select * From book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Book_Order();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				blist.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return blist;
	}

	@Override
	public List<Book_Order> getAllOrder() {
		
		List<Book_Order> blist = new ArrayList<Book_Order>();
		Book_Order b = null;
		
		
		try {
			
			String sql = "Select * From book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new Book_Order();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				blist.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blist;
	}
	

}
