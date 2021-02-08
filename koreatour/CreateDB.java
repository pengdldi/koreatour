package db;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

public class CreateDB {
	
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection("jdbc:mysql://venus.smu.ac.kr/group7", "group7", "group7");
			stmt = conn.createStatement();
			stmt.executeUpdate("create table info("
					         + "id int auto_increment,"
					         + "areaCode int,"
					         + "areaName varchar(10),"
					         + "sigunguCode int,"
					         + "sigunguName varchar(10),"
					         + "typeCode varchar(10),"
					         + "typeName varchar(20),"
					         + "contentId varchar(20),"
					         + "contentTypeId varchar(20),"
					         + "primary key(id))");
			
			insertData(stmt);
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void insertData(Statement stmt) {
		BufferedReader r = null;
		
		try {
			r = new BufferedReader(new FileReader("info.txt"));
			String line = null;
			
			while((line = r.readLine()) != null) {
				String[] values = line.split("\\|");
				
				try {
					stmt.executeUpdate("insert into info(areaCode, areaName, sigunguCode, "
							+ "sigunguName, typeCode, typeName, contentId, contentTypeId) values("
							+ values[0] + ", '" + values[1] + "', " + values[2] + ", '" + values[3]
							+ "', '" + values[4] + "', '" + values[5] + "', '" + values[6] + "', '"
							+ values[7] + "')");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(r != null)
					r.close();
			} catch(Exception e) {
				
			}
		}
	}

}
