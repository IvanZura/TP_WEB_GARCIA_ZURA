using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Partipante:Persona
    {
        public Premio premio { get; set; }
        public Voucher voucher { get; set; }
    }
}
