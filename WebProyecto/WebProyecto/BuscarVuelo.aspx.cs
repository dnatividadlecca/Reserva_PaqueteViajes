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
    public partial class BuscarVuelo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]
        public static string ListarHotelesXBusqueda()//string prvcCodCta, string prInCodSubCue)
        {
            ServicioHoteles.HotelesClient cliente = new ServicioHoteles.HotelesClient();
            try
            {
                List<ServicioHoteles.Hotel> hoteles = new List<ServicioHoteles.Hotel>(cliente.listarTodosHoteles());
                return "tu sis";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {

            }

        }
    }
}