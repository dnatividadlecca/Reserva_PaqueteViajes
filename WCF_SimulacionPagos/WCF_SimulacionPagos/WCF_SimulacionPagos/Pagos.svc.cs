using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCF_SimulacionPagos.Dominio;
using WCF_SimulacionPagos.Errores;
using WCF_SimulacionPagos.Persistencia;

namespace WCF_SimulacionPagos
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Pagos" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Pagos.svc o Pagos.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Pagos : IPagos
    {
        private PagosDAO pagoDAO = new PagosDAO();
        private DateTime fechaVencimiento;

        public Pago registrarpago(Pago nuevoPago)
        {
            
            if (!string.IsNullOrEmpty(nuevoPago.payment_card_expiration_date))
            {
                fechaVencimiento = new DateTime(Convert.ToInt32(nuevoPago.payment_card_expiration_date.Substring(3, 2)) + 2000,
                                                Convert.ToInt32(nuevoPago.payment_card_expiration_date.Substring(0, 2)), 1);

                fechaVencimiento = fechaVencimiento.AddDays(DateTime.DaysInMonth(fechaVencimiento.Year, fechaVencimiento.Month) - 1);

                //if (DateTime.Today > fechaVencimiento.Date)
                if(DateTime.Compare(DateTime.Today, fechaVencimiento) > 0)
                {
                    throw new WebFaultException<Excepciones>(new Excepciones()
                    {
                        codigo = "010",
                        descripcion = "Tarjeta se encuentra Expirada. No se puede proceder con el pago."
                    }, System.Net.HttpStatusCode.Conflict);
                }
                else
                {
                    return pagoDAO.grabarPago(nuevoPago);
                }
            }
            
            return null;            
        }

        public Pago obtenerDetallesPago(string codigoPago)
        {
            return pagoDAO.obtenerDetallesPago(Convert.ToInt32(codigoPago));
        }
    }
}
