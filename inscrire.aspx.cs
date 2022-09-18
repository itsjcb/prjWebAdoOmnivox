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
    public partial class inscrire : System.Web.UI.Page
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
   
        protected void btnInscrire_Click(object sender, EventArgs e)
        {
            String numEtud = txtNumero.Text.Trim();
            String nomEtud = txtNom.Text.Trim();
            DateTime naissEtud = Convert.ToDateTime(txtNaissance.Text);
            String passEtud = txtMotDePasse.Text.Trim();

            String sqlEtud = "SELECT * FROM Etudiants WHERE Numero = @num AND Nom = @nom AND Naissance = @naiss";

            OleDbCommand mycmd = new OleDbCommand(sqlEtud, mycon);

            //methode courte de création de parametres
            mycmd.Parameters.AddWithValue("num", numEtud);
            mycmd.Parameters.AddWithValue("nom", nomEtud);
            mycmd.Parameters.AddWithValue("naiss", naissEtud);
            mycon.Open();
            OleDbDataReader myRd = mycmd.ExecuteReader();
            //si le reader est vide CAD il n'y a pas de membres avec ces numeo et password
            if (myRd.Read() == true)
            {
                mycon.Close();
                lblErreur.Text = "Seulement les etudiants de Teccart peuvent s'inscrire!";

            }
            //si l'utilisateur est etudiant et pas membres (il peut devenir membres)
            else
            {

                //Verifier si un membre avec ce numero d'etudiant n'Existe pas deja
                string sql = "SELECT Numero FROM Membres WHERE Numero=@num ";

                OleDbCommand mycmd1 = new OleDbCommand(sql, mycon);
                mycmd1.Parameters.AddWithValue("num", numEtud);
                OleDbDataReader myRd1 = mycmd1.ExecuteReader();

                //Si le reader n'est pas vide c'est à dire(CAD) il a deja un membre avec ce numero
                if (myRd1.Read() == true)
                {
                    mycon.Close();
                    lblErreur.Text = "Vous êtes deja membre veuillez contacter l'administration. ";
                }
                //si l'utilisateur est etudiant et pas membre (il peut devenir membre)
                else
                {
                    string sqlAdd = "INSERT INTO Membres (Numero, Nom, Mot2Passe, Statut) VALUES (@num,@nom,@pass,'actif')";
                    OleDbCommand mycmd2 = new OleDbCommand(sqlAdd, mycon);
                    mycmd2.Parameters.AddWithValue("num", numEtud);
                    mycmd2.Parameters.AddWithValue("nom", nomEtud);
                    mycmd2.Parameters.AddWithValue("pass", passEtud);
                    //mode ecriture
                    mycmd2.ExecuteNonQuery();
                    mycon.Close();
                    Server.Transfer("index.aspx");
                }

            }
        }
    }
}