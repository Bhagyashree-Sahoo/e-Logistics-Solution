<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Update and delete</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String Sid,SName,CPerson,Photo,Address,Locality,City,State,PhoneNo,Email,Website,GSTNo,Date,btnUp,btnDel;
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
			doConnect();
			Sid=request.getParameter("cmbSId");
			SName=request.getParameter("txtsName");
			CPerson=request.getParameter("txtCperson");
			Photo=request.getParameter("filePhoto");
			if(Photo.length()==0){
			Photo=request.getParameter("hdnfileSup");
			}		
			System.out.println("Photo"+Photo);
			Address=request.getParameter("txtAddress");
			Locality=request.getParameter("txtLocality");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbState");
			PhoneNo=request.getParameter("txtphno");
			Email=request.getParameter("txtmail");
			Website=request.getParameter("urlWebsite");
			GSTNo=request.getParameter("txtGstno");
			Date=request.getParameter("dtDate");
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update supplierinformation set EmailID='"+Email+"',SupplierName='"+SName+"',ContactPerson='"+CPerson+"',Photo='"+Photo+"',Address='"+Address+"',Locality='"+Locality+"',City='"+City+"',StateUnion='"+State+"',PhoneNo='"+PhoneNo+"',Website='"+Website+"',GSTNo='"+GSTNo+"',Date='"+Date+"' where SupplierID='"+Sid+"'");					
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Updated Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='logs_supplierfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from supplierinformation where EmailID='"+Email+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Deleted Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='logs_supplierfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>		