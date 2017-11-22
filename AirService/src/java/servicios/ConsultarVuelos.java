/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import datos.*;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jsalguero
 */
@WebService(serviceName = "ConsultarVuelos")
public class ConsultarVuelos {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "VuelosIdaYVuelta")
    public String VuelosIdaYVuelta(@WebParam(name = "origen") String origen, @WebParam(name = "destino") String destino, @WebParam(name = "fechaSalida") Date fechaSalida, @WebParam(name = "fechaRegreso") Date fechaRegreso, @WebParam(name = "nroPasajeros") Integer nroPasajeros) throws Error, ParseException {
        //TODO write your implementation code here:
        String result = "";
        java.sql.Date fSalida = new java.sql.Date(fechaSalida.getTime());
        java.sql.Date fRegreso = new java.sql.Date(fechaRegreso.getTime());
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();
        Connection cnna = db.getCnn();
        out.println("WS Conectada a MySQL");
        ResultSet rs;
        ResultSet rsa;
        Integer reservados = 0;
        try {
            Statement sqlExec = cnn.createStatement();
            Statement sqlExeca = cnna.createStatement();
            rs = sqlExec.executeQuery("SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos FROM airservice.vuelo INNER JOIN airservice.aereolinea ON airservice.vuelo.idaereolinea = airservice.aereolinea.idaereolinea WHERE (vuelo.origen = '" + origen + "' AND vuelo.destino = '" + destino + "') AND vuelo.fechaOrigen = '" + fSalida + "' ");
            out.println("Resultado:");
            result = result + " \n";
            while (rs.next()) {
                reservados = 0;
                rsa = sqlExeca.executeQuery("SELECT SUM(cantidadAsientos) FROM airservice.reserva WHERE reserva.idvuelo = '" + rs.getString(1) + "' AND reserva.clase = '" + rs.getString(3) + "' ");
                while (rsa.next()) {
                    reservados = reservados + rsa.getInt(1);
                }
                if (reservados < Integer.parseInt(rs.getString(8))) {
                    result = result + "IDA" + "|"
                            + rs.getString(1) + "|"
                            + rs.getString(2) + "|"
                            + rs.getString(3) + "|"
                            + rs.getString(4) + "|"
                            + rs.getString(5) + "|"
                            + rs.getString(6) + "|"
                            + rs.getString(7) + "|"
                            + rs.getString(8) + "|"
                            + reservados + " \n";
                }
            }
            rs = sqlExec.executeQuery("SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos FROM airservice.vuelo INNER JOIN airservice.aereolinea ON airservice.vuelo.idaereolinea = airservice.aereolinea.idaereolinea WHERE (vuelo.origen = '" + destino + "' AND vuelo.destino = '" + origen + "') AND vuelo.fechaOrigen = '" + fRegreso + "' ");
            while (rs.next()) {
                reservados = 0;
                rsa = sqlExeca.executeQuery("SELECT SUM(cantidadAsientos) FROM airservice.reserva WHERE reserva.idvuelo = '" + rs.getString(1) + "' AND reserva.clase = '" + rs.getString(3) + "' ");
                while (rsa.next()) {
                    reservados = reservados + rsa.getInt(1);
                }
                if (reservados < Integer.parseInt(rs.getString(8))) {
                    result = result + "VUE" + "|"
                            + rs.getString(1) + "|"
                            + rs.getString(2) + "|"
                            + rs.getString(3) + "|"
                            + rs.getString(4) + "|"
                            + rs.getString(5) + "|"
                            + rs.getString(6) + "|"
                            + rs.getString(7) + "|"
                            + rs.getString(8) + "|"
                            + reservados + " \n";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarVuelos.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.println(result);
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "RegistrarReserva")
    public String RegistrarReserva(@WebParam(name = "agencia") String agencia, @WebParam(name = "vuelo") String vuelo, @WebParam(name = "clase") String clase, @WebParam(name = "dni") String dni, @WebParam(name = "nroPasajes") Integer nroPasajes) throws Error, ParseException {
        //TODO write your implementation code here:
        String result = "";
        Integer nroReserva = 3;
        cnnDb db = new cnnDb();
        Connection cnn = db.getCnn();
        out.println("WS Conectada a MySQL");
        ResultSet rs;
        String insertStr = "";
        try {
            Statement sqlExec = cnn.createStatement();
            rs = sqlExec.executeQuery("SELECT COUNT(idreserva) FROM airservice.reserva");
            while (rs.next()) {
                nroReserva = Integer.parseInt(rs.getString(1)) + 1;
                out.println("Reserva: " + nroReserva);
            }
            insertStr = "INSERT INTO airservice.reserva (idreserva, idvuelo, clase, dni, cantidadAsientos) VALUES( '" + nroReserva + "', '" + vuelo + "', '" + clase + "', '" + dni + "', '" + nroPasajes + "' )";
            sqlExec.executeUpdate(insertStr);
            return "Reserva " + nroReserva + " registrada";
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarVuelos.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.println(result);
        return result;
    }
}
