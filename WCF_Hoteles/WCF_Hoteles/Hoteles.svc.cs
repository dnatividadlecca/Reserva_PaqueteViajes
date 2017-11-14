﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using WCF_Hoteles.Dominio;
using WCF_Hoteles.Persistencia;

namespace WCF_Hoteles
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Hoteles" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Hoteles.svc o Hoteles.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Hoteles : IHoteles
    {
        private HotelDAO hotelesDAO = new HotelDAO();

        public List<Hotel> listarTodosHoteles()
        {
            List<Hotel> listaHoteles = new List<Hotel>();

            listaHoteles = hotelesDAO.listarTodosHoteles();

            return listaHoteles;
        }

        public List<Hotel> listarHotelesxHorarios(int dept, int prov, int dist, DateTime fecha_ini, DateTime fecha_fin)
        {
            List<Hotel> listaHoteles = new List<Hotel>();

            listaHoteles = hotelesDAO.listarHotelesxHorarios(dept, prov, dist, fecha_ini, fecha_fin);

            return listaHoteles;
        }

        public List<Hotel_cuarto> listarCuartosPorHotel(string cod_hotel, DateTime fecha_ini, DateTime fecha_fin)
        {
            List<Hotel_cuarto> listaCuartos = new List<Hotel_cuarto>();

            listaCuartos = hotelesDAO.listarCuartosPorHotel(cod_hotel, fecha_ini, fecha_fin);

            return listaCuartos;
        }

    }
}