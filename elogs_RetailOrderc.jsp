<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillRName,stmtFillArrayRetailerInfo,stmtRetailOrderNo;
Statement stmtFillPCode,stmtFillArray;
ResultSet rsRName,rsFillRInfo;
ResultSet rsPCode,rsFillPInfo,rsretailorder;
String RName, RCode[],RLocality[],RCity[],RStateunion[];
String PCode,PName[],PCategory[],PMRP[];
String retailorder,srslno;
int i,nrsslno;
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
    retailorder="";
    try{
    stmtRetailOrderNo = conn.createStatement();
    rsretailorder = stmtRetailOrderNo.executeQuery("SELECT MAX(Order_no) as rorder FROM elogs_tblretailorder");
    if(rsretailorder.next()){
        retailorder=rsretailorder.getString("rorder");
        System.out.println(retailorder);
    }
    if(retailorder==null){
        retailorder="6000";
		srslno=retailorder;
    }
    else
        srslno = retailorder.substring(retailorder.indexOf('6'));
        nrsslno = Integer.parseInt(srslno);
        nrsslno = nrsslno+ 1;
        System.out.println(nrsslno);
        retailorder = "RO"+"-"+ nrsslno;
    }
    catch(SQLException se){
    out.println("error"+se);
    }
    %>
    <%
    doConnect();
    try{
        stmtFillArrayRetailerInfo = conn.createStatement();
        rsFillRInfo = stmtFillArrayRetailerInfo.executeQuery("Select * from elogs_tblretailer");
        RCode=  new String[20];
        RLocality=  new String[20];
        RCity=  new String[20];
        RStateunion=  new String[20];

        
        i = 0;
        while(rsFillRInfo.next()==true){
            RCode[i]= rsFillRInfo.getString("Retailer_code");
            RLocality[i]= rsFillRInfo.getString("Locality");
            RCity[i]= rsFillRInfo.getString("City");
            RStateunion[i]= rsFillRInfo.getString("State_union");
            i = i+1;
        }
    }
    catch(SQLException se){
        out.println("Unable to fill Array");
    }

    try{
        stmtFillArray = conn.createStatement();
        rsFillPInfo = stmtFillArray.executeQuery("Select * from elogs_tblproductinfo");
        PName=  new String[20];
        PCategory=  new String[20];
        PMRP=  new String[20];
        
        i = 0;
        while(rsFillPInfo.next()==true){
            PName[i]= rsFillPInfo.getString("Product_name");
            PCategory[i]= rsFillPInfo.getString("Product_category_name");
            PMRP[i]= rsFillPInfo.getString("MRP");
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
    <link rel="shortcut icon" type="image/png" href="img2.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Retailer Order 7</title>
</head>
<script class="color">
    //Start Here....Always Same
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
    } //End Here...Always Same
    
    function showRetailerInfoData(){
            var JSCode = new Array();
            var JLocality = new Array();
            var JCity = new Array();
            var JStateunion = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<RCode.length){
            %>
                JSCode[j] = "<%= RCode[i] %>";
                JLocality[j] = "<%= RLocality[i] %>";
                JCity[j] = "<%= RCity[i] %>";
                JStateunion[j] = "<%= RStateunion[i] %>";


                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbRetailName.selectedIndex;
                document.f1.txtRetailCode.value = JSCode[k-1];
                document.f1.txtLocality.value = JLocality[k-1];
                document.f1.txtCity.value = JCity[k-1];
                document.f1.cmbStateUnion.value = JStateunion[k-1];
                
            }

        function showProdCodeShowData(){
            var JPName = new Array();
            var JPCategory = new Array();
            var JPMRP = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<PName.length){
            %>
                JPName[j] = "<%= PName[i] %>";
                JPCategory[j] = "<%= PCategory[i] %>";
                JPMRP[j] = "<%= PMRP[i] %>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbProCode.selectedIndex;
                document.f1.txtProName.value = JPName[k-1];
                document.f1.txtCategory.value = JPCategory[k-1];
                document.f1.txtMRP.value = JPMRP[k-1];
    }

    function showAmt(){
            var price,qty,amount;
            price = parseFloat(document.f1.txtMRP.value);
            qty = parseInt(document.f1.txtOrderQty.value);
            amount = price*qty;
            document.f1.txtAmount.value=amount;
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
        <h2 >Order Form &nbsp;&nbsp;[Retailer]</h2><br><br>
        <form name= "f1" action="elogs_RetailOrders.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Order No :</b> </td>
                        <td><input type="text" name="txtOrderNo" placeholder="Enter Order No.." autocomplete="off" value="<%= retailorder %>"required></td>
                        <td style="font-size:17px"><b>Order Date : </b></td>
                        <td><input type="Date" name="txtOrderDate" size="10" ></td>
                    </tr>

                    <tr>
                        <td style="font-size:17px"><b>Retailer Name :</b></td>
                        <td><select name="cmbRetailName" onchange="showRetailerInfoData()" style="width: 230px">  
                            <option value="null" >--Retailer Name--</option>
    
                            <% doConnect();
                            try{
                                stmtFillRName = conn.createStatement();
                                rsRName= stmtFillRName.executeQuery("select * from elogs_tblretailer");
                                while(rsRName.next()==true){
                                    RName = rsRName.getString("Retailer_name");
                                %>
                                <option value = "<%=RName%>"><%=RName%></option>
                                <%
                                }
                            }
                            catch(SQLException se){
                                out.println("Unable to Connect");
                            }
                            %>
    
                            </select>
                        </td>
                        <td style="font-size:17px"><b>Code :</b></td>
                        <td><input type="text"  name="txtRetailCode" size="10" autocomplete="off" readonly></td>     
                    </tr>
                <tr>
                    <td style="font-size:17px"><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="10" placeholder="Enter Locality.." readonly></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="10" placeholder="Enter City" readonly></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td>
                        <select name="cmbStateUnion" >
                            <option value="Select" align="left" >--Select--</option>
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
            </table><br><br>
                <table width="70%" border="1">
                <tr>
                    <td style="font-size:17px" height="40px" align="center" ><b>Serial No :</b> </td>
                    <td style="font-size:17px" align="center"><b>Product Code : </b></td>
                    <td style="font-size:17px" align="center"><b>Product Name : </b></td>
                    <td style="font-size:17px" align="center"><b>Category : </b></td>
                    <td style="font-size:17px" align="center"><b>M.R.P. : </b></td>
                    <td style="font-size:17px" align="center"><b>Order Quantity : </b></td>
                    <td style="font-size:17px" align="center"><b>Amount : </b></td>
                </tr>
                <tr>
                    <td height="30px" align="center">
                        <input type="text" name="txtSlno">
                    </td>
                    <td align="center" width="150px">
                        <select name="cmbProCode" onchange="showProdCodeShowData()">
                        <option value="Select" align="center">--Select--</option>

                        <% doConnect();
                        try{
                            stmtFillPCode = conn.createStatement();
                            rsFillPInfo= stmtFillPCode.executeQuery("select * from elogs_tblproductinfo");
                            while(rsFillPInfo.next()==true){
                                PCode = rsFillPInfo.getString("Product_code");
                            %>
                            <option value = "<%=PCode%>"><%=PCode%></option>
                            <%
                            }
                        }
                        catch(SQLException se){
                            out.println("Unable to Fill Product code");
                        }
                        %>

                        </select>
                    </td>
                    <td align="center">
                        <input type="text" name="txtProName" readonly>
                    </td>
                    <td align="center">
                        <input type="text" name="txtCategory" readonly>
                    </td>
                    <td align="center">
                        <input type="text" name="txtMRP" >
                    </td>
                    <td align="center">
                        <input type="text" name="txtOrderQty" onblur="showAmt()">
                    </td>
                    <td align="center">
                        <input type="text" name="txtAmount" readonly>
                    </td>
                </tr>
            </table>
            <br><br>
            <br>
            <input type="submit" name="btmSubmit" class="button button1" value="Submit">
             <input type="button" name="btmFind" class="button button2" value="Find" onclick="window.location.href = 'elogs_RetailOrderfc.jsp';">
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = '';">
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

