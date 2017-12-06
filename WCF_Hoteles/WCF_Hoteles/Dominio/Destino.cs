using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_Hoteles.Dominio
{
    public class Destino
    {
        [DataMember]
        public int IdDistrito { get; set; }

        [DataMember]
        public int IdProvincia { get; set; }

        [DataMember]
        public int IdDepartamaneto { get; set; }

        [DataMember]
        public string NombreDestino { get; set; }
    }
}