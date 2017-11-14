using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WCF_Hoteles.Persistencia
{
    public class ConexionDAO
    {
        string conBD = ConfigurationManager.ConnectionStrings["BD_WS"].ConnectionString;

        public SqlConnection crearConexion()
        {
            SqlConnection cnn = new SqlConnection(conBD);

            return cnn;
        }
    }
}