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
            if(sqlQuery1.toLowerCase().contains("WHERE".toLowerCase())){
                sqlQuery1 += "AND vuelo.destino = '" + destino + "'  ";
            }else
            {
                sqlQuery1 += "WHERE vuelo.destino = '" + destino + "'  ";
            }
        }
        if(fechaSalida != null && !fechaSalida.isEmpty()){
            if(sqlQuery1.toLowerCase().contains("WHERE".toLowerCase())){
                sqlQuery1 += "AND vuelo.fechaOrigen = '" + fechaSalida + "' ";
            }else
            {
                sqlQuery1 += "WHERE vuelo.fechaOrigen = '" + fechaSalida + "' ";
            }
        }
        
        int xCont1 = 0;
        String xRs = "";
        String[] arr = sqlQuery1.split(" ");
        for (int i = 0; i < arr.length; i++) {
            
            if(arr[i] == "WHERE")
                xCont1 ++;
            
            if(xCont1 >= 2)
                    xRs += " ";
            else
                xRs += arr[i] + " ";
        }
        sqlQuery1 = xRs;

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
