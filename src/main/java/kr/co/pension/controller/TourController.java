package kr.co.pension.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.spi.FileSystemProvider;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.pension.dao.AdminDao;
import kr.co.pension.dao.TourDao;
import kr.co.pension.dto.RoomDto;
import kr.co.pension.dto.TourDto;

@Controller

public class TourController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/tour/list")
	private String list(Model model)
	{
		
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		ArrayList<TourDto> tlist=tdao.list();
		model.addAttribute("tlist",tlist);
		return "/tour/list";
	}
	
	
	@RequestMapping("/tour/write")
	public String write()
	{
		return "/tour/write";
		
	}
	
	
	
	@RequestMapping("/tour/writeOk")
	public String writeOk(HttpServletRequest request, HttpSession session) throws Exception
	{
		String path=request.getRealPath("resources/tour");
		int size=1024*1024*30;
		
		MultipartRequest multi =new MultipartRequest(request,path,size,"utf-8" , new DefaultFileRenamePolicy());
		
		//여러개의 그림파일 명을 하나의 문자열로  그림파일명/그림파일명/그림파닝령
		//multi.getFilesystemName(path)
		Enumeration files=multi.getFileNames();
		String timg="";
		while(files.hasMoreElements())
		{
			String fname=files.nextElement().toString();
			timg=multi.getFilesystemName(fname)+"/"+timg;
		}
		
		timg=timg.replace("null/","");
		
		String title=multi.getParameter("title");
		System.out.println(title);
		String content=multi.getParameter("content");
		System.out.println(content);
		String userid=session.getAttribute("userid").toString();

		
		TourDto tdto=new TourDto();
		tdto.setTimg(timg);
		tdto.setTitle(title);
		tdto.setContent(content);
		tdto.setUserid(userid);
		
		
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		tdao.writeOk(tdto);
		
		return "redirect:/tour/list";
		
	}
	

	@RequestMapping("/tour/readnum")
	public String readnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		tdao.readnum(id);
		return "redirect:/tour/content?id="+id;
	}
	
	
	
	@RequestMapping("/tour/content")
	public String content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		TourDto tdto=tdao.content(id);
		tdto.setContent(tdto.getContent().replace("\r\n", "<br>"));
		
		String[] timgs=tdto.getTimg().split("/");
		tdto.setTimgs(timgs);
		
		
		model.addAttribute("tdto", tdto);
		return "tour/content";
	}
	
	@RequestMapping("/tour/update")
	public String update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		TourDto tdto=tdao.content(id);
		System.out.println(tdto.getContent());
		String[] timgs=tdto.getTimg().split("/");
		tdto.setTimgs(timgs);
		
		
		model.addAttribute("tdto", tdto);
		return "tour/update";
	}
	
	
	@RequestMapping("tour/updateOk")
	public String updateOk(HttpServletRequest request) throws Exception
	{
		String path=request.getRealPath("resources/tour");
		int size=1024*1024*30;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8", new DefaultFileRenamePolicy());
		Enumeration files=multi.getFileNames(); //type="file"태그의 name집합
		
		//업로드한 파일을 문자열로 처리 => 파일명/파일명/파일명/
		String timg="";
		while(files.hasMoreElements())
		{
			String name=files.nextElement().toString(); //type="file" 태그의 name
			timg=multi.getFilesystemName(name)+"/"+timg;
		}
		System.out.println("replace전"+timg);
	
		System.out.println(timg);
		String delimg=multi.getParameter("delimg");
		String safeimg=multi.getParameter("safeimg");
		//delimg에 있는 파일을 삭제
		String[] delfile=delimg.split("/");
		for(int i=0; i<delfile.length; i++)
		{
			File file=new File(path+"/"+delfile[i]);
			if(file.exists())
				file.delete();
		}
		
		//safe파일과 합쳐서 저장
		timg=safeimg+timg;
		timg=timg.replace("null/", "");
		System.out.println("마지막"+timg);
		
		int id=Integer.parseInt(multi.getParameter("id"));
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		
		
		TourDto tdto = new TourDto();
		tdto.setTimg(timg);
		tdto.setId(id);
		tdto.setContent(content);
		tdto.setTitle(title);

		
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		tdao.updateOk(tdto);
		
		return "redirect:/tour/content?id="+id;
		
	}
	
	
	@RequestMapping("/tour/delete")
	public String delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		TourDao tdao=sqlSession.getMapper(TourDao.class);
		/*
		 * RoomDto rdto=adao.content(id); 
		 * String delimg=rdto.getRimg();
		 */
		String delimg=tdao.getTimg(id);
		String path=request.getRealPath("resources/tour");
        String[] delimgs=delimg.split("/");
        
        for(int i=0;i<delimgs.length;i++)
        {
        	File file=new File(path+"/"+delimgs[i]);
        	
        	if(file.exists())
        	{
        		file.delete();
        	}        
        }
        tdao.delete(id);
        		
		return "redirect:/tour/list";
		
	}
	
	
	
	


}
