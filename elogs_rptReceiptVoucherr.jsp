<%@ page language="java" import="java.sql.*" session="true" %>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData;
ResultSet rsData;
HttpSession ssn;
String Voucherno,VIssuedate,Sname,Regno,Locality,City,Stateunion,Paymentmode,CDORefno,Date,Bankname,Amount;
int slno;
String retname;

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
    <title>Debtor Ledger Report </title>
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
        <div><a href="adminmenu.html"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
        <div class = "logo">
            <h4><center><a href="adminmenu.html" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.5rem;"><span>Debtor Ledger</span></a> </center></h4> 
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
<table width="100%">
    <tr height="50" bgcolor="#404040" align="center" style="color:rgb(251, 251, 251);">
        <td style="width: 2%;">Sl.No</td>
        <td>Voucher No.</td>
        <td>Voucher Issue Date</td>
        <td>Retailer Name</td>
        <td>Registration No.</td>
        <td>Locality</td>
        <td>City</td>
        <td>State Union</td>
        <td>Payment Mode</td>
        <td>Payment Ref No.</td>
        <td>Date</td>
        <td>Bank name</td>
        <td>Amount</td>
    </tr>
<% 
doConnect();
try{
    stmtData = conn.createStatement();  
    rsData = stmtData.executeQuery("select * from elogs_tblreceiptvoucher  where Retailer_name = '"+retname+"'");
    slno = 1;
    while(rsData.next()){
        Voucherno = rsData.getString("Voucher_no");
        VIssuedate = rsData.getString("Voucher_date");
        Sname = rsData.getString("Retailer_name");
        Regno = rsData.getString("Registration_no");
        Locality= rsData.getString("Locality");
        City = rsData.getString("City");
        Stateunion = rsData.getString("State_union");
        Paymentmode = rsData.getString("Payment_mode");
        CDORefno = rsData.getString("CDORef_no");
        Date = rsData.getString("Date");
        Bankname = rsData.getString("Bank_name");
        Amount = rsData.getString("Amount");

        if(slno%2 == 0)
        out.println("<tr bgcolor = \"#E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td align="center" style="height: 35px; "><%= slno%></td>
    <td align="center"><%= Voucherno%></td>
    <td align="center"><%= VIssuedate%></td>
    <td align="center"><%= Sname%></td>
    <td align="center"><%= Regno%></td>
    <td align="center"><%= Locality%></td>
    <td align="center"><%= City%></td>
    <td align="center"><%= Stateunion%></td>
    <td align="center"><%= Paymentmode%></td>
    <td align="center"><%= CDORefno%></td>
    <td align="center"><%= Date%></td>
    <td align="center"><%= Bankname%></td>
    <td align="center"><%= Amount%></td>
    <% 
    slno = slno +1;
    }
}
catch(SQLException se){
    out.println("Unable to fill Array" + se);
}
%>
</div>
</table>
</frameset>
<hr width="100%" height="20px">
<center><br><br>
<input type="submit" name="btmUpdate" class="button button1" value="Print/Save" onclick="myPrint()">
</center>

</body>
</html>