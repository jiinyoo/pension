package kr.co.pension.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pension.dao.InquiryDao;
import kr.co.pension.dto.InquiryDto;

@Controller
public class InquiryController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/inquiry/write")
	public String write(HttpServletRequest request, Model model)
	{
		model.addAttribute("err",request.getParameter("err"));
		return "/inquiry/write";
	}
	
	
	@RequestMapping("/inquiry/writeOk")
	public String writeOk(InquiryDto idto, HttpSession session, Model model)
	{
		String userid,inum ="";
		InquiryDao idao=sqlSession.getMapper(InquiryDao.class);
		if(session.getAttribute("userid")==null)
		{
		   userid="비회원";
		   //문의 번호를 생성하기
		   //m년 원일 값을 생성하여 매개변수 전달
		   LocalDate today=LocalDate.now();
		   String year=today.getYear()+""; 
		   year=year.substring(2);
		   int month=today.getMonthValue();
		   String month2=String.format("%02d", month);
		   int day=today.getDayOfMonth();	
		   String day2=String.format("%02d", day);
		   inum="m"+year+month2+day2;
		   
		  // System.out.println("DB에서 뽑은 번호"+idao.getNumber(inum));
		   int num=idao.getNumber(inum)+1;
		   System.out.println("DB에서 뽑은 번호+1"+num);
		   inum=inum+String.format("%03d", num);
		   System.out.println("결과물"+inum);
		   
		   
		}else
		{
			userid=session.getAttribute("userid").toString();
		}
		
		
		idto.setUserid(userid);
		idto.setInqNumber(inum);
		model.addAttribute("InqNumber",idto.getInqNumber());
		idao.writeOk(idto);
		return "/inquiry/writeOk";
	}
	
	
	@RequestMapping("/inquiry/nonMemberView")
	public String nonMemberView(HttpServletRequest request, Model model)
	{
		String inqNumber=request.getParameter("inqNumber");
		InquiryDao idao=sqlSession.getMapper(InquiryDao.class);
		InquiryDto idto=idao.getInquiry(inqNumber);
		
		
		if(idto==null)
		{
			return "redirect:/inquiry/write?err=1";
		}
		
		
		
		
		switch(idto.getTitle())
		{
			case 0: idto.setTitle2("펜션예약 관련문의");break;
			case 1: idto.setTitle2("입실퇴실 관련문의");break;
			case 2: idto.setTitle2("주변맛집 관련문의");break;
			case 3: idto.setTitle2("웹사이트 관련문의");break;
			case 4: idto.setTitle2("커뮤니티 관련문의");break;
			default: idto.setTitle2("");
		}
		
		if(idto.getContent()!=null) {
			
			String content=idto.getContent().replace("\r\n", "<br>");
			idto.setContent(content);
		}
		
		if(idto.getState()==0)
		{
			idto.setAnswer("답변 대기중");
		}
		else
		{
			String answer=idto.getAnswer().replace("\r\n", "<br>");
			idto.setAnswer(answer);
		}
		
		model.addAttribute("idto",idto);
		return "/inquiry/nonMemberView";
		
	}
	
	
	
	
}
