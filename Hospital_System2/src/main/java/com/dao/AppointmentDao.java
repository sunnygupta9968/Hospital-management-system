package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.appointments;

public class AppointmentDao {
	private Connection conn;
	public AppointmentDao(Connection conn) {
		super();
		this.conn=conn;
	}
    public boolean bookAppoin(appointments a) {
    	boolean f=false;
    	try {
    		String query="insert into appointments(userId,fullName,gender,age,appointmentDate,email,mobno,doctorId,disease,address) values(?,?,?,?,?,?,?,?,?,?)";
    		PreparedStatement ps=conn.prepareStatement(query);
    		ps.setInt(1,a.getUserId());
    		ps.setString(2,a.getFullName());
    		ps.setString(3,a.getGender());
    		ps.setInt(4,a.getAge());
    		ps.setString(5,a.getAppoinDate());
    		ps.setString(6,a.getEmail());
    		ps.setString(7,a.getPhNo());
    		ps.setInt(8,a.getDoctorId());
    		ps.setString(9,a.getDiseases());
    		ps.setString(10,a.getAddress());
    		
    	int i=ps.executeUpdate();
    	if(i==1) {
    		f=true;
    	}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    }
	public List<appointments> getAllAppointments(int userId){
		List<appointments>list=new ArrayList<>();
		appointments a=null;
		try {
			String sql="select * from appointments where userId=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				a=new appointments();
				a.setId(rs.getInt(1));
				a.setUserId(rs.getInt(2));
				a.setFullName(rs.getString(3));
				a.setGender(rs.getString(4));
				a.setAge(rs.getInt(5));
				a.setAppoinDate(rs.getString(6));
				a.setEmail(rs.getString(7));
				a.setPhNo(rs.getString(8));
				a.setDoctorId(rs.getInt(9));
				a.setDiseases(rs.getString(10));
				a.setAddress(rs.getString(11));
				list.add(a);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean removeAppoint(int userId) {
		boolean f=false;
		try {
			String query="delete from appointments where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1,userId);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int getAppointCount() {
		int size=0;
		try {
			String query="select * from appointments";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet doc=ps.executeQuery();
			while(doc.next()) {
				size++;
	}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return size;
	}
	
}
