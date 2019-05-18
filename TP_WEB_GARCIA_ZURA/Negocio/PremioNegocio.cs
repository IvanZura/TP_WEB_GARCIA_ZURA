using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using AccesoDatos;

namespace Negocio
{
    class PremioNegocio
    {
        // Lista de Premio
        public static List<Premio> lista()
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            List<Premio> lista = new List<Premio>();
            try
            {
                Premio premio;
                db.setearConsulta("select * from premio");
                db.abrirConexion();
                db.ejecutarConsulta();
                if (db.Lector.Read())
                {
                    premio = new Premio();
                    premio.id = (int)db.Lector["id"];
                    premio.titulo = (string)db.Lector["tirulo"].ToString();
                    premio.descripcion = (string)db.Lector["descripcion"].ToString();
                    premio.url = (string)db.Lector["url"].ToString();
                    lista.Add(premio);
                }
                return lista;
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

        //Trae un Premio en especifico
        public static Premio traer( string id)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();

            try
            {
                Premio premio=null;
                db.setearConsulta("select * from premio  where id="+id);
                db.abrirConexion();
                db.ejecutarConsulta();
                if (db.Lector.Read())
                {
                    premio = new Premio();
                    premio.id = (int)db.Lector["id"];
                    premio.titulo = (string)db.Lector["tirulo"].ToString();
                    premio.descripcion = (string)db.Lector["descripcion"].ToString();
                    premio.url = (string)db.Lector["url"].ToString();
                    
                }
                return premio;
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

        //Asigna el premio con el cliente y el codigo
        public static bool asinar (string dni, string codigo, string idPremio)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            try
            {
                db.setearConsulta("insert into Premios_X_Clientes(idPremio,dni,codigo) values(@idPremio,@dni,@codigo)");
                db.Comando.Parameters.Clear();
                db.Comando.Parameters.AddWithValue("@idPremio", idPremio);
                db.Comando.Parameters.AddWithValue("@dni", dni);
                db.Comando.Parameters.AddWithValue("@codigo", codigo);
                db.abrirConexion();
                if (db.ejecutarAccion() == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
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


    }

}
