package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.dao.TPicNewsDAO;
import com.model.TPicNews;
import com.opensymphony.xwork2.ActionSupport;

public class picNewsAction extends ActionSupport
{
	private int picNewsId;
	private String picNewsTitle;
	private String picNewsContent;
	
	private static final int BUFFER_SIZE = 16 * 1024;
	private File picNewsPic;
	private String picNewsPicFileName;
	private String picNewsPicContentType;
	
	private String message;
	private String path;
	private TPicNewsDAO picNewsDAO;
	
	public String picNewsAdd()
	{
		TPicNews picNews=new TPicNews();
		picNews.setPicNewsTitle(picNewsTitle);
		picNews.setPicNewsContent(picNewsContent);
		picNews.setPicNewsDate(new Date().toLocaleString());
		
		if(picNewsPic==null || picNewsPic.equals(""))
		{
			System.out.println("û���ϴ�����");
			picNews.setPicNewsPic("0");//��ʾû���ϴ�����
		}
		else
		{
			System.out.println("�й��ϴ�����");
			String newFile1Name=new Date().getTime()+picNewsPicFileName.substring(picNewsPicFileName.indexOf("."));
			String dstPath = ServletActionContext.getServletContext().getRealPath("upload")+ "\\" + newFile1Name;
			File dstFile = new File(dstPath);
			copy(this.getPicNewsPic(),dstFile);
			picNews.setPicNewsPic("/upload/"+newFile1Name);
			picNews.setPicNewsPicYuanshiming(picNewsPicFileName);
		}
		
		
		picNewsDAO.save(picNews);
		this.setMessage("�����ɹ�");
		this.setPath("picNewsMana.action");
		return "succeed";
	}
	
	
	public String picNewsMana()
	{
		List picNewsList =picNewsDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("picNewsList", picNewsList);
		return ActionSupport.SUCCESS;
	}
	
	public String picNewsDel()
	{
		TPicNews picNews=picNewsDAO.findById(picNewsId);
		picNewsDAO.delete(picNews);
		this.setMessage("�����ɹ�");
		this.setPath("picNewsMana.action");
		return "succeed";
	}
	
	public String picNewsDetail()
	{
		TPicNews picNews=picNewsDAO.findById(picNewsId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("picNews", picNews);
		return ActionSupport.SUCCESS;
	}
	
	
	public String picNewsDetailQian()
	{
		TPicNews picNews=picNewsDAO.findById(picNewsId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("picNews", picNews);
		
		
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	private static void copy(File src, File dst) 
    {
        InputStream in = null;
        OutputStream out = null;
        try 
        {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) 
            {
                out.write(buffer, 0, len);
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        } 
        finally
        {
            if (null != in) 
            {
                try 
                {
                    in.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
            if (null != out) 
            {
                try 
                {
                    out.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
    }
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	
	public TPicNewsDAO getPicNewsDAO()
	{
		return picNewsDAO;
	}



	public void  setPicNewsDAO(TPicNewsDAO picNewsDAO)
	{
		this.picNewsDAO = picNewsDAO;
	}





	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public String getPicNewsContent()
	{
		return picNewsContent;
	}
	public void setPicNewsContent(String picNewsContent)
	{
		this.picNewsContent = picNewsContent;
	}
	public int getPicNewsId()
	{
		return picNewsId;
	}
	public void setPicNewsId(int picNewsId)
	{
		this.picNewsId = picNewsId;
	}
	public File getPicNewsPic()
	{
		return picNewsPic;
	}
	public void setPicNewsPic(File picNewsPic)
	{
		this.picNewsPic = picNewsPic;
	}
	public String getPicNewsPicContentType()
	{
		return picNewsPicContentType;
	}
	public void setPicNewsPicContentType(String picNewsPicContentType)
	{
		this.picNewsPicContentType = picNewsPicContentType;
	}
	public String getPicNewsPicFileName()
	{
		return picNewsPicFileName;
	}
	public void setPicNewsPicFileName(String picNewsPicFileName)
	{
		this.picNewsPicFileName = picNewsPicFileName;
	}
	public String getPicNewsTitle()
	{
		return picNewsTitle;
	}
	public void setPicNewsTitle(String picNewsTitle)
	{
		this.picNewsTitle = picNewsTitle;
	}
	
}
