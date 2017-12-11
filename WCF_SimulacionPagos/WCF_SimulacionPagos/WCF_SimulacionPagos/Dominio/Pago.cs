using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCF_SimulacionPagos.Dominio
{
    [DataContract]
    public class Pago
    {
        [DataMember(IsRequired = false)]
        public int payment_id { get; set; }

        [DataMember(IsRequired = false)]
        public DateTime payment_date { get; set; }

        [DataMember]
        public decimal payment_price { get; set; }

        [DataMember]
        public decimal payment_card_number { get; set; }

        [DataMember]
        public string payment_card_expiration_date { get; set; }

        [DataMember]
        public string email { get; set; }

        [DataMember]
        public string first_name { get; set; }

        [DataMember]
        public string last_name { get; set; }

        [DataMember(IsRequired = false)]
        public string street { get; set; }

        [DataMember(IsRequired = false)]
        public string city { get; set; }

        [DataMember(IsRequired = false)]
        public string state { get; set; }

        [DataMember(IsRequired = false)]
        public string zip { get; set; }

        [DataMember(IsRequired = false)]
        public string country { get; set; }

        [DataMember]
        public string is_success { get; set; }

        [DataMember(IsRequired = false)]
        public string reason_fault { get; set; }

    }
}