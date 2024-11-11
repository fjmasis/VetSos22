<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialClinico.aspx.cs" Inherits="ClinicaVeterinariaWebApp.HistorialClinico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Historial Clínico</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gestión de Historial Clínico</h2>

            <!-- Formulario para capturar datos de un nuevo historial clínico -->
            <asp:TextBox ID="txtFechaVisita" runat="server" placeholder="Fecha de Visita (YYYY-MM-DD)" />
            <asp:TextBox ID="txtSintomas" runat="server" placeholder="Síntomas" />
            <asp:TextBox ID="txtDiagnostico" runat="server" placeholder="Diagnóstico" />
            <asp:TextBox ID="txtTratamiento" runat="server" placeholder="Tratamiento" />
            <asp:TextBox ID="txtVeterinario" runat="server" placeholder="Veterinario" />
            <asp:TextBox ID="txtMascotaID" runat="server" placeholder="ID de Mascota" />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Historial" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Historial" OnClick="btnActualizar_Click" />

            <!-- GridView para mostrar la lista de historiales clínicos -->
            <asp:GridView ID="gvHistorialClinico" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvHistorialClinico_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="HistorialID" HeaderText="ID" />
                    <asp:BoundField DataField="FechaVisita" HeaderText="Fecha de Visita" />
                    <asp:BoundField DataField="Sintomas" HeaderText="Síntomas" />
                    <asp:BoundField DataField="Diagnostico" HeaderText="Diagnóstico" />
                    <asp:BoundField DataField="Tratamiento" HeaderText="Tratamiento" />
                    <asp:BoundField DataField="Veterinario" HeaderText="Veterinario" />
                    <asp:BoundField DataField="MascotaID" HeaderText="ID de Mascota" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
