package kr.co.pension.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pension.dao.RoomDao;
import kr.co.pension.dto.RoomDto;
import kr.co.pension.util.Utils;

@Controller
public class RoomController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/room/roomView")
	public String roomView(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		
		RoomDao rdao=sqlSession.getMapper(RoomDao.class);
		RoomDto rdto=rdao.roomView(id);
		String[] imgs=rdto.getRimg().split("/");
		rdto.setImgs(imgs);
		
		String imsi="";
		for(int i=0; i<imgs.length; i++)
		{
				
				imsi=imsi+"\""+imgs[i]+"\"";
				if(i!=imgs.length-1)
				{
					imsi=imsi+",";
				}
		
		}
		
		
		String price2=Utils.comma(rdto.getPrice());//숫자에 ,를 넣은 문자열로 받기
		rdto.setPrice2(price2);
		
		rdto.setContent(rdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("imsi",imsi);
		//여러개의 사진 중 첫번째 그림을 rdto의 rimg필드에 값을 대체
		rdto.setRimg(imgs[0]);
		
		
		
		model.addAttribute("rdto",rdto);
		return "/room/roomView";
	}

}
