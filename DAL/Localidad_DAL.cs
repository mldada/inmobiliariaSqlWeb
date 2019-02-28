using System;
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
    public class Localidad_DAL
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
        SqlCommand cmd = new SqlCommand();

        const string listar = "Sp_Listar_Localidades";
        
        public List<Localidad_E> ListadoLocalidad()
        {
            List<Localidad_E> listado = new List<Localidad_E>();

            try
            {
                cn.Open();
                cmd = new SqlCommand(listar, cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Localidad_E localidad = new Localidad_E();
                    localidad.Id_Localidad = Convert.ToInt32(dr["id_localidad"]);
                    localidad.Dc_Localidad = dr["dc_localidad"].ToString();
                    listado.Add(localidad);
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
