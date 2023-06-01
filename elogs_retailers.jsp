<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Data Insertion Page</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String retailercode,retailername,contactperson,photo,gstno,locality,city,state,phno,faxno,mailid,website;
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
			retailercode=request.getParameter("txtRCode");
			retailername=request.getParameter("txtRName");
			contactperson=request.getParameter("txtRCPerson");
			photo=request.getParameter("filePhoto");
			gstno=request.getParameter("txtGSTNo");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			state=request.getParameter("cmbState");
			phno=request.getParameter("txtPhno");
			faxno=request.getParameter("txtFaxNo");
			mailid=request.getParameter("txtMailid");
			website=request.getParameter("txtWebsite");
		
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblretailer Values('"+retailercode+"','"+retailername+"','"+contactperson+"','"+photo+"','"+gstno+"','"+locality+"','"+city+"','"+state+"','"+phno+"','"+faxno+"','"+mailid+"','"+website+"')");
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");");
				out.println("setTimeout(function(){window.location.href='elogs_retailerc.jsp'},100);");
				out.println("</script>");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
