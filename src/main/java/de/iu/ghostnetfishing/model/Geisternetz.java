package de.iu.ghostnetfishing.model;

import jakarta.persistence.*;

@Entity
public class Geisternetz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double latitude;
    private double longitude;
    private String groesse;

    @Enumerated(EnumType.STRING)
    private Status status = Status.GEMELDET;

    @ManyToOne
    private Person melder;

    @ManyToOne
    private Person berger;

    @ManyToOne
    private Person verschollenMelder;

    // Getter und Setter

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }

    public String getGroesse() { return groesse; }
    public void setGroesse(String groesse) { this.groesse = groesse; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public Person getMelder() { return melder; }
    public void setMelder(Person melder) { this.melder = melder; }

    public Person getBerger() { return berger; }
    public void setBerger(Person berger) { this.berger = berger; }

    public Person getVerschollenMelder() { return verschollenMelder; }
    public void setVerschollenMelder(Person verschollenMelder) { this.verschollenMelder = verschollenMelder; }
}