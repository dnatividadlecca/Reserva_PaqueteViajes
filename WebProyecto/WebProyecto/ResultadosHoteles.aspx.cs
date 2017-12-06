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
    public partial class ResultadosHoteles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    hdf_IdDepartamento.Value = Request.QueryString["IdDepartamento"];
                    hdf_IdProvincia.Value = Request.QueryString["IdProvincia"];
                    hdf_IdDistrito.Value = Request.QueryString["IdDistrito"];
                    hdf_FechaIni.Value = Request.QueryString["daFechaIni"];
                    hdf_FechaFin.Value = Request.QueryString["daFechaFin"];
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
        public static List<ServicioHoteles.Hotel> ListarHotelesXBusqueda(string idDep, string idProv, string idDist, string vcFechaI, string vcFechaF)
        {
            ServicioHoteles.HotelesClient cliente = new ServicioHoteles.HotelesClient();
            try
            {
                List<ServicioHoteles.Hotel> ObjHotel = new List<ServicioHoteles.Hotel>(cliente.listarHotelesxHorarios(Convert.ToInt32(idDep), Convert.ToInt32(idProv), Convert.ToInt32(idDist), Convert.ToDateTime(vcFechaI), Convert.ToDateTime(vcFechaF)));
                return ObjHotel;
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