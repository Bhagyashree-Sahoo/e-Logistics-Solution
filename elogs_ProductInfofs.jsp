<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<title>Update and delete</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmtUpdate,stmtDelete;
        String ProCode,PSName, PSCode,PPCName,PCode,PName,Feature,PPrice,MRP,GSTSlab,Stock,Unit,Location,btnUp,btnDel; 
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
			ProCode=request.getParameter("cmbPCode");
			PSName=request.getParameter("cmbSupName");
			PSCode=request.getParameter("txtSupCode");
			PPCName=request.getParameter("cmbPubCatName");
			PCode=request.getParameter("txtProCode");
			PName=request.getParameter("txtPName");
			Feature=request.getParameter("txtPFeature");
			PPrice=request.getParameter("txtPPrice");
			MRP=request.getParameter("txtMRP");
			GSTSlab=request.getParameter("cmbGSTSlab");
			Stock=request.getParameter("txtStock");
			Unit=request.getParameter("txtUnit");
			Location=request.getParameter("txtLocation");
			btnUp=request.getParameter("btmUpdate");
			btnDel=request.getParameter("btmDelete");
			if(btnUp!=null){
				try{
					stmtUpdate=conn.createStatement();
					stmtUpdate.executeUpdate("update elogs_tblproductinfo set Supplier_name='"+PSName+"',Supplier_code='"+PSCode+"',Product_category_name='"+PPCName+"',Product_category_code='"+PCode+"',Product_name='"+PName+"',Feature='"+Feature+"',Purchase_price='"+PPrice+"',MRP='"+MRP+"',GST_slab='"+GSTSlab+"',Stock='"+Stock+"',Unit='"+Unit+"',Location='"+Location+"' where Product_code='"+ProCode+"'");					
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Updated Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_ProductInfofc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("Your updated Fails,Try again later "+se);
				}
			}
			else if(btnDel!=null){
				try{
					stmtDelete=conn.createStatement();
					stmtDelete.executeUpdate("delete from elogs_tblproductinfo where Product_code='"+ProCode+"'");
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Deleted Successfully...'"+");");
					out.println("setTimeout(function(){window.location.href='elogs_ProductInfofc.jsp'},100);");
					out.println("</script>");
				}
				catch(SQLException se){
					out.println("unable to Delete try later");
				}
			}
		%>
</body>
</html>		