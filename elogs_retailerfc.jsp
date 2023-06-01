<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;
Statement stmtFillRCode,stmtFillArray;
ResultSet rsRCode,rsFill;
String RCode, SRName[],SCPerson[],SPhoto[],SGstno[],SLocality[],SCity[],SState[],SPhoneno[],SFaxno[],SEmailid[],SWebsite[];
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
        rsFill = stmtFillArray.executeQuery("Select * from elogs_tblretailer");
        SRName =  new String[20];
        SCPerson =  new String[20];
        SPhoto = new String[20];
        SGstno =  new String[20];
        SLocality =  new String[20];
        SCity =  new String[20];
        SState =  new String[20];
        SPhoneno =  new String[20];
        SFaxno =  new String[20];        
        SEmailid =  new String[20];
        SWebsite =  new String[20];
        
        i = 0;
        while(rsFill.next()==true){
            SRName[i]= rsFill.getString("Retailer_name");
            SCPerson[i]= rsFill.getString("Contact_person");
            SPhoto[i]= rsFill.getString("Photo");
            SGstno[i]= rsFill.getString("GST_no");
            SLocality[i]= rsFill.getString("Locality");
            SCity[i]= rsFill.getString("City");
            SState[i]= rsFill.getString("State_union");
            SPhoneno[i]= rsFill.getString("Phone_no");
            SFaxno[i]= rsFill.getString("Fax_no");
            SEmailid[i]= rsFill.getString("E_mailid");
            SWebsite[i]= rsFill.getString("Website");

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
           
    function showRetailerData(){
            var JRName = new Array();
            var JCPerson = new Array();
            var JPhoto = new Array();
            var JGstno = new Array();
            var JLocality = new Array();
            var JCity = new Array();
            var JState = new Array();
            var JPhoneno = new Array();
            var JFaxno = new Array();
            var JEmailid = new Array();
            var JWebsite = new Array();

            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SRName.length){
            %>
                JRName[j] = "<%= SRName[i] %>";
                JCPerson[j] = "<%=SCPerson[i]%>";
                JPhoto[j] = "<%=SPhoto[i]%>";
		        JGstno[j] = "<%=SGstno[i]%>";
		        JLocality[j] = "<%=SLocality[i]%>";
		        JCity[j] = "<%=SCity[i]%>";
		        JState[j] = "<%=SState[i]%>";
		        JPhoneno[j] = "<%=SPhoneno[i]%>";
		        JFaxno[j] = "<%=SFaxno[i]%>";
		        JEmailid[j] = "<%=SEmailid[i]%>";
		        JWebsite[j] = "<%=SWebsite[i]%>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbRCode.selectedIndex;
                document.f1.txtRName.value = JRName[k-1];
                document.f1.txtRCPerson.value = JCPerson[k-1];
                document.f1.imgPhoto.src = JPhoto[k-1];
                document.f1.hdnfileSup.value=JPhoto[k-1];
                document.f1.txtGSTNo.value = JGstno[k-1];
                document.f1.txtLocality.value = JLocality[k-1];
                document.f1.txtCity.value = JCity[k-1];
                document.f1.cmbState.value = JState[k-1];
                document.f1.txtPhno.value = JPhoneno[k-1];
                document.f1.txtFaxNo.value = JFaxno[k-1];
                document.f1.txtMailid.value = JEmailid[k-1];
                document.f1.txtWebsite.value = JWebsite[k-1];

            }
        function showPhoto(){
        var imgPath,imgName;
        imgPath = document.f1.filePhoto.value;
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
    <center><br><br>
        <h2>Retailer Information</h2><br><br>
        <form name= "f1" action="elogs_retailerfs.jsp"  method="GET" >
            <table width="850" border="0">
                <tr>
                    <td ><b>Retailer Id :</b></td>
                    <td><select name="cmbRCode" onchange="showRetailerData()">  
                        <option value="null">--Select--</option>
                        <% doConnect();
                        try{
                            stmtFillRCode = conn.createStatement();
                            rsRCode = stmtFillRCode.executeQuery("select * from elogs_tblretailer");
                            while(rsRCode.next()==true){
                                RCode = rsRCode.getString("Retailer_code");
                            %>
                            <option value = "<%=RCode%>"><%=RCode%></option>
                            <%
                            }
                        }
                        catch(SQLException se){
                            out.println("Unable to Connect");
                        }
                        %>
                        </select>
                    </td>
                    <td rowspan="5" align="right"><img name="imgPhoto" src="download2.svg" width="150" height="150" style="border-radius:75px"></td>
                </tr>
                <tr>
                    <td><b>Retailer Name :</b></td>
                    <td><input type="text" name="txtRName" size="32" placeholder="Retailer Name.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <td><b>Contact Person :</b></td>
                    <td><input type="text" name="txtRCPerson" size="32" placeholder="Contact Person.." autocomplete="off" required></td>
                </tr>
                <tr>
                    <!-- Image Collected -->
                    <td><b>Photo :</b></td>
                    <td><input type="file" name="filePhoto" size="32" onchange="showPhoto()">
                    <input type="hidden" name="hdnfileSup"></td>
                </tr>
                <tr>
                    <td><b>G.S.T. No. :</b></td>
                    <td><input type="text" name="txtGSTNo" size="32" placeholder="Enter your G.S.T. No.." autocomplete="off"></td>
                </tr>
                <tr>
                    <td><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="32" placeholder="Enter your Locality.." autocomplete="off"></td>
                </tr>
                <tr>
                    <td><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="32" placeholder="Enter your City.."></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td>
                        <select name="cmbState">
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
                    <td><input type="text" name="txtPhno" size="32" placeholder="Enter your Phone No.." autocomplete="off"></td>
                    <td><b>Fax No. : </b></td>
                    <td><input type="text" name="txtFaxNo" size="32"  placeholder="Enter your Fax.No.." required></td>
                </tr>
                <tr>
                    <td><b>e-Mailid :</b></td>
                    <td><input type="email" name="txtMailid" size="32" placeholder="Enter your e-Mailid.."></td>
                    <td><b>Website :</b></td>
                    <td><input type="text" name="txtWebsite" size="32" placeholder="Enter your Website.."></td>
                </tr>
            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmUpdate" class="button button1" value="Update">
             <input type="submit" name="btmDelete" class="button button2" value="Delete" >
             <input type="button" name="btmres" class="button button3" value="Back" onclick="window.location.href = 'elogs_retailerc.jsp';">
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

