<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="VetSos.Pages.Historial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Hoja Clínica</title>
     <link type="text/css" rel="stylesheet" href="../Styles/HojaEstilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <label  runat="server" name="lblUsuario" id="lblUsuario" class="label">Usuario conectado:</label> 

            <label class="label">Fecha de atención:</label>
            <input type="text" id="fechaAtencion" class="text-box" disabled /><br />

            <label class="label">Identificador Mascota:</label>
            <input type="text" id="identificador" class="text-box" title="Dígite el identificador de la mascota aquí:" />
            <button type="button" class="button" onclick="buscarMascota()">Buscar</button>
            <button type="button" class="button" onclick="agregarMascota()">Agregar</button><br />

            <label class="label">Nombre Mascota:</label>
            <input type="text" id="nombreMascota" class="text-box" /><br />

            <label class="label">Peso Mascota:</label>
            <input type="text" id="pesoMascota" class="text-box" /><br />

            <label class="label">Sexo:</label>
            <input type="text" id="sexo" class="text-box" disabled /><br />

            <label class="label">Fecha Nacimiento:</label>
            <input type="text" id="fechaNacimiento" class="text-box" disabled /><br />

            <label class="label">Alergias:</label>
            <input type="text" id="alergias" class="text-box" /><br />

            <label class="label">Síntomas:</label>
            <textarea id="sintomas" class="text-box" rows="4"></textarea><br />

            <label class="label">Diagnóstico:</label>
            <textarea id="diagnostico" class="text-box" rows="4"></textarea><br />

            <label class="label">Tratamiento:</label>
            <textarea id="tratamiento" class="text-box" rows="4"></textarea><br />

            <button type="button" class="button" onclick="actualizarDatos()">Actualizar Datos</button>
            <button type="button" class="button" onclick="limpiarCampos()">Limpiar Campos</button>
            <button type="button" class="button" onclick="guardarHoja()">Guardar Hoja</button>
        </div>
    </form>
</body>
</html>
