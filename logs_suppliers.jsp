
<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Data Insertion Page</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String supplierid,suppliername,contactperson,photo,address,locality,city,state,phno,mailid,website,gstno,date;
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
			supplierid=request.getParameter("txtSId");
			suppliername=request.getParameter("txtsName");
			contactperson=request.getParameter("txtCperson");
			photo=request.getParameter("filePhoto");
			address=request.getParameter("txtAddress");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			state=request.getParameter("cmbState");
			phno=request.getParameter("txtphno");
			mailid=request.getParameter("txtmail");
			website=request.getParameter("urlWebsite");
			gstno=request.getParameter("txtGstno");
			date=request.getParameter("dtDate");
		
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into supplierinformation Values('"+supplierid+"','"+suppliername+"','"+contactperson+"','"+photo+"','"+address+"','"+locality+"','"+city+"','"+state+"','"+phno+"','"+mailid+"','"+website+"','"+gstno+"','"+date+"')");
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");");
				out.println("setTimeout(function(){window.location.href='logs_supplierc.jsp'},1000);");
				out.println("</script>");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
