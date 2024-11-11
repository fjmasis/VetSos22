<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="VetSos.Pages.Mascotas" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="ClinicaVeterinariaWebApp.Mascotas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Mascotas</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestión de Mascotas</h2>

            <!-- Formulario para capturar datos de una nueva mascota -->
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" />
            <asp:TextBox ID="txtEspecie" runat="server" placeholder="Especie" />
            <asp:TextBox ID="txtRaza" runat="server" placeholder="Raza" />
            <asp:TextBox ID="txtFechaNacimiento" runat="server" placeholder="Fecha de Nacimiento (YYYY-MM-DD)" />
            <asp:TextBox ID="txtColor" runat="server" placeholder="Color" />
            <asp:TextBox ID="txtPeso" runat="server" placeholder="Peso" />
            <asp:TextBox ID="txtDueñoID" runat="server" placeholder="ID del Dueño" />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Mascota" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Mascota" OnClick="btnActualizar_Click" />

            <!-- GridView para mostrar la lista de mascotas -->
            <asp:GridView ID="gvMascotas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvMascotas_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="MascotaID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Especie" HeaderText="Especie" />
                    <asp:BoundField DataField="Raza" HeaderText="Raza" />
                    <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha de Nacimiento" />
                    <asp:BoundField DataField="Color" HeaderText="Color" />
                    <asp:BoundField DataField="Peso" HeaderText="Peso" />
                    <asp:BoundField DataField="DueñoID" HeaderText="Dueño ID" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>

