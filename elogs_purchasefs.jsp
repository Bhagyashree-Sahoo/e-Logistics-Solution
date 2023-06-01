<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Company Information</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete,stmtStockUpdate,stmtStockDelete;
		String ISno,invoiceno,invoicedate,orderno,orderdate,suppliername,locality,city,stateunion,purchasetype,slno,productcode,productname,category,price,quantity,hdnquantity,amount,disper,disamount,gstper,gstamount,netamount,btnUp,btnDel;
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
			ISno=request.getParameter("cmbPurInvoiceNo");
			invoiceno=ISno.substring(0,ISno.indexOf("_"));
			slno=ISno.substring(ISno.indexOf("_")+1);
            invoicedate=request.getParameter("txtInvoiceDate");
            orderno=request.getParameter("cmbOrderNo");
			orderdate=request.getParameter("txtOrderDate");
			suppliername=request.getParameter("txtSupName");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			stateunion=request.getParameter("cmbState");
			purchasetype=request.getParameter("cmbPurchaseType");
			slno=request.getParameter("txtSlno");   
			productcode=request.getParameter("cmbProCode");
			productname=request.getParameter("txtProName");
			category=request.getParameter("txtCategory");
			price=request.getParameter("txtPrice");
			quantity=request.getParameter("txtOrderQty");
			hdnquantity=request.getParameter("hdnOrderQty");
			amount=request.getParameter("txtAmount"); 
			disper=request.getParameter("txtDiscPer");  
			disamount=request.getParameter("txtDiscAmount");  
			gstper=request.getParameter("txtGSTPer");  
			gstamount=request.getParameter("txtGSTAmount");  
			netamount=request.getParameter("txtNetAmount");  
			btnUp=request.getParameter("btnUpdate");
			btnDel=request.getParameter("btnDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblpurchase set Invoice_date='"+invoicedate+"',Order_no='"+orderno+"',Order_date='"+orderdate+"',Supplier_name='"+suppliername+"',Locality='"+locality+"',City='"+city+"',State_Union='"+stateunion+"',Purchase_type='"+purchasetype+"',Serial_no='"+slno+"', Product_code='"+productcode+"',Product_name='"+productname+"',Category='"+category+"',Price='"+price+"',Quantity='"+quantity+"',Amount='"+amount+"',Discount_percentage='"+disper+"',Discount_amount='"+disamount+"',GST_percentage='"+gstper+"',GST_amount='"+gstamount+"',Net_amount='"+netamount+"' where Purchase_invoice_no='"+invoiceno+"' and Serial_no='"+slno+"'");	
					stmtStockUpdate=conn.createStatement();
					stmtStockUpdate.executeUpdate("update elogs_tblproductinfo set stock=stock-'"+hdnquantity+"'+'"+quantity+"' where Product_code='"+productcode+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_purchasefc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtStockDelete=conn.createStatement();
					stmtStockDelete.executeUpdate("update elogs_tblproductinfo set stock=stock-'"+quantity+"' where Product_code='"+productcode+"'");
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblpurchase where Purchase_invoice_no='"+invoiceno+"' and Serial_no='"+slno+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data delete Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_purchasefc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>
			