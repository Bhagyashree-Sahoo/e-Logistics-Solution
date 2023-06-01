<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Update and delete</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
		String PCCode,PCName,PPhoto,btnUp,btnDel;
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
			PCCode=request.getParameter("cmbPCCode");
			PCName=request.getParameter("txtProdCatgName");
			PPhoto=request.getParameter("ProductPhoto");
			if(PPhoto.length()==0){
			PPhoto=request.getParameter("hdnfileProdCat");
			}
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblprodcategory set Product_Category_name='"+PCName+"',Product_Image='"+PPhoto+"'where Product_Category_code='"+PCCode+"'");					
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Updated Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_ProductCatgfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblprodcategory where Product_Category_code='"+PCCode+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Deleted Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_ProductCatgfc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>		