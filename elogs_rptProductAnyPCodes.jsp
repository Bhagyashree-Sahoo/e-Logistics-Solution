<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData;
ResultSet rsData;
String Orno,SupplierName,SupCode,ProductCatgName,ProductCatgCode,ProductName,Feature,PurchasePrice,MRP,GSTSlab,Stock,Unit,Location,demo;
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
    demo=request.getParameter("CmbPCode");
    %>
    
<!-- Header -->
    <nav>
        <div><a href="adminmenu.html"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
        <div class = "logo">
            <h4><center><a href="adminmenu.html" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.1rem;"><span>Product Code Register [<%= demo %>]</span></a> </center></h4> 
        </div>
        <div><a href="adminmenu.html"><img src="left.png" alt="" width="40px" height="40px"></a></div>
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
        <td>Supplier Name</td>
        <td>Supplier Code</td>
        <td>Product Category Name</td>
        <td>Product Category Code</td>
        <td>Product Name</td>
        <td>Feature</td>
        <td>Purchase Price</td>
        <td>MRP</td>
        <td>GST Slab</td>
        <td>Stock</td>
        <td>Unit</td>
        <td>Location</td>
    </tr>
<% 
doConnect();
try{ 
    stmtData = conn.createStatement();
    demo=request.getParameter("CmbPCode");
    rsData = stmtData.executeQuery("select * from elogs_tblproductinfo where Product_code = '"+demo+"'");    
    slno = 1;
    while(rsData.next()){
        SupplierName = rsData.getString("Supplier_name");
        SupCode = rsData.getString("Supplier_code");
        ProductCatgName = rsData.getString("Product_category_name");
        ProductCatgCode = rsData.getString("Product_category_code");
        ProductName = rsData.getString("Product_name");
        Feature = rsData.getString("Feature");
        PurchasePrice = rsData.getString("Purchase_price");
        MRP = rsData.getString("MRP");
        GSTSlab = rsData.getString("GST_slab");
        Stock = rsData.getString("Stock");
        Unit = rsData.getString("Unit");
        Location = rsData.getString("Location");

        if(slno%2 == 0)
        out.println("<tr bgcolor = \"#E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td align="center"><%= slno%></td>
    <td align="center"><%= SupplierName%></td>
    <td align="center"><%= SupCode%></td>
    <td align="center"><%= ProductCatgName%></td>
    <td align="center"><%= ProductCatgCode%></td>
    <td align="center"><%= ProductName%></td>
    <td align="center"><%= Feature%></td>
    <td align="center"><%= PurchasePrice%></td>
    <td align="center"><%= MRP%></td>
    <td align="center"><%= GSTSlab%></td>
    <td align="center"><%= Stock%></td>
    <td align="center"><%= Unit%></td>
    <td align="center"><%= Location%></td>

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
<input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_rptProductAnyPCodec.jsp';">
</center>

</body>
</html>
