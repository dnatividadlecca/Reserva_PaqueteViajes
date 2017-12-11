using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Script.Serialization;
using System.Text;
using System.Net;
using System.IO;

namespace WCF_Simulacion_Test
{
    [TestClass]
    public class UnitTest_Obtencion
    {

        [TestMethod]
        public void ObtenerPago()
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://localhost:33636/Pagos.svc/Pagos/1");
            request.Method = "GET";
            HttpWebResponse respuesta = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(respuesta.GetResponseStream());

            string jsonTrama = reader.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Pago pagoCreado = js.Deserialize<Pago>(jsonTrama);

            Assert.AreEqual(1, pagoCreado.payment_id);
        }
    }
}
