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
using System.Net;
using System.Net.Mail;

namespace WEBFORM_PROMOCOMERCIO
{
    public partial class Datos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["voucher"]==null && Session["idPremio"] == null)
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
                HttpContext.Current.Session["EsCliente"] = false;
                return "{ \"length\" : 0 }";
            } else
            {
                HttpContext.Current.Session["EsCliente"] = true;
                string res = "{ \"length\" : 1, \"nombre\": \"" + local.nombre + "\", \"apellido\": \"" + local.apellido + "\", \"email\": \"" + local.email + "\", \"ciudad\": \"" + local.ciudad + "\"," +
                "\"direccion\": \"" + local.direccion + "\", \"CP\": \"" + local.CP + "\" }";
                return res;
            }
        }

        [WebMethod]
        public static bool CompletaParticipante(string nombre, string apellido, string email, string ciudad, string direccion,
            string CP, string DNI)
        {
            var fromAddress = new MailAddress("tpwebgarciazura@gmail.com", "TPWEB");
            var toAddress = new MailAddress(email, nombre + " " + apellido);
            const string fromPassword = "TPWEB1234";
            const string subject = "Sorteo !";
            const string body = "Has completado todo y ganado el premio. Pronto te lo llevaran a tu domicilio";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            Participante nuevo = new Participante();
            nuevo.nombre = nombre;
            nuevo.apellido = apellido;
            nuevo.email = email;
            nuevo.ciudad = ciudad;
            nuevo.direccion = direccion;
            nuevo.CP = CP;
            nuevo.DNI = DNI;
            if (!(bool)HttpContext.Current.Session["EsCliente"])
            {
                if (!PersonaNegocio.InsertarPersona(nuevo))
                {
                    return false;
                }
            }

            if (VoucherNegocio.CambiarEstado(HttpContext.Current.Session["voucher"].ToString()))
            {
                if (PremioNegocio.asignar(nuevo.DNI, HttpContext.Current.Session["voucher"].ToString(), HttpContext.Current.Session["idPremio"].ToString()))
                {
                    HttpContext.Current.Session["voucher"] = null;
                    HttpContext.Current.Session["idPremio"] = null;
                    HttpContext.Current.Session["gano"] = true;
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

    }
}