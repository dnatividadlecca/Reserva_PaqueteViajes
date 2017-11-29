/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.util.Date;
import java.util.ArrayList;
import datos.*;
import clases.*;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;

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
        System.out.println("WS Conectada a MySQL");

        //Variables locales
        String sqlQuery1;
        String sqlQuery2;
        String sqlQuery3;
        ArrayList<Vuelo> vuelos = new ArrayList<Vuelo>();
        Integer i = 0;
        Date fSalida = new java.sql.Date(fechaSalida.getTime());
        Date fRegreso = new java.sql.Date(fechaRegreso.getTime());
        Integer r = 0;

        //Consulta a MySQL
        sqlQuery1 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM airservice.vuelo INNER JOIN airservice.aereolinea "
                + "ON airservice.vuelo.idaereolinea = airservice.aereolinea.idaereolinea "
                + "WHERE ( airservice.vuelo.origen = '" + origen + "' "
                + "AND airservice.vuelo.destino = '" + destino + "' ) "
                + "AND airservice.vuelo.fechaOrigen = '" + fSalida + "' ";

        sqlQuery2 = "SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, "
                + "vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, "
                + "vuelo.cantidadAsientos "
                + "FROM airservice.vuelo INNER JOIN airservice.aereolinea "
                + "ON airservice.vuelo.idaereolinea = airservice.aereolinea.idaereolinea "
                + "WHERE ( airservice.vuelo.origen = '" + destino + "' "
                + "AND airservice.vuelo.destino = '" + origen + "' ) "
                + "AND airservice.vuelo.fechaOrigen = '" + fRegreso + "' ";

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
                        + "FROM airservice.reserva "
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
                        + "FROM airservice.reserva "
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

        sqlQuery1 = "SELECT COUNT(idreserva) FROM airservice.reserva";
        sqlQuery2 = "SELECT SUM(cantidadAsientos) FROM airservice.reserva WHERE idvuelo = '" + vuelo + "' AND clase = '" + clase + "' ";
        sqlQuery3 = "SELECT cantidadAsientos FROM airservice.vuelo WHERE idaereolinea = '" + agencia + "' AND idvuelo = '" + vuelo + "' AND clase = '" + clase + "' ";

        try {
            Statement sqlExec1 = cnn.createStatement();
            Statement sqlExec2 = cnn.createStatement();
            Statement sqlExec3 = cnn.createStatement();
            ResultSet rs1 = sqlExec1.executeQuery(sqlQuery1);
            ResultSet rs2 = sqlExec2.executeQuery(sqlQuery2);
            ResultSet rs3 = sqlExec3.executeQuery(sqlQuery3);
            System.out.println(sqlQuery1);
            System.out.println(sqlQuery2);
            System.out.println(sqlQuery3);
                while (rs1.next()) {
                    r = rs1.getInt(1);
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
                sqlInsert1 = "INSERT INTO airservice.reserva (idreserva, idvuelo, clase, dni, cantidadAsientos) "
                        + "VALUES( '" + r + "', '" + vuelo + "', '" + clase + "', '" + dni + "', '" + nroPasajes + "' )";
                sqlExec1.executeUpdate(sqlInsert1);
                m.setTipo("Satisfactorio");
                m.setMensaje("Reserva " + r + " registrada");
            } else {
                m.setTipo("Error");
                m.setMensaje("Se ha alcanzado el límite de reservas");
            }
            mensajes.add(m);
        } catch (Exception e) {
        }
        return mensajes;
    }
}
