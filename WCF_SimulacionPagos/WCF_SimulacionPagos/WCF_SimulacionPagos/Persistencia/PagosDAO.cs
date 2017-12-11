using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WCF_SimulacionPagos.Dominio;

namespace WCF_SimulacionPagos.Persistencia
{
    public class PagosDAO
    {
        private ConexionDAO conexion;
        SqlConnection cnn;

        public Pago grabarPago(Pago nuevaPago)
        {
            Pago nueva_pago = new Pago();
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand("sp_grabarpago", cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@payment_id", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@payment_price", nuevaPago.payment_price);
                cmd.Parameters.AddWithValue("@payment_card_number", nuevaPago.payment_card_number);
                cmd.Parameters.AddWithValue("@payment_card_expiration_date", nuevaPago.payment_card_expiration_date);
                cmd.Parameters.AddWithValue("@email", nuevaPago.email);
                cmd.Parameters.AddWithValue("@first_name", nuevaPago.first_name);
                cmd.Parameters.AddWithValue("@last_name", nuevaPago.last_name);
                cmd.Parameters.AddWithValue("@street", nuevaPago.street);
                cmd.Parameters.AddWithValue("@city", nuevaPago.city);
                cmd.Parameters.AddWithValue("@state", nuevaPago.state);
                cmd.Parameters.AddWithValue("@zip", nuevaPago.zip);
                cmd.Parameters.AddWithValue("@country", nuevaPago.country);
                cmd.Parameters.AddWithValue("@is_success", nuevaPago.is_success);
                cmd.Parameters.AddWithValue("@reason_fault", nuevaPago.reason_fault);


                cmd.ExecuteNonQuery();

                nuevaPago.payment_id = Convert.ToInt32(cmd.Parameters["@payment_id"].Value);

                nueva_pago = obtenerDetallesPago(nuevaPago.payment_id);

                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error", ex);
            }

            return nueva_pago;
        }

        public Pago obtenerDetallesPago(int codigoPago)
        {
            Pago pagoBuscado = new Pago();
            conexion = new ConexionDAO();
            cnn = conexion.crearConexion();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand("sp_obtenerpago", cnn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@codigoPago", codigoPago);

                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        pagoBuscado = new Pago();

                        //Se llenan datos del pago creado
                        pagoBuscado.payment_id = (int)rd["payment_id"];
                        pagoBuscado.payment_date = (DateTime)rd["payment_date"];
                        pagoBuscado.payment_price = (decimal)rd["payment_price"];
                        pagoBuscado.payment_card_number = (decimal)rd["payment_card_number"];
                        pagoBuscado.payment_card_expiration_date = (string)rd["payment_card_expiration_date"];
                        pagoBuscado.email = (string)rd["email"];
                        pagoBuscado.first_name = (string)rd["first_name"];
                        pagoBuscado.last_name = (string)rd["last_name"];
                        pagoBuscado.street = (string)rd["street"];
                        pagoBuscado.city = (string)rd["city"];
                        pagoBuscado.state = (string)rd["state"];
                        pagoBuscado.zip = (string)rd["zip"];
                        pagoBuscado.country = (string)rd["country"];
                        pagoBuscado.is_success = (string)rd["is_success"];
                        pagoBuscado.reason_fault = (string)rd["reason_fault"];

                    }
                }

                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error", ex);
            }

            return pagoBuscado;
        }
    }
}