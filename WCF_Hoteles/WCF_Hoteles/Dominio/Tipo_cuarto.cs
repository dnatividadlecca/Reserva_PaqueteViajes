using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Dominio
{
    [DataContract]
    public class Tipo_cuarto
    {
        [DataMember]
        public string id { get; set; }

        [DataMember]
        public string descripcion { get; set; }
    }
}