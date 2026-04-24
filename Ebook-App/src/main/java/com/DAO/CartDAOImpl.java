package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;
	
	
	
	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public boolean addCart(Cart c) {
		
		boolean f = false;
		
		try {
			
			String sql = "Insert into cart(bid, uid, bookName, author, price, total_price) Values(?,?,?,?,?,?) ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	@Override
	public List<Cart> getCartByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double total_price = 0;
		
		try {
			
			String sql = "Select * from cart where uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				total_price += rs.getDouble(7);
				c.setTotalPrice(total_price);
				
				list.add(c);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public boolean deleteBook(int cid) {
		boolean f = false;
		try {
			String sql = "Delete from cart where cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cid);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true; 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}
