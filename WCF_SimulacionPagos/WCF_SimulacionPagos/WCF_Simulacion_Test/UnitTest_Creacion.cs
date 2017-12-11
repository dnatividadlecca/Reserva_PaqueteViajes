using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Script.Serialization;
using System.Text;
using System.Net;
using System.IO;

namespace WCF_Simulacion_Test
{
    [TestClass]
    public class UnitTest_Creacion
    {
        [TestMethod]
        public void CrearPago()
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            Pago nuevopago = new Pago()
            {
                payment_price = 102.35m,
                payment_card_number = 3257384909826346,
                payment_card_expiration_date = "01/18",
                email = "u201010398@upc.edu.pe",
                first_name = "Alberto",
                last_name = "Larra",
                street = "Calle Tungasuca 134",
                city = "San Miguel",
                state = "Lima",
                zip = "Lima 33",
                country = "Perú",
                is_success = "S",
                reason_fault = ""
            };

            string postdata = js.Serialize(nuevopago);

            byte[] data = Encoding.UTF8.GetBytes(postdata);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://localhost:33636/Pagos.svc/Pagos");
            request.Method = "POST";
            request.ContentLength = data.Length;
            request.ContentType = "application/json";

            var requestStream = request.GetRequestStream();
            requestStream.Write(data, 0, data.Length);

            HttpWebResponse respuesta = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(respuesta.GetResponseStream());

            string jsonTrama = reader.ReadToEnd();

            Pago pagoCreado = js.Deserialize<Pago>(jsonTrama);

            Assert.AreEqual(3257384909826346, pagoCreado.payment_card_number);
        }

        [TestMethod]
        public void CrearPagoConFechaExpirada()
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            Pago nuevopago = new Pago()
            {
                payment_price = 102.35m,
                payment_card_number = 3257384909826346,
                payment_card_expiration_date = "01/17",
                email = "u201010398@upc.edu.pe",
                first_name = "Alberto",
                last_name = "Larra",
                street = "Calle Tungasuca 134",
                city = "San Miguel",
                state = "Lima",
                zip = "Lima 33",
                country = "Perú",
                is_success = "S",
                reason_fault = ""
            };

            string postdata = js.Serialize(nuevopago);

            byte[] data = Encoding.UTF8.GetBytes(postdata);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://localhost:33636/Pagos.svc/Pagos");
            request.Method = "POST";
            request.ContentLength = data.Length;
            request.ContentType = "application/json";

            var requestStream = request.GetRequestStream();
            requestStream.Write(data, 0, data.Length);

            HttpWebResponse respuesta = null;

            try
            {
                respuesta = (HttpWebResponse)request.GetResponse();
                StreamReader reader = new StreamReader(respuesta.GetResponseStream());

                string jsonTrama = reader.ReadToEnd();
                Pago pagoCreado = js.Deserialize<Pago>(jsonTrama);

                Assert.AreEqual(3257384909826346, pagoCreado.payment_card_number);
            }
            catch (WebException ex)
            {
                HttpStatusCode codigo = ((HttpWebResponse)ex.Response).StatusCode;
                StreamReader reader = new StreamReader(ex.Response.GetResponseStream());

                string jsonTrama = reader.ReadToEnd();

                Excepciones error = js.Deserialize<Excepciones>(jsonTrama);
                Assert.AreEqual(HttpStatusCode.Conflict, codigo);
                Assert.AreEqual("Tarjeta se encuentra Expirada. No se puede proceder con el pago.", error.descripcion);
            }
        }

    }
}
