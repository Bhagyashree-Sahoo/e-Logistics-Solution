<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Update and delete</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String VNo,Vissuedate,Suppliername,Registrationno,Locality,City,Stateunion,Paymentmode,Paymentrefno,Date,Bankname,Amount,btnUp,btnDel;
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
			VNo=request.getParameter("cmbVoucherNo");
			Vissuedate=request.getParameter("txtVoucherIssueDate");
			Suppliername=request.getParameter("cmbSupName");
			Registrationno=request.getParameter("txtRegsNo");
			Locality=request.getParameter("txtLocality");
			City=request.getParameter("txtCity");
			Stateunion=request.getParameter("cmbStateUnion");
			Paymentmode=request.getParameter("cmbPayMode");
			Paymentrefno=request.getParameter("txtRefNo");
			Date=request.getParameter("txtDate");
			Bankname=request.getParameter("cmbBankName");
			Amount=request.getParameter("txtAmount");
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblpaymentvoucher set VIssue_date='"+Vissuedate+"',Supplier_name='"+Suppliername+"',Registration_no='"+Registrationno+"',Locality='"+Locality+"',City='"+City+"',State_union='"+Stateunion+"',Payment_mode='"+Paymentmode+"',Payment_ref_no='"+Paymentrefno+"',Date='"+Date+"',Bank_name='"+Bankname+"',Amount='"+Amount+"' where Voucher_no='"+VNo+"'");					
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Updated Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_PayVoucherfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblpaymentvoucher where Voucher_no='"+VNo+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Deleted Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_PayVoucherfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>		