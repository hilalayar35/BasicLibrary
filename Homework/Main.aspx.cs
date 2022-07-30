using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Homework
{
    public partial class Main : System.Web.UI.Page
    {
        string connectionString = @"Data Source=localhost; Database=Library;User=user1;Password='12345';SslMode=none;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindPage();
            }
        }
        private void Show(string message)
        {
            string script = "alert(\" " + message + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }

        private void bindPage()
        {
            try
            {
                DataTable dt = getDataFromSql("SELECT * FROM Book");
                gvMsql.DataSource = dt;
                gvMsql.DataBind();

                ddlBook.DataSource = dt;
                ddlBook.DataTextField = "BookName";
                ddlBook.DataValueField = "BookId";
                ddlBook.DataBind();
                ddlBook.Items.Insert(0, new ListItem("Please select a value", ""));

                ddlISBN.DataSource = dt;
                ddlISBN.DataTextField = "ISBN";
                ddlISBN.DataValueField = "BookId";
                ddlISBN.DataBind();
                ddlISBN.Items.Insert(0, new ListItem("Please select a value", ""));

            }
            catch (Exception ex)
            {
                Show(ex.Message);
            }

        }

        private DataTable getDataFromSql(string sql)
        {
            DataTable dt = new DataTable();
            using (MySqlConnection myc = new MySqlConnection(connectionString))
            {
                MySqlDataAdapter mda = new MySqlDataAdapter(sql, myc);
                mda.Fill(dt);
                return dt;
            }

        }

        protected void onSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlBook.SelectedValue != "")
                {
                    DataTable dt = getDataFromSql("SELECT Author FROM Book  WHERE BookId = " + ddlBook.SelectedValue);

                    if (dt.Rows.Count > 0)
                    {
                        LblAuthor.Text = dt.Rows[0].Field<string>("Author");
                    }
                }
                else
                {
                    LblAuthor.Text = "";
                }
            }
            catch (Exception ex)
            {
                Show(ex.Message);
            }
        }

        protected void onSelectedIndexDeleted(object sender, EventArgs e)
        {
            try
            {
                if (ddlISBN.SelectedValue != "")
                {
                    string deleteQuery = "DELETE FROM Book  WHERE BookId = " + ddlISBN.SelectedValue;
                    using (MySqlConnection myc = new MySqlConnection(connectionString))
                    {
                        myc.Open();
                        MySqlCommand myCmd = new MySqlCommand(deleteQuery, myc);
                        myCmd.ExecuteNonQuery();
                        myc.Close();
                        bindPage();
                        LblResponse.Text = "Related book is deleted..";
                    }
                }
                else
                {
                    LblResponse.Text = "";
                }
            }
            catch (Exception ex)
            {
                Show(ex.Message);
            }
        }
    }

}