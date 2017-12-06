using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace WebProyecto
{
    public partial class BuscarHoteles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    txtFechaIni.Value = DateTime.Now.ToShortDateString();
                    txtFechaFin.Value = DateTime.Now.ToShortDateString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        [WebMethod(EnableSession = true)]
        public static List<ServicioHoteles.Destino> ListarDestinoXFiltro(string vcNomDestino)
        {
            ServicioHoteles.HotelesClient cliente = new ServicioHoteles.HotelesClient();
            List<ServicioHoteles.Destino> Destino = new List<ServicioHoteles.Destino>(cliente.ListarDestinoXFiltro(vcNomDestino));

            return Destino;
        }



    }
}