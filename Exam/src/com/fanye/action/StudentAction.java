package com.fanye.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fanye.dao.StudentDao;
import com.fanye.model.PageBean;
import com.fanye.model.Student;
import com.fanye.util.DateUtil;
import com.fanye.util.PageUtil;
import com.fanye.util.ResponseUtil;
import com.fanye.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	private StudentDao studentDao=new StudentDao();
	private List<Student> studentList;
	private Student s_student;
	
	private Student student;
	private String error;
	private String mainPage;
	private int total;
	private String page;
	private String pageCode;
	private String title;
	private String id;

	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getPageCode() {
		return pageCode;
	}


	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}


	public Student getS_student() {
		return s_student;
	}


	public void setS_student(Student s_student) {
		this.s_student = s_student;
	}


	public List<Student> getStudentList() {
		return studentList;
	}


	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}


	public String getMainPage() {
		return mainPage;
	}


	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}


	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}


	public String login()throws Exception{
		HttpSession session=request.getSession();
		Student currentUser = studentDao.login(student);
		if(currentUser==null){
			error="准考证号或密码错误";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		}
	}
	
	
	public String preUpdatePassword()throws Exception{
		mainPage="student/updatePassword.jsp";
		return SUCCESS;
	}
	
	public String updatePassword()throws Exception{
		Student s=studentDao.getStudentById(student.getId());
		s.setPassword(student.getPassword());
		studentDao.saveStudent(s);
		mainPage="student/updateSuccess.jsp";
		return SUCCESS;
	}
	
	public String logout()throws Exception{
		request.getSession().invalidate();
		return "logout";
	}
	
	public String list()throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_student==null){
			Object o=session.getAttribute("s_student");
			if(o!=null){
				s_student=(Student)o;
			}else{
				s_student=new Student();
			}
		}else{
			session.setAttribute("s_student", s_student);
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),5);
		studentList=studentDao.getStudents(s_student,pageBean);
		total=studentDao.studentCount(s_student);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/student!list", total, Integer.parseInt(page), 5);
		mainPage="student/studentList.jsp";
		return SUCCESS;
	}
	
	
	public String preSave()throws Exception{
		if(StringUtil.isNotEmpty(id)){
			student=studentDao.getStudentById(id);
			title="修改学生信息";
		}else{
			title="添加学生信息";
		}
		mainPage="student/studentWrite.jsp";
		return SUCCESS;
	}
	
	public String saveStudent()throws Exception{
		if(StringUtil.isEmpty(student.getId())){
			student.setId("Js"+DateUtil.getCurrentDateStr());
		}
		studentDao.saveStudent(student);
		return "save";
	}
	
	
	public String deleteStudent()throws Exception{
		student=studentDao.getStudentById(id);
		studentDao.studentDelete(student);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}
