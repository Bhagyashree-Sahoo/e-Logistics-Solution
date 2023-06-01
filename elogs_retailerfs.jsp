<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Update and delete</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String RCode,RName,CPerson,Photo,Gstno,Locality,City,State,Phoneno,Faxno,Emailid,Website,btnUp,btnDel;
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
			RCode=request.getParameter("cmbRCode");
			RName=request.getParameter("txtRName");
			CPerson=request.getParameter("txtRCPerson");
			Photo=request.getParameter("filePhoto");
			if(Photo.length()==0){
			Photo=request.getParameter("hdnfileSup");
			}
			Gstno=request.getParameter("txtGSTNo");
			Locality=request.getParameter("txtLocality");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbState");
			Phoneno=request.getParameter("txtPhno");
			Faxno=request.getParameter("txtFaxNo");
			Emailid=request.getParameter("txtMailid");
			Website=request.getParameter("txtWebsite");
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblretailer set Retailer_name='"+RName+"',Contact_person='"+CPerson+"',Photo='"+Photo+"',GST_no='"+Gstno+"',Locality='"+Locality+"',City='"+City+"',State_union='"+State+"',Phone_no='"+Phoneno+"',Fax_no='"+Faxno+"',E_mailid='"+Emailid+"',Website='"+Website+"' where Retailer_code='"+RCode+"'");					
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Updated Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_retailerfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblretailer where E_mailid='"+Emailid+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Deleted Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_retailerfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>		