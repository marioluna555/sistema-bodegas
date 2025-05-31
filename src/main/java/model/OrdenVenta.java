package model;

import java.util.Date;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;

@Entity
@Table(name = "orden_venta")
public class OrdenVenta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date fecha;
    private double cantidad;
    private String usuario;
    private boolean entregado;
    private String observaciones;
    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;
    @ManyToOne
    @JoinColumn(name = "unidad_almacenamiento_salida")
    private UnidadAlmacenamiento unidadAlmacenamientoSalida;
    @ManyToOne
    @JoinColumn(name = "material_id")
    private Material material;

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
    public Material getMaterial() { return material; }
    public void setMaterial(Material material) { this.material = material; }
    public double getCantidad() { return cantidad; }
    public void setCantidad(double cantidad) { this.cantidad = cantidad; }
    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }
    public boolean isEntregado() { return entregado; }
    public void setEntregado(boolean entregado) { this.entregado = entregado; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
    public Cliente getCliente() { return cliente; }
    public void setCliente(Cliente cliente) { this.cliente = cliente; }
    public UnidadAlmacenamiento getUnidadAlmacenamientoSalida() { return unidadAlmacenamientoSalida; }
    public void setUnidadAlmacenamientoSalida(UnidadAlmacenamiento unidadAlmacenamientoSalida) { this.unidadAlmacenamientoSalida = unidadAlmacenamientoSalida; }
}
