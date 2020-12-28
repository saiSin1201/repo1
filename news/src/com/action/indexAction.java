package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGonggaoDAO;
import com.dao.TNewsDAO;
import com.dao.TPicNewsDAO;
import com.model.TCatelog;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TNewsDAO newsDAO;
	private TPicNewsDAO picNewsDAO;
	private TCatelogDAO catelogDAO;
	
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		List picNewsList=picNewsDAO.findAll();
		if(picNewsList.size()>4)
		{
			picNewsList=picNewsList.subList(0, 4);
		}
		request.put("picNewsList", picNewsList);
		
		
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<cateLogList.size();i++)
		{
			TCatelog catelog=(TCatelog)cateLogList.get(i);
			catelog.setNewsList(newsDAO.getHibernateTemplate().find("from TNews where catelogId="+catelog.getCatelogId()));
		}
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}

	

	public TNewsDAO getNewsDAO()
	{
		return newsDAO;
	}

	public void setNewsDAO(TNewsDAO newsDAO)
	{
		this.newsDAO = newsDAO;
	}

	public TPicNewsDAO getPicNewsDAO()
	{
		return picNewsDAO;
	}

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}



	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}



	public void setPicNewsDAO(TPicNewsDAO picNewsDAO)
	{
		this.picNewsDAO = picNewsDAO;
	}
}
