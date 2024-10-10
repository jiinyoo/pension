package kr.co.pension.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.pension.dao.MemberDao;
import kr.co.pension.dto.BoardDto;
import kr.co.pension.dto.GongjiDto;
import kr.co.pension.dto.InquiryDto;
import kr.co.pension.dto.MemberDto;
import kr.co.pension.dto.ReserveDto;
import kr.co.pension.dto.TourDto;
import kr.co.pension.util.MailSend;
import kr.co.pension.util.Utils;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/index";
	}

	
	@RequestMapping("/main/index")
	public String index(Model model)
	{
		
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		ArrayList<GongjiDto> glist=mdao.getGongji();
		ArrayList<TourDto> tlist=mdao.getTour();
		ArrayList<BoardDto> blist=mdao.getBoard();
		
	for(int i=0; i<glist.size(); i++)
	{
		//GongjiDto gdto=new GongjiDto();
		String gtitle=glist.get(i).getTitle();
	    if (gtitle.length() >= 8) {
	            glist.get(i).setTitle(gtitle.substring(0, 8) + "..");
	            System.out.println(glist.get(i).getTitle());
	        } else {
	        	glist.get(i).setTitle(gtitle); 
	        }
	}
	
	
	for(int i=0; i<tlist.size(); i++)
	{
		//GongjiDto gdto=new GongjiDto();
		String ttitle=tlist.get(i).getTitle();
	    if (ttitle.length() >= 8) {
	            tlist.get(i).setTitle(ttitle.substring(0, 8) + "..");
	        } else {
	        	tlist.get(i).setTitle(ttitle); 
	        }
	}
	
	
	for(int i=0; i<blist.size(); i++)
	{
		//GongjiDto gdto=new GongjiDto();
		String btitle=blist.get(i).getTitle();
	    if (btitle.length() >= 8) {
	            blist.get(i).setTitle(btitle.substring(0, 8) + "..");
	        } else {
	        	blist.get(i).setTitle(btitle); 
	        }
	}
	
		
	model.addAttribute("blist",blist);
	model.addAttribute("tlist",tlist);
	model.addAttribute("glist",glist);
	
		return "/main/index";
	}
	
	
	
	@RequestMapping("/main/indextest")
	public String indextest()
	{
		return "/main/indextest";
	}
	
	
	@RequestMapping("/member/member")
	public String member()
	{
		return "/member/member";
	}
	
	
	@RequestMapping("/member/dupCheck")
	public @ResponseBody String dupCheck(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		
		return mdao.dupCheck(userid);
		
	}
	
	
	@RequestMapping("/member/memberOk")
	public String memberOk(MemberDto mdto)
	{	
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.memberOk(mdto);
		return "redirect:/member/login";
		
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest request, Model model)
	{	
			String err=request.getParameter("err");
			model.addAttribute("err",err);
			if(request.getParameter("year")!=null) {
			int year=Integer.parseInt(request.getParameter("year"));
			int month=Integer.parseInt(request.getParameter("month"));
			int day=Integer.parseInt(request.getParameter("day"));
			int id=Integer.parseInt(request.getParameter("id"));
			model.addAttribute("year",year);
			model.addAttribute("month",month);
			model.addAttribute("day",day);
			model.addAttribute("id",id);
			}
	
		
		return "/member/login";
	}
	
	
	@RequestMapping("/member/loginOk")
	public String loginOk(MemberDto mdto,HttpSession session, HttpServletRequest request)
	{	
		/*
		 * String userid=mdto.getUserid(); String pwd=mdto.getPwd();
		 */
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String name=mdao.loginOk(mdto);
		if(name!=null)
		{
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			
			if(request.getParameter("year")==null)
			{
				//어드민 사용자로 로그인 했을 때
				if(session.getAttribute("userid").equals("admin"))
				{
					return "redirect:/adminRoom/index";
				}
				else 
				{	
					return "redirect:/main/index";
				}
			}else {
				//값이 있을 때만 오는 거라서
				int year=Integer.parseInt(request.getParameter("year"));
				int month=Integer.parseInt(request.getParameter("month"));
				int day=Integer.parseInt(request.getParameter("day"));
				int id=Integer.parseInt(request.getParameter("id"));
				
				return "redirect:/reserve/reserveNext?year="+year+"&month="+month+"&day="+day+"&id="+id;
			}
		}
		else
		{
			return "redirect:/member/login?err=1";
		}
	}
	
	
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
	@RequestMapping("member/usForm")
	public String usForm(HttpServletRequest request,Model model)
	{
		String err=request.getParameter("err");
		model.addAttribute("err",err);
		return "/member/usForm";
	}
	
	
	
	@RequestMapping("/member/useridSearch")
	public String useridSearch(MemberDto mdto, Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String userid=mdao.useridSearch(mdto);
		if(userid==null)
		{
			return "redirect:/member/usForm?err=1";
		}else {
			
			model.addAttribute("userid",userid);
			return "/member/useridSearch";
			
		}
		
	}
	
	
	@RequestMapping("member/pwdForm")
	public String pwdForm()
	{
		return "/member/pwdForm";
	}
	
	
	@RequestMapping("/member/pwdSearch")
	public String pwdSearch(MemberDto mdto,HttpServletRequest request,Model model) throws Exception
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String pwd=mdao.pwdSearch(mdto);
		//pwd가 있다면 메일로 링크를 보내게 해야함
		
		
		if(pwd==null) {	
			return "redirect:/member/pwdForm?err=1";
		}else {
			
			String name=request.getParameter("name");
			String naverPwd=request.getParameter("naverPwd");
			String userid=request.getParameter("userid");
			MailSend mail=MailSend.getInstance();
			
			mail.setEmail("blessedgirl7@naver.com",name+"님의 새 비밀번호 링크입니다.","새 비밀번호 링크 : http://localhost:8080/pension/member/pwdUpdate?userid="+userid, naverPwd);
			
			System.out.println(pwd);
			model.addAttribute("pwd",pwd);
			return "/member/pwdSearch";
			
			
			
		}
		
	}
	
	
	
	
	@RequestMapping("/member/pwdUpdate")
	public String pwdUpdate(HttpServletRequest request,Model model)
	{
		String userid=request.getParameter("userid");
		model.addAttribute("userid",userid);
		return "/member/pwdUpdate";
	}
	
	
	
	@RequestMapping("/member/pwdUpdateOk")
	public String pwdUpdateOk(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.pwdUpdateOk(pwd,userid);
		return "redirect:/member/login";
		
		//redirect를 안하면 문서는  pwdUpdateOk인데, member/login만 보여서 
		//pwd의 파라미터 값들이 붙어있다.
	}
	
	@RequestMapping("member/bmemberView")
	public String bmemberView(HttpServletRequest request, Model model)
	{
		String err=request.getParameter("err");
		
		model.addAttribute("err",err);
		return "member/bmemberView";
		
	}
	
	@RequestMapping("/member/bmemberOk")
	public String bmemberOk(HttpServletRequest request,HttpSession session)
	{
		String pwd=request.getParameter("pwd");
		String userid=session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		if(mdao.isPwd(pwd,userid))
		{
			return "redirect:/member/memberView";
			
		}else {
			
			return "redirect:/member/bmemberView?err=1";
		}
		
	}
	
	
	
	
	
	@RequestMapping("member/memberView")
	public String memberView(HttpSession session,HttpServletRequest request,Model model)
	{
		
		String err=request.getParameter("err");
		
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/member/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			MemberDao mdao=sqlSession.getMapper(MemberDao.class);
			MemberDto mdto=mdao.memberView(userid);
			model.addAttribute("mdto", mdto);
		}
		model.addAttribute("err",err);
		return "/member/memberView";
		
		
	}
	
	
	
	@RequestMapping("/member/emailEdit")
	public String emailEdit(HttpServletRequest request, HttpSession session)
	{
		
		String email=request.getParameter("email");
		String userid =session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.emailEdit(email, userid);
		return "redirect:/member/memberView";
		
	}
	
	@RequestMapping("/member/phoneEdit")
	public String phoneEdit(HttpServletRequest request, HttpSession session)
	{
		
		String phone=request.getParameter("phone");
		String userid =session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.phoneEdit(phone, userid);
		return "redirect:/member/memberView";
		
	}
	
	@RequestMapping("/member/pwdeditform")
	public String pwdeditform(HttpServletRequest request,Model model)
	{
		String err=request.getParameter("err");
		model.addAttribute("err", err);
		return "/member/pwdeditform";
	}
	
	
	@RequestMapping("/member/pwdeditformOk")
	public String pwdeditformOk()
	{
		return "/member/pwdeditformOk";
	}
	
	
	
	
	@RequestMapping("/member/pwdEdit")
	public String pwdEdit(HttpServletRequest request, HttpSession session)
	{
		
		String pwd=request.getParameter("pwd");
		String newpwd1=request.getParameter("newpwd1");
		String userid =session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		if(mdao.isPwd(pwd,userid))
		{
			mdao.pwdEdit(newpwd1,pwd, userid);
			return "redirect:/member/pwdeditformOk";
			
		}
		else
		{
			return "redirect:/member/pwdeditform?err=1";
			
		}
		
	}
	
	
	
	@RequestMapping("/member/myWrite")
	public String myWrite(HttpSession session,Model model)
	{
		if(session.getAttribute("userid")!=null)
		{
			//나의 글 => board,tour,inquiry
			String userid= session.getAttribute("userid").toString();
			MemberDao mdao=sqlSession.getMapper(MemberDao.class);
			
			
			ArrayList<InquiryDto> ilist=mdao.getInquirys(userid);

			
			for(int i=0; i<ilist.size(); i++)
			{
				InquiryDto idto=ilist.get(i);
				switch(idto.getTitle())
				{
					case 0: idto.setTitle2("펜션예약 관련문의");break;
					case 1: idto.setTitle2("입실퇴실 관련문의");break;
					case 2: idto.setTitle2("주변맛집 관련문의");break;
					case 3: idto.setTitle2("웹사이트 관련문의");break;
					case 4: idto.setTitle2("커뮤니티 관련문의");break;
					default: idto.setTitle2("");
				}
				if(idto.getState()==0) {
					idto.setAnswer("↳답변 대기중");
				}else {
					String answer=idto.getAnswer().replace("\r\n", "<br>");
					idto.setAnswer("↳"+answer);
					
				}
				
				
				
				//content와 answer에 "\r\n =><br>
				String content=idto.getContent().replace("\r\n", "<br>");
				idto.setContent(content);
				
				
			}
			
			
			
			
			model.addAttribute("ilist",ilist);
			
			//board테이블 가져오기 => 뷰에 전달
			//tour 테이블 가져오기
			//inquiry테이블 가져오기
			return "member/myWrite";
		}else
		{
			
			return "redirect:/member/login";
		}
		
		
	}
	
	@RequestMapping("/member/mapEx")
	public String mapEx(Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		//ArrayList<MemberDto> mlist=mdao.getMembers();
		
		ArrayList<HashMap> mapAll=mdao.getMembers2();
		model.addAttribute("mapAll",mapAll);
		
		//model.addAttribute("mlist", mlist);
		return "/member/mapEx";
	}
	
	
	
	@RequestMapping("/member/outMember")
	public String outMember(HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.outMember(userid);
		session.invalidate();
		return "redirect:/main/index";
		
	}
	
	
	@RequestMapping("/member/reserveList")
	public String reserveList(HttpSession session,Model model)
	{
		String userid=session.getAttribute("userid").toString();
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		ArrayList<ReserveDto> rlist=mdao.reserveList(userid);
		
		for(int i=0; i<rlist.size(); i++)
		{
			boolean chk=Utils.dayBefore2(rlist.get(i).getOutday());
			rlist.get(i).setChk(chk);
		}
		
		
		
		
		model.addAttribute("rlist", rlist);
		return "/member/reserveList";
	}
	
	@RequestMapping("/member/cancelRe")
	public String cancelRe(HttpServletRequest request)
	{
		System.out.println("cancelRe");
		String id=request.getParameter("id");
		String state=request.getParameter("state");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.cancelRe(state,id);
		return "redirect:/member/reserveList";
	}
	
	
	
}
