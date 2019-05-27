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
            if (HttpContext.Current.Session["gano"] != null)
            {
                lblGano.Text = "Se envío un e-mail a su direccion de correo para informarle sobre su premio";
                HttpContext.Current.Session["gano"] = null;
            } else
            {
                lblGano.Text = "";
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (txtVoucher.Text.Trim() != "")
            {
                if (VoucherNegocio.verificar(txtVoucher.Text.Trim()))
                {
                    Session.Add("voucher", txtVoucher.Text.Trim());
                   
                    Response.Redirect("Premios.aspx");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "M.toast({ html: 'Voucher inválido' })", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "M.toast({ html: 'Campo vacío' })", true);
            }
        }
    }
}