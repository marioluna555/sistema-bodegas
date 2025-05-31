package model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "material")
public class Material implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "codigo_material", nullable = false, unique = true)
    private String codigoMaterial;

    @Column(name = "nombre_material", nullable = false)
    private String nombreMaterial;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "categoria")
    private String categoria;

    @Column(name = "presentacion_cantidad")
    private String presentacionCantidad;

    @Column(name = "peso")
    private String peso;

    @Column(name = "volumen")
    private String volumen;

    @Column(name = "stock_disponible")
    private String stockDisponible;

    @Column(name = "stock_minimo")
    private String stockMinimo;

    @Column(name = "stock_maximo")
    private String stockMaximo;

    @Column(name = "lote_serie")
    private String loteSerie;

    @Column(name = "fecha_vencimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaVencimiento;

    @ManyToOne
    @JoinColumn(name = "ubicacion", referencedColumnName = "id")
    private UnidadAlmacenamiento ubicacion;

    @ManyToOne
    @JoinColumn(name = "proveedor", referencedColumnName = "id")
    private Proveedor proveedor;

    @Column(name = "costo_unitario")
    private String costoUnitario;

    @Column(name = "costo_total")
    private String costoTotal;

    @Column(name = "observaciones")
    private String observaciones;

    // Getters y setters
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    public String getCodigoMaterial() { return codigoMaterial; }
    public void setCodigoMaterial(String codigoMaterial) { this.codigoMaterial = codigoMaterial; }
    public String getNombreMaterial() { return nombreMaterial; }
    public void setNombreMaterial(String nombreMaterial) { this.nombreMaterial = nombreMaterial; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public String getPresentacionCantidad() { return presentacionCantidad; }
    public void setPresentacionCantidad(String presentacionCantidad) { this.presentacionCantidad = presentacionCantidad; }
    public String getPeso() { return peso; }
    public void setPeso(String peso) { this.peso = peso; }
    public String getVolumen() { return volumen; }
    public void setVolumen(String volumen) { this.volumen = volumen; }
    public String getStockDisponible() { return stockDisponible; }
    public void setStockDisponible(String stockDisponible) { this.stockDisponible = stockDisponible; }
    public String getStockMinimo() { return stockMinimo; }
    public void setStockMinimo(String stockMinimo) { this.stockMinimo = stockMinimo; }
    public String getStockMaximo() { return stockMaximo; }
    public void setStockMaximo(String stockMaximo) { this.stockMaximo = stockMaximo; }
    public String getLoteSerie() { return loteSerie; }
    public void setLoteSerie(String loteSerie) { this.loteSerie = loteSerie; }
    public Date getFechaVencimiento() { return fechaVencimiento; }
    public void setFechaVencimiento(Date fechaVencimiento) { this.fechaVencimiento = fechaVencimiento; }
    public UnidadAlmacenamiento getUbicacion() { return ubicacion; }
    public void setUbicacion(UnidadAlmacenamiento ubicacion) { this.ubicacion = ubicacion; }
    public Proveedor getProveedor() { return proveedor; }
    public void setProveedor(Proveedor proveedor) { this.proveedor = proveedor; }
    public String getCostoUnitario() { return costoUnitario; }
    public void setCostoUnitario(String costoUnitario) { this.costoUnitario = costoUnitario; }
    public String getCostoTotal() { return costoTotal; }
    public void setCostoTotal(String costoTotal) { this.costoTotal = costoTotal; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
}
