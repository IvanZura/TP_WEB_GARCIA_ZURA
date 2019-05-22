using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WEBFORM_PROMOCOMERCIO
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (txtVoucher.Text.Trim() != "")
            {
                if (VoucherNegocio.verificar(txtVoucher.Text.Trim()))
                {
                    Session.Add("voucher", txtVoucher.Text.Trim());
                    Response.Redirect("Datos.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('El numero de voucher es incorrecto')",true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('Relle el campo codigo antes de enviar')", true);
            }
        }
    }
}