package pre.vote.dao;

import java.util.List;

import pre.vote.model.Option;

public interface OptionDao {
	public int saveOption(Option option);
	public List<Option> showOption();
	public List<Option> showOptionByName(int vname);
	public int remove(Option option);
	public int addNum(Option option);
	public List<Option> showResult();
	public List<Option> showResultByContent(String content);
}
