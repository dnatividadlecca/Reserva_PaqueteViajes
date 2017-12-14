/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicio;

import controlador.cnnDb;
import modelo.Vuelo;
import modelo.Mensaje;
import java.util.Date;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author jsalguero
 */
@WebService(serviceName = "ConsultarVuelos")
public class ConsultarVuelos {

    /**
     * Web service operation
     *
     * @param origen
     * @param destino
     * @param fechaSalida
     * @param fechaRegreso
     * @param nroPasajeros
     * @return
     * @throws java.text.ParseException
     */
    @WebMethod(operationName = "VuelosIdaYVuelta")
    public ArrayList<Vuelo> VuelosIdaYVuelta(@WebParam(name = "origen") String origen, @WebParam(name = "destino") String destino, @WebParam(name = "fechaSalida") Date fechaSalida, @WebParam(name = "fechaRegreso") Date fechaRegreso, @WebParam(name = "nroPasajeros") Integer nroPasajeros) throws Error, ParseException {

        //Conexión a MySQL
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();

        //Variables locales
        String sqlQuery1;
        String sqlQuery2;
        String sqlQuery3;
        ArrayList<Vuelo> vuelos = new ArrayList<Vuelo>();
        Integer i = 0;
        SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd");
        String fSalida = fDate.format(fechaSalida);
        String fRegreso = fDate.format(fechaRegreso);
        Integer r = 0;

        sqlQuery1 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea "
                + "WHERE ( vuelo.origen = '" + origen + "' "
                + "OR vuelo.destino = '" + destino + "' ) "
                + "OR vuelo.fechaOrigen = '" + fSalida + "' ";

        sqlQuery2 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea "
                + "WHERE ( vuelo.origen = '" + destino + "' "
                + "OR vuelo.destino = '" + origen + "' ) "
                + "OR vuelo.fechaOrigen = '" + fRegreso + "' ";

        try {
            Statement sqlExec1 = cnn.createStatement();
            Statement sqlExec2 = cnn.createStatement();
            Statement sqlExec3 = cnn.createStatement();
            ResultSet rs1 = sqlExec1.executeQuery(sqlQuery1);
            ResultSet rs2 = sqlExec2.executeQuery(sqlQuery2);
            while (rs1.next()) {
                i++;
                Vuelo v = new Vuelo();
                v.setTipo("IDA");
                v.setVuelo(rs1.getString(1));
                v.setAereolina(rs1.getString(2));
                v.setClase(rs1.getString(3));
                v.setOrigen(rs1.getString(4));
                v.setDestino(rs1.getString(5));
                v.setPrecio(rs1.getDouble(6));
                v.setFechaOrigen(rs1.getDate(7));
                v.setCantidadAsientos(rs1.getInt(8));
                // Busca si hay asientos disponibles en el vuelo
                sqlQuery3 = "SELECT SUM(cantidadAsientos) "
                        + "FROM reserva "
                        + "WHERE reserva.idvuelo = '" + v.getVuelo() + "' "
                        + "AND reserva.clase = '" + v.getClase() + "' ";
                ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
                while (rs3.next()) {
                    r = r + rs3.getInt(1);
                }
                if (r < v.getCantidadAsientos()) {
                    vuelos.add(v);
                }
            }
            while (rs2.next()) {
                i++;
                Vuelo v = new Vuelo();
                v.setTipo("VUELTA");
                v.setVuelo(rs2.getString(1));
                v.setAereolina(rs2.getString(2));
                v.setClase(rs2.getString(3));
                v.setOrigen(rs2.getString(4));
                v.setDestino(rs2.getString(5));
                v.setPrecio(rs2.getDouble(6));
                v.setFechaOrigen(rs2.getDate(7));
                v.setCantidadAsientos(rs2.getInt(8));
                // Busca si hay asientos disponibles en el vuelo
                sqlQuery3 = "SELECT SUM(cantidadAsientos) "
                        + "FROM reserva "
                        + "WHERE reserva.idvuelo = '" + v.getVuelo() + "' "
                        + "AND reserva.clase = '" + v.getClase() + "' ";
                ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
                while (rs3.next()) {
                    r = r + rs3.getInt(1);
                }
                if (r < v.getCantidadAsientos()) {
                    v.setCantidadAsientos(v.getCantidadAsientos() - r);
                    vuelos.add(v);
                }
            }
        } catch (Exception e) {
            //return e.getMessage();
        }
        return vuelos;
    }

