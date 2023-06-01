<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillSPCode,stmtFillPCName,stmtFillSName,stmtFillArray,stmtFillArray1,stmtFillArray2;
ResultSet rsSName,rsFillS,rsPCName,rsFillP,rsSPCode;
String SName, SCode[],PCName,PCode[];
String PCodee, SSName[],SSCode[],SPCName[],SPCode[],SPName[],SFeature[],SPPrice[],SMRP[],SGSTSlab[],SStock[],SUnit[],SLocation[];
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
        stmtFillArray2 = conn.createStatement();
        rsSPCode = stmtFillArray2.executeQuery("Select * from elogs_tblproductinfo");
        SSName =  new String[20];
        SSCode =  new String[20];
        SPCName = new String[20];
        SPCode = new String[20];
        SPName =  new String[20];
        SFeature =  new String[20];
        SPPrice =  new String[20];
        SMRP =  new String[20];
        SGSTSlab =  new String[20];
        SStock =  new String[20];
        SUnit =  new String[20];
        SLocation =  new String[20];   

        i=0;

        while(rsSPCode.next()==true){
            SSName[i]= rsSPCode.getString("Supplier_name");
            SSCode[i]= rsSPCode.getString("Supplier_code");
            SPCName[i]= rsSPCode.getString("Product_category_name");
            SPCode[i]= rsSPCode.getString("Product_category_code");
            SPName[i]= rsSPCode.getString("Product_name");
            SFeature[i]= rsSPCode.getString("Feature");
            SPPrice[i]= rsSPCode.getString("Purchase_price");
            SMRP[i]= rsSPCode.getString("MRP");
            SGSTSlab[i]= rsSPCode.getString("GST_slab");
            SStock[i]= rsSPCode.getString("Stock");
            SUnit[i]= rsSPCode.getString("Unit");
            SLocation[i]= rsSPCode.getString("Location");

            i = i+1;
        }
    }
    catch(SQLException se){
        out.println("Unable to fill Array");
    }


    try{
        stmtFillArray = conn.createStatement();
        rsFillP = stmtFillArray.executeQuery("select * from elogs_tblProdcategory");  
        PCode=  new String[20];
        
        i = 0;
        while(rsFillP.next()==true){
            PCode[i]= rsFillP.getString("Product_Category_code");

            i = i+1;
        }
    }
    catch(SQLException se){
        out.println("Unable to fill Array of Product Category Code");
    }

    try{
        stmtFillArray1 = conn.createStatement();
        rsFillS = stmtFillArray1.executeQuery("Select * from supplierinformation");
        SCode=  new String[20];
        
        i = 0;
        while(rsFillS.next()==true){
            SCode[i]= rsFillS.getString("SupplierID");

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

    function showProductData(){
            var JSSName = new Array();
            var JSSCode = new Array();
            var JSPCName = new Array();
            var JSPCode= new Array();
            var JSPName = new Array();
            var JSFeature = new Array();
            var JSPPrice = new Array();
            var JMRP = new Array();
            var JSGSTSlab = new Array();
            var JSStock = new Array();
            var JSUnit = new Array();
            var JSLocation = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SSName.length){
            %>
                JSSName[j] = "<%= SSName[i] %>";
                JSSCode[j] = "<%=SSCode[i]%>";
                JSPCName[j] = "<%=SPCName[i]%>";
		        JSPCode[j] = "<%=SPCode[i]%>";
		        JSPName[j] = "<%=SPName[i]%>";
		        JSFeature[j] = "<%=SFeature[i]%>";
		        JSPPrice[j] = "<%=SPPrice[i]%>";
		        JMRP[j] = "<%=SMRP[i]%>";
		        JSGSTSlab[j] = "<%=SGSTSlab[i]%>";
		        JSStock[j] = "<%=SStock[i]%>";
		        JSUnit[j] = "<%=SUnit[i]%>";
		        JSLocation[j] = "<%=SLocation[i]%>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbPCode.selectedIndex;
                document.f1.cmbSupName.value = JSSName[k-1];
                document.f1.txtSupCode.value = JSSCode[k-1];				
                document.f1.cmbPubCatName.value = JSPCName[k-1];
                document.f1.txtProCode.value=JSPCode[k-1];
                document.f1.txtPName.value = JSPName[k-1];
                document.f1.txtPFeature.value = JSFeature[k-1];
                document.f1.txtPPrice.value = JSPPrice[k-1];
                document.f1.txtMRP.value = JMRP[k-1];
                document.f1.cmbGSTSlab.value = JSGSTSlab[k-1];
                document.f1.txtStock.value = JSStock[k-1];
                document.f1.txtUnit.value = JSUnit[k-1];
                document.f1.txtLocation.value = JSLocation[k-1];

            }
    
    function showSupplyInfoData(){
            var JSCode = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SCode.length){
            %>
                JSCode[j] = "<%= SCode[i] %>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbSupName.selectedIndex;
                document.f1.txtSupCode.value = JSCode[k-1];
            }


    function showProCatData(){
            var JPCode = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<PCode.length){
            %>
                JPCode[j] = "<%= PCode[i] %>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbPubCatName.selectedIndex;
                document.f1.txtProCode.value = JPCode[k-1];
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
        <h2>Product Information</h2><br><br><br>
        <form name= "f1" action="elogs_ProductInfofs.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Product Code :</b></td>
                        <td><select name="cmbPCode" onchange="showProductData()" style="width: 230px">
                            <option value="null">--Select Product Code--</option>
                            <% doConnect();
                        try{
                            stmtFillSPCode = conn.createStatement();
                            rsSPCode = stmtFillSPCode.executeQuery("select * from elogs_tblproductinfo");
                            while(rsSPCode.next()==true){
                                PCodee = rsSPCode.getString("Product_code");
                            %>
                            <option value = "<%=PCodee%>"><%=PCodee%></option>
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

                    <tr>
                        <td style="font-size:17px"><b>Supplier Name :</b></td>
                        <td><select name="cmbSupName" onchange="showSupplyInfoData()" style="width: 230px">  
                            <option value="null" >--Category Name--</option>
    
                            <% doConnect();
                            try{
                                stmtFillSName = conn.createStatement();
                                rsSName= stmtFillSName.executeQuery("select * from supplierinformation");
                                while(rsSName.next()==true){
                                    SName = rsSName.getString("SupplierName");
                                %>
                                <option value = "<%=SName%>"><%=SName%></option>
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
                        <td><input type="text"  name="txtSupCode" size="10" autocomplete="off" readonly></td>     
                    </tr>




                    <td style="font-size:17px"><b>Product Category :</b></td>
                    <td><select name="cmbPubCatName" onchange="showProCatData()" style="width: 230px">  
                        <option value="null" >--Category Name--</option>

                        <% doConnect();
                        try{
                            stmtFillPCName = conn.createStatement();
                            rsPCName= stmtFillPCName.executeQuery("select * from elogs_tblProdcategory");
                            while(rsPCName.next()==true){
                                PCName = rsPCName.getString("Product_Category_name");
                            %>
                            <option value = "<%=PCName%>"><%=PCName%></option>
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
                    <td><input type="text"  name="txtProCode" size="10" autocomplete="off" readonly></td>     
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Product Name :</b></td>
                    <td><input type="text" name="txtPName" size="10" placeholder="Enter Product Name.."></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Feature :</b></td>
                    <td><input type="text" name="txtPFeature" size="10" placeholder="Enter Product Feature.."></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Purchase Price :</b> </td>
                    <td><input type="text" name="txtPPrice" size="10" placeholder="Enter Purchase Price.." autocomplete="off" required></td>
                    <td style="font-size:17px"><b>M.R.P. : </b></td>
                    <td><input type="text" name="txtMRP" size="10"  placeholder="Enter M.R.P.." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>G.S.T. Slab :</b></td>
                    <td>
                        <select name="cmbGSTSlab" style="width: 230px">
                            <option value="null">--Select--</option>
                            <option value="5">5</option>
                            <option value="8">8</option>
                            <option value="12">12</option>
                            <option value="18">18</option>
                            <option value="28">28</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Stock :</b> </td>
                    <td><input type="text" name="txtStock" size="10" placeholder="Enter Stock.." autocomplete="off"></td>
                    <td style="font-size:17px"><b>Unit : </b></td>
                    <td><input type="text" name="txtUnit" size="10"  placeholder="Enter Unit.." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Location :</b></td>
                    <td><input type="text" name="txtLocation" size="10" placeholder="Enter Location.."></td>
                </tr>


            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmUpdate" class="button button1" value="Update">
             <input type="submit" name="btmDelete" class="button button2" value="Delete">
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_ProductInfoc.jsp';">
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

