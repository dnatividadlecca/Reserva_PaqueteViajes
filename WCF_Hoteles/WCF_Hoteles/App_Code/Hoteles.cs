using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Hoteles : IHoteles
{

    string conBD = ConfigurationManager.ConnectionStrings["BD_WS"].ConnectionString;

    //Lista de Hoteles(búsqueda de destino, fecha inicio, fecha fin)
    public List<hotel> listarHotelesxHorarios(int dept, int prov, int dist, DateTime fecha_ini, DateTime fecha_fin)
    {
        List<hotel> listaHoteles = new List<hotel>();
        try {
            SqlConnection cnn = new SqlConnection(conBD);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarHotelesDisponibles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@dept", dept);
            cmd.Parameters.Add("@prov", prov);
            cmd.Parameters.Add("@dist", dist);
            cmd.Parameters.Add("@fecha_ini", fecha_ini);
            cmd.Parameters.Add("@fecha_fin", fecha_fin);

            SqlDataReader rd = cmd.ExecuteReader();
            hotel hotelEncontrado = new hotel();

            if (rd.HasRows){
                while (rd.Read()){

                    //Se llenan datos de hotel
                    hotelEncontrado.cuartos = new List<hotel_cuarto>();
                    hotelEncontrado.id = rd.GetString(0);
                    hotelEncontrado.nombre = rd.GetString(1);
                    hotelEncontrado.departamaneto = rd.GetInt32(2);
                    hotelEncontrado.provincia = rd.GetInt32(3);
                    hotelEncontrado.distrito = rd.GetInt32(4);

                    //Se llenan datos de cuarto
                    hotel_cuarto cuartoHotelEncontrado = new hotel_cuarto();
                    cuartoHotelEncontrado.costo_noche = Convert.ToDouble(rd.GetDecimal(5));

                    //Se agrega el cuarto al hotel encontrado
                    hotelEncontrado.cuartos.Add(cuartoHotelEncontrado);

                    //Se agrega al hotel a la lista que retorna el WS
                    listaHoteles.Add(hotelEncontrado);
                }
            }
            
            cnn.Close();
        }
        catch (Exception ex) {
            throw new Exception("Error al buscar", ex);
        }

        return listaHoteles;
    }


    public List<hotel> listarTodosHoteles()
    {
        List<hotel> listaHoteles = new List<hotel>();
        try {
            SqlConnection cnn = new SqlConnection(conBD);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarTodosHoteles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader rd = cmd.ExecuteReader();
            hotel hotelEncontrado = new hotel();

            if (rd.HasRows){
                while (rd.Read()){
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
        catch (Exception ex) {
            throw new Exception("Error al buscar", ex);
        }

        return listaHoteles;
    }


    public List<hotel_cuarto> listarCuartosPorHotel(string cod_hotel, DateTime fecha_ini, DateTime fecha_fin)
    {
        List<hotel_cuarto> listaCuartos = new List<hotel_cuarto>();
        try
        {
            SqlConnection cnn = new SqlConnection(conBD);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarCuartosDisponibles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@cod_hotel", cod_hotel);
            cmd.Parameters.Add("@fecha_ini", fecha_ini);
            cmd.Parameters.Add("@fecha_fin", fecha_fin);

            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    //Se llenan datos de hotel
                    hotel_cuarto cuartoEncontrado = new hotel_cuarto();
                    cuartoEncontrado.id = rd.GetString(0);
                    cuartoEncontrado.numero = rd.GetInt32(1);
                    cuartoEncontrado.capacidad = rd.GetInt32(2);
                    cuartoEncontrado.costo_noche = Convert.ToDouble(rd.GetDecimal(3));

                    //Se agrega al hotel a la lista que retorna el WS
                    listaCuartos.Add(cuartoEncontrado);
                }
            }

            cnn.Close();
        }
        catch (Exception ex)
        {
            throw new Exception("Error al buscar", ex);
        }

        return listaCuartos;
    }
}
