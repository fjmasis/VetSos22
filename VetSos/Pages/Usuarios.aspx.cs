using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ClinicaVeterinariaWebApp
{
    public partial class Usuarios : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ClinicaVeterinariaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_LeerUsuarios", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsuarios.DataSource = dt;
                gvUsuarios.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_CrearUsuario", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@NombreUsuario", txtNombreUsuario.Text);
                cmd.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);
                cmd.Parameters.AddWithValue("@Rol", txtRol.Text);
                cmd.Parameters.AddWithValue("@AdicionadoPor", "admin"); // Cambiar según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarUsuarios();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarUsuario", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UsuarioID", ViewState["UsuarioID"]);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@NombreUsuario", txtNombreUsuario.Text);
                cmd.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);
                cmd.Parameters.AddWithValue("@Rol", txtRol.Text);
                cmd.Parameters.AddWithValue("@ModificadoPor", "admin"); // Cambiar según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarUsuarios();
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvUsuarios.SelectedRow;
            ViewState["UsuarioID"] = row.Cells[0].Text;
            txtNombre.Text = row.Cells[1].Text;
            txtApellido.Text = row.Cells[2].Text;
            txtEmail.Text = row.Cells[3].Text;
            txtNombreUsuario.Text = row.Cells[4].Text;
            txtRol.Text = row.Cells[5].Text;
        }

        protected void gvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int usuarioID = Convert.ToInt32(gvUsuarios.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_EliminarUsuario", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UsuarioID", usuarioID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarUsuarios();
        }
    }
}
