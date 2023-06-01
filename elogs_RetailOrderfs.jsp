<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Company Information</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String orslno,orderno,orderdate,retailername,code,locality,city,stateunion,slno,productcode,productname,category,MRP,orderqty,amount,btnUp,btnDel;
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
			orslno=request.getParameter("cmbOrderNumber");
			orderno=orslno.substring(0,orslno.indexOf("_"));
			slno=orslno.substring(orslno.indexOf("_")+1);
			orderdate=request.getParameter("txtOrderDate");
			retailername=request.getParameter("cmbRetailName");
			code=request.getParameter("txtRetailCode");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			stateunion=request.getParameter("cmbStateUnion");
			slno=request.getParameter("txtSlno");   
			productcode=request.getParameter("cmbProCode");
			productname=request.getParameter("txtProName");
			category=request.getParameter("txtCategory");
			MRP=request.getParameter("txtMRP");
			orderqty=request.getParameter("txtOrderQty");
			amount=request.getParameter("txtAmount");  
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblretailorder set Order_date='"+orderdate+"',Retailer_name='"+retailername+"',Code='"+code+"',Locality='"+locality+"',City='"+city+"',State_union='"+stateunion+"',Serial_no='"+slno+"', Product_code='"+productcode+"',Product_name='"+productname+"',Category='"+category+"',MRP='"+MRP+"',Order_qty='"+orderqty+"',Amount='"+amount+"' where Order_no='"+orderno+"' and Serial_no='"+slno+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_RetailOrderfc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblretailorder where Order_no='"+orderno+"' and Serial_no='"+slno+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data delete Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_RetailOrderfc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>
			