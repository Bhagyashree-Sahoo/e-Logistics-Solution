<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Company Information</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String Orderno,Orderdate,Retailname,Retailcode,Locality,City,State,Slno,Procode,Proname,Category,MRP,Ordqty,Amount;
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
            Orderno=request.getParameter("txtOrderNo");
			Orderdate=request.getParameter("txtOrderDate");
			Retailname=request.getParameter("cmbRetailName");
			Retailcode=request.getParameter("txtRetailCode");
			Locality=request.getParameter("txtLocality");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbStateUnion");
			Slno=request.getParameter("txtSlno");
			Procode=request.getParameter("cmbProCode");   
			Proname=request.getParameter("txtProName");
			Category=request.getParameter("txtCategory");
			MRP=request.getParameter("txtMRP");
			Ordqty=request.getParameter("txtOrderQty");
			Amount=request.getParameter("txtAmount");
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblretailorder Values('"+Orderno+"','"+Orderdate+"','"+Retailname+"','"+Retailcode+"','"+Locality+"','"+City+"','"+State+"','"+Slno+"','"+Procode+"','"+Proname+"','"+Category+"','"+MRP+"','"+Ordqty+"','"+Amount+"')");
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='elogs_RetailOrderc.jsp'},100);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
			