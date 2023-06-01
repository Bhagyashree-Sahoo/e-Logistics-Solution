<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillArray1,stmtFillEmail;
ResultSet rsRetailercode,rsFillMail;
ResultSet rsPCode,rsFillP;
String rcode,mail,srslno;
int nrsslno;
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
<%
doConnect();
rcode="";
try{
    stmtFillArray1 = conn.createStatement();
    rsRetailercode = stmtFillArray1.executeQuery("SELECT MAX(SupplierID) as suppliercode FROM supplierinformation");
    if(rsRetailercode.next()){
        rcode=rsRetailercode.getString("suppliercode");
		
    }
    if(rcode==null){
        rcode="1000";
		srslno=rcode;
    }
	else
	srslno = rcode.substring(rcode.indexOf('1'));
    nrsslno = Integer.parseInt(srslno);
    nrsslno = nrsslno+ 1;
    rcode = "SUP"+"-"+ nrsslno;

    }
catch(SQLException se){
    out.println("error"+se);
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
    <title>Supplier Profile 1</title>
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
    function showPhoto(){
        var imgPath,imgName;
        imgPath = document.f1.filePhoto.value;
        imgName = imgPath.substring(imgPath.lastIndexOf("\\")+1);
        document.f1.imgPhoto.src=imgName;
    }
    function clearimage(){
        document.f1.imgPhoto.src="download2.svg";
    }
</script>
<body onload="showTime()" >
    
<!-- Header -->

    <nav>
        <div><a href="adminmenu.html"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
        <div class = "logo">
            <center><a href="adminmenu.html" style="color: white;font-weight: bold; text-decoration: none; align-items: center;letter-spacing: 0.1rem;"><span>e-Logistic Solutions</span></a> </center></h4>
        </div>
        <div class="timedate" style="font-weight: bold;">
            <p id="tm1" class="Time"></p>
            <p id="dt1" class="date"></p>
            </div>
        <div><a href="adminmenu.html"><img src="left.png" alt="" width="40px" height="40px"></a></div>
    </nav>
<!-- Gradiantcolor -->

<div id="Gradiantcolor">
    <center><br><br>
        <h2>Supplier Information</h2><br><br>
        <form name= "f1" action="logs_suppliers.jsp"  method="GET" >
            <table width="850" border="0">
                <tr>
                    <td><b>Supplier Code :</b></td>
                    <td><input type="text" name="txtSId" size="32" placeholder="Supplier Id.." autocomplete="off" value="<%= rcode %>" readonly></td>
                    <td rowspan="5" align="right">
                    <img name="imgPhoto" src="download2.svg"  width="150" height="150" style="border-radius:75px" required><img></td>
                </tr>
                <tr>
                    <td><b>Supplier Name :</b></td>
                    <td><input type="text" name="txtsName" size="32" placeholder="Supplier Name.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <td><b>Contact Person :</b></td>
                    <td><input type="text" name="txtCperson" size="32" placeholder="Contact Person.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <td><b>Photo :</b></td>
                    <td><input type="file" name="filePhoto" size="32" onchange="showPhoto()" required></td>
                </tr>
                <tr>
                    <td><b>Address :</b></td>
                    <td><input type="text" name="txtAddress" size="32" placeholder="Enter your Address.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <td><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="32" placeholder="Enter your Locality.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <td><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="32" placeholder="Enter your City.." required></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td>
                        <select name="cmbState" required>
                            <option value="Select" align="left">--Select--</option>
                            <option value="Andhrapradesh">Andhrapradesh</option>
                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chhattishgarh">Chhattishgarh</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujurat">Gujurat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachalpradesh">Himachalpradesh</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnatak">Karnatak</option>
                            <option value="Kerla">Kerla</option>
                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="Odisha">Odisha</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttarakhand">Uttarakhand</option>
                            <option value="West Bengal">West Bengal</option>
                            <option value="Andaman & Nicobar Islands">Andaman & Nicobar Islands</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Daman and Diu">Daman and Diu</option>
                            <option value="Lakshadweep">Lakshadweep</option>
                            <option value="Puduchery">Puduchery</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td><b>Phone No :</b> </td>
                    <td><input type="text" name="txtphno" size="32" placeholder="Enter your Phone No.." autocomplete="off" required></td>
                    <td><b>E-MailId : </b></td>
                    <td><input type="email" name="txtmail" size="30"  placeholder="Enter your Email.." required></td>
                </tr>
                <tr>
                    <td><b>Website :</b></td>
                    <td><input type="url" name="urlWebsite" size="32" placeholder="Enter your Website.." required></td>
                </tr>
                <tr>
                    <td><b>G.S.T No :</b></td>
                    <td><input type="text" name="txtGstno" size="32" placeholder="Enter G.S.T No.." required></td>
                    <td><b>Date :</b></td>
                    <td><input type="date" name="dtDate" required></td>
                </tr>
            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmsub" class="button button1" value="Submit">
             <input type="submit" name="btmfind" class="button button2" value="Find" onclick="window.location.href = 'logs_supplierfc.jsp';">
             <input type="reset" name="btmres" id="clearImg" class="button button3" value="Reset" onclick="clearimage()">
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

