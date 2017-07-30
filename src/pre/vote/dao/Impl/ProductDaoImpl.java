package pre.vote.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pre.vote.dao.ProductDao;
import pre.vote.model.Product;
import pre.vote.util.JDBCUtil;

public class ProductDaoImpl implements ProductDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	public boolean saveProduct(Product product) {
		int count = 0;
		boolean flag=false;
		String sql = "insert into product(productName,brand,picture) values(?,?,?)";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,product.getProductName());
			pstmt.setString(2,product.getBrand());
			pstmt.setString(3, product.getPicture());
			count = pstmt.executeUpdate();
			if(count>=1) flag= true;
		} catch (SQLException e) {
		
			e.printStackTrace();
			  flag=false;
		}
		return flag;
		 
	}

	public List<Product> findAll() {
		List<Product> list = new ArrayList<Product>();
		Product product= null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from product ";
			pstmt = conn.prepareStatement(sql);
		 	  	rs = pstmt.executeQuery();
		 	while(rs.next()){
			 	product = new Product();
				 product.setProductName(rs.getString("ProductName"));
				  product.setBrand(rs.getString("Brand"));
				 product.setPicture(rs.getString("Picture"));
				 list.add(product);
			}
		} catch (Exception e) {
		 
			e.printStackTrace();
		} 
		return list;
	}

}
