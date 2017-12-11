using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCF_SimulacionPagos.Dominio;

namespace WCF_SimulacionPagos
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IPagos" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IPagos
    {
        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "Pagos", ResponseFormat = WebMessageFormat.Json)]
        Pago registrarpago(Pago nuevoPago);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Pagos/{codigoPago}", ResponseFormat = WebMessageFormat.Json)]
        Pago obtenerDetallesPago(string codigoPago);
    }
}
