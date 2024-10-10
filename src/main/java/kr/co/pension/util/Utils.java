package kr.co.pension.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;

public class Utils {
	public static String comma(int val)
	{
		DecimalFormat df=new DecimalFormat("#,###");
		return df.format(val);
	}
	
	
	//YYYY-MM-DD와 며칠후의 값이 들어오면 날짜객체를 생성하여 리턴
	public static LocalDate getDate(String date, int day)
	{
		//day후의 날
		//date의 day전후의 날짜정보를 생성
		String[] ymd=date.split("-");
		int y=Integer.parseInt(ymd[0]);
		int m=Integer.parseInt(ymd[1]);
		int d=Integer.parseInt(ymd[2]);
		LocalDate xday=LocalDate.of(y,m,d);
		LocalDate dday=xday.plusDays(day);
		return dday;
	}
	
	
	public static String dateToString()
	{
		LocalDate today=LocalDate.now();
		return today.toString().replace("-", "");
	}
	
	
	//방의 예약여부를 체크
	public static boolean isCheck(String date, int rid) throws Exception
	{
		
		Class.forName("com.mysql.jdbc.Driver");  
		String db="jdbc:mysql://localhost:3306/pension";
		Connection conn=DriverManager.getConnection(db,"root","1234");
		
		String sql="select count(*) as cnt from reserve where inday <= ? and outday > ? and rid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,date);
		pstmt.setString(2,date);
		pstmt.setInt(3,rid);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		int cnt=rs.getInt("cnt");
		
		
		rs.close();
		pstmt.close();
		conn.close();
		
		if(cnt==0)
		{
			return false;
		}else {
			return true;
		}
		
	}
	
	public static boolean dayBefore(String date)//YYYY-MM-DD
	{
		//요청된 날짜
		String[] imsi=date.split("-");
		int y=Integer.parseInt(imsi[0]);
		int m=Integer.parseInt(imsi[1]);
		int d=Integer.parseInt(imsi[2]);
		LocalDate xday=LocalDate.of(y, m, d);
		
		
		//오늘날짜
		LocalDate today=LocalDate.now();
		
		if(today.isBefore(xday) || today.isEqual(xday))//today가 xday보다 이전이냐 xday는 reserve로 받는날짜
		{
			return true;
		}else
		{
			return false;
		}
	}
	
	
	public static boolean dayBefore2(String date)//YYYY-MM-DD
	{
		//요청된 날짜
		String[] imsi=date.split("-");
		int y=Integer.parseInt(imsi[0]);
		int m=Integer.parseInt(imsi[1]);
		int d=Integer.parseInt(imsi[2]);
		LocalDate xday=LocalDate.of(y, m, d);
		
		
		//오늘날짜
		LocalDate today=LocalDate.now();
		
		if(today.isBefore(xday))//today가 xday보다 이전이냐 xday는 reserve로 받는날짜
		{
			return true;
		}else
		{
			return false;
		}
	}
	
	
	

}
