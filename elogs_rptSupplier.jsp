<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established  -->
<%!
Connection conn;
Statement stmtData;
ResultSet rsData;
String Sid,Sname,Cperson,Photo,Address,Locality,City,State_Union,Phone_no,Emailid,Website,GSTNo,Date;
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
    <title>Supplier Report </title>
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
            <h4><center><a href="adminmenu.html" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.5rem;"><span>Supplier Report</span></a> </center></h4> 
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
        <td>Supplier id</td>
        <td>Supplier Name</td>
        <td>Contact Person</td>
        <td>Photo</td>
        <td>Address</td>
        <td>Locality</td>
        <td>City</td>
        <td>State_Union</td>
        <td>Phone_no</td>
        <td>Email_id</td>
        <td>Website</td>
        <td>GSTNo</td>
        <td>Date</td>
    </tr>
<% 
doConnect();
try{
    stmtData = conn.createStatement();
    rsData = stmtData.executeQuery("select * from supplierinformation");
    slno = 1;
    while(rsData.next()){
        Sid = rsData.getString("SupplierID");
        Sname = rsData.getString("SupplierName");
        Cperson = rsData.getString("ContactPerson");
        Photo = rsData.getString("Photo");
        Address= rsData.getString("Address");
        Locality = rsData.getString("Locality");
        City = rsData.getString("City");
        State_Union = rsData.getString("StateUnion");
        Phone_no = rsData.getString("PhoneNo");
        Emailid = rsData.getString("EmailID");
        Website = rsData.getString("Website");
        GSTNo = rsData.getString("GSTNo");
        Date = rsData.getString("Date");

        if(slno%2 == 0)
        out.println("<tr bgcolor = \"E0E0E0\">");
        else
        out.println("<tr>");
    %>
    <td><%= slno%></td>
    <td><%= Sid%></td>
    <td><%= Sname%></td>
    <td><%= Cperson%></td>
    <td><img src="<%=Photo%>" alt="" height="50px" width="50px"></td>
    <td><%= Address%></td>
    <td><%= Locality%></td>
    <td><%= City%></td>
    <td><%= State_Union%></td>
    <td><%= Phone_no%></td>
    <td><%= Emailid%></td>
    <td><%= Website%></td>
    <td><%= GSTNo%></td>
    <td><%= Date%></td>
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
</frameset>
<hr width="100%" height="20px">
<center><br><br>
<input type="submit" name="btmUpdate" class="button button1" value="Print/Save" onclick="myPrint()">
</center>

</body>
</html>
