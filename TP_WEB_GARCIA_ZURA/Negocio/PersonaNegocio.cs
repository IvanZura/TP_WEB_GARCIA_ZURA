using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using AccesoDatos;

namespace Negocio
{
    public class PersonaNegocio
    {

        public static Persona traer(string dni)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            try
            {
                Persona persona = null;
                db.setearConsulta("select * from clientes where  dni=" + dni);
                db.abrirConexion();
                db.ejecutarConsulta();
                if (db.Lector.Read())
                {
                    persona = new Persona();
                    persona.DNI = (string)db.Lector["dni"].ToString();
                    persona.nombre = (string)db.Lector["nombre"].ToString();
                    persona.apellido = (string)db.Lector["apellido"].ToString();
                    persona.email = (string)db.Lector["email"].ToString();
                    persona.direccion = (string)db.Lector["direccion"].ToString();
                    persona.ciudad = (string)db.Lector["ciudad"].ToString();
                    persona.CP = (string)db.Lector["CP"].ToString();

                }
                return persona;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                db.cerrarConexion();
            }
        }
        public static bool InsertarPersona()
        {
            return true;
        }

    }
}
