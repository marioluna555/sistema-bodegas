package model;

import java.util.Date;

public class OrdenTraslado {
    private int id;
    private Date fecha;
    private Material material;
    private double cantidad;
    private UnidadAlmacenamiento almacenOrigen;
    private UnidadAlmacenamiento almacenDestino;
    private boolean salida;
    private boolean recibido;
    private String usuario;
    private String observaciones;

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
    public Material getMaterial() { return material; }
    public void setMaterial(Material material) { this.material = material; }
    public double getCantidad() { return cantidad; }
    public void setCantidad(double cantidad) { this.cantidad = cantidad; }
    public UnidadAlmacenamiento getAlmacenOrigen() { return almacenOrigen; }
    public void setAlmacenOrigen(UnidadAlmacenamiento almacenOrigen) { this.almacenOrigen = almacenOrigen; }
    public UnidadAlmacenamiento getAlmacenDestino() { return almacenDestino; }
    public void setAlmacenDestino(UnidadAlmacenamiento almacenDestino) { this.almacenDestino = almacenDestino; }
    public boolean isSalida() { return salida; }
    public void setSalida(boolean salida) { this.salida = salida; }
    public boolean isRecibido() { return recibido; }
    public void setRecibido(boolean recibido) { this.recibido = recibido; }
    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
}
