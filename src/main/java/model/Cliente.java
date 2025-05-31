package model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "cliente")
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numero_cliente", nullable = false, unique = true)
    private String numeroCliente;

    @Column(name = "nombre_razon_social", nullable = false)
    private String nombreRazonSocial;

    @Column(name = "tipo_cliente", nullable = false)
    private String tipoCliente;

    @Column(name = "nit", nullable = false)
    private String nit;

    @Column(name = "direccion_facturacion", nullable = false)
    private String direccionFacturacion;

    @Column(name = "direccion_entrega", nullable = false)
    private String direccionEntrega;

    @Column(name = "telefono", nullable = false)
    private String telefono;

    @Column(name = "correo", nullable = false)
    private String correo;

    @Column(name = "persona_contacto", nullable = false)
    private String personaContacto;

    @Column(name = "metodo_pago", nullable = false)
    private String metodoPago;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNumeroCliente() { return numeroCliente; }
    public void setNumeroCliente(String numeroCliente) { this.numeroCliente = numeroCliente; }

    public String getNombreRazonSocial() { return nombreRazonSocial; }
    public void setNombreRazonSocial(String nombreRazonSocial) { this.nombreRazonSocial = nombreRazonSocial; }

    public String getTipoCliente() { return tipoCliente; }
    public void setTipoCliente(String tipoCliente) { this.tipoCliente = tipoCliente; }

    public String getNit() { return nit; }
    public void setNit(String nit) { this.nit = nit; }

    public String getDireccionFacturacion() { return direccionFacturacion; }
    public void setDireccionFacturacion(String direccionFacturacion) { this.direccionFacturacion = direccionFacturacion; }

    public String getDireccionEntrega() { return direccionEntrega; }
    public void setDireccionEntrega(String direccionEntrega) { this.direccionEntrega = direccionEntrega; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getPersonaContacto() { return personaContacto; }
    public void setPersonaContacto(String personaContacto) { this.personaContacto = personaContacto; }

    public String getMetodoPago() { return metodoPago; }
    public void setMetodoPago(String metodoPago) { this.metodoPago = metodoPago; }
}