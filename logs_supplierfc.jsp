<%@ page language="java" import="java.sql.*" %>

<!-- Connection Established -->
<%!
Connection conn;
Statement stmtFillSId,stmtFillArray;
ResultSet rsSId,rsFill;
String SId, SSName[],SCPerson[],SPhoto[],SAddress[],SLocality[],SCity[],SState[],SPhoneNo[],SEMail[],SWebsite[],SGSTNo[],SDate[];
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
        rsFill = stmtFillArray.executeQuery("Select * from supplierinformation");
        SSName =  new String[20];
        SCPerson =  new String[20];
        SPhoto = new String[20];
        SAddress =  new String[20];
        SLocality =  new String[20];
        SCity =  new String[20];
        SState =  new String[20];
        SPhoneNo =  new String[20];
        SEMail =  new String[20];
        SWebsite =  new String[20];
        SGSTNo =  new String[20];
        SDate =  new String[20];        
        
        i = 0;
        while(rsFill.next()==true){
            SSName[i]= rsFill.getString("SupplierName");
            SCPerson[i]= rsFill.getString("ContactPerson");
            SPhoto[i]= rsFill.getString("Photo");
            SAddress[i]= rsFill.getString("Address");
            SLocality[i]= rsFill.getString("Locality");
            SCity[i]= rsFill.getString("City");
            SState[i]= rsFill.getString("StateUnion");
            SPhoneNo[i]= rsFill.getString("PhoneNo");
            SEMail[i]= rsFill.getString("EMailID");
            SWebsite[i]= rsFill.getString("Website");
            SGSTNo[i]= rsFill.getString("GSTNo");
            SDate[i]= rsFill.getString("Date");

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
           
    function showRegdData(){
            var JSName = new Array();
            var JCPerson = new Array();
            var JPhoto = new Array();
            var JAddress = new Array();
            var JLocality = new Array();
            var JCity = new Array();
            var JState = new Array();
            var JPhoneNo = new Array();
            var JEMail = new Array();
            var JWebsite = new Array();
            var JGSTNo = new Array();
            var JDate = new Array();


            var j,k;
            j=0;

            <% 
                i=0;
                while(i<SSName.length){
            %>
                JSName[j] = "<%= SSName[i] %>";
                JCPerson[j] = "<%=SCPerson[i]%>";
                JPhoto[j] = "<%=SPhoto[i]%>";
		        JAddress[j] = "<%=SAddress[i]%>";
		        JLocality[j] = "<%=SLocality[i]%>";
		        JCity[j] = "<%=SCity[i]%>";
		        JState[j] = "<%=SState[i]%>";
		        JPhoneNo[j] = "<%=SPhoneNo[i]%>";
		        JEMail[j] = "<%=SEMail[i]%>";
		        JWebsite[j] = "<%=SWebsite[i]%>";
		        JGSTNo[j] = "<%=SGSTNo[i]%>";
		        JDate[j] = "<%=SDate[i]%>";

                j = j+1;
            <% 
                i = i+1;
                }
            %>
                k = document.f1.cmbSId.selectedIndex;
                document.f1.txtsName.value = JSName[k-1];
                document.f1.txtCperson.value = JCPerson[k-1];
                document.f1.imgPhoto.src = JPhoto[k-1];
                document.f1.hdnfileSup.value=JPhoto[k-1];
                document.f1.txtAddress.value = JAddress[k-1];
                document.f1.txtLocality.value = JLocality[k-1];
                document.f1.txtCity.value = JCity[k-1];
                document.f1.cmbState.value = JState[k-1];
                document.f1.txtphno.value = JPhoneNo[k-1];
                document.f1.txtmail.value = JEMail[k-1];
                document.f1.urlWebsite.value = JWebsite[k-1];
                document.f1.txtGstno.value = JGSTNo[k-1];
                document.f1.dtDate.value = JDate[k-1];

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
        <center><a href="adminmenu.html" style="color: white; text-decoration: none;font-weight: bold; align-items: center;letter-spacing: 0.1rem;"><span>e-Logistic Solutions</span></a> </center></h4>
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
        <h2>Supplier Information</h2><br><br>
        <form name= "f1" action="logs_supplierfs.jsp"  method="GET" >
            <table width="850" border="0">
                <tr>
                    <td ><b>Supplier Id :</b></td>
                    <td><select name="cmbSId" onchange="showRegdData()">  
                        <option value="null">--Select--</option>
                        <% doConnect();
                        try{
                            stmtFillSId = conn.createStatement();
                            rsSId = stmtFillSId.executeQuery("select * from supplierinformation");
                            while(rsSId.next()==true){
                                SId = rsSId.getString("SupplierID");
                            %>
                            <option value = "<%=SId%>"><%=SId%></option>
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
                    <td><b>Supplier Name :</b></td>
                    <td><input type="text" name="txtsName" size="32" placeholder="Supplier Name.." autocomplete="off" ></td>
                </tr>
                <tr>
                    <td><b>Contact Person :</b></td>
                    <td><input type="text" name="txtCperson" size="32" placeholder="Contact Person.." autocomplete="off" ></td>
                </tr>
                <tr>
                    <td><b>Photo :</b></td>
                    <td><input type="file" name="filePhoto" size="32" onchange="showPhoto()">
                    <input type="hidden" name="hdnfileSup"></td>
                </tr>
                <tr>
                    <td><b>Address :</b></td>
                    <td><input type="text" name="txtAddress" size="32" placeholder="Enter your Address.." autocomplete="off" ></td>
                </tr>
                <tr>
                    <td><b>Locality :</b></td>
                    <td><input type="text" name="txtLocality" size="32" placeholder="Enter your Locality.." autocomplete="off" ></td>
                </tr>
                <tr>
                    <td><b>City :</b></td>
                    <td><input type="text" name="txtCity" size="32" placeholder="Enter your City.." ></td>
                </tr>
                <tr>
                    <td><b>State/U.Teritory :</b></td>
                    <td >
                        <select name="cmbState">
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
                
                <tr>
                    <td><b>Phone No :</b> </td>
                    <td><input type="text" name="txtphno" size="32" placeholder="Enter your Phone No.." ></td>
                    <td><b>E-MailId : </b></td>
                    <td><input type="email" name="txtmail" size="30"  placeholder="Enter your Email.." ></td>
                </tr>
                <tr>
                    <td><b>Website :</b></td>
                    <td><input type="url" name="urlWebsite" size="32" placeholder="Enter your Website.."  ></td>
                </tr>
                <tr>
                    <td><b>G.S.T No :</b></td>
                    <td><input type="text" name="txtGstno" size="32" placeholder="Enter G.S.T No.." ></td>
                    <td><b>Date :</b></td>
                    <td><input type="date" name="dtDate" ></td>
                </tr>
            </table>
            </table><br><br>
            <br>
            <input type="submit" name="btmUpdate" class="button button1" value="Update">
             <input type="submit" name="btmDelete" class="button button2" value="Delete">
             <input type="button" name="btmres" class="button button3" value="Back" onclick="window.location.href = 'logs_supplierc.jsp';">
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

