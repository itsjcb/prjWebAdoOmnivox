<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accueil.aspx.cs" Inherits="prjWebAdoOmnivox.accueil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 674px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
        <div>
            <h1 class="auto-style1">INSTITUT TECCART - ACCUEIL - OMNIVOX</h1>
            <hr class="auto-style2" />
            <br />
        </div>
            <asp:Label ID="lblMessage" runat="server" BackColor="#AEE4FF" BorderStyle="Solid" Width="325px"></asp:Label>
        </div>
    </form>
</body>
</html>
