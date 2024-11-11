using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ClinicaVeterinariaWebApp
{
    public partial class Mascotas : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ClinicaVeterinariaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMascotas();
            }
        }

        private void CargarMascotas()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_LeerMascotas", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMascotas.DataSource = dt;
                gvMascotas.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_CrearMascota", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Especie", txtEspecie.Text);
                cmd.Parameters.AddWithValue("@Raza", txtRaza.Text);
                cmd.Parameters.AddWithValue("@FechaNacimiento", DateTime.Parse(txtFechaNacimiento.Text));
                cmd.Parameters.AddWithValue("@Color", txtColor.Text);
                cmd.Parameters.AddWithValue("@Peso", decimal.Parse(txtPeso.Text));
                cmd.Parameters.AddWithValue("@DueñoID", int.Parse(txtDueñoID.Text));
                cmd.Parameters.AddWithValue("@AdicionadoPor", "admin"); // Cambia según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarMascotas();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarMascota", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MascotaID", ViewState["MascotaID"]);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Especie", txtEspecie.Text);
                cmd.Parameters.AddWithValue("@Raza", txtRaza.Text);
                cmd.Parameters.AddWithValue("@FechaNacimiento", DateTime.Parse(txtFechaNacimiento.Text));
                cmd.Parameters.AddWithValue("@Color", txtColor.Text);
                cmd.Parameters.AddWithValue("@Peso", decimal.Parse(txtPeso.Text));
                cmd.Parameters.AddWithValue("@DueñoID", int.Parse(txtDueñoID.Text));
                cmd.Parameters.AddWithValue("@ModificadoPor", "admin"); // Cambia según el usuario actual

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarMascotas();
        }

        protected void gvMascotas_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvMascotas.SelectedRow;
            ViewState["MascotaID"] = row.Cells[0].Text;
            txtNombre.Text = row.Cells[1].Text;
            txtEspecie.Text = row.Cells[2].Text;
            txtRaza.Text = row.Cells[3].Text;
            txtFechaNacimiento.Text = row.Cells[4].Text;
            txtColor.Text = row.Cells[5].Text;
            txtPeso.Text = row.Cells[6].Text;
            txtDueñoID.Text = row.Cells[7].Text;
        }

        protected void gvMascotas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int mascotaID = Convert.ToInt32(gvMascotas.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_EliminarMascota", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MascotaID", mascotaID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CargarMascotas();
        }
    }
}
