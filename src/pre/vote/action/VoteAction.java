package pre.vote.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import pre.vote.dao.VoteDao;
import pre.vote.model.Vote;

public class VoteAction extends ActionSupport{
	public Vote vote;
	VoteDao voteDao = null;
	public List<Vote> lists =null;
	
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public VoteDao getVoteDao() {
		return voteDao;
	}
	public void setVoteDao(VoteDao voteDao) {
		this.voteDao = voteDao;
	}
	public List<Vote> getLists() {
		return lists;
	}
	public void setLists(List<Vote> lists) {
		this.lists = lists;
	}
   
	//��ʾ������Ŀ��
	public String showVoteAll(){
		lists = voteDao.showVoteAll();
		return "action";
	}
	//���ͶƱ��
	public String addVote(){
		voteDao.addVote(vote);
		return "addsuccess";
	}
	//��ʾ��Ŀ����
	public String showByContent(){
		lists = voteDao.showByContent(getVote());
		return "showcontent";
		
	}
}
