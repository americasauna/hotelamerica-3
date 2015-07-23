package beans;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class Masajes {

    @Persistent
	private String tipodemasaje;
	@Persistent
	private String descripcion;
	@Persistent
	private String precio;
	@Persistent
	private String empleado;
	
	public Masajes(String tipodemasaje, String descripcion, String precio ,String empleado) {
		super();
		this.tipodemasaje = tipodemasaje;
		this.descripcion = descripcion;
		this.precio = precio;
		this.empleado = empleado;
	}
	public String getTipodemasaje() {
		return tipodemasaje;
	}
	public void setTipodemasaje(String tipodemasaje) {
		this.tipodemasaje = tipodemasaje;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public String getEmpleado() {
		return empleado;
	}
	public void setEmpleado(String empleado) {
		this.empleado = empleado;
	}
	}