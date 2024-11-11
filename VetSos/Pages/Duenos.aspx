<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Duenos.aspx.cs" Inherits="VetSos.Pages.Duenos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Dueños</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestión de Dueños</h2>

            <!-- Formulario para capturar datos de un nuevo dueño -->
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" />
            <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" />
            <asp:TextBox ID="txtDireccion" runat="server" placeholder="Dirección" />
            <asp:TextBox ID="txtTelefono" runat="server" placeholder="Teléfono" />
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
            <asp:TextBox ID="txtIdentificacion" runat="server" placeholder="Identificación" />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Dueño" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Dueño" OnClick="btnActualizar_Click" />

            <!-- GridView para mostrar la lista de dueños -->
            <asp:GridView ID="gvDuenos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvDuenos_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="DueñoID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Identificacion" HeaderText="Identificación" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
