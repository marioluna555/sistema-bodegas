package model;

import java.util.Date;
import jakarta.persistence.*;

@Entity
@Table(name = "ajuste_inventario")
public class AjusteInventario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date fecha;
    @ManyToOne
    @JoinColumn(name = "material_id")
    private Material material;
    private double cantidad;
    @Column(name = "tipo_ajuste")
    private String tipoAjuste; // 'AUMENTO' o 'DISMINUCION'
    private String usuario;
    private String observaciones;
    @Column(name = "aplicado")
    private boolean aplicado = false;

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
    public Material getMaterial() { return material; }
    public void setMaterial(Material material) { this.material = material; }
    public double getCantidad() { return cantidad; }
    public void setCantidad(double cantidad) { this.cantidad = cantidad; }
    public String getTipoAjuste() { return tipoAjuste; }
    public void setTipoAjuste(String tipoAjuste) { this.tipoAjuste = tipoAjuste; }
    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
    public boolean isAplicado() { return aplicado; }
    public void setAplicado(boolean aplicado) { this.aplicado = aplicado; }
}
