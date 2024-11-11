using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace VetSos.Pages
{
    public class UsuarioDAO
    {
        public static DatabaseHelper dh = new DatabaseHelper();

        /// <summary>
        /// Este método intenta iniciar sesión con el nombre de usuario y contraseña proporcionados.
        /// </summary>
        /// <param name="nombreUsuario">El nombre de usuario del usuario que intenta iniciar sesión.</param>
        /// <param name="contrasenna">La contraseña del usuario.</param>
        /// <returns>Un DataRow que contiene la información del usuario si el inicio de sesión es exitoso, de lo contrario null.</returns>
        public static DataRow IniciarSesion(string nombreUsuario, string contrasenna)
        {
            dh = new DatabaseHelper();
            try
            {
                // Definir la consulta SQL para ejecutar el procedimiento almacenado
                //string query = "EXEC sp_IniciarSesion @NombreUsuario = '" + nombreUsuario + "', @Contrasenna = '" + contrasenna + "'; ";
                string query = "sp_IniciarSesion";

                // Define los parámetros
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@NombreUsuario",SqlDbType.Text){Value = nombreUsuario},
                    new SqlParameter("@Contrasenna", SqlDbType.Text){Value = contrasenna},
                };

                // Ejecutar la consulta y obtener los resultados
                DataTable resultado = dh.ExecuteSelectQuery(query, sqlParameters);

                // Verificar si se ha devuelto algún resultado
                if (resultado.Rows.Count > 0)
                {
                    // Devolver la primera fila de resultados
                    return resultado.Rows[0];
                }
                else
                {
                    // Si no se encontró el usuario, retornar null
                    return null;
                }
            }
            catch (Exception ex)
            {
                // Manejar cualquier error que ocurra y registrar el error
                dh.LogError(ex);
                throw; // Re-lanzar la excepción para manejarla en un nivel superior
            }
        }
    }
}