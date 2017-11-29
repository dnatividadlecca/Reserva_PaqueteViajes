using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Dominio
{
    [DataContract]
    public class Hotel_reserva
    {

        [DataMember]
        public int reserva_ID { get; set; }

        [DataMember]
        public string cuarto_ID { get; set; }

        [DataMember]
        public string cliente_ID { get; set; }

        [DataMember]
        public string hotel_ID { get; set; }

        [DataMember]
        public DateTime fecha_inicio { get; set; }

        [DataMember]
        public DateTime fecha_fin { get; set; }

        [DataMember]
        public string reserva_estado { get; set; }
    }
}