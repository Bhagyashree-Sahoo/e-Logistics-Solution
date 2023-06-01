<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;
Statement stmtFillPCode,stmtFillArray;
ResultSet rsPCode,rsFill;
String PCCode, PCName[],PPhoto[];
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
<% 
    doConnect();
    try{
        stmtFillArray = conn.createStatement();
        rsFill = stmtFillArray.executeQuery("Select * from elogs_tblprodcategory");
        PCName =  new String[20];
        PPhoto = new String[20];
        
        i = 0;
        while(rsFill.next()==true){
            PCName[i]= rsFill.getString("Product_Category_name");
            PPhoto[i]= rsFill.getString("Product_Image");

            i = i+1;
        }
    }
    catch(SQLException se){
        out.println("Unable to fill Array");
    }
%>
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
    <title>Find Page</title>
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
           
    function showProdCatgData(){
            var JPName = new Array();
            var JPPhoto = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<PCName.length){
            %>
                JPName[j] = "<%= PCName[i] %>";
                JPPhoto[j] = "<%=PPhoto[i]%>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbPCCode.selectedIndex;
                document.f1.txtProdCatgName.value = JPName[k-1];
                document.f1.imgPhoto.src = JPPhoto[k-1];
				document.f1.hdnfileProdCat.value=JPPhoto[k-1];
            }
            function showPhoto(){
        var imgPath,imgName;
        imgPath = document.f1.ProductPhoto.value;
        imgName = imgPath.substring(imgPath.lastIndexOf("\\")+1);
        document.f1.imgPhoto.src=imgName;
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
        <form name= "f1" action="elogs_ProductCatgfs.jsp"  method="GET">
            <table width="850" border="0">
                <tr>
                    <td style="font-size:18px"><b>Product Category Code :</b></td>
                    <td><select name="cmbPCCode" onchange="showProdCatgData()" style="margin-top: 10px;
                        padding: 10px;
                        border-radius: 4px;">  
                        <option value="null">--Select--</option>
                        <% doConnect();
                        try{
                            stmtFillPCode = conn.createStatement();
                            rsPCode = stmtFillPCode.executeQuery("select * from elogs_tblprodcategory");
                            while(rsPCode.next()==true){
                                PCCode = rsPCode.getString("Product_Category_code");
                            %>
                            <option value = "<%=PCCode%>"><%=PCCode%></option>
                            <%
                            }
                        }
                        catch(SQLException se){
                            out.println("Unable to Connect");
                        }
                        %>
                        </select>
                    </td>
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
                        border-radius: 4px;">
						<input type="hidden" name="hdnfileProdCat">
						</td>
                </tr>
            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmUpdate" class="button button1" value="Update">
             <input type="submit" name="btmDelete" class="button button2" value="Delete">
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_ProductCatgc.jsp';">
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

