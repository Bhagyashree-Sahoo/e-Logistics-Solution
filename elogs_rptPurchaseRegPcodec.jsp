<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;
Statement stmtFillPCode, stmtFillArray;
ResultSet rsPCode;
String PCode;
int i;
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

<!-- Collecting Data From database -->

<!-- Client Site  -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="shortcut icon" type="image/png" href="img1.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Purchase Register [PCODE]</title>
</head>
<script class="color">
    function showTime(){
            var dt = new Date();
            hr = dt.getHours();
            mn = dt.getMinutes();
            sc = dt.getSeconds();

            tm ="Time : "+hr + " : " +mn+" : " +sc;
        	document.getElementById("tm1").innerHTML=tm;

            d = dt.getDate();
            m = dt.getMonth()+1;
            y = dt.getFullYear();

            date ="Date : "+d+" / "+m+" / "+y;
            document.getElementById("dt1").innerHTML = date;            
            setTimeout("showTime()",1000);
    }
</script>
<body onload="showTime()" >
    
<!-- Header -->
<nav>
    <div><a href="adminmenu.html"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
    <div class = "logo">
        <h4><center><a href="adminmenu.html" style="color: white; text-decoration: none; align-items: center;letter-spacing: 0.5rem;"><span>e-Logistic Solutions</span></a> </center></h4> 
    </div>
    <div><a href="adminmenu.html"><img src="left.png" alt="" width="40px" height="40px"></a></div>
</nav>
<!-- Gradiantcolor -->

<div id="Gradiantcolor">
    <center><br><br><br><br>
        <h2>Purchase Regsiter &nbsp;&nbsp;&nbsp;<span style="text-transform:capitalize;">[Any Product Code]</span></h2><br><br><br>
        <form name= "f1" action="elogs_rptPurchaseRegPcodes.jsp"  method="GET">
            <table width="700" border="0">
                <tr> 
                    <td style="font-size:18px"><b>Select Product Code:</b></td>
                    <td>     
                        <select name="cmbPCode"  onchange ="call()" style="margin-top: 10px;
                        padding: 10px;
                        border-radius: 4px;
                        width: 250px;">  
                        <script>
                            function call(){
                                document.getElementById("disabledButton").disabled = false;
                            }    
                        </script>
                        
                        <option value="null" align="center">--Select--</option> 
                        <% doConnect();
                        try{
                            stmtFillPCode = conn.createStatement();
                            rsPCode = stmtFillPCode.executeQuery("select * from elogs_tblpurchase");
                            while(rsPCode.next()==true){
                                PCode = rsPCode.getString("Product_code");
                            %>
                            <option value = "<%=PCode%>"><%=PCode%></option>
                            <%
                            }
                        }
                        catch(SQLException se){
                            out.println("Unable to Connect");
                        }
                        %>
                        </select>
                    </td>
                </tr>
                </table><br><br>
            <br>
            <input type="submit" id = "disabledButton" class="button button1" value="Submit" disabled >
            <input type="reset" name="" class="button button3" value="Reset">
        </form>
         <h4>
        </center>      
</div>
<!-- Footer -->
<nav>
    <div class = "footer">
        <h3>&copy; Mother India Sales and Supply</h3>
    </div>
</nav>

</body>

</html>

