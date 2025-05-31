package model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "unidad_almacenamiento")
public class UnidadAlmacenamiento implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "codigo_unidad", nullable = false, unique = true)
    private String codigoUnidad;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "tipo", nullable = false)
    private String tipo;

    @Column(name = "clase")
    private String clase;

    @ManyToOne
    @JoinColumn(name = "bodega_padre", referencedColumnName = "id")
    private UnidadAlmacenamiento bodegaPadre;

    @Column(name = "volumen_total")
    private String volumenTotal;

    @Column(name = "ubicacion_fisica")
    private String ubicacionFisica;

    @Column(name = "observaciones")
    private String observaciones;

    // Getters y setters
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    public String getCodigoUnidad() { return codigoUnidad; }
    public void setCodigoUnidad(String codigoUnidad) { this.codigoUnidad = codigoUnidad; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    public String getClase() { return clase; }
    public void setClase(String clase) { this.clase = clase; }
    public UnidadAlmacenamiento getBodegaPadre() { return bodegaPadre; }
    public void setBodegaPadre(UnidadAlmacenamiento bodegaPadre) { this.bodegaPadre = bodegaPadre; }
    public String getVolumenTotal() { return volumenTotal; }
    public void setVolumenTotal(String volumenTotal) { this.volumenTotal = volumenTotal; }
    public String getUbicacionFisica() { return ubicacionFisica; }
    public void setUbicacionFisica(String ubicacionFisica) { this.ubicacionFisica = ubicacionFisica; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
}
