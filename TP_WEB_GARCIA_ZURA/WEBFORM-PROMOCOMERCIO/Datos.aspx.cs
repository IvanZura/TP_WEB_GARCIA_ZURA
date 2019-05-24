using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Configuration;
using Dominio;
using Negocio;

namespace WEBFORM_PROMOCOMERCIO
{
    public partial class Datos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["voucher"]==null|| Session["idPremio"] == null)
            {
                Response.Redirect("default.aspx");
            }
        }

        [WebMethod]
        public static string DatosCliente(string dni)
        {
            Persona local = PersonaNegocio.traer(dni);
            if (local == null)
            {
                return "{ \"length\" : 0 }";
            } else
            {
                string res = "{ \"length\" : 1, \"nombre\": \"" + local.nombre + "\", \"apellido\": \"" + local.apellido + "\", \"email\": \"" + local.email + "\", \"ciudad\": \"" + local.ciudad + "\"," +
                "\"direccion\": \"" + local.direccion + "\", \"CP\": \"" + local.CP + "\" }";
                return res;
            }
        }

    }
}