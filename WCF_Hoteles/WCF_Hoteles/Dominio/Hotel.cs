using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Dominio
{
    [DataContract]
    public class Hotel
    {
        [DataMember]
        public string id { get; set; }

        [DataMember]
        public string nombre { get; set; }

        [DataMember]
        public string telefono { get; set; }

        [DataMember]
        public string direccion { get; set; }

        [DataMember]
        public int provincia { get; set; }

        [DataMember]
        public int distrito { get; set; }

        [DataMember]
        public int departamaneto { get; set; }

        [DataMember]
        public List<Hotel_cuarto> cuartos { get; set; }
    }
}