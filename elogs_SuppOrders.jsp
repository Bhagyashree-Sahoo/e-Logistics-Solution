<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Company Information</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String Orderno,Orderdate,Supname,Supcode,Locality,City,State,Slno,Procode,Proname,Category,Price,Ordqty,Amount;
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
			Supname=request.getParameter("cmbSupName");
			Supcode=request.getParameter("txtSupCode");
			Locality=request.getParameter("txtLocality");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbState");
			Slno=request.getParameter("txtSlno");
			Procode=request.getParameter("cmbProCode");   
			Proname=request.getParameter("txtProName");
			Category=request.getParameter("txtCategory");
			Price=request.getParameter("txtPrice");
			Ordqty=request.getParameter("txtOrderQty");
			Amount=request.getParameter("txtAmount");
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblSuppOrder Values('"+Orderno+"','"+Orderdate+"','"+Supname+"','"+Supcode+"','"+Locality+"','"+City+"','"+State+"','"+Slno+"','"+Procode+"','"+Proname+"','"+Category+"','"+Price+"','"+Ordqty+"','"+Amount+"')");
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='elogs_SuppOrderc.jsp'},100);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
			