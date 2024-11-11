<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="ClinicaVeterinariaWebApp.Usuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Usuarios</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestión de Usuarios</h2>

            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" />
            <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" />
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
            <asp:TextBox ID="txtNombreUsuario" runat="server" placeholder="Nombre de Usuario" />
            <asp:TextBox ID="txtContraseña" runat="server" placeholder="Contraseña" TextMode="Password" />
            <asp:TextBox ID="txtRol" runat="server" placeholder="Rol" />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Usuario" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Usuario" OnClick="btnActualizar_Click" />

            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="UsuarioID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre de Usuario" />
                    <asp:BoundField DataField="Rol" HeaderText="Rol" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>

