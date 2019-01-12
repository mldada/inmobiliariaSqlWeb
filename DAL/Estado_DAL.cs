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
    public class Estado_DAL
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
        SqlCommand cmd = new SqlCommand();

        const string listar = "View_Listar_Estados";

        public List<Estado_E> ListadoEstado()
        {
            List<Estado_E> listado = new List<Estado_E>();

            try
            {
                cn.Open();
                cmd = new SqlCommand(listar, cn)
                {
                    CommandType = CommandType.TableDirect
                };
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Estado_E estado = new Estado_E
                    {
                        Id_Estado = Convert.ToInt32(dr["id_estado"]),
                        Dc_Estado = dr["dc_estado"].ToString()
                    };
                    listado.Add(estado);
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
