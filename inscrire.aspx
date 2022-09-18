<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inscrire.aspx.cs" Inherits="prjWebAdoOmnivox.inscrire" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 548px;
        }
        .auto-style3 {
            width: 500px;
            background-color: #FF822F;
        }
        .auto-style4 {
            width: 131px;
        }
        .auto-style5 {
            width: 131px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
            width: 282px;
        }
        .auto-style9 {
            width: 282px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style11 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1" background="orange">
            <h1>OMNIVOX - INSTITUT - TECCART
            <br />
            Inscription Des Nouveaux Membres</h1>
            <hr class="auto-style2" />
            <br />
            <table class="auto-style3" align="center">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblNumero" runat="server" Text="N.Etudiant"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtNumero" runat="server" Width="235px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="ReqNumero" runat="server" ErrorMessage="Veuillez entrez le numero!" ControlToValidate="txtNumero" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblNom" runat="server" Text="Nom Complet: "></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtNom" runat="server" Width="235px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="ReqNom" runat="server" ErrorMessage="Nom requis!" ControlToValidate="txtNom" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblDateNaissance" runat="server" Text="Date Naissance: "></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtNaissance" runat="server" CssClass="auto-style10" TextMode="Date" Width="235px"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="ReqNaissance" runat="server" ErrorMessage="Date de Naissance requis!" ControlToValidate="txtNaissance" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblMotDePasse" runat="server" Text="Mot de Passe:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtMotDePasse" runat="server" Width="235px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="ReqMot2Passe" runat="server" ControlToValidate="txtMotDePasse" ErrorMessage="Mot de passe requis!" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblMotDePasse2" runat="server" Text="Mot de Passe: "></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtMotDePasse2" runat="server" Width="235px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="Identique Mot de Passe !" ControlToCompare="txtMotDePasse" ControlToValidate="txtMotDePasse2" Font-Bold="True" ForeColor="#CC3300">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnInscrire" runat="server" Text="Inscrire" Width="86px" OnClick="btnInscrire_Click" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnRecommencer" runat="server" Text="Recommencer" Width="97px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    
                    <td colspan="3" class="auto-style11">
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                    </td>
                    
                </tr>
                <tr>
                    
                    <td colspan="3">
                        <asp:Label ID="lblErreur" runat="server" Text=""></asp:Label>
                    </td>
                    
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
