using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace prjWebAdoOmnivox
{
    public partial class index : System.Web.UI.Page
    {
        // Declaration des var globales à la webform
        static OleDbConnection mycon;

        protected void Page_Load(object sender, EventArgs e)
        {
           if (Page.IsPostBack == false)
           {
                mycon = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\jacob\OneDrive\Bureau\asp1\prjWebAdoOmnivox\App_Data\OmnivoxTeccart.accdb;Persist Security Info=True");
           }
            

        }

        protected void btnEntrer_Click(object sender, EventArgs e)
        {
            mycon.Open();
            string StudNumero = txtNumeroEtudiant.Text.Trim();
            string StudPassword = txtPassword.Text.Trim();
            string sql = "Select RefMembre, Numero, Nom, Mot2passe From Membres Where Numero = @num AND Mot2Passe = @pass";
            OleDbCommand mycmd = new OleDbCommand(sql, mycon);
            //methode longue de création de parametres
            OleDbParameter mypar = new OleDbParameter("num", StudNumero);
            mycmd.Parameters.Add(mypar);
            //methode courte de création de parametres
            mycmd.Parameters.AddWithValue("pass", StudPassword);
            OleDbDataReader myRd = mycmd.ExecuteReader();
            //si le reader est vide CAD il n'y a pas de membre avec ces numeo et password
            if(myRd.Read() == false)
            {
                mycon.Close();
                lblErreur.Text = "Numero et/ou Mot de Passe Invalide(s)! Essayez encore!";

            }
            else //si le membre existe, on l'envoie a la page d'accueil avec son refmembre st
            {
                Session["MembreID"] = Convert.ToInt32(myRd["RefMembre"]);
                Session["MembreNom"] = myRd["Nom"].ToString();
                mycon.Close();
                Server.Transfer("accueil.aspx");
                // Response.Redirect("accueil.aspx");
            }
        }

        protected void btnInscrire_Click(object sender, EventArgs e)
        {
            Server.Transfer("inscrire.aspx");

        }
    }
}