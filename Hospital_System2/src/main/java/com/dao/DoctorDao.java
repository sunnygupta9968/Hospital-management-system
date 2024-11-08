package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
private Connection conn;
	public DoctorDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean registerDoctor(Doctor d) {
		boolean f=false;
		
		try {
			String sql="insert into doctor(fullName,qualification,specialist,email,mobno,password) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,d.getFullName());
			
			ps.setString(2,d.getQualification());
			ps.setString(3,d.getSpecialist());
			ps.setString(4,d.getEmail());
			ps.setString(5,d.getMob());
			ps.setString(6,d.getPassword());
			
			
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Doctor> getAllDoctor(){
		List<Doctor>list=new ArrayList<>();
		Doctor d=null;
		try {
			String sql="select * from doctor";
			PreparedStatement ps =conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				
				d.setQualification(rs.getString(3));
				d.setSpecialist(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setMob(rs.getString(6));
				list.add(d);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Doctor login(String email,String password) {
		Doctor d=null;
		String query="select * from doctor where email=? and password=?";
	try {	
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1,email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			d=new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setQualification(rs.getString(3));
			d.setSpecialist(rs.getString(4));
			d.setEmail(rs.getString(5));
			d.setMob(rs.getString(6));
			d.setPassword(rs.getString(7));
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return d;
	}
	
	public boolean removeDoctor(int id) {
		boolean f=false;
		try {
			String query="Delete From doctor where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	
	
	
	public Doctor getDoctorById(int id) {
		Doctor d=null;
		
		String query="select * from doctor where id=?";
	try {	
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1,id);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			d=new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setQualification(rs.getString(3));
			d.setSpecialist(rs.getString(4));
			d.setEmail(rs.getString(5));
			d.setMob(rs.getString(6));
			d.setPassword(rs.getString(7));
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f=false;
		try {
		String query="UPDATE doctor SET fullName = ?, qualification = ?, specialist = ?, email = ?, mobno = ?, password = ? WHERE id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
	       ps.setString(1,d.getFullName());		
			ps.setString(2,d.getQualification());
			ps.setString(3,d.getSpecialist());
			ps.setString(4,d.getEmail());
			ps.setString(5,d.getMob());
			ps.setString(6,d.getPassword());
			ps.setInt(7,d.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public int getDoctorCount() {
		int size=0;
		try {
			String query="select * from doctor";
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
