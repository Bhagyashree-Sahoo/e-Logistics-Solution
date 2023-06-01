<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;

Statement stmtFillSName,stmtFillArray1,stmtPayVoucher;
ResultSet rsSName,rsFillS,rspayvoucher;
String SName, SId[],SLocality[],SCity[],SStateunion[],payvoucher,srslno;
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
    payvoucher="";
    try{
    stmtPayVoucher = conn.createStatement();
    rspayvoucher = stmtPayVoucher.executeQuery("SELECT MAX(Voucher_no) as payvou FROM elogs_tblpaymentvoucher");
    if(rspayvoucher.next()){
        payvoucher=rspayvoucher.getString("payvou");
        System.out.println(payvoucher);
    }
    if(payvoucher==null){
        payvoucher="8000";
		srslno=payvoucher;
    }
    else
        srslno = payvoucher.substring(payvoucher.indexOf('8'));
        nrsslno = Integer.parseInt(srslno);
        nrsslno = nrsslno+ 1;
        System.out.println(nrsslno);
        payvoucher = "PAYVOUCHER"+"-"+ nrsslno;
    }
    catch(SQLException se){
    out.println("error"+se);
    }
    %>
    <%
    doConnect();
        try{
        stmtFillArray1 = conn.createStatement();
        rsFillS = stmtFillArray1.executeQuery("Select * from supplierinformation");
        SId=  new String[20];
        SLocality=  new String[20];
        SCity=  new String[20];
        SStateunion=  new String[20];

        
        i = 0;
        while(rsFillS.next()==true){
            SId[i]= rsFillS.getString("SupplierID");
            SLocality[i]= rsFillS.getString("Locality");
            SCity[i]= rsFillS.getString("City");
            SStateunion[i]= rsFillS.getString("StateUnion");


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
    <title>Payment Voucher 9</title>
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
    
    function showSupplyInfoData(){
            var JSId = new Array();
            var JSLocality = new Array();
            var JSCity = new Array();
            var JSStateunion = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SId.length){
            %>
                JSId[j] = "<%= SId[i] %>";
                JSLocality[j] = "<%= SLocality[i] %>";
                JSCity[j] = "<%= SCity[i] %>";
                JSStateunion[j] = "<%= SStateunion[i] %>";


                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbSupName.selectedIndex;
                document.f1.txtRegsNo.value = JSId[k-1];
                document.f1.txtLocality.value = JSLocality[k-1];
                document.f1.txtCity.value = JSCity[k-1];
                document.f1.txtStateUnion.value = JSStateunion[k-1];

            }
            function check(){
                var e = document.getElementById("cmbpay");
                var str = e.options[e.selectedIndex].text;

                if(str === "Cash"){
                    document.getElementById("refno").disabled = true;	
                    document.getElementById("bankname").disabled = true;				
                }
                else{
                    document.getElementById("refno").disabled = false;  
                    document.getElementById("bankname").disabled = false;  
                }
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
        <form name= "f1" action="elogs_PayVouchers.jsp"  method="GET">
            <table width="800" border="0">
                <tr>
                    <tr>
                        <td style="font-size:17px"><b>Voucher No. :</b></td>
                        <td><input type="text"  name="txtVoucherNo" size="10" autocomplete="off" value="<%= payvoucher %>" placeholder="Enter Voucher Number..."></td>
                        <td style="font-size:17px"><b>Date :</b></td>
                        <td><input type="date"  name="txtVoucherIssueDate" size="20"></td>  
                    </tr>
                    <tr>
                        <td style="font-size:17px"><b>Supplier Name :</b></td>
                        <td><select name="cmbSupName" onchange="showSupplyInfoData()" style="width: 230px">  
                            <option value="null" >--Supplier Name--</option>
    
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
                    <td><input type="text" name="txtStateUnion" size="10" placeholder="Enter State/Union Territory..."></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Payment Mode :</b></td>
                    <td>
                        <select name="cmbPayMode" id="cmbpay" style="width: 230px" onclick="check()">
                            <option value="null">--Select--</option>
                            <option value="Cash">Cash</option>
                            <option value="Cheque">Cheque</option>
                            <option value="Draft">Draft</option>
                            <option value="Online">Online</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:17px" ><b>CHQ/DD/OL Ref.No :</b> </td>
                    <td><input type="text" id="refno" name="txtRefNo" size="10" placeholder="Enter Reference No.." autocomplete="off"></td>
                    <td style="font-size:17px"><b>Date : </b></td>
                    <td><input type="date" name="txtDate" size="10"  placeholder="Enter Unit.." ></td>
                </tr>
                <tr>
                    <td style="font-size:17px"><b>Bank Name :</b></td>
                    <td>
                        <select name="cmbBankName" id="bankname" style="width: 230px">
                            <option value="null">--Select--</option>
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
            <input type="submit" name="btmSubmit" class="button button1" value="Submit">
             <input type="button" name="btmFind" class="button button2" value="Find" onclick="window.location.href = 'elogs_PayVoucherfc.jsp';">
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

