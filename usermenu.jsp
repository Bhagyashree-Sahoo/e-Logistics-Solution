<%@ page language="java" import="java.sql.*" session="true" %>

<%!
    String retcode,retPhoto;
    HttpSession ssn;
%>
<%
   ssn=request.getSession();
   retcode=ssn.getAttribute("ssnRcode").toString();
   retPhoto=ssn.getAttribute("ssnPhoto").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="stylemenuadmin.css">
  <title>Retailer Menu Page</title>
  <style>
    img{
      border-radius: 50%;
    }
  </style>
</head>
<body>
  <nav class="navbar">
    <a href="Index.html" class="navbar-logo">Mother India &nbsp;&nbsp;</a>
    <ul class="navbar-links">
      <li class="navbar-dropdown" style="display:flex; justify-content:space-around; padding-left: 90px">
        <a href="aboutc.html">About</a>
      </li>
      <li class="navbar-dropdown">
        <a href="#">My Activity</a>
        <div class="dropdown">
          <a href="elogs_RetailOrdercr.jsp">Order from Retailer</a>
          <a href="elogs_rptProductAnyPCodecr.jsp">Product Information [Code]</a>
        </div>
      </li>
      <li class="navbar-dropdown">
        <a href="#">Show All</a>
        <div class="dropdown">
          <a href="elogs_billformatcr.jsp">Invoice Generation</a>
          <a href="elogs_rptSupplier.jsp">Supplier List</a>
          <a href="elogs_rptProductCatg.jsp">Product Category List</a>
          <a href="elogs_rptProductInfor.jsp">Product Regsiter</a>
          <a href="elogs_rptRetailerr.jsp">Retailer List</a>
          <a href="elogs_rptRetailOrderr.jsp">Order from Retailer Register</a>
          <a href="elogs_rptIssuer.jsp">Issue Register</a>
          <a href="elogs_rptReceiptVoucherr.jsp">Debtors Ledger</a>
        </div>
      </li>
      <li class="navbar-dropdown">
        <a href="#">Find Any</a>
        <div class="dropdown">
          <a href="elogs_rptProductInfoAnySupcr.jsp">Product Regsiter [Supplier ]</a>
          <a href="elogs_rptProductCatgAnyCatgcr.jsp">Product Information [Category]</a>
          <a href="elogs_rptIssueRetailerNamecr.jsp">Issue Register [Retailer]</a>
          <a href="elogs_rptIssueProductCatgcr.jsp">Issue Register [Product Category]	</a>
          <a href="elogs_rptIssueInvoiceDatecr.jsp">Issue Register [Date]</a>		      
          <a href="elogs_rptIssueProductCodecr.jsp">Issue Register [Product Code]	</a>
          <a href="elogs_rptOrderInvoiceDatecr.jsp">Order Register [Date]</a>
          <a href="elogs_rptOrderRegRetailercr.jsp">Order Register [Retailer]</a>
          <a href="elogs_rptOrderRegPCatgcr.jsp">Order Register [Product Category]</a>
          <a href="elogs_rptProductSupcr.jsp">Stock Register [Supplier]		</a>
          <a href="elogs_rptProductInfocr.jsp">Stock Register [Category]</a>
        </div>
      </li>
      <li class="navbar-dropdown">
        <a href="reachusc.html">Reach Us</a>
      </li>	  
    </ul>
    <ul class="navbar-links">
      <li style="display:flex; justify-content:space-around; padding-left: 130px;"><img src="<%= retPhoto %>" class="img" alt="" width="45px" height="45px" ></li>
    </ul>
    <ul class="navbar-links" >
      <li ><a href=""><span style="color: red;"><%= retcode %></span></a></li>
    </ul>
  </nav>
  <div class="maindiv"></div>
  <h3>© 2022-2023 E-Logistic| All Rights Reserved |</h3>
</body>
</html>
