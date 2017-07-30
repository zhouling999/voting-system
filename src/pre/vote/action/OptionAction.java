package pre.vote.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import pre.vote.dao.OptionDao;
import pre.vote.model.Option;


public class OptionAction extends ActionSupport{
	public Option option;
	public OptionDao optionDao;
	public List<Option> optionList;


	public Option getOption() {
		return option;
	}
	public void setOption(Option option) {
		this.option = option;
	}
	public OptionDao getOptionDao() {
		return optionDao;
	}
	public void setOptionDao(OptionDao optionDao) {
		this.optionDao = optionDao;
	}
	public List<Option> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<Option> optionList) {
		this.optionList = optionList;
	}
	//���ѡ��
	public String saveOption(){
		int count= optionDao.saveOption(option);
		if(count>0){
			optionList= optionDao.showOption();
			return "addsuccess";
		}else{

			return "addfail";
		}
	}
	//��ʾ����ѡ��
	public String showOption(){
		optionList = optionDao.showOption();
		return "showall";
	}
	//����
	public String showOptionByName(){
		optionList= optionDao.showOptionByName(option.getVote().getVname());
		return "showOptionByName";
		
	}
	//ɾ��ͶƱ��
	public String remove(){

		optionDao.remove(option);
		optionList= optionDao.showOption();
		return "removesuccess";
	}
	//ͶƱ��+1
	public String addNum(){
		int count = optionDao.addNum(option);
		if(count>0){
			return "success";
		}else{

			return "addfail";
		}
	}
	//��ʾ������û�
	public String showResult(){
		optionList = optionDao.showResult();
		return "showresult";
	}
	//��ʾ������ݣ�����Ա��
	public String showResultByContent(){
		optionList= optionDao.showResultByContent(option.getVote().getContent());
		return "showresultbycontent";
	}
}
