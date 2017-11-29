using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WCF_Hoteles.Dominio;

namespace WCF_Hoteles.Persistencia
{
    public class Hotel_reservaDAO
    {
        private ConexionDAO conexion;
        SqlConnection cnn;

        public Hotel_reserva grabarReservaHotel(Hotel_reserva nuevaReserva)
        {
            Hotel_reserva nueva_reserva = new Hotel_reserva();
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand("sp_grabarReserva", cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@reserva_IDGenerada", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@cuarto_ID", nuevaReserva.cuarto_ID);
                cmd.Parameters.AddWithValue("@cliente_ID", nuevaReserva.cliente_ID);
                cmd.Parameters.AddWithValue("@hotel_ID", nuevaReserva.hotel_ID);
                cmd.Parameters.AddWithValue("@fecha_inicio", nuevaReserva.fecha_inicio);
                cmd.Parameters.AddWithValue("@fecha_fin", nuevaReserva.fecha_fin);
                cmd.Parameters.AddWithValue("@reserva_estado", nuevaReserva.reserva_estado);

                cmd.ExecuteNonQuery();

                nueva_reserva.reserva_ID = Convert.ToInt32(cmd.Parameters["@reserva_IDGenerada"].Value);

                nueva_reserva = obtenerReserva(nueva_reserva.reserva_ID);

                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error", ex);
            }
            return nueva_reserva;
        }

        public Hotel_reserva obtenerReserva(int codigoreserva)
        {
            Hotel_reserva reservaBuscada = new Hotel_reserva();
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand("sp_obtenerReserva", cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@reserva_ID", codigoreserva);

                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.HasRows)
                {
                    while (rd.Read())
                    {

                        //Se llenan datos de la reserva
                        reservaBuscada.reserva_ID = rd.GetInt32(0);
                        reservaBuscada.cuarto_ID = rd.GetString(1);
                        reservaBuscada.cliente_ID = rd.GetString(2);
                        reservaBuscada.hotel_ID = rd.GetString(3);
                        reservaBuscada.fecha_inicio = rd.GetDateTime(4);
                        reservaBuscada.fecha_fin = rd.GetDateTime(5);
                        reservaBuscada.reserva_estado = rd.GetString(6);
                    }
                }

                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error", ex);
            }

            return reservaBuscada;
        }
    }
}