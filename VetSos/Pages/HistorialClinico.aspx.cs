using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ClinicaVeterinariaWebApp
{
    public partial class HistorialClinico : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ClinicaVeterinariaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarHistorialClinico();
            }
        }

        private void CargarHistorialClinico()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_LeerHistorialClinico", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvHistorialClinico.DataSource = dt;
                gvHistorialClinico.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_CrearHistorialClinico", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FechaVisita", DateTime.Parse(txtFechaVisita.Text));
                cmd.Parameters.AddWithValue("@Sintomas", txtSintomas.Text);
                cmd.Parameters.AddWithValue("@Diagnostico", txtDiagnostico.Text);
                cmd.Parameters.AddWithValue("@Tratamiento", txtTratamiento.Text);
                cmd.Parameters.AddWithValue("@Veterinario", txtVeterinario.Text);
                cmd.Parameters.AddWithValue("@MascotaID", int.Parse(txtMascotaID.Text));
                cmd.Parameters.AddWithValue("@AdicionadoPor", "admin"); // Cambiar según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarHistorialClinico();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarHistorialClinico", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HistorialID", ViewState["HistorialID"]);
                cmd.Parameters.AddWithValue("@FechaVisita", DateTime.Parse(txtFechaVisita.Text));
                cmd.Parameters.AddWithValue("@Sintomas", txtSintomas.Text);
                cmd.Parameters.AddWithValue("@Diagnostico", txtDiagnostico.Text);
                cmd.Parameters.AddWithValue("@Tratamiento", txtTratamiento.Text);
                cmd.Parameters.AddWithValue("@Veterinario", txtVeterinario.Text);
                cmd.Parameters.AddWithValue("@MascotaID", int.Parse(txtMascotaID.Text));
                cmd.Parameters.AddWithValue("@ModificadoPor", "admin"); // Cambiar según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarHistorialClinico();
        }

        protected void gvHistorialClinico_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvHistorialClinico.SelectedRow;
            ViewState["HistorialID"] = row.Cells[0].Text;
            txtFechaVisita.Text = row.Cells[1].Text;
            txtSintomas.Text = row.Cells[2].Text;
            txtDiagnostico.Text = row.Cells[3].Text;
            txtTratamiento.Text = row.Cells[4].Text;
            txtVeterinario.Text = row.Cells[5].Text;
            txtMascotaID.Text = row.Cells[6].Text;
        }

        protected void gvHistorialClinico_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int historialID = Convert.ToInt32(gvHistorialClinico.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_EliminarHistorialClinico", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HistorialID", historialID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarHistorialClinico();
        }
    }
}
