using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using AccesoDatos;

namespace Negocio
{
    public class VoucherNegocio
    {

        //Verifica si no fue usado
        public static bool verificar(string codigo)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            try
            {
                db.setearConsulta("select codigo from vouchers where estado=1 and codigo=" + codigo);
                db.abrirConexion();
                db.ejecutarConsulta();
                if (db.Lector.Read())
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



        // Cambi el estado a usado 
        public static bool cambiarEstado(string codigo)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            try
            {
                db.setearConsulta("update vouchers set estado=0 where codigo=" + codigo);
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


        // trae un vouche especifico
        public static Voucher traer(string codigo)
        {
            GestorAccesoDatos db = new GestorAccesoDatos();
            try
            {
                Voucher voucher=null;
                db.setearConsulta("select codigo from vouchers where estado=1 and codigo=" + codigo);
                db.abrirConexion();
                db.ejecutarConsulta();
                if (db.Lector.Read())
                {
                    voucher = new Voucher();
                    voucher.codigo =(string) db.Lector["codigo"].ToString();
                    voucher.estado = true;

                }
                return voucher;
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