    /**
     * Web service operation
     *
     * @param agencia
     * @param vuelo
     * @param clase
     * @param dni
     * @param nroPasajes
     * @return
     * @throws java.text.ParseException
     */
    @WebMethod(operationName = "RegistrarReserva")
    public ArrayList<Mensaje> RegistrarReserva(@WebParam(name = "agencia") String agencia, @WebParam(name = "vuelo") String vuelo, @WebParam(name = "clase") String clase, @WebParam(name = "dni") String dni, @WebParam(name = "nroPasajes") Integer nroPasajes) throws Error, ParseException {

        //Conexión a MySQL
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();
        System.out.println("WS Conectada a MySQL");

        //Variables locales
        String sqlQuery1;
        String sqlQuery2;
        String sqlQuery3;
        String sqlInsert1;
        ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>();
        Integer r = 0;
        Integer s = 0;
        Integer c = 0;

        sqlQuery1 = "SELECT COUNT(idreserva) FROM reserva";
        System.out.println(sqlQuery1);
        sqlQuery2 = "SELECT SUM(cantidadAsientos) FROM reserva WHERE idvuelo = '" + vuelo + "' AND clase = '" + clase + "' ";
        System.out.println(sqlQuery2);
        sqlQuery3 = "SELECT cantidadAsientos FROM vuelo WHERE idaereolinea = '" + agencia + "' AND idvuelo = '" + vuelo + "' AND clase = '" + clase + "' ";
        System.out.println(sqlQuery3);

        try {
            Statement sqlExec1 = cnn.createStatement();
            Statement sqlExec2 = cnn.createStatement();
            Statement sqlExec3 = cnn.createStatement();
            ResultSet rs1 = sqlExec1.executeQuery(sqlQuery1);
            ResultSet rs2 = sqlExec2.executeQuery(sqlQuery2);
            ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
            while (rs1.next()) {
                r = rs1.getInt(1);
            }
            if (r == 0) {
                r = 1;
            }
            System.out.println("Siguiente reserva: " + Integer.toString(r));
            while (rs2.next()) {
                s = rs2.getInt(1) + nroPasajes;
            }
            System.out.println("Cantidad reservada: " + Integer.toString(s));
            while (rs3.next()) {
                c = rs3.getInt(1);
            }
            System.out.println("Cantidad disponible: " + Integer.toString(c));
            Mensaje m = new Mensaje();
            if (s <= c) {
                sqlInsert1 = "INSERT INTO reserva (idreserva, idvuelo, clase, dni, cantidadAsientos) "
                        + "VALUES( '" + r + "', '" + vuelo + "', '" + clase + "', '" + dni + "', '" + nroPasajes + "' )";
                sqlExec1.executeUpdate(sqlInsert1);
                m.setTipo("Satisfactorio");
                m.setMensaje("Reserva " + r + " registrada");
            } else {
                if (c==0) {
                    m.setTipo("Error");
                    m.setMensaje("Verifique sus datos");
                } else {
                    m.setTipo("Error");
                    m.setMensaje("Se ha alcanzado el límite de reservas");
                }
            }
            mensajes.add(m);
        } catch (Exception e) {
        }
        return mensajes;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "prueba")
    public String prueba(@WebParam(name = "origen") String origen) {
          
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();
        System.out.println("WS Conectada a MySQL");

        //Variables locales
        String sqlQuery1;
        String sqlQuery2;
        String sqlQuery3;
        ArrayList<Vuelo> vuelos = new ArrayList<Vuelo>();
        Integer i = 0;
        Integer r = 0;

        //Consulta a MySQL
        sqlQuery1 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea "
                + "WHERE ( vuelo.origen = '" + origen + "' "
                + "OR vuelo.destino = '" + origen + "' ) ";


        sqlQuery2 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea "
                + "WHERE ( vuelo.origen = '" + origen + "' "
                + "OR vuelo.destino = '" + origen + "' )";

       try {
            Statement sqlExec1 = cnn.createStatement();
            Statement sqlExec2 = cnn.createStatement();
            Statement sqlExec3 = cnn.createStatement();
            ResultSet rs1 = sqlExec1.executeQuery(sqlQuery1);
            ResultSet rs2 = sqlExec2.executeQuery(sqlQuery2);
            while (rs1.next()) {
                i++;
                Vuelo v = new Vuelo();
                v.setTipo("IDA");
                v.setVuelo(rs1.getString(1));
                v.setAereolina(rs1.getString(2));
                v.setClase(rs1.getString(3));
                v.setOrigen(rs1.getString(4));
                v.setDestino(rs1.getString(5));
                v.setPrecio(rs1.getDouble(6));
                v.setFechaOrigen(rs1.getDate(7));
                v.setCantidadAsientos(rs1.getInt(8));
                // Busca si hay asientos disponibles en el vuelo
                sqlQuery3 = "SELECT SUM(cantidadAsientos) "
                        + "FROM reserva "
                        + "WHERE reserva.idvuelo = '" + v.getVuelo() + "' "
                        + "AND reserva.clase = '" + v.getClase() + "' ";
                ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
                while (rs3.next()) {
                    r = r + rs3.getInt(1);
                }
                if (r < v.getCantidadAsientos()) {
                    vuelos.add(v);
                }
            }

            while (rs2.next()) {
                i++;
                Vuelo v = new Vuelo();
                v.setTipo("VUELTA");
                v.setVuelo(rs2.getString(1));
                v.setAereolina(rs2.getString(2));
                v.setClase(rs2.getString(3));
                v.setOrigen(rs2.getString(4));
                v.setDestino(rs2.getString(5));
                v.setPrecio(rs2.getDouble(6));
                v.setFechaOrigen(rs2.getDate(7));
                v.setCantidadAsientos(rs2.getInt(8));
                // Busca si hay asientos disponibles en el vuelo
                sqlQuery3 = "SELECT SUM(cantidadAsientos) "
                        + "FROM reserva "
                        + "WHERE reserva.idvuelo = '" + v.getVuelo() + "' "
                        + "AND reserva.clase = '" + v.getClase() + "' ";
                ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
                while (rs3.next()) {
                    r = r + rs3.getInt(1);
                }
                if (r < v.getCantidadAsientos()) {
                    v.setCantidadAsientos(v.getCantidadAsientos() - r);
                    vuelos.add(v);
                }
            }
        } catch (Exception e) {
            return e.getMessage();
        }
        return String.valueOf(vuelos.size()) ;
    }
    
