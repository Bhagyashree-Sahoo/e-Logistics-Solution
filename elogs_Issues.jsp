<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Data Insertion Page</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave,stmtStockUpdate;
		String invoiceno,invoicedate,orderno,orderdate,retailername,locality,city,stateunion,purchasetype,serialno,productcode,productname,category,price,quantity,amount,discountpercentage,discountamount,gstpercentage,gstamount,netamount;
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
			invoiceno=request.getParameter("txtInvoiceNo");
			invoicedate=request.getParameter("txtInvoiceDate");
			orderno=request.getParameter("cmbOrderNo");
			orderdate=request.getParameter("txtOrderDate");
			retailername=request.getParameter("txtRetailName");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			stateunion=request.getParameter("txtStateUnion");
			purchasetype=request.getParameter("cmbPurchaseType");
			serialno=request.getParameter("txtSlno");
			productcode=request.getParameter("cmbProCode");
			productname=request.getParameter("txtProName");
            category=request.getParameter("txtCategory");
			price=request.getParameter("txtPrice");
			quantity=request.getParameter("txtOrderQty");
			amount=request.getParameter("txtAmount");
			discountpercentage=request.getParameter("txtDiscPer");
			discountamount=request.getParameter("txtDiscAmount");
			gstpercentage=request.getParameter("txtGSTPer");
			gstamount=request.getParameter("txtGSTAmount");
			netamount=request.getParameter("txtNetAmount");

		
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblissue Values('"+invoiceno+"','"+invoicedate+"','"+orderno+"','"+orderdate+"','"+retailername+"','"+locality+"','"+city+"','"+stateunion+"','"+purchasetype+"','"+serialno+"','"+productcode+"','"+productname+"','"+category+"','"+price+"','"+quantity+"','"+amount+"','"+discountpercentage+"','"+discountamount+"','"+gstpercentage+"','"+gstamount+"','"+netamount+"')");
				stmtStockUpdate=conn.createStatement();
				stmtStockUpdate.executeUpdate("update elogs_tblproductinfo set Stock=Stock-'"+quantity+"' where Product_code='"+productcode+"'");				
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");");
				out.println("setTimeout(function(){window.location.href='elogs_Issuec.jsp'},100);");
				out.println("</script>");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
