using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WCF_Hoteles.Dominio;

namespace WCF_Hoteles.Persistencia
{
    public class HotelDAO
    {
        private ConexionDAO conexion;
        SqlConnection cnn;

        public List<Hotel> listarTodosHoteles()
        {
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            List<Hotel> listaHoteles = new List<Hotel>();
            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand("sp_listarTodosHoteles", cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rd = cmd.ExecuteReader();
                
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        Hotel hotelEncontrado = new Hotel();

                        hotelEncontrado.id = rd.GetString(0);
                        hotelEncontrado.nombre = rd.GetString(1);
                        hotelEncontrado.telefono = rd.GetString(2);
                        hotelEncontrado.direccion = rd.GetString(3);
                        hotelEncontrado.provincia = rd.GetInt32(4);
                        hotelEncontrado.distrito = rd.GetInt32(5);
                        hotelEncontrado.departamaneto = rd.GetInt32(6);

                        listaHoteles.Add(hotelEncontrado);
                    }
                }

                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar", ex);
            }

            return listaHoteles;
        }

        public List<Hotel> listarHotelesxHorarios(int dept, int prov, int dist, DateTime fecha_ini, DateTime fecha_fin)
        {
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            List<Hotel> listaHoteles = new List<Hotel>();

            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarHotelesDisponibles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@dept", dept);
            cmd.Parameters.AddWithValue("@prov", prov);
            cmd.Parameters.AddWithValue("@dist", dist);
            cmd.Parameters.AddWithValue("@fecha_ini", fecha_ini);
            cmd.Parameters.AddWithValue("@fecha_fin", fecha_fin);

            SqlDataReader rd = cmd.ExecuteReader();
            //Hotel hotelEncontrado = new Hotel();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    Hotel hotelEncontrado = new Hotel();
                    //Se llenan datos de hotel
                    hotelEncontrado.cuartos = new List<Hotel_cuarto>();
                    hotelEncontrado.id = rd.GetString(0);
                    hotelEncontrado.nombre = rd.GetString(1);
                    hotelEncontrado.departamaneto = rd.GetInt32(2);
                    hotelEncontrado.provincia = rd.GetInt32(3);
                    hotelEncontrado.distrito = rd.GetInt32(4);
                    hotelEncontrado.direccion = rd.GetString(5);

                    //Se llenan datos de cuarto
                    Hotel_cuarto cuartoHotelEncontrado = new Hotel_cuarto();
                    //cuartoHotelEncontrado.servicios = rd.GetString(6);

                    cuartoHotelEncontrado.costo_noche = Convert.ToDouble(rd.GetDecimal(6));
                    //cuartoHotelEncontrado.costo_noche = Convert.ToDouble(rd.GetDecimal(9));
                    
                    //Tipo_cuarto tipo = new Tipo_cuarto();
                    //tipo.id = rd.GetString(7);
                    //tipo.descripcion = rd.GetString(8);
                    
                    //asigno el tipo de hotel al cuarto
                    //cuartoHotelEncontrado.tipo = tipo;

                    List<Hotel_cuarto> listado_cuartos = new List<Hotel_cuarto>();
                    
                    //Se agrega el cuarto al hotel encontrado
                    hotelEncontrado.cuartos.Add(cuartoHotelEncontrado);

                    //Se agrega al hotel a la lista que retorna el WS
                    listaHoteles.Add(hotelEncontrado);
                }
            }

            cnn.Close();
                
            return listaHoteles;
        }

        public List<Hotel_cuarto> listarCuartosPorHotel(string cod_hotel, DateTime fecha_ini, DateTime fecha_fin)
        {
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            List<Hotel_cuarto> listaCuartos = new List<Hotel_cuarto>();

            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarCuartosDisponibles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cod_hotel", cod_hotel);
            //cmd.Parameters.AddWithValue("@tipo_cuarto", tipo_cuarto);
            cmd.Parameters.AddWithValue("@fecha_ini", fecha_ini);
            cmd.Parameters.AddWithValue("@fecha_fin", fecha_fin);

            SqlDataReader rd = cmd.ExecuteReader();
            Hotel hotelEncontrado = new Hotel();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    //Se llenan datos de hotel
                    Hotel_cuarto cuartoEncontrado = new Hotel_cuarto();
                    cuartoEncontrado.id = rd.GetString(0);
                    cuartoEncontrado.numero = rd.GetInt32(1);
                    cuartoEncontrado.capacidad = rd.GetInt32(2);
                    cuartoEncontrado.costo_noche = Convert.ToDouble(rd.GetDecimal(3));
                    cuartoEncontrado.servicios = rd.GetString(4);

                    Tipo_cuarto tipo = new Tipo_cuarto();
                    tipo.id = rd.GetString(5);
                    tipo.descripcion = rd.GetString(6);

                    //asigno el tipo de hotel al cuarto
                    cuartoEncontrado.tipo = tipo;
                    //Se agrega al hotel a la lista que retorna el WS
                    listaCuartos.Add(cuartoEncontrado);
                }
            }

            cnn.Close();

            return listaCuartos;
        }

        public List<Destino> ListarDestinoXFiltro(string p_NomDestino) {
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            List<Destino> listaDestino = new List<Destino>();

            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_BuscarDestino", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@P_vcCodFiltro", p_NomDestino);

            SqlDataReader rd = cmd.ExecuteReader();
            

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    Destino oDestino = new Destino();
                    //Se llenan datos de hotel
                    oDestino.IdDepartamaneto = rd.GetInt32(2);
                    oDestino.IdProvincia = rd.GetInt32(1);
                    oDestino.IdDistrito = rd.GetInt32(0);
                    oDestino.NombreDestino = rd.GetString(3);
                    //Se agrega al hotel a la lista que retorna el WS
                    listaDestino.Add(oDestino);
                }
            }

            cnn.Close();

            return listaDestino;

        }
    }
}