package pre.vote.dao;

import java.util.List;

import pre.vote.model.Vote;

public interface VoteDao {
	   public List<Vote> showVoteAll();
	   public int addVote(Vote vote);
	   public List<Vote> showByContent(Vote vote);
}
