using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
[ServiceContract]
public interface IHoteles
{
    [OperationContract]
    List<hotel> listarTodosHoteles();

    [OperationContract]
    List<hotel> listarHotelesxHorarios(int dept, int prov, int dist, DateTime fecha_ini, DateTime fecha_fin);

    [OperationContract]
    List<hotel_cuarto> listarCuartosPorHotel(string cod_hotel, DateTime fecha_ini, DateTime fecha_fin);
}

[Serializable]
public class hotel
{
    public string id;
    public string nombre;
    public string telefono;
    public string direccion;
    public int provincia;
    public int distrito;
    public int departamaneto;
    public List<hotel_cuarto> cuartos;
}

[Serializable]
public class hotel_cuarto{
    public string id;
    public int numero;
    public int capacidad;
    public double costo_noche;
}
