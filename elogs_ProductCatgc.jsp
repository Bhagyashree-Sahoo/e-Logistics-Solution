<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillArray1;
ResultSet rsProdCatgCode;
ResultSet rsPCode,rsFillP;
String procatgcode,srslno;
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
procatgcode="";
try{
    stmtFillArray1 = conn.createStatement();
    rsProdCatgCode = stmtFillArray1.executeQuery("SELECT MAX(Product_Category_code) as retaileprocatgcode FROM elogs_tblprodcategory");
    if(rsProdCatgCode.next()){
        procatgcode=rsProdCatgCode.getString("retaileprocatgcode");
		
    }
    if(procatgcode==null){
        procatgcode="3000";
		srslno=procatgcode;
    }
	else
	srslno = procatgcode.substring(procatgcode.indexOf('3'));
    nrsslno = Integer.parseInt(srslno);
    nrsslno = nrsslno+ 1;
    procatgcode = "PRODUCT"+"-"+ nrsslno;

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
    <title>Product Page 3</title>
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
        imgPath = document.f1.ProductPhoto.value;
        imgName = imgPath.substring(imgPath.lastIndexOf("\\")+1);
        document.f1.imgPhoto.src=imgName;
    }
    function changeImage(){
        document.f1.imgPhoto.src = "download3.png";
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
    <center><br><br><br>
        <h2>Product  Category  Information</h2><br><br><br>
        <form name= "f1" action="elogs_ProductCatgs.jsp"  method="GET">
            <table width="850" border="0">
                <tr>
                    <td style="font-size:18px"><b>Product Category Code :</b></td>
                    <td><input type="text"  name="txtProdId" size="32" placeholder="Product Category Code.." autocomplete="off" value="<%= procatgcode %>" readonly style="margin-top: 10px;
                        padding: 10px;
                        border-radius: 4px;"></td>
                    <td rowspan="3" align="right">
                    <img name="imgPhoto" src="download3.png" width="180" height="180" ></td>
                </tr>
                <tr>
                    <td style="font-size:18px"><b>Product Category Name :</b></td>
                    <td><input type="text"  name="txtProdCatgName" size="32" placeholder="Product Category Name.." autocomplete="off" style="margin-top: 10px;
                        padding: 10px;
                        border-radius: 4px;"required></td>
                </tr>
                <tr>
                    <td style="font-size:18px"><b>Image :</b></td>
                    <td><input type="file" name="ProductPhoto" size="32" onchange="showPhoto()" style="margin-top: 10px;
                        padding: 10px;
                        border-radius: 4px;"></td>
                </tr>
            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmsub" class="button button1" value="Submit">
             <input type="submit" name="btmfind" class="button button2" value="Find" onclick="window.location.href = 'elogs_ProductCatgfc.jsp';">
             <input type="reset" name="btmres" class="button button3" value="Reset" onclick="changeImage()">
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

