using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace WCF_HotelesTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            HotelesWS.HotelesClient cliente = new HotelesWS.HotelesClient();
            cliente.listarCuartosPorHotel("00001", DateTime.Now, DateTime.Now);
        }
    }
}
