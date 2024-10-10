package kr.co.pension.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.pension.dao.ReserveDao;
import kr.co.pension.dto.ReserveDto;
import kr.co.pension.dto.RoomDto;
import kr.co.pension.util.Utils;
@Controller
public class ReserveController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@RequestMapping("/reserve/reserve")
	public String reserve(Model model,HttpServletRequest request)
	{
		
		
		int year, month;
		if(request.getParameter("year")==null)
		{
			LocalDate today=LocalDate.now();
			year=today.getYear();
			month=today.getMonthValue();
			
		}else
		{
			year=Integer.parseInt(request.getParameter("year"));
			month=Integer.parseInt(request.getParameter("month"));
			if(month==0)
			{
				month=12;
				year=year-1;
			}
			if(month==13)
			{
				month=1;
				year=year+1;
			}
			
		}
		
		//달력관련 값을 생성뒤에 뷰에 전달 => core태그 이용
		//1일의 요일, 총일수, 몇주
		
		//LocalDate라이브러리를 통해서 오늘날짜의 객체를 생성한다.
		//1일의 요일, 총일수, 몇주
	
		//오늘 기준으로 2024년 8월 일의 객체가 필요
		LocalDate xday=LocalDate.of(year, month, 1);
		//1일의 요일 => getDatofWeek().getValue()
		int yoil=xday.getDayOfWeek().getValue(); //1~7(월요일이 0이다.)
		//일요일은 월요일 앞에 출력되므로 월요일보다 적은값 0으로 교체
		if(yoil==7)
			yoil=0;
		
		
		//2024년 8월의 총일수
		int chong=xday.lengthOfMonth();
		int ju=(int)Math.ceil((yoil+chong)/7.0);
		
		model.addAttribute("yoil",yoil);
		model.addAttribute("chong",chong);
		model.addAttribute("ju",ju);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		ArrayList<RoomDto> rlist=rdao.getRooms();
		model.addAttribute("rlist",rlist);
		
		
		
		//1일부터 마지막 날까지 모든 방의 예약 가능 여부를 0,1로서 저장 => map.put("일_방번호",예약가능여부)
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		for(int i=0; i<rlist.size(); i++)
		{
			
			int id=rlist.get(i).getId();
			for(int j=1; j<=chong; j++)//1~마지막 날까지(31)
			{
				String date=year+"-"+month+"-"+j; //2024~-8=01 ~ 2024-08-31
				int cnt;
				if(rdao.isCheck(date, id))
				{
					cnt=1;
					map.put(j+"-"+id,cnt); //map.put("1-1",1) => //map.put("1-2",?)  => map.put("1-3",?)
											//....map.put("31-1",?")....map.put("31-6",?)
				}else{
					cnt=0;
					map.put(j+"-"+id,cnt);
					//일자 방번호 전달
				}
				System.out.println(j+"-"+id+","+cnt);
			}
		}
		
		model.addAttribute("map",map);
		return "/reserve/reserve";
	}
	
	
	@RequestMapping("/reserve/reserveNext")
	public String reserveNext(HttpServletRequest request,Model model,HttpSession session)
	{
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		int id=Integer.parseInt(request.getParameter("id"));//roomtable의 id
		if(session.getAttribute("userid")!=null)
		{
			
			
			//입실날짜 출력 => ????-??-??,????년 ??월 ??일
			String month2=String.format("%02d", month);
			String day2=String.format("%02d", day);
			String date=year+"-"+month2+"-"+day2; //입실일
			
			model.addAttribute("date",date);
			
			ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
			RoomDto rdto=rdao.getRoom(id);
			
			
			//뷰에 전달하기 전에 옵션추가
			String content=rdto.getContent().replace("\r\n", "<br>");
			rdto.setContent(content);
			String[] imgs=rdto.getRimg().split("/");
			rdto.setImgs(imgs);
			
			//1박 가격을 ,를 붙여서 dto에 저장
			String price2=Utils.comma(rdto.getPrice());
			rdto.setPrice2(price2);
			
			//reserveNext에서 몇박을 선택할 때 가능한 일수를 구해서 전달
			//입시날짜르 ㄹ구한다. 2024-08-11
			//8월 11일익 가능한지
			//8월 12일이 가능한지
			//8월 13일이 가능한지
			//8월 14일이 가능한지
			//8월 15일이 가능한지
			//위의 체크가 1이 나올 때까지 몇 번 돌았나
			int suk=0;
			LocalDate xday=LocalDate.of(year,month,day);
			for(int i=1; i<=8; i++) {
				 //8월 11일이 가능한지
				//day까지 해서 
				if(rdao.isCheck(xday.toString(),id))
				{
					break;//예약이 되어 있으면
				}
				else //예약 가능
				{
					suk++;
					
				}
				//날짜를 하루 증가시킨다.
				xday=xday.plusDays(1);
			}
			
			model.addAttribute("suk",suk);
			model.addAttribute("rdto",rdto);
			
			
			//System.out.println(date);
			return "/reserve/reserveNext";
			
		}else {
			
			return "redirect:/member/login?year="+year+"&month="+month+"&day="+day+"&id="+id;
		}
		
	}
	
	
	
	@RequestMapping("/reserve/reserveOk")
	public String reserveOk(ReserveDto rdto, HttpSession session)
	{
		System.out.println(rdto.getSuk());
		LocalDate dday=Utils.getDate(rdto.getInday(), rdto.getSuk());
		System.out.println(dday.toString());
		rdto.setOutday(dday.toString());
		
		
		String jumuncode="j"+Utils.dateToString();
		//오늘날짜 기준으로 가장 높은 오른쪽에서 3자리 값 가져오기
		
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		int num=rdao.getJumuncode(jumuncode)+1;
		jumuncode=jumuncode+String.format("%03d", num);
		rdto.setJumuncode(jumuncode);
		System.out.println(jumuncode);
		
		
		//사용자 아이디를 rdto에 추가
		rdto.setUserid(session.getAttribute("userid").toString());
		
		
		rdao.reserveOk(rdto);
		//System.out.println(Utils.dateToString());
		//jumuncode를 생성해서 dto에 넣기
		//j년월일 000 => j20240806001시작
		
		
		
		return "redirect:/reserve/reserveView?jumuncode="+jumuncode;
		
		
	}
	
	
	@RequestMapping("/reserve/reserveView")
	public String reserveView(HttpServletRequest request, Model model)
	{
		String jumuncode=request.getParameter("jumuncode");
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		ReserveDto rdto=rdao.reserveView(jumuncode);
		
		//총 결제금액, 를 붙이기
		String price2=Utils.comma(rdto.getChgprice());
		model.addAttribute("price2",price2);
		
		
		RoomDto rdto2=rdao.getRoom(rdto.getRid());
		model.addAttribute("title",rdto2.getTitle());
		
		model.addAttribute("rdto",rdto);
		
		return "/reserve/reserveView";
		
	}
	
	
	
	
	
	

}
