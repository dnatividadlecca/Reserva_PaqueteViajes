using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Dominio
{
    [DataContract]
    public class Hotel_cuarto
    {
        [DataMember]
        public string id { get; set; }
        
        [DataMember]
        public int numero { get; set; }

        [DataMember]
        public int capacidad { get; set; }

        [DataMember]
        public double costo_noche { get; set; }
    }
}