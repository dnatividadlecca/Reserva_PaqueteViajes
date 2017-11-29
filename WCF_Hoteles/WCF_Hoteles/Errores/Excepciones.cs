using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Errores
{
    [DataContract]
    public class Excepciones
    {
        [DataMember]
        public string codigo { get; set; }

        [DataMember]
        public string descripcion { get; set; }
    }
}