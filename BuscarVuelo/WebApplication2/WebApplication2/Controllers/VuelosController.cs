using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using srv = WebApplication2.ConsultarVuelos;

namespace WebApplication2.Controllers
{
    public class VuelosController : Controller
    {
        // GET: Vuelos
        public ActionResult Index()
        {
            return View();
        }
        public string Buscar(string origen, string destino, string fechaSalida, string fechaRegreso, int nroPasajeros)
        {
            srv.ConsultarVuelos servicio = new srv.ConsultarVuelos();
            //srv.vuelo[] vuelos = servicio.VuelosIdaYVueltaCantidad(origen, destino, fechaSalida, fechaRegreso, nroPasajeros, false);
            String vuelos = servicio.VuelosIdaYVueltaCantidad(origen, destino, fechaSalida, fechaRegreso, nroPasajeros, false);
            return vuelos;
            //if (vuelos != null)
            //{
            //    return  vuelos.Count().ToString();
            //}
            //else
            //{
            //    return "0";
            //}
        }


    }
}