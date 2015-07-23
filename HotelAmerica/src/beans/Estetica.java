package beans;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class Estetica {

    @Persistent
	private String tipoestetica;
	@Persistent
	private String descripcion;
	@Persistent
	private String precio;
	@Persistent
	private String empleado;
	
	
	public Estetica(String tipoestetica, String descripcion, String precio,
			String empleado) {
		super();
		this.tipoestetica = tipoestetica;
		this.descripcion = descripcion;
		this.precio = precio;
		this.empleado = empleado;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public String getTipoestetica() {
		return tipoestetica;
	}
	public void setTipoestetica(String tipoestetica) {
		this.tipoestetica = tipoestetica;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "Estetica [tipoestetica=" + tipoestetica + ", empleado="
				+ empleado + "]";
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
