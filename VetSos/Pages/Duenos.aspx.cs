using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using VetSos.Pages;

namespace ClinicaVeterinariaWebApp
{
    public partial class Duenos : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ClinicaVeterinariaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDuenos();
            }
        }

        private void CargarDuenos()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_LeerDueños", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDuenos.DataSource = dt;
                gvDuenos.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_CrearDueño", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text);
                cmd.Parameters.AddWithValue("@Direccion", txtDireccion.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Identificacion", txtIdentificacion.Text);
                cmd.Parameters.AddWithValue("@AdicionadoPor", "admin"); // Cambia según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarDuenos();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarDueño", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DueñoID", ViewState["DueñoID"]);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text);
                cmd.Parameters.AddWithValue("@Direccion", txtDireccion.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefono.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Identificacion", txtIdentificacion.Text);
                cmd.Parameters.AddWithValue("@ModificadoPor", "admin"); // Cambia según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarDuenos();
        }

        protected void gvDuenos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDuenos.SelectedRow;
            ViewState["DueñoID"] = row.Cells[0].Text;
            txtNombre.Text = row.Cells[1].Text;
            txtApellido.Text = row.Cells[2].Text;
            txtDireccion.Text = row.Cells[3].Text;
            txtTelefono.Text = row.Cells[4].Text;
            txtEmail.Text = row.Cells[5].Text;
            txtIdentificacion.Text = row.Cells[6].Text;
        }

        protected void gvDuenos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int dueñoID = Convert.ToInt32(gvDuenos.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_EliminarDueño", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DueñoID", dueñoID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarDuenos();
        }
    }
}
