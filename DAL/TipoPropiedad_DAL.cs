﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ENTIDAD;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class TipoPropiedad_DAL
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
        SqlCommand cmd = new SqlCommand();

        const string listarTiposPropiedadesVenta = "View_Listar_TiposPropiedades_Venta";
        const string listarTiposPropiedadesAlquiler = "View_Listar_TiposPropiedades_Alquiler";

        public List<TipoPropiedad_E> ListadoTipoPropiedad(bool esVenta)
        {
            List<TipoPropiedad_E> listado = new List<TipoPropiedad_E>();

            if (esVenta == true)
            {
                try
                {
                    cn.Open();
                    cmd = new SqlCommand(listarTiposPropiedadesVenta, cn)
                    {
                        CommandType = CommandType.TableDirect
                    };

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        TipoPropiedad_E tipoPropiedad = new TipoPropiedad_E
                        {
                            Id_Tipo_Propiedad = Convert.ToInt32(dr["id_tipo_propiedad"]),
                            Dc_Tipo_Propiedad = dr["dc_tipo_propiedad"].ToString(),
                            Es_Venta = Convert.ToBoolean(dr["es_venta"])
                        };
                        listado.Add(tipoPropiedad);
                    }
                }
                catch (Exception e)
                {

                    throw;
                }
                return listado;
            }
            else
            {
                try
                {
                    cn.Open();
                    cmd = new SqlCommand(listarTiposPropiedadesAlquiler, cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        TipoPropiedad_E tipoPropiedad = new TipoPropiedad_E
                        {
                            Id_Tipo_Propiedad = Convert.ToInt32(dr["id_tipo_propiedad"]),
                            Dc_Tipo_Propiedad = dr["dc_tipo_propiedad"].ToString(),
                            Es_Venta = Convert.ToBoolean(dr["es_venta"])
                        };
                        listado.Add(tipoPropiedad);
                    }
                }
                catch (Exception e)
                {

                    throw;
                }
                return listado;
            }
                
        }

    }
}
