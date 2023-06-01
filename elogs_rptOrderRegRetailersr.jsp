<%@ page language="java" import="java.sql.*" session="true"%>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData;
ResultSet rsData;
String Orno,Ordate,Retailername,code,Locality,City,State_union,Slno,Prodcode,Prodname,Catg,MRP,Qty,Amt,demo;
int slno;
String retname;
HttpSession ssn;

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
    <title>Supplier Order Report </title>
    <script language="javascript">
        function myPrint(){
            window.print();
        }
    </script>
</head>
</script>
<body>
    <%
    demo=request.getParameter("cmbRName");
    %>
    
<!-- Header -->
<nav>
        <div><a href="usermenu.jsp"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
        <div class = "logo">
            <h4><center><a href="usermenu.jsp" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.5rem;"><span>Retailer Order Report <br> [<%= demo %>]</span></a> </center></h4> 
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
<table width="100%" >
    <tr height="50" bgcolor="#404040" align="center" style="color:rgb(251, 251, 251);">
        <td>Sl.No</td>
        <td>Order no</td>
        <td>Order Date</td>
        <td>Retailer name</td>
        <td>Code</td>
        <td>Locality</td>
        <td>City</td>
        <td>State_Union</td>
        <td>Product Slno.</td>
        <td>Product Code</td>
        <td>Product Name</td>
        <td>Category</td>
        <td>MRP</td>
        <td>Quantity</td>
        <td>Amount</td>
    </tr>
<% 
doConnect();
try{
    stmtData = conn.createStatement();
    demo=request.getParameter("cmbRName");
    rsData = stmtData.executeQuery("select * from elogs_tblretailorder where Retailer_name = '"+retname+"' and Retailer_name = '"+demo+"'");    
    slno = 1;
    while(rsData.next()){
        Orno = rsData.getString("Order_no");
        Ordate = rsData.getString("Order_date");
        Retailername = rsData.getString("Retailer_name");
        code = rsData.getString("Code");
        Locality = rsData.getString("Locality");
        City = rsData.getString("City");
        State_union = rsData.getString("State_Union");
        Slno = rsData.getString("Serial_no");
        Prodcode = rsData.getString("Product_code");
        Prodname = rsData.getString("Product_name");
        Catg = rsData.getString("Category");
        MRP = rsData.getString("MRP");
        Qty = rsData.getString("Order_qty");
        Amt = rsData.getString("Amount");

        if(slno%2 == 0)
        out.println("<tr bgcolor = \"#E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td align="center"><%= slno%></td>
    <td align="center"><%= Orno%></td>
    <td align="center"><%= Ordate%></td>
    <td align="center"><%= Retailername%></td>
    <td align="center"><%= code%></td>
    <td align="center"><%= Locality%></td>
    <td align="center"><%= City%></td>
    <td align="center"><%= State_union%></td>
    <td align="center"><%= Slno%></td>
    <td align="center"><%= Prodcode%></td>
    <td align="center"><%= Prodname%></td>
    <td align="center"><%= Catg%></td>
    <td align="center"><%= MRP%></td>
    <td align="center"><%= Qty%></td>
    <td align="center"><%= Amt%></td>

    <% 
    slno = slno +1;
    }
}
catch(SQLException se){
    out.println("Unable to fill Array "+se);
}
%>
</div>
</table>
</frameset>
<hr width="100%" height="20px">
<center><br><br>
<input type="submit" name="btmUpdate" class="button button1" value="Print/Save" onclick="myPrint()">
<input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_rptOrderRegRetailercr.jsp';">
</center>

</body>
</html>
