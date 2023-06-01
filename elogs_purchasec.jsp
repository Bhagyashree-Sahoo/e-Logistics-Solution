<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillOrderNo,stmtFillArray1,stmtFillInvoiceNo;
Statement stmtFillPCode,stmtFillArray;
ResultSet rsOrderNo,rsOrderData,rsinvoiceno;
ResultSet rsPCode,rsFillP;
String OrderNo,OrderDate[],SuppName[],SLocality[],SCity[],SStateunion[];
String PCode,PName[],PCategory[],PPrice[],PGSTPer[];
String invoiceno,srslno;
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
    invoiceno="";
    try{
    stmtFillInvoiceNo = conn.createStatement();
    rsinvoiceno = stmtFillInvoiceNo.executeQuery("SELECT MAX(Purchase_invoice_no) as invoiceno1 FROM elogs_tblpurchase");
    if(rsinvoiceno.next()){
        invoiceno=rsinvoiceno.getString("invoiceno1");
        System.out.println(invoiceno);
    }
    if(invoiceno==null){
        invoiceno="5000";
		srslno=invoiceno;
    }
    else
        srslno = invoiceno.substring(invoiceno.indexOf('5'));
        nrsslno = Integer.parseInt(srslno);
        nrsslno = nrsslno+ 1;
        System.out.println(nrsslno);
        invoiceno = "PURCHASE.INVOICE"+"-"+ nrsslno;
    }
    catch(SQLException se){
    out.println("error"+se);
    }
    %>
    <%
doConnect();
    try{
        stmtFillArray1 = conn.createStatement();
        rsOrderData = stmtFillArray1.executeQuery("Select * from elogs_tblsupporder");
        OrderDate=  new String[20];
        SuppName=  new String[20];
        SLocality = new String[20];
        SCity=  new String[20];
        SStateunion=  new String[20];

        
        i = 0;
        while(rsOrderData.next()==true){
            OrderDate[i]= rsOrderData.getString("Order_date");
            SuppName[i]= rsOrderData.getString("Supplier_name");
            SLocality[i]= rsOrderData.getString("Locality");
            SCity[i]= rsOrderData.getString("City");
            SStateunion[i]= rsOrderData.getString("State_Union");
            i = i+1;
        }
    }
    catch(SQLException se){
        out.println("Unable to fill Array");
    }

    try{
        stmtFillArray = conn.createStatement();
        rsFillP = stmtFillArray.executeQuery("Select * from elogs_tblproductinfo");
        PName=  new String[20];
        PCategory=  new String[20];
        PPrice=  new String[20];
        PGSTPer = new String[20];
        
        i = 0;
        while(rsFillP.next()==true){
            PName[i]= rsFillP.getString("Product_name");
            PCategory[i]= rsFillP.getString("Product_category_name");
            PPrice[i]= rsFillP.getString("Purchase_price");
            PGSTPer[i] = rsFillP.getString("GST_slab");
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
    <title>Purchase of Goods 6</title>
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
    
    function FillOrderData(){
            var JOrderDate = new Array();
            var JSuppName = new Array();
            var JSLocality = new Array();
            var JCity = new Array();
            var JStateunion = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<OrderDate.length){
            %>
                JOrderDate[j] = "<%= OrderDate[i] %>";
                JSuppName[j] = "<%= SuppName[i] %>";
                JSLocality[j] = "<%= SLocality[i] %>";
                JCity[j] = "<%= SCity[i] %>";
                JStateunion[j] = "<%= SStateunion[i] %>";


                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbOrderNo.selectedIndex;
                document.f1.txtOrderDate.value = JOrderDate[k-1];
                document.f1.txtSupName.value = JSuppName[k-1];
                document.f1.txtLocality.value = JSLocality[k-1];
                document.f1.txtCity.value = JCity[k-1];
                document.f1.txtStateUnion.value = JStateunion[k-1];
                
            }

        function showProdCodeShowData(){
        var JPName = new Array();
        var JPCategory = new Array();
        var JPPrice = new Array();
        var JPGSTPer = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<PName.length){
            %>
                JPName[j] = "<%= PName[i] %>";
                JPCategory[j] = "<%= PCategory[i] %>";
                JPPrice[j] = "<%= PPrice[i] %>";
                JPGSTPer[j] = "<%= PGSTPer[i] %>";


                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbProCode.selectedIndex;
                document.f1.txtProName.value = JPName[k-1];
                document.f1.txtCategory.value = JPCategory[k-1];
                document.f1.txtPrice.value = JPPrice[k-1];
                document.f1.txtGSTPer.value = JPGSTPer[k-1];

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
        var amount,discamount,gstamount,netamount;
        var gstper,gstamount,netamount,amount,discamount;

        amount = parseFloat(document.f1.txtAmount.value);
        discountper = parseFloat(document.f1.txtDiscPer.value);
        discountamount = (amount * discountper)/100;
        document.f1.txtDiscAmount.value = discountamount;

        gstper = parseFloat(document.f1.txtGSTPer.value);
        amount = parseFloat(document.f1.txtAmount.value);
        discamount = parseFloat(document.f1.txtDiscAmount.value);
        gstamount = (amount - discamount)*gstper/100;
        document.f1.txtGSTAmount.value = gstamount;

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
        <form name= "f1" action="elogs_purchases.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Purchase Invoice No :</b> </td>
                        <td ><input type="text" name="txtPurInvoiceNo" placeholder="Enter Purchase No.." value="<%= invoiceno %>" autocomplete="off" required></td>
                        <td style="font-size:17px"><b>Invoice Date : </b></td>
                        <td><input type="Date" name="txtInvoiceDate" size="10" required></td>
                    </tr>

                    <tr>
                        <td style="font-size:17px"><b>Order No :</b></td>
                        <td><select name="cmbOrderNo" onchange="FillOrderData()" style="width: 230px">  
                            <option value="null" >--Order No--</option>
    
                            <% doConnect();
                            try{
                                stmtFillOrderNo = conn.createStatement();
                                rsOrderNo= stmtFillOrderNo.executeQuery("select * from elogs_tblsupporder");
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
                    <td><input type="text" name="txtSupName" size="10" placeholder="Enter Supplier Name...." readonly></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="10" placeholder="Enter Locality...." readonly></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="10" placeholder="Enter City...." readonly></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td><input type="text" name="txtStateUnion" size="10" placeholder="Enter State Union...." readonly></td>
                    <td style="font-size:17px"><b>Purchase Type :</b></td>
                    <td><select name="cmbPurchaseType" >
                        <option value="Select" align="left" >--Select--</option>
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
                                rsFillP= stmtFillPCode.executeQuery("select * from elogs_tblsupporder");
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
                        <input type="text" name="txtProName" size="35" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtCategory" size="25" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtPrice" size="20" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtOrderQty" size="7" onblur="showAmt()" required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtAmount" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtDiscPer" size="7" onblur="showDiscAmount()" required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtDiscAmount" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtGSTPer" size="7" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtGSTAmount" readonly required>
                    </td>
                    <td align="center">
                        <input type="text" name="txtNetAmount" readonly required>
                    </td>
                </tr>
            </table>
            <br><br>
            <br>
            <input type="submit" name="btmSubmit" class="button button1" value="Submit">
             <input type="button" name="btmFind" class="button button2" value="Find" onclick="window.location.href = 'elogs_purchasefc.jsp';">
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

