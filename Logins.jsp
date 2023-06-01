<%@ page language="java" import="java.sql.*" session="true" %>
<html>
<head>
<title>ADMIN LOGIN</title>
</head>
<body>
<%!
		Connection conn;
		String uname,pword,retname,retPhoto;
        Statement stmtMatch,stmtMatch1;
        ResultSet rsMatch,rsMatch1;
		HttpSession ssn;
		public void doConnect(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException cnfe){
				System.out.println("unable to load Driver "+cnfe);
			}
			try{
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/logsdb","root","root");
			}
			catch(SQLException se){
				System.out.println("unable to connect");
			}
		}
	%>
<%
uname=request.getParameter("Username");
pword=request.getParameter("Password");
ssn=request.getSession();
doConnect();
try{
	stmtMatch=conn.createStatement();
	rsMatch=stmtMatch.executeQuery("select * from elogs_tbladminlogin where Username='"+uname+"' and Password='"+pword+"'");

	stmtMatch1=conn.createStatement();
	rsMatch1=stmtMatch1.executeQuery("select * from elogs_tblretailer where Retailer_code='"+uname+"' and Phone_no='"+pword+"'");

	if(rsMatch.next()){
	out.println("<script type='text/javaScript'>");
	out.println("alert("+"'Your login completed successfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='adminmenu.html'},100);");
	out.println("</script>\n");}

	else if(rsMatch1.next()){
	retname=rsMatch1.getString("Retailer_name");
	retPhoto = rsMatch1.getString("Photo");
	ssn.setAttribute("ssnRcode",retname);
	ssn.setAttribute("ssnPhoto",retPhoto);
    ssn.setMaxInactiveInterval(3600);

	out.println("<script type='text/javaScript'>");
	out.println("setTimeout(function(){window.location.href='usermenu.jsp'},100);");
	out.println("</script>\n");}
	
	else{
	out.println("<script type='text/javaScript'>");
	out.println("alert("+"'Your login Failed'"+");\n");
	out.println("setTimeout(function(){window.location.href='Login.html'},100);");
    out.println("</script>\n");
	}
}	
catch(SQLException se){
out.println("Your Registration Fails,Try again later "+se);
}
%>
</body>
</html>
