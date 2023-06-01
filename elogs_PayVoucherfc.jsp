<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillSName,stmtFillArray,stmtFillArray1;
Statement stmtFillVNo;
ResultSet rsSName,rsFillS;
ResultSet rsVNo,rsFillVNo;
String SName;
String VNo;
String SVoucherNo, SVDate[],SSupplierName[],SRegdNo[],SLocality[],SCity[],SStateUnion[],SPaymentMode[],SRefNo[],SDate[],SBankName[],SAmount[];
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
        stmtFillArray1 = conn.createStatement();
        rsFillS = stmtFillArray1.executeQuery("Select * from elogs_tblpaymentvoucher");
        SVDate=  new String[20];
        SSupplierName=  new String[20];
        SRegdNo=  new String[20];
        SLocality=  new String[20];
        SCity=  new String[20];
        SStateUnion=  new String[20];
        SPaymentMode=  new String[20];
        SRefNo=  new String[20];
        SDate=  new String[20];
        SBankName=  new String[20];
        SAmount=  new String[20];

        
        i = 0;
        while(rsFillS.next()==true){
            SVDate[i]= rsFillS.getString("Vissue_date");
            SSupplierName[i]= rsFillS.getString("Supplier_name");
            SRegdNo[i]= rsFillS.getString("Registration_no");
            SLocality[i]= rsFillS.getString("Locality");
            SCity[i]= rsFillS.getString("City");
            SStateUnion[i]= rsFillS.getString("State_union");
            SPaymentMode[i]= rsFillS.getString("Payment_mode");
            SRefNo[i]= rsFillS.getString("Payment_ref_no");
            SDate[i]= rsFillS.getString("Date");
            SBankName[i]= rsFillS.getString("Bank_name");
            SAmount[i]= rsFillS.getString("Amount");

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

    function showAllVoucherData(){
        var JSVDate = new Array();
        var JSSupplierName = new Array();
        var JSRegdNo = new Array();
        var JSLocality = new Array();
        var JSCity = new Array();
        var JSStateUnion = new Array();
        var JSPaymentMode = new Array();
        var JSRefNo = new Array();
        var JSDate = new Array();
        var JSBankName = new Array();
        var JSAmount = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SVDate.length){
            %>
            JSVDate[j] = "<%= SVDate[i] %>";
            JSSupplierName[j] = "<%= SSupplierName[i] %>";
            JSRegdNo[j] = "<%= SRegdNo[i] %>";
            JSLocality[j] = "<%= SLocality[i] %>";
            JSCity[j] = "<%= SCity[i] %>";
            JSStateUnion[j] = "<%= SStateUnion[i] %>";
            JSPaymentMode[j] = "<%= SPaymentMode[i] %>";
            JSRefNo[j] = "<%= SRefNo[i] %>";
            JSDate[j] = "<%= SDate[i] %>";
            JSBankName[j] = "<%= SBankName[i] %>";
            JSAmount[j] = "<%= SAmount[i] %>";
        
                j = j+1;
            <% 
                i = i+1;
                }
            %>
            
                k = document.f1.cmbVoucherNo.selectedIndex;
                document.f1.txtVoucherIssueDate.value = JSVDate[k-1];
                document.f1.cmbSupName.value = JSSupplierName[k-1];
                document.f1.txtRegsNo.value = JSRegdNo[k-1];
                document.f1.txtLocality.value = JSLocality[k-1];
                document.f1.txtCity.value = JSCity[k-1];
                document.f1.cmbStateUnion.value = JSStateUnion[k-1];
                document.f1.cmbPayMode.value = JSPaymentMode[k-1];
                document.f1.txtRefNo.value = JSRefNo[k-1];
                document.f1.txtDate.value = JSDate[k-1];
                document.f1.cmbBankName.value = JSBankName[k-1];
                document.f1.txtAmount.value = JSAmount[k-1];       
                document.getElementById("btnup").disabled=false; 
                document.getElementById("btndel").disabled=false;          
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
        <h2>Payment Voucher</h2><br><br><br>
        <form name= "f1" action="elogs_PayVoucherfs.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Voucher No. :</b></td>
                        <td><select name="cmbVoucherNo" onchange="showAllVoucherData()" style="width: 230px" >  
                            <option value="null" align="center">--Voucher No--</option>
    
                            <% doConnect();
                            try{
                                stmtFillVNo = conn.createStatement();
                                rsVNo= stmtFillVNo.executeQuery("select * from elogs_tblpaymentvoucher");
                                while(rsVNo.next()==true){
                                    VNo = rsVNo.getString("Voucher_no");
                                %>
                                <option value = "<%=VNo%>"><%=VNo%></option>
                                <%
                                }
                            }
                            catch(SQLException se){
                                out.println("Unable to Connect");
                            }
                            %>
    
                            </select>
                        </td>
                        <td style="font-size:17px"><b>Date :</b></td>
                        <td><input type="date"  name="txtVoucherIssueDate" size="20"></td>  
                    </tr>
                    <tr>
                        <td style="font-size:17px"><b>Supplier Name :</b></td>
                        <td><select name="cmbSupName" onchange="showSupplyInfoData()" style="width: 230px" >  
                            <option value="null" align="center">--Supplier Name--</option>
    
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
                        <td style="font-size:17px"><b>Registration No. :</b></td>
                        <td><input type="text"  name="txtRegsNo" size="10" autocomplete="off" placeholder="Reg No..." readonly></td>     
                    </tr>
                <tr>
                    <td style="font-size:17px"><b>Locality :</b></td>
                    <td><input type="text"  name="txtLocality" size="10" autocomplete="off" placeholder="Enter Locality..." readonly></td> 
                </tr>  
                <tr>     
                    <td style="font-size:17px"><b>City :</b></td>
                    <td><input type="text"  name="txtCity" size="10" autocomplete="off" placeholder="Enter City..." readonly></td>     
                </tr>
                <tr>
                    <td style="font-size:17px"><b>State/Union Territory:</b></td>
                        <td>
                            <select name="cmbStateUnion" style="width: 230px" >
                                <option value="Select" align="center" >--Select--</option>
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
                    <td style="font-size:17px"><b>Payment Mode :</b></td>
                    <td>
                        <select name="cmbPayMode" style="width: 230px">
                            <option value="null" align="center">--Select--</option>
                            <option value="Cash">Cash</option>
                            <option value="Cheque">Cheque</option>
                            <option value="Draft">Draft</option>
                            <option value="Online">Online</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>CHQ/DD/OL Ref.No :</b> </td>
                    <td><input type="text" name="txtRefNo" size="10" placeholder="Enter Reference No.." autocomplete="off"></td>
                    <td style="font-size:17px"><b>Date : </b></td>
                    <td><input type="date" name="txtDate" size="10"  placeholder="Enter Unit.." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Bank Name :</b></td>
                    <td>
                        <select name="cmbBankName" style="width: 230px">
                            <option value="null" align="center">--Select--</option>
                            <option value="SBI">SBI(State Bank of India)</option>
                            <option value="BOI">BOI(Bank of India)</option>
                            <option value="HDFC">HDFC Bank</option>
                            <option value="Kotak_Mahindra">Kotak Mahindra Bank</option>
                            <option value="AXIS">Axis Bank</option>
                            <option value="ICICI_Bank">ICICI Bank</option>
                            <option value="Federal_Bank">Federal Bank</option>
                            <option value="Bank_of_Baroda">Bank of Baroda</option>
                            <option value="Canara_Bank">Canara Bank</option>
                            <option value="Union_Bank">Union Bank of India</option>
                            <option value="IDBI_Bank">IDBI Bank</option>
                            <option value="Central_Bank_of_India">Central Bank of India</option>
                            <option value="UCO_Bank">UCO Bank</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Amount :</b></td>
                    <td><input type="text" name="txtAmount" size="10" placeholder="Enter Amount..."></td>
                </tr>


            </table>
            </table><br><br>
            <br>
            <input type="submit" id="btnup" name="btmUpdate" class="button button1" value="Update" disabled>
             <input type="submit" id="btndel" name="btmDelete" class="button button2" value="Delete" disabled>
             <input type="button" name="btmBack" class="button button3" value="Back" onclick="window.location.href = 'elogs_PayVoucherc.jsp';">
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