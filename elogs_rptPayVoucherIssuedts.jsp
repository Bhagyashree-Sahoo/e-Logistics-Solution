<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData,stmtSum;
ResultSet rsData,rsSum;
String Voucherno,Voucherdate,Supname,Regdno,Locality,City,State_union,Paymode,CHQ_DD_OL,date,Bankname,amount,datefrom,dateto,total;
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
    <title>Payment Voucher Report </title>
    <script language="javascript">
        function myPrint(){
            window.print();
        }
    </script>
</head>
</script>
<body>
    <%
    datefrom=request.getParameter("cmbIndatefrom");
    dateto = request.getParameter("cmbIndateto");
    %>
    
<!-- Header -->
    <nav>
        <div><a href="adminmenu.html"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
        <div class = "logo">
            <h4><center><a href="adminmenu.html" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.1rem;"><span>Voucher Issue Report <BR>[<%= datefrom %>] - [<%= dateto %>]</span></a> </center></h4> 
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
        <td>Voucher No</td>
        <td>Supplier Name</td>
        <td>Regd No</td>
        <td>Locality</td>
        <td>City</td>
        <td>State_Union</td>
        <td>Payment Mode</td>
        <td>CHQ_DD_OL Refno</td>
        <td>Date</td>
        <td>Bank name</td>
        <td>Amount</td>
    </tr>
<% 
doConnect();
try{
    stmtSum = conn.createStatement();
    stmtData = conn.createStatement();
    datefrom=request.getParameter("cmbIndatefrom");
    dateto = request.getParameter("cmbIndateto");
    rsSum = stmtSum.executeQuery("select SUM(Amount) as totalamt FROM elogs_tblpaymentvoucher where VIssue_date >= '"+datefrom+"' and VIssue_date <= '"+dateto+"'");
    rsSum.next();
    total = rsSum.getString("totalamt");
    System.out.println(total);
    }

catch(SQLException se){
    out.println("error"+se);
    }

try{
    stmtData = conn.createStatement();
    datefrom=request.getParameter("cmbIndatefrom");
    dateto = request.getParameter("cmbIndateto");
    rsData = stmtData.executeQuery("select * from elogs_tblpaymentvoucher where VIssue_date >= '"+datefrom+"' and VIssue_date <= '"+dateto+"'");    
    
    slno = 1;
    while(rsData.next()){
        Voucherno = rsData.getString("Voucher_no");
        Supname = rsData.getString("Supplier_name");
        Regdno = rsData.getString("Registration_no");
        Locality = rsData.getString("Locality");
        City = rsData.getString("City");
        State_union = rsData.getString("State_Union");
        Paymode = rsData.getString("Payment_mode");
        CHQ_DD_OL = rsData.getString("Payment_ref_no");
        date = rsData.getString("Date");
        Bankname = rsData.getString("Bank_name");
        amount = rsData.getString("Amount");


        if(slno%2 == 0)
        out.println("<tr bgcolor = \"#E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td align="center"><%= slno%></td>
    <td align="center"><%= Voucherno%></td>
    <td align="center"><%= Supname%></td>
    <td align="center"><%= Regdno%></td>
    <td align="center"><%= Locality%></td>
    <td align="center"><%= City%></td>
    <td align="center"><%= State_union%></td>
    <td align="center"><%= Paymode%></td>
    <td align="center"><%= CHQ_DD_OL%></td>
    <td align="center"><%= date%></td>
    <td align="center"><%= Bankname%></td>
    <td align="right"><%= amount%></td>
    
    <% 
    slno = slno +1;
    }

}
catch(SQLException se){
    out.println("Unable to fill Array "+se);
}
%>
</tr>
<tr height="30" bgcolor="#f0f0f0" align="center" style="color:rgb(0, 0, 0);">
    <td colspan="11" align="right">Total : </td>
    
    <th align="right"><%=total%></th>
</tr>
</div>
</table>
</frameset>
<hr width="100%" height="20px">
<center><br><br>
<input type="submit" name="btmUpdate" class="button button1" value="Print/Save" onclick="myPrint()">
<input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_rptPayVoucherIssuedtc.jsp';">
</center>

</body>
</html>
