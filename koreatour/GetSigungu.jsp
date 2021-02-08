<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*, db.*"%>
    
<%
String areaCode = request.getParameter("areaCode");
DBConnectionMgr pool = new DBConnectionMgr();
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = pool.getConnection();
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select distinct sigunguCode, sigunguName "
			              +"from info "
			              +"where areaCode = " + areaCode);
	
	out.println("<select name='Sigungu'>");
	out.println("<option value='0'>-- 시/군/구 선택 --</option>");
	
	while(rs.next()) {
		String sigunguCode = Integer.toString(rs.getInt("sigunguCode"));
		String sigunguName = rs.getString("sigunguName");
		out.println("<option value='" + sigunguCode + "'>" + sigunguName + "</option>");
	}
	
	out.println("</select>");
} catch(SQLException e) {
	e.printStackTrace();
} catch(Exception e) {
	e.printStackTrace();
} finally {
	try {
		if(rs != null)
			rs.close();
		
		if(stmt != null)
			stmt.close();
		
		if(conn != null)
			pool.freeConnection(conn);
	} catch(Exception e) {
		
	}
}
%>