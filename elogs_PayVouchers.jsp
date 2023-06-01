<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Data Insertion Page</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String voucherno,voucherdate,suppliername,registrationno,locality,city,stateunion,paymentmode,cdorefno,date,bankname,amount;
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
			voucherno=request.getParameter("txtVoucherNo");
			voucherdate=request.getParameter("txtVoucherIssueDate");
			suppliername=request.getParameter("cmbSupName");
			registrationno=request.getParameter("txtRegsNo");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			stateunion=request.getParameter("txtStateUnion");
			paymentmode=request.getParameter("cmbPayMode");
			cdorefno=request.getParameter("txtRefNo");
			date=request.getParameter("txtDate");
			bankname=request.getParameter("cmbBankName");
            amount=request.getParameter("txtAmount");

		
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblpaymentvoucher Values('"+voucherno+"','"+voucherdate+"','"+suppliername+"','"+registrationno+"','"+locality+"','"+city+"','"+stateunion+"','"+paymentmode+"','"+cdorefno+"','"+date+"','"+bankname+"','"+amount+"')");				
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");");
				out.println("setTimeout(function(){window.location.href='elogs_PayVoucherc.jsp'},100);");
				out.println("</script>");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