    @WebMethod(operationName = "VuelosIdaYVueltaCantidad")
    public String VuelosIdaYVueltaCantidad(@WebParam(name = "origen") String origen, @WebParam(name = "destino") String destino, @WebParam(name = "fechaSalida") String fechaSalida, @WebParam(name = "fechaRegreso") String fechaRegreso, @WebParam(name = "nroPasajeros") Integer nroPasajeros) throws Error, ParseException {

        //Conexión a MySQL
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();

        //Variables locales
        String sqlQuery1 = "";
        String sqlQuery2 = "";
        String sqlQuery3;


        sqlQuery1 = "SELECT CONCAT('Sentido|Vuelo|Aerolinea|Clase|Origen|Destino|Precio|Fecha|Asientos¬50|80|80|80|80|80|80|80|80¬'," 
                + "IFNULL(GROUP_CONCAT(CONCAT_WS('|','IDA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos)),'')) "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea ";
        
        if(origen != null && !origen.isEmpty()){
            sqlQuery1 += "WHERE vuelo.origen = '" + origen + "' ";
        }
        
        if(destino != null && !destino.isEmpty()){
            if(sqlQuery1.toLowerCase().contains("WHERE")){
                sqlQuery1 += "AND vuelo.destino = '" + destino + "'  ";
            }else
            {
                sqlQuery1 += "WHERE vuelo.destino = '" + destino + "'  ";
            }
        }
        if(fechaSalida != null && !fechaSalida.isEmpty()){
            if(sqlQuery1.toLowerCase().contains("WHERE")){
                sqlQuery1 += "AND vuelo.fechaOrigen = '" + fechaSalida + "' ";
            }else
            {
                sqlQuery1 += "WHERE vuelo.fechaOrigen = '" + fechaSalida + "' ";
            }
        }

        sqlQuery2 = "SELECT IFNULL(GROUP_CONCAT(CONCAT_WS('|','VUELTA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos)),'') "
                + "FROM vuelo INNER JOIN aereolinea "
                + "ON vuelo.idaereolinea = aereolinea.idaereolinea "
                + "WHERE ( vuelo.origen = '" + destino + "' "
                + "AND vuelo.destino = '" + origen + "' "
                + "AND vuelo.fechaOrigen = '" + fechaRegreso + "' );";
        
        String rpta1 = "";
        String rpta2 = "";
        
        try {
            Statement sqlExec1 = cnn.createStatement();
            Statement sqlExec2 = cnn.createStatement();
            ResultSet rs1 = sqlExec1.executeQuery(sqlQuery1);
            ResultSet rs2 = sqlExec2.executeQuery(sqlQuery2);
           
            while (rs1.next()) {
                rpta1= rs1.getString(1);
            }
            while (rs2.next()) {
                rpta2= rs2.getString(1);
            }
        } catch (Exception e) {
            return e.getMessage() + " " + sqlQuery1 + " " + sqlQuery2;
        }
        
        String rpta = rpta1+","+rpta2;
        return rpta;
    }
}
