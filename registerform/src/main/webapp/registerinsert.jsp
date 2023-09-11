<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String finame=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String fname=request.getParameter("fathername");
String dob=request.getParameter("dateofbirth");
String mobileno=request.getParameter("mobilenumber");
String mail=request.getParameter("emailid");
String edu=request.getParameter("qualification");

String prcourse=request.getParameter("course");
String college=request.getParameter("college");
String hall=request.getParameter("hall");
String pot=request.getParameter("passoutyear");
String date=request.getParameter("date");
String task=request.getParameter("task");
String add=request.getParameter("add");
try{
	int id=0;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Akshay","akky123");
	Statement st = con.createStatement();

	ResultSet rs=st.executeQuery("SELECT max(id) FROM StudentDetails3");

	if(rs.next()){
	id=rs.getInt(1);
	id++;

	PreparedStatement p=con.prepareStatement("insert into  StudentDetails3 values(?,?,?,?,?,?,?,?,?,?,?,?,?)");


	p.setInt(1, id);
	p.setString(2,finame);
	p.setString(3,lname);
	p.setString(4,fname);
	p.setString(5,dob);
	p.setString(6,mobileno);
	p.setString(7,mail);
	p.setString(8,edu);
	p.setString(9,task);
	p.setString(10,college);
	p.setString(11,hall);
	p.setString(12,pot);
	p.setString(13,prcourse);
	//p.setString(14,date);
	//p.setString(15,add);
	int i=p.executeUpdate();
	if(i>0) {
		response.sendRedirect("registersuccess.jsp");
	}
	else {
		response.sendRedirect("registerfail.jsp");
	}
	
	}
}
catch(Exception e){
out.println(e);
}




%>
</body>
</html>