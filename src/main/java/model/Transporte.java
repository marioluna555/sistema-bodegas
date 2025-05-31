package model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "transporte")
public class Transporte implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numero_transporte", nullable = false, unique = true)
    private String numeroTransporte;

    @Column(name = "tipo_vehiculo", nullable = false)
    private String tipoVehiculo;

    @Column(name = "placa")
    private String placa;

    @Column(name = "marca")
    private String marca;

    @Column(name = "capacidad")
    private String capacidad;

    @Column(name = "kilometraje")
    private String kilometraje;

    @Column(name = "conductor")
    private String conductor;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNumeroTransporte() { return numeroTransporte; }
    public void setNumeroTransporte(String numeroTransporte) { this.numeroTransporte = numeroTransporte; }
    public String getTipoVehiculo() { return tipoVehiculo; }
    public void setTipoVehiculo(String tipoVehiculo) { this.tipoVehiculo = tipoVehiculo; }
    public String getPlaca() { return placa; }
    public void setPlaca(String placa) { this.placa = placa; }
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
    public String getCapacidad() { return capacidad; }
    public void setCapacidad(String capacidad) { this.capacidad = capacidad; }
    public String getKilometraje() { return kilometraje; }
    public void setKilometraje(String kilometraje) { this.kilometraje = kilometraje; }
    public String getConductor() { return conductor; }
    public void setConductor(String conductor) { this.conductor = conductor; }
}
