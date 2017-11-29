using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using WCF_Hoteles.Dominio;

namespace WCF_Hoteles
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IHoteles" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IHoteles
    {
        [OperationContract]
        List<Hotel> listarTodosHoteles();

        [OperationContract]
        List<Hotel> listarHotelesxHorarios(int dept, int prov, int dist, DateTime fecha_ini, DateTime fecha_fin);

        [OperationContract]
        List<Hotel_cuarto> listarCuartosPorHotel(string cod_hotel, DateTime fecha_ini, DateTime fecha_fin);

        [OperationContract]
        Hotel_reserva grabarReservaHotel(Hotel_reserva nuevaReserva);
    }
}
