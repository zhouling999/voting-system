package pre.vote.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pre.vote.dao.VoteDao;
import pre.vote.model.User;
import pre.vote.model.Vote;
import pre.vote.util.JDBCUtil;

public class VoteDaoImpl implements VoteDao{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	//显示vote列表
	@Override
	public List<Vote> showVoteAll() {
		List<Vote> voteList = new ArrayList<Vote>();
		Vote newVote = null;
		// sql
		String sql = "select vid,vname,content  from vote order by vid desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?

			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newVote = new Vote();
				newVote.setVid(rs.getInt("vid"));
				newVote.setVname(rs.getInt("vname"));
				newVote.setContent(rs.getString("content"));

				voteList.add(newVote);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return voteList;
	}
	
    //添加新项目
	@Override
	public int addVote(Vote vote) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "insert into vote(vname,content) values(?,?)";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,vote.getVname());
			pstmt.setString(2,vote.getContent());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
    
	//显示题目内容
	@Override
	public List<Vote> showByContent(Vote vote) {
		// TODO Auto-generated method stub
		List<Vote> voteList = new ArrayList<Vote>();
		Vote newVote = null;
		// sql
		String sql = "select vname,content from vote where content regexp '"+vote.getContent()+"'";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?		 
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newVote = new Vote();
				newVote.setVname(rs.getInt("vname"));
				newVote.setContent(rs.getString("content"));
				voteList.add(newVote);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return voteList;
	}

}
