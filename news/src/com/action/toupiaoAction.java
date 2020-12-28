package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TToupiaoDAO;
import com.model.TToupiao;
import com.opensymphony.xwork2.ActionSupport;

public class toupiaoAction extends ActionSupport
{
	private int toupiaoId;
	private String toupiaoName;
	
	private TToupiaoDAO toupiaoDAO;
	
	/*
	 *   ����5��ͶƱ��ʽ
	 *   1�����ѽ��ܣ�pengyou��
	 *   2���Ż���վ���������棨menhu��
	 *   3��Google��ٶ�������googlebaidu��
	 *   4�������վ�ϵ����ӣ�qitazhan��
	 *   5������;����qita��
	*/
	public String toupiaoAdd()
	{
		TToupiao toupiao=new TToupiao();
		toupiao.setToupiaoName(toupiaoName);
		toupiao.setToupiaoDate(new Date().toLocaleString());
		toupiaoDAO.save(toupiao);
		System.out.println("dddd");
		return "successAdd";
	}
	
	public String toupiaoChakan()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="select count(*) from TToupiao where toupiaoName='pengyou'";
		List list=toupiaoDAO.getHibernateTemplate().find(sql);
		request.put("pengyou", list.get(0).toString());
		
		sql="select count(*) from TToupiao where toupiaoName='menhu'";
		list=toupiaoDAO.getHibernateTemplate().find(sql);
		request.put("menhu",list.get(0).toString());
		
		sql="select count(*) from TToupiao where toupiaoName='googlebaidu'";
		list=toupiaoDAO.getHibernateTemplate().find(sql);
		request.put("googlebaidu",list.get(0).toString());
		
		sql="select count(*) from TToupiao where toupiaoName='qitazhan'";
		list=toupiaoDAO.getHibernateTemplate().find(sql);
		request.put("qitazhan",list.get(0).toString());
		
		sql="select count(*) from TToupiao where toupiaoName='qita'";
		list=toupiaoDAO.getHibernateTemplate().find(sql);
		request.put("qita",list.get(0).toString());
		
		return ActionSupport.SUCCESS;
		
		
	}

	public TToupiaoDAO getToupiaoDAO()
	{
		return toupiaoDAO;
	}

	public void setToupiaoDAO(TToupiaoDAO toupiaoDAO)
	{
		this.toupiaoDAO = toupiaoDAO;
	}

	public int getToupiaoId()
	{
		return toupiaoId;
	}

	public void setToupiaoId(int toupiaoId)
	{
		this.toupiaoId = toupiaoId;
	}

	public String getToupiaoName()
	{
		return toupiaoName;
	}

	public void setToupiaoName(String toupiaoName)
	{
		this.toupiaoName = toupiaoName;
	}

}
