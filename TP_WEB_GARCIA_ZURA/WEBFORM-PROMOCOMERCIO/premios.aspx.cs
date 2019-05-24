using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Dominio;
using Negocio;

namespace WEBFORM_PROMOCOMERCIO
{
    public partial class premios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["voucher"]== null){
                Response.Redirect("default.aspx");
            }
        }

        [WebMethod]
        public static List<Premio> listaPremios()
        {
            return PremioNegocio.lista();
        }
        [WebMethod]
        public static void siguiente(string premio)
        {
            HttpContext.Current.Session.Add("idPremio", premio);
        }

    }
}