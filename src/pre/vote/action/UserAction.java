package pre.vote.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import pre.vote.dao.UserDao;
import pre.vote.model.User;
import pre.vote.util.PageUtil;
import pre.vote.dao.Impl.UserDaoImpl;

public class UserAction extends ActionSupport implements SessionAware{
	public User user;
	UserDao  userDao =null;
	public List<User> lists=null;
	public PageUtil page = new PageUtil();
	private int goPage;
	public Map<String, Object> session;

	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public PageUtil getPage() {
		return page;
	}


	public void setPage(PageUtil page) {
		this.page = page;
	}


	public int getGoPage() {
		return goPage;
	}


	public void setGoPage(int goPage) {
		this.goPage = goPage;
	}

	public List<User> getLists() {
		return lists;
	}


	public void setLists(List<User> lists) {
		this.lists = lists;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	//添加用户
	public String saveUser(){

		int count= userDao.saveUser(user);
		if(count>0){

			return "registersuccess";
		}else{

			return "registerfail";
		}

	}
	//显示用户列表
	public String showUserAll(){
		lists= userDao.showUserAll();
		return "action";
	}
	//登录
	public String login(){

		String name = user.getName();
		String count= userDao.login(user);
		if(count=="loginsuccess"){
			session.put("name",name );
			return "loginsuccess";
		}else{
			return "loginfail";
		}


	}
	//删除用户
	public String remove(){

		userDao.remove(user);
		lists= userDao.showUserAll();
		return "removesuccess";
	}
	//分页显示
	public String showUserAllPage() {

		int count=userDao.userCount();
		page.setRowPageData(goPage,count);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("page", page);
		map.put("name", "z");
		lists = userDao.showUserAllPage(map);
		return "pagesuccess";
	}
	//按id显示
	public String showUserById(){
		user=this.userDao.findUserById(user.getSid());
		return "modify";
	}
	//修改用户
	public String modify(){
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setSex(request.getParameter("user.sex"));
		user.setPermission(request.getParameter("user.permission"));
		int count = userDao.modify(user);
		lists = userDao.showUserAll();

		if (count > 0) {
			return "success";
		} else {
			return "modify";
		}
	}
	//查找
	public String search(){
		lists=userDao.search(getUser());
		return "search";


	}
}
