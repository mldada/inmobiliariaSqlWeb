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


namespace DAL
{
    public class Inmueble_DAL
    {
        #region Conexion

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
        SqlCommand cmd =  new SqlCommand();

        #endregion

        #region SP
        const string buscarInmuebleId = "Sp_Buscar_Inmueble_Id";
        const string buscarInmuebles = "Sp_Buscar_Inmuebles";
        const string actualizarInmuebleId = "Sp_Actualizar_Inmueble_Id";
        const string agregarInmueble = "Sp_Agregar_Inmueble";
        const string eliminarInmuebleId = "Sp_Eliminar_Inmueble_Id";
        #endregion

        #region Metodos
        public Inmueble_E BuscarInmuebleId(int idInmueble)
        {
            Inmueble_E inmueble = new Inmueble_E();
            try
            {
                cn.Open();
                cmd = new SqlCommand(buscarInmuebleId, cn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param_id_inmueble = new SqlParameter
                {
                    ParameterName = "@id_inmueble",
                    SqlDbType = SqlDbType.Int,
                    Value = idInmueble
                };

                cmd.Parameters.Add(param_id_inmueble);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                if (dr.HasRows)
                {
                    inmueble.Id_Inmueble = Convert.ToInt32(dr["id_inmueble"]);
                    inmueble.tipoPropiedad_E.Id_Tipo_Propiedad = Convert.ToInt32(dr["id_tipo_propiedad"]);
                    inmueble.Es_Venta = Convert.ToBoolean(dr["es_venta"]);
                    inmueble.Importe = Convert.ToInt32(dr["importe"]);
                    inmueble.Superficie = Convert.ToInt32(dr["superficie"]);
                    inmueble.Calle = dr["calle"].ToString();
                    inmueble.Altura = Convert.ToInt32(dr["altura"]);
                    inmueble.localidad_E.Id_Localidad = Convert.ToInt32(dr["id_localidad"]);
                    inmueble.Descripcion = dr["descripcion"].ToString();
                    inmueble.estado_E.Id_Estado = Convert.ToInt32(dr["id_estado"]);
                    inmueble.Cant_Ambientes = Convert.ToInt32(dr["cant_ambientes"]);
                    inmueble.Piso = dr["piso"].ToString();
                    inmueble.Depto = dr["depto"].ToString();
                    inmueble.Apto_Credito = Convert.ToBoolean(dr["apto_credito"]);

                }
            }
            catch (Exception e)
            {
                throw;
            }
            return inmueble;
        }
        public List<Inmueble_E> BuscarInmuebles(int idTipoPropiedad, bool esVenta)
        {
            List<Inmueble_E> listado = new List<Inmueble_E>();
            try
            {
                cn.Open();
                cmd = new SqlCommand(buscarInmuebles, cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param_id_tipo_propiedad = new SqlParameter
                {
                    ParameterName = "@id_tipo_propiedad",
                    SqlDbType = SqlDbType.Int,
                    Value = idTipoPropiedad
                };

                SqlParameter param_es_venta = new SqlParameter
                {
                    ParameterName = "@es_venta",
                    SqlDbType = SqlDbType.Bit,
                    Value = esVenta
                };

                cmd.Parameters.Add(param_id_tipo_propiedad);
                cmd.Parameters.Add(param_es_venta);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Inmueble_E inmueble = new Inmueble_E();
                    inmueble.Id_Inmueble = Convert.ToInt32(dr["id_inmueble"]);
                    inmueble.Id_Tipo_Propiedad = Convert.ToInt32(dr["id_tipo_propiedad"]);
                    inmueble.tipoPropiedad_E.Dc_Tipo_Propiedad = dr["dc_tipo_propiedad"].ToString();
                    inmueble.Es_Venta = Convert.ToBoolean(dr["es_venta"]);
                    inmueble.Importe = Convert.ToInt32(dr["importe"]);
                    inmueble.Superficie = Convert.ToInt32(dr["superficie"]);
                    inmueble.Calle = dr["calle"].ToString();
                    inmueble.Altura = Convert.ToInt32(dr["altura"]);
                    inmueble.Id_Localidad = Convert.ToInt32(dr["id_localidad"]);
                    inmueble.localidad_E.Dc_Localidad = dr["dc_localidad"].ToString();
                    inmueble.Descripcion = dr["descripcion"].ToString();
                    inmueble.Id_Estado = Convert.ToInt32(dr["id_estado"]);
                    inmueble.estado_E.Dc_Estado = dr["dc_estado"].ToString();
                    inmueble.Cant_Ambientes = Convert.ToInt32(dr["cant_ambientes"]);
                    inmueble.Piso = dr["piso"].ToString();
                    inmueble.Depto = dr["depto"].ToString();
                    inmueble.Apto_Credito = Convert.ToBoolean(dr["apto_credito"]);
                    listado.Add(inmueble);
                }
            }
            catch (Exception e)
            {

                throw;
            }
           
            return listado;
        }
        public bool ActualizarInmueble(Inmueble_E inmueble)
        {
            bool resultado = false;

            try
            {

                cn.Open();
                cmd = new SqlCommand(actualizarInmuebleId, cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param_id_inmueble = new SqlParameter
                {
                    ParameterName = "@id_inmueble",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Id_Inmueble
                };

                SqlParameter param_id_tipo_propiedad = new SqlParameter
                {
                    ParameterName = "@id_tipo_propiedad",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.tipoPropiedad_E.Id_Tipo_Propiedad
                };

                SqlParameter param_es_venta = new SqlParameter
                {
                    ParameterName = "@es_venta",
                    SqlDbType = SqlDbType.Bit,
                    Value = inmueble.Es_Venta
                };

                SqlParameter param_importe = new SqlParameter
                {
                    ParameterName = "@importe",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Importe
                };

                SqlParameter param_superficie = new SqlParameter
                {
                    ParameterName = "@superficie",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Superficie
                };

                SqlParameter param_calle = new SqlParameter
                {
                    ParameterName = "@calle",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 50,
                    Value = inmueble.Calle
                };

                SqlParameter param_altura = new SqlParameter
                {
                    ParameterName = "@altura",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Altura
                };

                SqlParameter param_id_localidad = new SqlParameter
                {
                    ParameterName = "@id_localidad",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.localidad_E.Id_Localidad
                };

                SqlParameter param_descripcion = new SqlParameter
                {
                    ParameterName = "@descripcion",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 1000,
                    Value = inmueble.Descripcion
                };

                SqlParameter param_id_estado = new SqlParameter
                {
                    ParameterName = "@id_estado",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.estado_E.Id_Estado
                };

                SqlParameter param_cant_ambientes = new SqlParameter
                {
                    ParameterName = "@cant_ambientes",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Cant_Ambientes
                };

                SqlParameter param_piso = new SqlParameter
                {
                    ParameterName = "@piso",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 2,
                    Value = inmueble.Piso
                };

                SqlParameter param_depto = new SqlParameter
                {
                    ParameterName = "@depto",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 5,
                    Value = inmueble.Depto
                };

                SqlParameter param_apto_credito = new SqlParameter
                {
                    ParameterName = "@apto_credito",
                    SqlDbType = SqlDbType.Bit,
                    Value = inmueble.Apto_Credito
                };

                cmd.Parameters.Add(param_id_inmueble);
                cmd.Parameters.Add(param_id_tipo_propiedad);
                cmd.Parameters.Add(param_es_venta);
                cmd.Parameters.Add(param_importe);
                cmd.Parameters.Add(param_superficie);
                cmd.Parameters.Add(param_calle);
                cmd.Parameters.Add(param_altura);
                cmd.Parameters.Add(param_id_localidad);
                cmd.Parameters.Add(param_descripcion);
                cmd.Parameters.Add(param_id_estado);
                cmd.Parameters.Add(param_cant_ambientes);
                cmd.Parameters.Add(param_piso);
                cmd.Parameters.Add(param_depto);
                cmd.Parameters.Add(param_apto_credito);

                cmd.ExecuteNonQuery();
                resultado = true;

            }
            catch (Exception e)
            {

                throw;
            }
            return resultado;
        }
        public bool AgregarInmueble(Inmueble_E inmueble)
        {
            bool resultado = false;

            try
            {
                cn.Open();
                cmd = new SqlCommand(agregarInmueble, cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param_id_tipo_propiedad = new SqlParameter
                {
                    ParameterName = "@id_tipo_propiedad",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.tipoPropiedad_E.Id_Tipo_Propiedad
                };

                SqlParameter param_es_venta = new SqlParameter
                {
                    ParameterName = "@es_venta",
                    SqlDbType = SqlDbType.Bit,
                    Value = inmueble.Es_Venta
                };

                SqlParameter param_importe = new SqlParameter
                {
                    ParameterName = "@importe",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Importe
                };

                SqlParameter param_superficie = new SqlParameter
                {
                    ParameterName = "@superficie",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Superficie
                };

                SqlParameter param_calle = new SqlParameter
                {
                    ParameterName = "@calle",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 50,
                    Value = inmueble.Calle
                };

                SqlParameter param_altura = new SqlParameter
                {
                    ParameterName = "@altura",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Altura
                };

                SqlParameter param_id_localidad = new SqlParameter
                {
                    ParameterName = "@id_localidad",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.localidad_E.Id_Localidad
                };

                SqlParameter param_descripcion = new SqlParameter
                {
                    ParameterName = "@descripcion",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 1000,
                    Value = inmueble.Descripcion
                };

                SqlParameter param_id_estado = new SqlParameter
                {
                    ParameterName = "@id_estado",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.estado_E.Id_Estado
                };

                SqlParameter param_cant_ambientes = new SqlParameter
                {
                    ParameterName = "@cant_ambientes",
                    SqlDbType = SqlDbType.Int,
                    Value = inmueble.Cant_Ambientes
                };

                SqlParameter param_piso = new SqlParameter
                {
                    ParameterName = "@piso",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 2,
                    Value = inmueble.Piso
                };

                SqlParameter param_depto = new SqlParameter
                {
                    ParameterName = "@depto",
                    SqlDbType = SqlDbType.VarChar,
                    Size = 5,
                    Value = inmueble.Depto
                };

                SqlParameter param_apto_credito = new SqlParameter
                {
                    ParameterName = "@apto_credito",
                    SqlDbType = SqlDbType.Bit,
                    Value = inmueble.Apto_Credito
                };

                cmd.Parameters.Add(param_id_tipo_propiedad);
                cmd.Parameters.Add(param_es_venta);
                cmd.Parameters.Add(param_importe);
                cmd.Parameters.Add(param_superficie);
                cmd.Parameters.Add(param_calle);
                cmd.Parameters.Add(param_altura);
                cmd.Parameters.Add(param_id_localidad);
                cmd.Parameters.Add(param_descripcion);
                cmd.Parameters.Add(param_id_estado);
                cmd.Parameters.Add(param_cant_ambientes);
                cmd.Parameters.Add(param_piso);
                cmd.Parameters.Add(param_depto);
                cmd.Parameters.Add(param_apto_credito);

                cmd.ExecuteNonQuery();
                resultado = true;

            }
            catch (Exception e)
            {

                throw;
            }
            return resultado;
        }
        public bool EliminarInmueble (int idInmueble)
        {
            bool eliminado = false;

            try
            {
                cn.Open();
                cmd = new SqlCommand(eliminarInmuebleId, cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param_id_inmueble = new SqlParameter
                {
                    ParameterName = "@id_inmueble",
                    SqlDbType = SqlDbType.Int,
                    Value = idInmueble
                };

                cmd.Parameters.Add(param_id_inmueble);

                cmd.ExecuteNonQuery();
                eliminado = true;
            }
            catch (Exception e)
            {

                throw;
            }

            return eliminado;
        }
        #endregion
    }
}
