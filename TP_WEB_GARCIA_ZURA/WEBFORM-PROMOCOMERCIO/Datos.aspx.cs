﻿using System;
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
        public  static Persona datosCliente(string dni)
        {
           
           return PersonaNegocio.traer(dni);

        }

    }
}