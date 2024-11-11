<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginFrm.aspx.cs" Inherits="VetSos.Pages.LoginFrm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link type="text/css" rel="stylesheet" href="../Styles/HojaEstilos.css" />
</head>
<body>
    <div class="login-form">
        <h2>Login</h2>
        <form id="form1" runat="server" method="post">
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="user" runat="server" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="pass" runat="server" required>
            <br />
            <button type="submit" runat="server" onserverclick="btnLogin_Click">Iniciar sesión</button>
        </form>
        <div class="message" runat="server" id="lblMessage"></div>
        <!-- Div para mensajes -->
    </div>
</body>
</html>
