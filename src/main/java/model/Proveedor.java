package model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "proveedor")
public class Proveedor implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numero_proveedor", nullable = false, unique = true)
    private String numeroProveedor;

    @Column(name = "nombre_razon_social", nullable = false)
    private String nombreRazonSocial;

    @Column(name = "nit", nullable = false)
    private String nit;

    @Column(name = "tipo_proveedor", nullable = false)
    private String tipoProveedor;

    @Column(name = "direccion_fiscal")
    private String direccionFiscal;

    @Column(name = "representante_legal")
    private String representanteLegal;

    @Column(name = "telefono")
    private String telefono;

    public enum MetodoPago {
        TRANSFERENCIA, EFECTIVO, CHEQUE, TARJETA, OTRO
    }
    public enum CondicionPago {
        CONTADO, CREDITO_15, CREDITO_30, CREDITO_60, OTRO
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "metodo_pago")
    private MetodoPago metodoPago;

    @Enumerated(EnumType.STRING)
    @Column(name = "condicion_pago")
    private CondicionPago condicionPago;

    @Column(name = "banco")
    private String banco;

    @Column(name = "tipo_cuenta")
    private String tipoCuenta;

    @Column(name = "numero_cuenta")
    private String numeroCuenta;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNumeroProveedor() { return numeroProveedor; }
    public void setNumeroProveedor(String numeroProveedor) { this.numeroProveedor = numeroProveedor; }
    public String getNombreRazonSocial() { return nombreRazonSocial; }
    public void setNombreRazonSocial(String nombreRazonSocial) { this.nombreRazonSocial = nombreRazonSocial; }
    public String getNit() { return nit; }
    public void setNit(String nit) { this.nit = nit; }
    public String getTipoProveedor() { return tipoProveedor; }
    public void setTipoProveedor(String tipoProveedor) { this.tipoProveedor = tipoProveedor; }
    public String getDireccionFiscal() { return direccionFiscal; }
    public void setDireccionFiscal(String direccionFiscal) { this.direccionFiscal = direccionFiscal; }
    public String getRepresentanteLegal() { return representanteLegal; }
    public void setRepresentanteLegal(String representanteLegal) { this.representanteLegal = representanteLegal; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public MetodoPago getMetodoPago() { return metodoPago; }
    public void setMetodoPago(MetodoPago metodoPago) { this.metodoPago = metodoPago; }
    public CondicionPago getCondicionPago() { return condicionPago; }
    public void setCondicionPago(CondicionPago condicionPago) { this.condicionPago = condicionPago; }
    public String getBanco() { return banco; }
    public void setBanco(String banco) { this.banco = banco; }
    public String getTipoCuenta() { return tipoCuenta; }
    public void setTipoCuenta(String tipoCuenta) { this.tipoCuenta = tipoCuenta; }
    public String getNumeroCuenta() { return numeroCuenta; }
    public void setNumeroCuenta(String numeroCuenta) { this.numeroCuenta = numeroCuenta; }
}
