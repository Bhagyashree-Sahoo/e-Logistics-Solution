<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillOrderNo;
Statement stmtFillPCode;
Statement stmtFillInvoiceNo;
ResultSet rsInvoiceNo;
ResultSet rsOrderNo;
ResultSet rsFillP;
String OrderNo;
String PCode;
Statement stmtFillArrayPurchaseGoodData;
ResultSet rsFillPurchaseGoodData;
String InvoiceNo,SerialNo,InvoiceNo_SerialNo,SInvoiceDate[],SOrderNo[],SOrderDate[],SSupplierName[],SLocality[],SCity[],SStateUnion[],SPurchaseType[],SSerialNo[],SProductCode[],SProductName[],SCategory[],SPrice[],SQuantity[],SAmount[],SDisPercentage[],SDisAmount[],SGSTPer[],SGSTAmount[],SNetAmount[];
String PrevQty;
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
try{
    stmtFillArrayPurchaseGoodData = conn.createStatement();
    rsFillPurchaseGoodData = stmtFillArrayPurchaseGoodData.executeQuery("Select * from elogs_tblpurchase");
    SInvoiceDate= new String[20];
    SOrderNo= new String[20];
    SOrderDate=  new String[20];
    SSupplierName=  new String[20];
    SLocality=  new String[20];
    SCity=  new String[20];
    SStateUnion=  new String[20];
    SPurchaseType=  new String[20];
    SSerialNo = new String[20];
    SProductCode = new String[20];
    SProductName = new String[20];
    SCategory = new String[20];
    SPrice = new String[20];
    SQuantity = new String[20];
    SAmount = new String[20];
    SDisPercentage = new String[20];
    SDisAmount = new String[20];
    SGSTPer = new String[20];
    SGSTAmount = new String[20];
    SNetAmount = new String[20];
    
    i = 0;
    while(rsFillPurchaseGoodData.next()==true){
        SInvoiceDate[i]= rsFillPurchaseGoodData.getString("Invoice_date");
        SOrderNo[i]= rsFillPurchaseGoodData.getString("Order_no");
        SOrderDate[i]= rsFillPurchaseGoodData.getString("Order_date");
        SSupplierName[i]= rsFillPurchaseGoodData.getString("Supplier_name");
        SLocality[i]= rsFillPurchaseGoodData.getString("Locality");
        SCity[i]= rsFillPurchaseGoodData.getString("City");
        SStateUnion[i]= rsFillPurchaseGoodData.getString("State_Union");
        SPurchaseType[i]= rsFillPurchaseGoodData.getString("Purchase_type");
        SSerialNo[i]= rsFillPurchaseGoodData.getString("Serial_no");
        SProductCode[i]= rsFillPurchaseGoodData.getString("Product_code");
        SProductName[i]= rsFillPurchaseGoodData.getString("Product_name");
        SCategory[i]= rsFillPurchaseGoodData.getString("Category");
        SPrice[i]= rsFillPurchaseGoodData.getString("Price");
        SQuantity[i]= rsFillPurchaseGoodData.getString("Quantity");
        SAmount[i]= rsFillPurchaseGoodData.getString("Amount");
        SDisPercentage[i]= rsFillPurchaseGoodData.getString("Discount_percentage");
        SDisAmount[i]= rsFillPurchaseGoodData.getString("Discount_amount");
        SGSTPer[i]= rsFillPurchaseGoodData.getString("GST_percentage");
        SGSTAmount[i]= rsFillPurchaseGoodData.getString("GST_amount");
        SNetAmount[i]= rsFillPurchaseGoodData.getString("Net_amount");


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
    
    function GetAllPurchaseGoodData(){
            var JSInvoiceDate = new Array();
            var JSOrderNo = new Array();
            var JSOrderDate = new Array();
            var JSSupplierName = new Array();
            var JSLocality = new Array();
            var JSCity = new Array();
            var JSStateUnion = new Array();
            var JSPurchaseType = new Array();
            var JSSerialNo = new Array();
            var JSProductCode = new Array();
            var JSProductName = new Array();
            var JSCategory = new Array();
            var JSPrice = new Array();
            var JSQuantity = new Array();
            var JSAmount = new Array();
            var JSDisPercentage = new Array();
            var JSDisAmount = new Array();
            var JSGSTPer = new Array();
            var JSGSTAmount = new Array();
            var JSNetAmount = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SInvoiceDate.length){
            %>
                JSInvoiceDate[j] = "<%= SInvoiceDate[i] %>";
                JSOrderNo[j] = "<%= SOrderNo[i] %>";
                JSOrderDate[j] = "<%= SOrderDate[i] %>";
                JSSupplierName[j] = "<%= SSupplierName[i] %>";
                JSLocality[j] = "<%= SLocality[i] %>";
                JSCity[j] = "<%= SCity[i] %>";
                JSStateUnion[j] = "<%= SStateUnion[i] %>";
                JSPurchaseType[j] = "<%= SPurchaseType[i] %>";
                JSSerialNo[j] = "<%= SSerialNo[i] %>";
                JSProductCode[j] = "<%= SProductCode[i] %>";
                JSProductName[j] = "<%= SProductName[i] %>";
                JSCategory[j] = "<%= SCategory[i] %>";
                JSPrice[j] = "<%= SPrice[i] %>";
                JSQuantity[j] = "<%= SQuantity[i] %>";
                JSAmount[j] = "<%= SAmount[i] %>";
                JSDisPercentage[j] = "<%= SDisPercentage[i] %>";
                JSDisAmount[j] = "<%= SDisAmount[i] %>";
                JSGSTPer[j] = "<%= SGSTPer[i] %>";
                JSGSTAmount[j] = "<%= SGSTAmount[i] %>";
                JSNetAmount[j] = "<%= SNetAmount[i] %>";


                j = j+1;
            <% 
                i = i+1;
                }
            %>
            
                k = document.f1.cmbPurInvoiceNo.selectedIndex;
                document.f1.txtInvoiceDate.value = JSInvoiceDate[k-1];
                document.f1.cmbOrderNo.value = JSOrderNo[k-1];
                document.f1.txtOrderDate.value = JSOrderDate[k-1];
                document.f1.txtSupName.value = JSSupplierName[k-1];
                document.f1.txtLocality.value = JSLocality[k-1];
                document.f1.txtCity.value = JSCity[k-1];
                document.f1.cmbState.value = JSStateUnion[k-1];
                document.f1.cmbPurchaseType.value = JSPurchaseType[k-1];
                document.f1.txtSlno.value = JSSerialNo[k-1];
                document.f1.cmbProCode.value = JSProductCode[k-1];
                document.f1.txtProName.value = JSProductName[k-1];
                document.f1.txtCategory.value = JSCategory[k-1];
                document.f1.txtPrice.value = JSPrice[k-1];
                document.f1.txtOrderQty.value = JSQuantity[k-1];
                document.f1.hdnOrderQty.value = JSQuantity[k-1];
                document.f1.txtAmount.value = JSAmount[k-1]; 
                document.f1.txtDiscPer.value = JSDisPercentage[k-1]; 
                document.f1.txtDiscAmount.value = JSDisAmount[k-1]; 
                document.f1.txtGSTPer.value = JSGSTPer[k-1]; 
                document.f1.txtGSTAmount.value = JSGSTAmount[k-1]; 
                document.f1.txtNetAmount.value = JSNetAmount[k-1];               
            }

    function showAmt(){
            var price,qty,amount,discpercentage,discamount;
            price = parseFloat(document.f1.txtPrice.value);
            qty = parseFloat(document.f1.txtOrderQty.value);
            amount = price*qty;
            document.f1.txtAmount.value=amount;
        }

    function showDiscAmount(){
        var discountper,discountamount,amount;
        amount = parseFloat(document.f1.txtAmount.value);
        discountper = parseFloat(document.f1.txtDiscPer.value);
        discountamount = (amount * discountper)/100;
        document.f1.txtDiscAmount.value = discountamount;
    }

    function showGstAmount(){
        var gstper,gstamount,netamount,amount,discamount;
        gstper = parseFloat(document.f1.txtGSTPer.value);
        amount = parseFloat(document.f1.txtAmount.value);
        discamount = parseFloat(document.f1.txtDiscAmount.value);
        gstamount = (amount - discamount)*gstper/100;
        document.f1.txtGSTAmount.value = gstamount;
    }
    function netamount(){
        var amount,discamount,gstamount,netamount;
        amount = parseFloat(document.f1.txtAmount.value);
        discamount = parseFloat(document.f1.txtDiscAmount.value);
        gstamount = parseFloat(document.f1.txtGSTAmount.value);
        netamount = (amount - discamount)+gstamount;
        document.f1.txtNetAmount.value = netamount;
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
        <h2 >Purchase of Goods</h2><br><br>
        <form name= "f1" action="elogs_purchasefs.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Purchase Invoice No :</b> </td>
                        <td>
                            <select name="cmbPurInvoiceNo" onchange="GetAllPurchaseGoodData()" style="width: 230px">  
                            <option value="null" >--Invoice/SerialNo--</option>    
                            <% doConnect();
                            try{
                                stmtFillInvoiceNo = conn.createStatement();
                                rsInvoiceNo= stmtFillInvoiceNo.executeQuery("select * from elogs_tblpurchase");
                                while(rsInvoiceNo.next()==true){
                                    InvoiceNo = rsInvoiceNo.getString("Purchase_invoice_no");
                                    SerialNo = rsInvoiceNo.getString("Serial_no");
                                    InvoiceNo_SerialNo = InvoiceNo+"_"+SerialNo;
                                %>
                                <option value = "<%= InvoiceNo_SerialNo%>"><%= InvoiceNo_SerialNo%></option>
                                <%
                                }
                            }
                            catch(SQLException se){
                                out.println("Unable to Connect");
                            }
                            %>
                            </select>
                        </td>
                        <td style="font-size:17px"><b>Invoice Date : </b></td>
                        <td><input type="Date" name="txtInvoiceDate" size="10" ></td>
                    </tr>

                    <tr>
                        <td style="font-size:17px"><b>Order No :</b></td>
                        <td><select name="cmbOrderNo" onchange="FillOrderData()" style="width: 230px">  
                            <option value="null" >--Order No--</option>
    
                            <% doConnect();
                            try{
                                stmtFillOrderNo = conn.createStatement();
                                rsOrderNo= stmtFillOrderNo.executeQuery("select * from elogs_tblpurchase");
                                while(rsOrderNo.next()==true){
                                    OrderNo = rsOrderNo.getString("Order_no");
                                %>
                                <option value = "<%=OrderNo%>"><%=OrderNo%></option>
                                <%
                                }
                            }
                            catch(SQLException se){
                                out.println("Unable to Connect");
                            }
                            %>
    
                            </select>
                        </td>
                        <td style="font-size:17px"><b>Order Date :</b></td>
                        <td><input type="date"  name="txtOrderDate" size="10" ></td>     
                    </tr>
                <tr>
                    <td style="font-size:17px"><b>Supplier Name :</b></td>
                    <td><input type="text" name="txtSupName" size="10" placeholder="Enter Supplier Name...." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="10" placeholder="Enter Locality...." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="10" placeholder="Enter City...." ></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td><select name="cmbState" >
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
                </td></td>
                    <td style="font-size:17px"><b>Purchase Type :</b></td>
                    <td><select name="cmbPurchaseType" >
                        <option value="null" align="left" >--Select--</option>
                        <option value="Cash">Cash</option>
                        <option value="Credit">Credit</option></td> 
                </tr>
            </table><br><br>
                <table width="95%" border="1">
                <tr>
                    <td style="font-size:16px" height="40px" align="center" ><b>Serial No :</b> </td>
                    <td style="font-size:16px" align="center"><b>Product Code : </b></td>
                    <td style="font-size:16px" align="center"><b>Product Name : </b></td>
                    <td style="font-size:16px" align="center"><b>Category : </b></td>
                    <td style="font-size:16px" align="center"><b>Price : </b></td>
                    <td style="font-size:16px" align="center"><b>Quantity : </b></td>
                    <td style="font-size:16px" align="center"><b>Amount : </b></td>
                    <td style="font-size:16px" align="center"><b>Disc. %tage : </b></td>
                    <td style="font-size:16px" align="center"><b>Disc. Amount : </b></td>
                    <td style="font-size:16px" align="center"><b>G.S.T. %tage : </b></td>
                    <td style="font-size:16px" align="center"><b>G.S.T. Amount : </b></td>
                    <td style="font-size:16px" align="center"><b>Net Amount : </b></td>
                </tr>
                <tr>
                    <td height="30px" align="center">
                        <input type="text" name="txtSlno" size="5">
                    </td>
                    <td align="center" width="150px">
                        <select name="cmbProCode" onchange="showProdCodeShowData()">
                        <option value="Select" align="center">--Select--</option>

                        <% doConnect();
                            try{
                                stmtFillPCode = conn.createStatement();
                                rsFillP= stmtFillPCode.executeQuery("select * from elogs_tblpurchase");
                                while(rsFillP.next()==true){
                                    PCode = rsFillP.getString("Product_code");
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
                        <input type="text" name="txtProName" size="35">
                    </td>
                    <td align="center">
                        <input type="text" name="txtCategory" size="25">
                    </td>
                    <td align="center">
                        <input type="text" name="txtPrice" size="20">
                    </td>
                    <td align="center">
                        <input type="text" name="txtOrderQty" size="7" onblur="showAmt()">
                        <input type="hidden" name="hdnOrderQty" size="7" >

                    </td>
                    <td align="center">
                        <input type="text" name="txtAmount" >
                    </td>
                    <td align="center">
                        <input type="text" name="txtDiscPer" size="7" onblur="showDiscAmount()">
                    </td>
                    <td align="center">
                        <input type="text" name="txtDiscAmount">
                    </td>
                    <td align="center">
                        <input type="text" name="txtGSTPer" size="7"  onblur="showGstAmount()">
                    </td>
                    <td align="center">
                        <input type="text" name="txtGSTAmount" onblur="netamount()">
                    </td>
                    <td align="center">
                        <input type="text" name="txtNetAmount">
                    </td>
                </tr>
            </table>
            <br><br>
            <br>
            <input type="Submit" name="btnUpdate" class="button button1" value="Update">
             <input type="Submit" name="btnDelete" class="button button2" value="Delete" >
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_purchasec.jsp';">
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

