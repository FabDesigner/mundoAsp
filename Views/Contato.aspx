<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="WbForm.Views.Contato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Cabecalho" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Fale conosco</h1>
    
    <asp:Label ID="lblNome" runat="server" Text="Nome: "></asp:Label>
    <asp:TextBox ID="txtNome" runat="server" style="margin-left: 16px" Width="358px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNome" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>

    <br />

    <asp:Label ID="lblEmail" runat="server" Text="E-mail: "></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" style="margin-left: 16px" TextMode="Email" Width="358px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>

    <br />

    <asp:Label ID="lblAssunto" runat="server" Text="Assunto: "></asp:Label>
    <asp:TextBox ID="txtAssunto" runat="server" style="margin-left: 3px" TextMode="MultiLine" Width="354px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAssunto" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>

    <br />

    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" BackColor="#0066FF" BorderColor="Red" BorderStyle="Solid" ForeColor="White" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Rodape" runat="server">
</asp:Content>
