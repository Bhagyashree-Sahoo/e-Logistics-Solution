<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Company Information</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String orslno,orderno,orderdate,suppliername,code,locality,city,stateunion,slno,productcode,productname,category,price,orderqty,amount,btnUp,btnDel;
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
			suppliername=request.getParameter("cmbSupName");
			code=request.getParameter("txtSupCode");
			locality=request.getParameter("txtLocality");
			city=request.getParameter("txtCity");
			stateunion=request.getParameter("cmbState");
			slno=request.getParameter("txtSlno");   
			productcode=request.getParameter("cmbProCode");
			productname=request.getParameter("txtProName");
			category=request.getParameter("txtCategory");
			price=request.getParameter("txtPrice");
			orderqty=request.getParameter("txtOrderQty");
			amount=request.getParameter("txtAmount");  
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblsupporder set Order_date='"+orderdate+"',Supplier_name='"+suppliername+"',Code='"+code+"',Locality='"+locality+"',Locality='"+locality+"',City='"+city+"',State_Union='"+stateunion+"',Sl_no='"+slno+"', Product_code='"+productcode+"',Product_name='"+productname+"',Category='"+category+"',Price='"+price+"',Order_qty='"+orderqty+"',Amount='"+amount+"' where Order_no='"+orderno+"' and Sl_no='"+slno+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_SuppOrderfc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblsupporder where Order_no='"+orderno+"' and Sl_no='"+slno+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data delete Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='elogs_SuppOrderfc.jsp'},100);");
					out.println("</script>\n");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>
			