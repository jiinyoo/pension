package kr.co.pension.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.pension.dto.RoomDto;
import kr.co.pension.dto.InquiryDto;
import kr.co.pension.dto.MemberDto;
import kr.co.pension.dto.ReserveDto;

public interface AdminDao {
	public ArrayList<RoomDto> list();
	public void writeOk(RoomDto rdto);
	public RoomDto content(String id);
	public void delete(String id);
	public String getRimg(String id);
	public void updateOk(RoomDto rdto);
	public ArrayList<InquiryDto> getInquirys();
	public void inquiryOk(InquiryDto idto);
	public ArrayList<HashMap> getMembers();
	public void memberUp(MemberDto mdto);
	public ArrayList<ReserveDto> reserveList();
	public void cancelRe(String state, String id);
	public void chgState(String state, String id);
}
