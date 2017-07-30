package pre.vote.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pre.vote.util.JDBCUtil;
import pre.vote.dao.OptionDao;
import pre.vote.model.Option;
import pre.vote.model.User;
import pre.vote.model.Vote;

public class OptionDaoImpl implements OptionDao{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	//保存选项
	@Override
	public int saveOption(Option option) {
		// TODO Auto-generated method stub
		int count=0;
		String sql = "insert into ooption(optionname,vname) values(?,?)";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,option.getOption());
			pstmt.setInt(2,option.getVote().getVname());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}

	//显示列表
	@Override
	public List<Option> showOption() {
		// TODO Auto-generated method stub
		List<Option> optionList = new ArrayList<Option>();
		Option option =null;
		//sql
		String sql = "select v.vname vname,v.content content,o.oid oid,o.optionname optionname,o.num num from vote v ,ooption o where v.vname=o.vname order by vname desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				option = new Option();
				Vote  vote= new Vote();
				vote.setVname(rs.getInt("vname"));
				vote.setContent(rs.getString("content"));
				option.setOid(rs.getInt("oid"));
				option.setOption(rs.getString("optionname"));
				option.setNum(rs.getInt("num"));
				option.setVote(vote);
				optionList.add(option);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return optionList;
	}

	//显示选定项目下选项
	@Override
	public List<Option> showOptionByName(int vname) {
		// TODO Auto-generated method stub
		List<Option> showOptionByName = new ArrayList<Option>();
		Option newOption = null;
		// sql
		String sql = "select oid,optionname,num  from ooption where vname=? order by oid ";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
			pstmt.setInt(1,vname);
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newOption = new Option();
				newOption.setOid(rs.getInt("oid"));
				newOption.setOption(rs.getString("optionname"));
				newOption.setNum(rs.getInt("num"));
				showOptionByName.add(newOption);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// return
		return showOptionByName;
	}

	//删除
	@Override
	public int remove(Option option) {
		int count = 0;
		String sql = "delete from ooption where oid=?";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,option.getOid());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	//投票数+1
	@Override
	public int addNum(Option option) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "update ooption set num=num+1 where oid=?";
		conn = JDBCUtil.getConnection(); 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,option.getOid());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	// 结果显示
	@Override
	public List<Option> showResult() {
		// TODO Auto-generated method stub
		List<Option> optionList = new ArrayList<Option>();
		Option option =null;
		//sql
		String sql = "select v.vname vname, v.content content,o.oid oid,o.optionname optionname,o.num num from vote v ,ooption o where v.vname=o.vname order by vname desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				option = new Option();
				Vote  vote= new Vote();
				vote.setVname(rs.getInt("vname"));
				vote.setContent(rs.getString("content"));
				option.setOid(rs.getInt("oid"));
				option.setOption(rs.getString("optionname"));
				option.setNum(rs.getInt("num"));
				option.setVote(vote);
				optionList.add(option);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return optionList;
	}

	@Override
	public List<Option> showResultByContent(String content) {
		// TODO Auto-generated method stub
		List<Option> optionList = new ArrayList<Option>();
		Option option =null;
		// sql
		String sql = "select v.vname vname, v.content content,o.oid oid,o.optionname optionname,o.num num from vote v ,ooption o where v.vname=o.vname and v.content regexp '"+content+"' order by num desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?		 
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				option = new Option();
				Vote  vote= new Vote();
				vote.setVname(rs.getInt("vname"));
				vote.setContent(rs.getString("content"));
				option.setOid(rs.getInt("oid"));
				option.setOption(rs.getString("optionname"));
				option.setNum(rs.getInt("num"));
				option.setVote(vote);
				optionList.add(option);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return optionList;
	}
	}







