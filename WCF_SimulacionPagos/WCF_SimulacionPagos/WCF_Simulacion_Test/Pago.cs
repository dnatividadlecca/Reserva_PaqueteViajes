using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WCF_Simulacion_Test
{
    public class Pago
    {
        public int payment_id { get; set; }
        
        public DateTime payment_date { get; set; }
        
        public decimal payment_price { get; set; }
        
        public decimal payment_card_number { get; set; }
        
        public string payment_card_expiration_date { get; set; }
        
        public string email { get; set; }

        public string first_name { get; set; }
        
        public string last_name { get; set; }

        public string street { get; set; }

        public string city { get; set; }

        public string state { get; set; }

        public string zip { get; set; }

        public string country { get; set; }

        public string is_success { get; set; }

        public string reason_fault { get; set; }
        
    }
}
