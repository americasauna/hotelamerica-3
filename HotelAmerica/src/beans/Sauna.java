package beans;

import java.util.*;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Sauna {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	@Persistent
	private String nombre;
	@Persistent
	private List<String>camaras;
    @Persistent
   	private List<String>baños;
	@Persistent
	private String descripcion;
	@Persistent
	private Double precio;
	
	public Sauna(List<String>baños, List<String> camaras,String descripcion, String precio) {
		super();
		this.baños=baños;
		this.camaras=camaras;
		this.descripcion = descripcion;
	}
	
	public Sauna(String nombre){
		this.nombre=nombre;
		this.baños=new ArrayList<String>();
		this.camaras= new ArrayList<String>();
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setTipo(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public void aumentarCamara(String a){
		camaras.add(a);
	}
	public void aumentarBaño(String a){
		baños.add(a);
	}
	@Override
	public String toString() {
		return "Sauna [nombre=" + nombre + ", camaras=" + camaras + ", ba�os="
				+ baños + ", descripcion=" + descripcion + ", precio=" + precio
				+ "]";
	}
	
	
}