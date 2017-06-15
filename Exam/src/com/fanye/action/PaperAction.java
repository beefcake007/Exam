package com.fanye.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.fanye.dao.PaperDao;
import com.fanye.dao.QuestionDao;
import com.fanye.model.Paper;
import com.fanye.model.Question;
import com.fanye.util.ResponseUtil;
import com.fanye.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class PaperAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private PaperDao paperDao=new PaperDao();
	private String mainPage;
	private List<Paper> paperList=new ArrayList<Paper>();
	private QuestionDao questionDao=new QuestionDao();
	private String paperId;
	private Paper paper;
	private List<Question> squestionList=new ArrayList<Question>();
	private List<Question> mquestionList=new ArrayList<Question>();
	private String title;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public List<Question> getSquestionList() {
		return squestionList;
	}
	public void setSquestionList(List<Question> squestionList) {
		this.squestionList = squestionList;
	}
	public List<Question> getMquestionList() {
		return mquestionList;
	}
	public void setMquestionList(List<Question> mquestionList) {
		this.mquestionList = mquestionList;
	}
	public String getMainPage() {
		return mainPage;
	}
	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	public List<Paper> getPaperList() {
		return paperList;
	}
	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}
	

	public String list()throws Exception{
		paperList=paperDao.getPapers();
		mainPage="exam/selectPaper.jsp";
		return SUCCESS;
	}
	
	public String paperList()throws Exception{
		paperList=paperDao.getPapers();
		mainPage="paper/paperList.jsp";
		return SUCCESS;
	}
	
	
	public String deletePaper()throws Exception{
		paper=paperDao.getPaper(paperId);
		JSONObject result=new JSONObject();
		if(questionDao.existQestionByPaperId(paperId)){
			result.put("error", "试卷下面有题目，不能删除");
		}else{
			paperDao.paperDelete(paper);
			result.put("success", true);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
	
	public String getDetailPaper()throws Exception{
		paper=paperDao.getPaper(paperId);
		Set<Question> questionList=paper.getQuestions();
		Iterator<Question> it=questionList.iterator();
		while(it.hasNext()){
			Question q=it.next();
			if("1".equals(q.getType())){
				squestionList.add(q);
			}else{
				mquestionList.add(q);
			}
		}
		squestionList=this.getRandomQuestion(squestionList, 3);
		mquestionList=this.getRandomQuestion(mquestionList, 2);
		mainPage="exam/paper.jsp";
		return SUCCESS;
	}
	
	private List<Question> getRandomQuestion(List<Question> questionList,int num){
		List<Question> resultList=new ArrayList<Question>();
		Random random=new Random();
		if(num>0){
			for(int i=1;i<=num;i++){
				int n=random.nextInt(questionList.size());
				Question q=questionList.get(n);
				if(resultList.contains(q)){
					i--;
				}else{
					resultList.add(q);
				}
			}
		}
		return resultList;
	}
	
	public String preSave()throws Exception{
		if(StringUtil.isNotEmpty(paperId)){
			paper=paperDao.getPaper(paperId);
			title="修改试卷";
		}else{
			title="添加试卷";
		}
		mainPage="paper/paperWrite.jsp";
		return SUCCESS;
	}
	
	public String savePaper()throws Exception{
		if(StringUtil.isNotEmpty(paperId)){
			paper.setId(Integer.parseInt(paperId));
		}else{
			paper.setJoinDate(new Date());
		}
		paperDao.savePaper(paper);
		return "save";
	}
	
}
