package pre.vote.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pre.vote.util.JDBCUtil;
import pre.vote.util.PageUtil;
import pre.vote.dao.UserDao;
import pre.vote.model.User;

public class UserDaoImpl implements UserDao{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;




	//登录
	@Override
	public String login(User user) {
		String count = null;
		String sql = "select * from user where name='"+user.getName()+"'and pwd='"+user.getPwd()+"'and permission='"+user.getPermission()+"'";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				count="loginsuccess";
			}else{
				count="loginfail";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;



	}
	//注册
	public int saveUser(User user){
		int count=0;
		String sql = "insert into user(name,pwd,email,phone,age,sex,address,permission) values(?,?,?,?,?,?,?,?)";
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,user.getName());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setInt(5, user.getAge());
			pstmt.setString(6, user.getSex());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getPermission());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	//显示列表
	@Override
	public List<User> showUserAll() {
		List<User> userList = new ArrayList<User>();
		User newUser = null;
		// sql
		String sql = "select sid,name,pwd,email,phone,age,sex,address,permission  from user order by sid desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?

			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newUser = new User();
				newUser.setSid(rs.getInt("sid"));
				newUser.setName(rs.getString("name"));
				newUser.setPwd(rs.getString("pwd"));
				newUser.setEmail(rs.getString("email"));
				newUser.setPhone(rs.getString("phone"));
				newUser.setAge(rs.getInt("age"));
				newUser.setSex(rs.getString("sex"));
				newUser.setAddress(rs.getString("address"));
				newUser.setPermission(rs.getString("permission"));

				userList.add(newUser);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return userList;
	}

	//删除
	@Override
	public int remove(User user) {
		int count = 0;
		String sql = "delete from user where sid=?";
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1,user.getSid());


			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	//记录数据量
	@Override
	public int userCount() {
		 // sql
		int count=0;
		String sql = "select count(sid) c from user ";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
   
			rs = pstmt.executeQuery();
			// rs
			if (rs.next()) {
				count= (rs.getInt("c"));
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return count;
	}
	//显示所有分页
	@Override
	public List<User> showUserAllPage(Map map) {
		List<User> userList = new ArrayList<User>();
		User newUser = null;
		// sql
		String sql = " select sid,name,pwd,email,phone,age,sex,address,permission  from user   order by sid ASC  LIMIT ?,?";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
			//銆妔elect   select where =#{page.minNum}
             pstmt.setInt(1,((PageUtil)map.get("page")).getMinNum());
             pstmt.setInt(2, PageUtil.ROWNUM);
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newUser = new User();
				 newUser.setSid(rs.getInt("sid"));
				 newUser.setName(rs.getString("name"));
				 newUser.setPwd(rs.getString("pwd"));
				 newUser.setEmail(rs.getString("email"));
				 newUser.setPhone(rs.getString("phone"));
				 
				userList.add(newUser);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return userList;
	}
	
	//修改
	@Override
	public int modify(User user) {
		User newUser = null;
		// sql
		int count = 0;
		String sql = "update user set name=?,pwd=?,email=?,phone=?,age=?,sex=?,address=?,permission=? where sid=?";
		conn = JDBCUtil.getConnection(); 
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getPwd());
			pstmt.setString(3,user.getEmail());
			pstmt.setString(4,user.getPhone());
			pstmt.setInt(5,user.getAge());
			pstmt.setString(6,user.getSex());
			pstmt.setString(7,user.getAddress());
			pstmt.setString(8,user.getPermission());
			pstmt.setInt(9,user.getSid());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	//查找id所有信息
	@Override
	public User findUserById(int id) {
		User newUser = null;
		// sql
		String sql = "select sid,name,pwd,email,phone,age,sex,address,permission from user where sid=?";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
			pstmt.setInt(1,id);
		 
			rs = pstmt.executeQuery();
			// rs
			if (rs.next()) {
				newUser = new User();
				newUser.setSid(rs.getInt("sid"));
				newUser.setName(rs.getString("name"));
				newUser.setPwd(rs.getString("pwd"));
				newUser.setEmail(rs.getString("email"));
				newUser.setPhone(rs.getString("phone"));
				newUser.setAge(rs.getInt("age"));
				newUser.setSex(rs.getString("sex"));
				newUser.setAddress(rs.getString("address"));
				newUser.setPermission(rs.getString("permission"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return newUser;
	}
	
	//查找
	@Override
	public List<User> search(User user) {
		List<User> userList = new ArrayList<User>();
		String sql = "select * from user where name regexp '"+user.getName()+"'";
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				user = new User();
				user.setSid(rs.getInt("sid"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getString("sex"));
				user.setAddress(rs.getString("address"));
				user.setPermission(rs.getString("permission"));
				userList.add(user);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userList;
	}



}
