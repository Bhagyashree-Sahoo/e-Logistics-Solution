<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData,stmtSum;
ResultSet rsData,rsSum;
String Productcode,Productname,Category,Price,Qty,Amount,Disper,Disamt,Gstper,Gstamt,Netamt,demo;
String Retailername,Locality,City,Stateunion,Invoiceno,Invoicedate,Orderno,Orderdate,Invoice;
String total,amounttotal,discamount,gstamount;
int slno;

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
try{
    stmtSum = conn.createStatement();
    Invoice=request.getParameter("cmbInvoice");
    rsSum = stmtSum.executeQuery("SELECT SUM(Net_amount) as totalnetamt ,SUM(Amount) as totalamt , SUM(Discount_amount) as disamt, SUM(GST_amount) as gstamt FROM elogs_tblissue where Invoice_no = '"+Invoice+"' ");
    rsSum.next();
    total = rsSum.getString("totalnetamt");
	amounttotal = rsSum.getString("totalamt");
	discamount = rsSum.getString("disamt");
	gstamount = rsSum.getString("gstamt");
    }

catch(SQLException se){
    out.println("error"+se);
    }
try{
    stmtData = conn.createStatement();
    demo=request.getParameter("cmbInvoice");
    rsData = stmtData.executeQuery("select * from elogs_tblissue where Invoice_no = '"+demo+"'");    
    slno = 1;
    while(rsData.next()){
		Retailername = rsData.getString("Retailer_name");
		Locality = rsData.getString("Locality");
		City = rsData.getString("City");
		Stateunion = rsData.getString("State_union");
		Invoiceno = rsData.getString("Invoice_no");
		Invoicedate = rsData.getString("Invoice_date");
		Orderno = rsData.getString("Order_no");
		Orderdate = rsData.getString("Order_date");
    }
}
catch(SQLException se){
    out.println("Unable to fill Array "+se);
}
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="style.css">
		<link rel="license" href="https://www.opensource.org/licenses/mit-license/">
		<link rel="stylesheet" href="stylebill.css">
		<script src="script.js"></script>
	</head>
	<body>
		<header>
			<h1>Invoice</h1>
			<div class="alignitem">
			<address contenteditable>
				<p>Mother India Sales and Supply</p>
				<p>Piligrim Road,<br>College Square</p>
				<p>Cuttack- 753003</p>
			</address>
      		<address >
				<p>GST : 21AACCF8045D1ZM</p>
				<p>GST Date : 18-05-2016</p>
			</address>
		</div>
		</header>
		<article>
			<address contenteditable>
				<p>Shipped to,</p>
				<p><%= Retailername %></p>
				<p><%= Locality %><br><%= City %></p>
				<p><%= Stateunion %></p>
			</address>
			<table class="meta">
				<tr>
					<th><span contenteditable>Invoice No</span></th>
					<td><span contenteditable><%= Invoiceno %></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Invoice Date</span></th>
					<td><span contenteditable><%= Invoicedate %></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Order No</span></th>
					<td></span><span><%= Orderno %></span></td>
				</tr>
        		<tr>
					<th><span contenteditable>Order Date</span></th>
					<td><span><%= Orderdate %></span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th style="text-align: left; width: 2.5%; "><span contenteditable>Sl.No</span></th>
						<th style="text-align: left; width: 4%;"><span contenteditable>Product Code</span></th>
						<th style="text-align: left; width: 8%; "><span contenteditable>Product Name</span></th>
						<th style="text-align: left; width: 5%;"><span contenteditable>Category</span></th>
						<th style="text-align: left; width:3% "><span contenteditable>Price</span></th>
						<th style="text-align: left; width:2% "><span contenteditable>Qty</span></th>
						<th style="text-align: left; width:5%"><span contenteditable>Amt.</span></th>
						<th style="text-align: left; width:3%"><span contenteditable>Dis. %tage</span></th>
						<th style="text-align: left; width:4%"><span contenteditable>Dis. Amt</span></th>
						<th style="text-align: left; width:3%"><span contenteditable>GST. %tage</span></th>
						<th style="text-align: left; width:3%"><span contenteditable>GST. Amt</span></th>
						<th style="text-align: left; width:5%"><span contenteditable>Net Amt</span></th>
					</tr>
				</thead>
				<tbody>
					<% 
						doConnect();

						try{
							stmtData = conn.createStatement();
							demo=request.getParameter("cmbInvoice");
							rsData = stmtData.executeQuery("select * from elogs_tblissue where Invoice_no = '"+demo+"'");     
							slno = 1; 
							while(rsData.next()){
								Productcode = rsData.getString("Product_code");
								System.out.println(Productcode);
								Productname = rsData.getString("Product_name");
								Category = rsData.getString("Category");
								Price = rsData.getString("Price");
								Qty = rsData.getString("Quantity");
								Amount = rsData.getString("Amount");
								Disper = rsData.getString("Discount_percentage");
								Disamt = rsData.getString("Discount_amount");
								Gstper = rsData.getString("GST_percentage");
								Gstamt = rsData.getString("GST_amount");
								Netamt = rsData.getString("Net_amount");
						
								if(slno%2 == 0)
								out.println("<tr bgcolor = \"#E0E0E0\">");
								else
								out.println("<tr>");
							%>
							<td><%= slno%></td>
							<td><%= Productcode%></td>
							<td align="left"><%= Productname%></td>
							<td><%= Category%></td>
							<td><%= Price%></td>
							<td><%= Qty%></td>
							<td><%= Amount%></td>
							<td><%= Disper%></td>
							<td><%= Disamt%></td>
							<td><%= Gstper%></td>
							<td><%= Gstamt%></td>
							<td><%= Netamt%></td>						
							<% 
							slno = slno +1;
							}
						}
						catch(SQLException se){
							out.println("Unable to fill Array "+se);
						}
						%>
				</tbody>
			</table>
			<table class="balance">
				<tr>
					<th><span contenteditable>Amount</span></th>
					<td><span><b>Rs.</b></span><span><%= amounttotal %></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Discount Amount.</span></th>
					<td><span><b>Rs.</b></span><span contenteditable><%= discamount %></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Gst. Amount</span></th>
					<td><span><b>Rs.</b></span><span><%= gstamount %></span></td>
				</tr>
				<tr>
					<th><span contenteditable>Net Amount</span></th>
					<td><span><b>Rs.</b></span><span><%= total%></span></td>
				</tr>
			</table>
		</article>
		<aside><br><br><br>
			<h1><span contenteditable>Additional Notes</span></h1>
			<div style="display: flex; justify-content: space-between;">
				<address contenteditable>
					<p>*All Disputes are Subject to Cuttack Jurisdiction</p>
					<p>*Goods once sold cannot be returned back.</p>
					<p>*E.& O.E.</p>
				</address>
				  <address >
					<p>For</p>
					<p>Mother India Sales and Supply </p>
				</address>
			</div>
		</aside>
	</body>
</html>