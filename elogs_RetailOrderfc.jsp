<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillRName;
Statement stmtFillOrderNo;
Statement stmtFillPCode;
Statement stmtFillArrayOrderData;
ResultSet rsFillOrderData;
ResultSet rsFillPInfo;
ResultSet rsOrderNo;
ResultSet rsRName;
String RName;
String PCode;
String OrderNo,SerialNo,OrderNo_SerialNo,SOrderDate[],SRetailerName[],SCode[],SLocality[],SCity[],SStateUnion[],SSlNo[],SProductCode[],SProductName[],SCategory[],SMRP[],SOrderQty[],SAmount[];
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
    doConnect();
    try{
        stmtFillArrayOrderData = conn.createStatement();
        rsFillOrderData = stmtFillArrayOrderData.executeQuery("Select * from elogs_tblretailorder");
        SOrderDate= new String[20];
        SRetailerName= new String[20];
        SCode=  new String[20];
        SLocality=  new String[20];
        SCity=  new String[20];
        SStateUnion=  new String[20];
        SSlNo = new String[20];
        SProductCode = new String[20];
        SProductName = new String[20];
        SCategory = new String[20];
        SMRP = new String[20];
        SOrderQty = new String[20];
        SAmount = new String[20];
        
        i = 0;
        while(rsFillOrderData.next()==true){
            SOrderDate[i]= rsFillOrderData.getString("Order_date");
            SRetailerName[i]= rsFillOrderData.getString("Retailer_name");
            SCode[i]= rsFillOrderData.getString("Code");
            SLocality[i]= rsFillOrderData.getString("Locality");
            SCity[i]= rsFillOrderData.getString("City");
            SStateUnion[i]= rsFillOrderData.getString("State_union");
            SSlNo[i]= rsFillOrderData.getString("Serial_no");
            SProductCode[i]= rsFillOrderData.getString("Product_code");
            SProductName[i]= rsFillOrderData.getString("Product_name");
            SCategory[i]= rsFillOrderData.getString("Category");
            SMRP[i]= rsFillOrderData.getString("MRP");
            SOrderQty[i]= rsFillOrderData.getString("Order_qty");
            SAmount[i]= rsFillOrderData.getString("Amount");


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
    

    function GetAllRetailerFormData(){
            var JSOrderDate = new Array();
            var JSRetailerName = new Array();
            var JSCode = new Array();
            var JSLocality = new Array();
            var JSCity = new Array();
            var JSStateUnion = new Array();
            var JSSlNo = new Array();
            var JSProductCode = new Array();
            var JSProductName = new Array();
            var JSCategory = new Array();
            var JSMRP = new Array();
            var JSOrderQty = new Array();
            var JSAmount = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SOrderDate.length){
            %>
                JSOrderDate[j] = "<%= SOrderDate[i] %>";
                JSRetailerName[j] = "<%= SRetailerName[i] %>";
                JSCode[j] = "<%= SCode[i] %>";
                JSLocality[j] = "<%= SLocality[i] %>";
                JSCity[j] = "<%= SCity[i] %>";
                JSStateUnion[j] = "<%= SStateUnion[i] %>";
                JSSlNo[j] = "<%= SSlNo[i] %>";
                JSProductCode[j] = "<%= SProductCode[i] %>";
                JSProductName[j] = "<%= SProductName[i] %>";
                JSCategory[j] = "<%= SCategory[i] %>";
                JSMRP[j] = "<%= SMRP[i] %>";
                JSOrderQty[j] = "<%= SOrderQty[i] %>";
                JSAmount[j] = "<%= SAmount[i] %>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
            
                k = document.f1.cmbOrderNumber.selectedIndex;
                document.f1.txtOrderDate.value = JSOrderDate[k-1];
                document.f1.cmbRetailName.value = JSRetailerName[k-1];
                document.f1.txtRetailCode.value = JSCode[k-1];
                document.f1.txtLocality.value = JSLocality[k-1];
                document.f1.txtCity.value = JSCity[k-1];
                document.f1.cmbStateUnion.value = JSStateUnion[k-1];
                document.f1.txtSlno.value = JSSlNo[k-1];
                document.f1.cmbProCode.value = JSProductCode[k-1];
                document.f1.txtProName.value = JSProductName[k-1];
                document.f1.txtCategory.value = JSCategory[k-1];
                document.f1.txtMRP.value = JSMRP[k-1];
                document.f1.txtOrderQty.value = JSOrderQty[k-1];
                document.f1.txtAmount.value = JSAmount[k-1]; 
                document.getElementById("btnup").disabled=false; 
                document.getElementById("btndel").disabled=false;           

            }
    function showAmt(){
            var price,qty,amount;
            price = parseFloat(document.f1.txtPrice.value);
            qty = parseInt(document.f1.txtOrderQty.value);
            amount = price*qty;
            document.f1.txtAmount.value=amount;
        }
    

</script>
<body onload="showTime()" >
    
<!-- Header -->
<nav>
    <div><a href="usermenu.jsp"><img src="house.png" alt="" width="45px" height="40px" style="color: white;"></a></div>
    <div class = "logo">
        <center><a href="usermenu.jsp" style="color: white;font-weight: bold; text-decoration: none; align-items: center;letter-spacing: 0.1rem;"><span>e-Logistic Solutions</span></a> </center></h4>
    </div>
    <div class="timedate" style="font-weight: bold;">
        <p id="tm1" class="Time"></p>
        <p id="dt1" class="date"></p>
        </div>
    <div><a href="usermenu.jsp"><img src="left.png" alt="" width="40px" height="40px"></a></div>
</nav>
<!-- Gradiantcolor -->

<div id="Gradiantcolor">
    <center><br><br><br>
        <h2 >Retailer Form &nbsp;&nbsp;[Retailer]</h2><br><br>
        <form name= "f1" action="elogs_RetailOrderfs.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Order No :</b> </td>
                        <td><select name="cmbOrderNumber" onchange="GetAllRetailerFormData()" style="width: 230px">  
                            <option value="null" >--Order Number--</option>

                            <% doConnect();
                            try{
                                stmtFillOrderNo = conn.createStatement();
                                rsOrderNo= stmtFillOrderNo.executeQuery("select * from elogs_tblretailorder");
                                while(rsOrderNo.next()==true){
                                    OrderNo = rsOrderNo.getString("Order_no");
                                    SerialNo = rsOrderNo.getString("Serial_no");
                                    OrderNo_SerialNo = OrderNo+"_"+SerialNo;
                                %>
                                <option value = "<%=OrderNo_SerialNo%>"><%=OrderNo_SerialNo%></option>
                                <%
                                }
                            }
                            catch(SQLException se){
                                out.println("Unable to Connect");
                            }
                            %>
                        </select>
                    </td>
                        <td style="font-size:17px"><b>Order Date : </b></td>
                        <td><input type="Date" name="txtOrderDate" size="10" readonly></td>
                    </tr>

                    <tr>
                        <td style="font-size:17px"><b>Retailer Name :</b></td>
                        <td><select name="cmbRetailName" style="width: 230px">  
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
                        <td><input type="text"  name="txtRetailCode" size="10" autocomplete="off" readonly required></td>     
                    </tr>
                <tr>
                    <td style="font-size:17px"><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="10" placeholder="Enter Locality.." readonly required ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="10" placeholder="Enter City" readonly required></td>
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
                    <td style="font-size:17px" align="center"><b>MRP : </b></td>
                    <td style="font-size:17px" align="center"><b>Order Quantity : </b></td>
                    <td style="font-size:17px" align="center"><b>Amount : </b></td>
                </tr>
                <tr>
                    <td height="30px" align="center">
                        <input type="text" name="txtSlno">
                    </td>
                    <td align="center" width="150px">
                        <select name="cmbProCode" onchange="">
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
                        <input type="text" name="txtProName" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtCategory" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtMRP" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtOrderQty" onblur="showAmt()">
                    </td>
                    <td align="center">
                        <input type="text" name="txtAmount" readonly required>
                    </td>
                </tr>
            </table>
            <br><br>
            <br>
            <input type="submit" id="btnup" name="btmUpdate" class="button button1" value="Update" disabled>
             <input type="submit" id ="btndel" name="btmDelete" class="button button2" value="Delete" disabled >
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_RetailOrderc.jsp';">
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

