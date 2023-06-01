<%@ page language="java" import="java.sql.*" session="true"%>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData;
ResultSet rsData;

String PInvoiceno,Invoicedate,Orderno,Orderdate,Retailername,Locality,City,Stateunion,Purchasetype,Serialno,Productcode,Productname,Catg,Price,Qty,Amount,DisPer,DisAmount,GSTPer,GSTAmount,Netamount;
String retname;
HttpSession ssn;
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
   ssn=request.getSession();
   retname=ssn.getAttribute("ssnRcode").toString();
   System.out.println("Retailer Data "+retname);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="shortcut icon" type="image/png" href="img2.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Issue Report </title>
    <script language="javascript">
        function myPrint(){
            window.print();
        }
    </script>
</head>
</script>
<body>
    
<!-- Header -->

<nav>
    <div><a href="usermenu.jsp"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
    <div class = "logo">
        <h4><center><a href="usermenu.jsp" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.5rem;"><span>Issue Register</span></a> </center></h4> 
    </div>
    <div><a href="usermenu.jsp"><img src="left.png" alt="" width="40px" height="40px"></a></div>
</nav>

<blockquote style="text-transform:none;font-family: 'Times New Roman', Times, serif;letter-spacing: 1px;color:#000000;  font-size: 20px; margin-top:0px;">
    <br>&nbsp;&nbsp;Mother India Sales and Supply<br>
    &nbsp;&nbsp;Piligrim Road , College Square <br>
    &nbsp;&nbsp;Cuttack
</blockquote>
<br>
<div>
<hr width="100%" height="20px">
</div>
<center>
<table width="100%">
    <tr height="50" bgcolor="#404040" align="center" style="color:rgb(251, 251, 251);">
        <td style="width: 2%;">Sl.No</td>
        <td>Invo.No</td>
        <td>Invo.Date</td>
        <td>Order No.</td>
        <td>Order Date</td>
        <td>Retailer Name</td>
        <td>Locality</td>
        <td>City</td>
        <td>State_Union</td>
        <td>Purchase_type</td>
        <td>Product Slno.</td>
        <td>Product Code</td>
        <td>Product Name</td>
        <td>Category</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Amount</td>
        <td>Disc_Per</td>
        <td>Disc_amount</td>
        <td>GST_Per</td>
        <td>GST_Amount</td>
        <td>Net_Amount</td>
    </tr>
<% 
doConnect();
try{
    stmtData = conn.createStatement();
    rsData = stmtData.executeQuery("select * from elogs_tblissue where Retailer_name = '"+retname+"'"); 
    slno = 1;
    while(rsData.next()){
        PInvoiceno = rsData.getString("Invoice_no");
        Invoicedate = rsData.getString("Invoice_date");
        Orderno= rsData.getString("Order_no");
        Orderdate = rsData.getString("Order_date");
        Retailername = rsData.getString("Retailer_name");
        Locality = rsData.getString("Locality");
        City = rsData.getString("City");
        Stateunion = rsData.getString("State_union");
        Purchasetype = rsData.getString("Purchase_type");
        Serialno = rsData.getString("Serial_no");
        Productcode = rsData.getString("Product_code");
        Productname = rsData.getString("Product_name");
        Catg = rsData.getString("Category");
        Price = rsData.getString("Price");
        Qty = rsData.getString("Quantity");
        Amount = rsData.getString("Amount");
        DisPer = rsData.getString("Discount_percentage");
        DisAmount = rsData.getString("Discount_amount");
        GSTPer = rsData.getString("GST_percentage");
        GSTAmount = rsData.getString("GST_amount");
        Netamount = rsData.getString("Net_amount");


        if(slno%2 == 0)
        out.println("<tr bgcolor = \"#E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td align="center"><%= slno%></td>
    <td align="center"><%= PInvoiceno%></td>
    <td align="center"><%= Invoicedate%></td>
    <td align="center"><%= Orderno%></td>
    <td align="center"><%= Orderdate%></td>
    <td align="center"><%= Retailername%></td>
    <td align="center"><%= Locality%></td>
    <td align="center"><%= City%></td>
    <td align="center"><%= Stateunion%></td>
    <td align="center"><%= Purchasetype%></td>
    <td align="center"><%= Serialno%></td>
    <td align="center"><%= Productcode%></td>
    <td align="center"><%= Productname%></td>
    <td align="center"><%= Catg%></td>
    <td align="center"><%= Price%></td>
    <td align="center"><%= Qty%></td>
    <td align="center"><%= Amount%></td>
    <td align="center"><%= DisPer%></td>
    <td align="center"><%= DisAmount%></td>
    <td align="center"><%= GSTPer%></td>
    <td align="center"><%= GSTAmount%></td>
    <td align="center"><%= Netamount%></td>

    <% 
    slno = slno +1;
    }
}
catch(SQLException se){
    out.println("Unable to fill Array");
}
%>
</div>
</table>
</center>
</frameset>
<hr width="100%" height="20px">
<center><br><br>
<input type="submit" name="btmUpdate" class="button button1" value="Print/Save" onclick="myPrint()">
</center>

</body>
</html>
