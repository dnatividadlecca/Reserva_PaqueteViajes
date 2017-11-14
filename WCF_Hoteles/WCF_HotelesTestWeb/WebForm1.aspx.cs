using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WCF_HotelesTestWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HotelesWS.HotelesClient cliente = new HotelesWS.HotelesClient();
            //cliente.listarCuartosPorHotel("00001", DateTime.Now, DateTime.Now);

            List<HotelesWS.Hotel> hoteles = new List<HotelesWS.Hotel>(cliente.listarTodosHoteles());
        }
    }
}