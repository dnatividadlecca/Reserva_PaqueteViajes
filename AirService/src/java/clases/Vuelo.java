/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.Date;

/**
 *
 * @author jsalguero
 */
public class Vuelo {
    private String tipo;
    private String vuelo;
    private String aereolina;
    private String nombreAreolinea;
    private String clase;
    private String origen;
    private String destino;
    private Double precio;
    private Date fechaOrigen;
    private Integer cantidadAsientos;

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the vuelo
     */
    public String getVuelo() {
        return vuelo;
    }

    /**
     * @param vuelo the vuelo to set
     */
    public void setVuelo(String vuelo) {
        this.vuelo = vuelo;
    }

    /**
     * @return the aereolina
     */
    public String getAereolina() {
        return aereolina;
    }

    /**
     * @param aereolina the aereolina to set
     */
    public void setAereolina(String aereolina) {
        this.aereolina = aereolina;
    }

    /**
     * @return the nombreAreolinea
     */
    public String getNombreAreolinea() {
        return nombreAreolinea;
    }

    /**
     * @param nombreAreolinea the nombreAreolinea to set
     */
    public void setNombreAreolinea(String nombreAreolinea) {
        this.nombreAreolinea = nombreAreolinea;
    }

    /**
     * @return the clase
     */
    public String getClase() {
        return clase;
    }

    /**
     * @param clase the clase to set
     */
    public void setClase(String clase) {
        this.clase = clase;
    }

    /**
     * @return the origen
     */
    public String getOrigen() {
        return origen;
    }

    /**
     * @param origen the origen to set
     */
    public void setOrigen(String origen) {
        this.origen = origen;
    }

    /**
     * @return the destino
     */
    public String getDestino() {
        return destino;
    }

    /**
     * @param destino the destino to set
     */
    public void setDestino(String destino) {
        this.destino = destino;
    }

    /**
     * @return the precio
     */
    public Double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    /**
     * @return the fechaOrigen
     */
    public Date getFechaOrigen() {
        return fechaOrigen;
    }

    /**
     * @param fechaOrigen the fechaOrigen to set
     */
    public void setFechaOrigen(Date fechaOrigen) {
        this.fechaOrigen = fechaOrigen;
    }

    /**
     * @return the cantidadAsientos
     */
    public Integer getCantidadAsientos() {
        return cantidadAsientos;
    }

    /**
     * @param cantidadAsientos the cantidadAsientos to set
     */
    public void setCantidadAsientos(Integer cantidadAsientos) {
        this.cantidadAsientos = cantidadAsientos;
    }

}
