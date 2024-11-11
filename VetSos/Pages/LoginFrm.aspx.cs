using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 

namespace VetSos.Pages
{
    public partial class LoginFrm : System.Web.UI.Page
    { 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Obtener el nombre de usuario y la contraseña desde los campos de entrada
            string nombreUsuario = username.Value; //   username es un input con runat="server"
            string contrasenna = password.Value; //   password es un input con runat="server"

            // Intentar iniciar sesión utilizando UsuarioDAO
            DataRow usuario = UsuarioDAO.IniciarSesion(nombreUsuario, contrasenna);

            // Verificar si el inicio de sesión fue exitoso
            if (usuario != null)
            { 
                // Inicio de sesión exitoso, redirigir a la página del menú
                Response.Redirect("Historial.aspx");
            }
            else
            {
                // Mostrar un mensaje de error en lblMessage
                lblMessage.InnerText = "Nombre de usuario o contraseña incorrectos."; // lblMessage debe tener runat="server"
            }
             
        }
    }
}