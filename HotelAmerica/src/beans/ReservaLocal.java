package beans;

import javax.jdo.annotations.*;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ReservaLocal {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private String fecha;
	@Persistent
	private String adultos;
	@Persistent
	private String niños;
	@Persistent
	private String evento;
	@Persistent
	private String extra;

	public ReservaLocal(String fecha, String adultos, String niños,
			String evento, String extra) {
		super();
		this.fecha = fecha;
		this.adultos = adultos;
		this.niños = niños;
		this.evento = evento;
		this.extra = extra;
	}

	public String getFecha() {
		return fecha;
	}

	@Override
	public String toString() {
		return "ReservaLocal ["
				+ (fecha != null ? "fecha=" + fecha + ", " : "")
				+ (adultos != null ? "adultos=" + adultos + ", " : "")
				+ (niños != null ? "ni�os=" + niños + ", " : "")
				+ (evento != null ? "evento=" + evento + ", " : "")
				+ (extra != null ? "extra=" + extra : "") + "]";
	}

	public Long getId() {
		return id;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getAdultos() {
		return adultos;
	}

	public void setAdultos(String adultos) {
		this.adultos = adultos;
	}

	public String getNiños() {
		return niños;
	}

	public void setNiños(String niños) {
		this.niños = niños;
	}

	public String getEvento() {
		return evento;
	}

	public void setEvento(String evento) {
		this.evento = evento;
	}

	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

}
