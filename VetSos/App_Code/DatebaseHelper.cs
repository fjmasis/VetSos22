using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace VetSos.Pages
{
    public class DatabaseHelper
    {
        /// <summary>
        /// Este método es responsable de obtener la cadena de conexión para la base de datos.<br />
        /// Propósito: Permitir la conexión a la base de datos ClinicaVeterinariaDB<br />
        /// Función: Utiliza ConfigurationManager.ConnectionStrings para acceder a la 
        /// configuración de la cadena de conexión en el archivo de configuración de la aplicación (app.config o web.config). <br />
        /// Esto asegura que los detalles de conexión estén centralizados y puedan ser modificados sin cambiar el código.
        /// </summary>
        /// <returns>Cadena de conexión para ClinicaVeterinariaDB.</returns>
        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ClinicaVeterinariaDB"].ConnectionString;
        }

        /// <summary>
        /// Este método es responsable de registrar cualquier error que ocurra al intentar conectarse o ejecutar consultas en la base de datos.<br />
        /// Propósito: Mantener un registro de errores de base de datos en un archivo de log(database_errors.log). <br />
        /// Función: Recibe una excepción como parámetro y abre el archivo de log en modo de "adición" (append)  
        /// para no sobreescribir información previa.<br />
        /// ***Luego escribe la fecha y hora actuales,
        /// el mensaje del error (ex.Message) y la traza de la pila (stack trace) con detalles técnicos del error (ex.StackTrace). 
        /// Esto facilita el diagnóstico de problemas al proporcionar información detallada sobre cada error que ocurre.
        /// </summary> 
        public void LogError(Exception ex)
        {
            string logFilePath = @"D:\Error_VetSOS\database_errors.log";// Ubicación y nombre del archivo de log

            using (StreamWriter writer = new StreamWriter(logFilePath, true)) // 'true' para agregar al final del archivo
            {
                writer.WriteLine($"{DateTime.Now} - Error: {ex.Message}");
                writer.WriteLine($"StackTrace: {ex.StackTrace}");
                writer.WriteLine();
            }
        }
         

        /// <summary>
        ///  Este método ejecuta una consulta SELECT en la base de datos y devuelve los resultados.<br />
        ///  Propósito: Ejecutar consultas de selección en la base de datos y devolver los datos como una tabla(DataTable).<br />
        ///  Función: Acepta una consulta SQL y una lista opcional de parámetros SQL(sqlParameters). Luego:<br />
        ///  ***Intenta abrir una conexión con la base de datos usando SqlConnection y SqlCommand para preparar la consulta.<br />
        ///  ***Si hay parámetros, los agrega al comando con cmd.Parameters.AddRange.<br />
        ///  ***Usa SqlDataAdapter para llenar un DataTable con los datos obtenidos y devolverlo al llamador.<br />
        ///  ***En caso de error, lo captura con catch, registra el error usando LogError, y vuelve a lanzar la excepción (throw) <br />
        ///  para que el código llamador pueda también manejarla.
        /// </summary>
        /// <returns>DataTable con los datos obtenidos.</returns>
        public DataTable ExecuteSelectQuery(string query, SqlParameter[] sqlParameters)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (sqlParameters != null)
                        {
                             cmd.CommandType = CommandType.StoredProcedure;
                             cmd.Parameters.AddRange(sqlParameters);  
                        }

                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                throw; // Re-throw la excepción para que el llamador pueda manejarla
            }
        }

        /// <summary>
        /// Este método ejecuta una consulta INSERT, UPDATE, o DELETE en la base de datos.<br />
        /// Propósito: Permitir ejecutar consultas de modificación de datos en la base de datos sin devolver resultados.<br />
        /// Función: Acepta una consulta SQL y una lista de parámetros SQL, y:<br />
        /// ***Usa SqlConnection para abrir una conexión y SqlCommand para preparar la consulta.<br />
        /// ***Agrega los parámetros a la consulta usando cmd.Parameters.AddRange.<br />
        /// ***Llama a conn.Open() para abrir la conexión, y luego cmd.ExecuteNonQuery() para ejecutar la consulta sin devolver datos.<br />
        /// ***En caso de error, captura la excepción, registra el error con LogError, y vuelve a lanzar la excepción.<br />
        /// </summary> 
        public void ExecuteQuery(string query, SqlParameter[] sqlParameters)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddRange(sqlParameters);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                throw; // Re-throw la excepción para que el llamador pueda manejarla
            }
        }
    }
}