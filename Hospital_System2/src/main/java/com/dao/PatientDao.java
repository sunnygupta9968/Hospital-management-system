package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Patient;
public class PatientDao {
	private Connection conn;
	public PatientDao(Connection conn) {
		super();
		this.conn=conn;
	}
	public boolean addPatients(Patient p) {
		boolean f=false;
		try {
			String sql="insert into patients(fullName,age,department,doctor,email,mobno) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,p.getFullName());
			ps.setInt(2,p.getAge());
			ps.setString(3,p.getDepartment());
			ps.setString(4,p.getDoctor());
			ps.setString(5,p.getEmail());
			ps.setString(6,p.getMobno());
			
			
			
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Patient> getAllPatients(){
		List<Patient>list=new ArrayList<>();
		Patient p=null;
		try {
			String sql="select * from patients";
			PreparedStatement ps =conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Patient();
				p.setId(rs.getInt(1));
				p.setFullName(rs.getString(2));
				
				p.setAge(rs.getInt(3));
				p.setDepartment(rs.getString(4));
				p.setDoctor(rs.getString(5));
				p.setEmail(rs.getString(6));
				p.setMobno(rs.getString(7));
				list.add(p);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
