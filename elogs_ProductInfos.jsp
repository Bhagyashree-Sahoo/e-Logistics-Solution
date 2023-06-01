<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Data Insertion Page</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String suppliername,suppliercode,prodcatgname,prodcatgcode,prodcode,prodname,feature,purchaseprice,mrp,gstslab,stock,unit,location;
		
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
			suppliername=request.getParameter("cmbSupName");
			suppliercode=request.getParameter("txtSupCode");
			prodcatgname=request.getParameter("cmbPubCatName");
			prodcatgcode=request.getParameter("txtProCode");
			prodcode=request.getParameter("txtPCode");
			prodname=request.getParameter("txtPName");
			feature=request.getParameter("txtPFeature");
			purchaseprice=request.getParameter("txtPPrice");
			mrp=request.getParameter("txtMRP");
			gstslab=request.getParameter("cmbGSTSlab");
			stock=request.getParameter("txtStock");
			unit=request.getParameter("txtUnit");
			location=request.getParameter("txtLocation");
		
			doConnect();
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into elogs_tblproductinfo Values('"+suppliername+"','"+suppliercode+"','"+prodcatgname+"','"+prodcatgcode+"','"+prodcode+"','"+prodname+"','"+feature+"','"+purchaseprice+"','"+mrp+"','"+gstslab+"','"+stock+"','"+unit+"','"+location+"')");
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data submit Successfully...'"+");");
				out.println("setTimeout(function(){window.location.href='elogs_ProductInfoc.jsp'},1000);");
				out.println("</script>");
			}
			catch(SQLException se){
				out.println("Your Registration Fails,Try again later "+se);
			}
		%>
</body>
</html>
