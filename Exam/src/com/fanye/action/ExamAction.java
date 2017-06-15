package com.fanye.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.fanye.dao.ExamDao;
import com.fanye.dao.QuestionDao;
import com.fanye.model.Exam;
import com.fanye.model.PageBean;
import com.fanye.model.Question;
import com.fanye.util.PageUtil;
import com.fanye.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ExamDao examDao=new ExamDao();
	private QuestionDao questionDao=new QuestionDao();
	
	private HttpServletRequest request;
	
	private Exam exam;
	private Exam s_exam;
	private String mainPage;
	private List<Exam> examList;
	private String page;
	private int total;
	private String pageCode;
	
	
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public Exam getS_exam() {
		return s_exam;
	}

	public void setS_exam(Exam s_exam) {
		this.s_exam = s_exam;
	}

	public List<Exam> getExamList() {
		return examList;
	}

	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String add()throws Exception{
		Map<String, String[]> keyMap=request.getParameterMap();
		Iterator<Entry<String,String[]>> it2=keyMap.entrySet().iterator();
		int totalScore=0;
		int singleScore=0;
		int moreScore=0;
		while(it2.hasNext()){
			Entry<String,String[]> entry=it2.next();
			String keyStr=entry.getKey();
			String values[]=entry.getValue();
			String key;
			String value="";
			if(keyStr.equals("exam.student.id")||keyStr.equals("exam.paper.id")){
				continue;
			}
			if(keyStr.split("-")[1].equals("r")){ // 单选题目
				key=keyStr.split("-")[2];
				value=values[0];
				singleScore+=this.calScore(key, value, "1");
			}else{  // 多选
				key=keyStr.split("-")[2];
				for(String s:values){
					value+=s+",";
				}
				value=value.substring(0, value.length()-1);
				moreScore+=this.calScore(key, value, "2");
			}
		}
		totalScore=singleScore+moreScore;
		exam.setSingleScore(singleScore);
		exam.setMoreScore(moreScore);
		exam.setScore(totalScore);
		exam.setExamDate(new Date());
		
		examDao.saveExam(exam);
		mainPage="exam/examResult.jsp";
		return SUCCESS;
	}

	
	private int calScore(String questionId,String userAnswer,String type)throws Exception{
		Question question=questionDao.getQuestion(questionId);
		if(userAnswer.equals(question.getAnswer())){
			if("1".equals(type)){
				return 20;
			}else{
				return 30;
			}
		}else{
			return 0;
		}
	}

	
	public String getExams()throws Exception{
		examList=examDao.getExams(s_exam,null);
		mainPage="exam/myExam.jsp";
		return SUCCESS;
	}
	
	
	public String list()throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_exam==null){
			Object o=session.getAttribute("s_exam");
			if(o!=null){
				s_exam=(Exam)o;
			}else{
				s_exam=new Exam();
			}
		}else{
			session.setAttribute("s_exam", s_exam);
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page),5);
		examList=examDao.getExams(s_exam,pageBean);
		total=examDao.examCount(s_exam);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/exam!list", total, Integer.parseInt(page), 5);
		mainPage="exam/examList.jsp";
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}
