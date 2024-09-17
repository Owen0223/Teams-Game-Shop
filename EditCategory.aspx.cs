using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace labexw2
{
    public partial class EditCategory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tabResult.Visible = false;
                btnUpdate.Visible = false;
                btnDelete.Visible = false;

                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Categories]", conn);
            SqlDataAdapter sda = new SqlDataAdapter();

            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    dltCate.DataSource = dt;
                    dltCate.DataBind();
                }
            }
        }
        public void Clear()
        {
            txtCatID.Text = txtName.Text = txtSearch.Text = "";
            lblResult.Text = lblStatus.Text = "";
            tabEditing.Visible = true;
            lbHeader.Text = "** Add new Record **";
            txtCatID.Enabled = true;
            lbHeader.Visible = true;
            btnDelete.Visible = false;
            btnUpdate.Visible = false;
            btnSave.Visible = true;



        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM[Categories] WHERE CategoryID=@CatID", conn);
            cmd.Parameters.AddWithValue("CatID", txtSearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            bool recordfound = dr.Read();

            if (recordfound)
            {
                lbHeader.Text = "** Record Details **";
                tabEditing.Visible = false;
                tabResult.Visible = true;
                lblResult.Text = "Record Found!";
                lblResult.ForeColor = System.Drawing.Color.Green;
                lblCategoryID.Text = dr["CategoryID"].ToString();
                lblName.Text = dr["CategoryName"].ToString();
            }
            else
            {
                tabResult.Visible = false;
                lblResult.Text = "No record found...";
                lblResult.ForeColor = System.Drawing.Color.Red;
                lbHeader.Visible = false;
            }
            conn.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                    string insertQuery = "INSERT INTO Categories(CategoryID,CategoryName)values(@ID,@name)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("ID", txtCatID.Text);
                    com.Parameters.AddWithValue("name", txtName.Text);
                    com.ExecuteNonQuery();
                    Response.Write("<script>alert('Category added successfully!');</script>");
                    conn.Close();
                    BindGrid();
                    Clear();
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Following error occured:" + ex.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            tabEditing.Visible = true;
            tabResult.Visible = false;
            btnSave.Visible = false;
            btnUpdate.Visible = true;
            btnDelete.Visible = true;
            btnBack.Visible = false;
            string sid = lblCategoryID.Text;
            string Name = lblName.Text;


            txtCatID.Text = sid;
            txtCatID.Enabled = false;
            txtName.Text = Name;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
                string updateQuery = "UPDATE Categories SET CategoryName=@name WHERE CategoryID=@Id";
                SqlCommand com = new SqlCommand(updateQuery, conn);
                {
                    //@shortName, @longName, @Id
                    com.Parameters.AddWithValue("Id", txtCatID.Text);
                    com.Parameters.AddWithValue("name", txtName.Text);

                    com.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Record Updated Successfully!');</script>");
                com.Dispose();
                conn.Close();
                BindGrid();
                Clear();
                btnBack.Visible = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryID=@ID", conn))
                    {
                        cmd.Parameters.AddWithValue("ID", txtCatID.Text);
                        int rows = cmd.ExecuteNonQuery();

                        Response.Write("<script>alert('Record Deleted Successfully...');</script>");
                        conn.Close();
                        BindGrid();
                        Clear();
                        btnBack.Visible = true;
                    }
                }

                catch (SqlException ex)
                {
                    lblStatus.Text = "Error found: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();

            btnBack.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminpage.aspx");
        }
    }

}