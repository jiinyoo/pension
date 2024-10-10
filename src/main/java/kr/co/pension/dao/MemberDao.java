package kr.co.pension.dao;

import kr.co.pension.dto.MemberDto;
import kr.co.pension.dto.ReserveDto;
import kr.co.pension.dto.TourDto;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.pension.dto.BoardDto;
import kr.co.pension.dto.GongjiDto;
import kr.co.pension.dto.InquiryDto;

public interface MemberDao {
	public String dupCheck(String userid);
	public void memberOk(MemberDto memberDto);
	//public int loginOk(String userid, String pwd);
	public String loginOk(MemberDto mdto);
	public String useridSearch(MemberDto mdto);
	public String pwdSearch(MemberDto mdto);
	public void pwdUpdateOk(String pwd,String userid);
	public MemberDto memberView(String userid);
	public void emailEdit(String email, String userid);
	public void phoneEdit(String phone, String userid);
	public boolean isPwd(String pwd, String userid);
	public void pwdEdit(String newpwd1 ,String pwd, String userid);
	public ArrayList<InquiryDto> getInquirys(String userid);
	public ArrayList<MemberDto> getMembers();
	public ArrayList<HashMap> getMembers2();
	
	public void outMember(String userid);
	public ArrayList<ReserveDto> reserveList(String userid);
	public void cancelRe(String state, String id);
	
	public ArrayList<GongjiDto> getGongji();
	public ArrayList<TourDto> getTour();
	public ArrayList<BoardDto> getBoard();
	
	
}
