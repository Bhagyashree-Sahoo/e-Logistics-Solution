<%@ page language="java" import="java.sql.*" %>
<html>
	<head>
		<title>Product Information</title>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String PCode,PName,Image;
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
		PCode=request.getParameter("txtProdId");
		PName=request.getParameter("txtProdCatgName");
		Image=request.getParameter("ProductPhoto");
		doConnect();
		try{
            stmtSave=conn.createStatement();
			stmtSave.executeUpdate("insert into elogs_tblprodcategory values('"+PCode+"','"+PName+"','"+Image+"')");
			out.println("<script type='text/javaScript'>");
			out.println("alert("+"'Your data submit Successfully...'"+");");
			out.println("setTimeout(function(){window.location.href='elogs_ProductCatgc.jsp'},100);");
			out.println("</script>");
		}
		catch(SQLException se){
			out.println("Your data not submited.");
		}
	%>
</body>
</html>	
		