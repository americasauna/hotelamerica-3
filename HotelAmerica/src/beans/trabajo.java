package beans;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class trabajo  {
	@Persistent
	private String time;
	@Persistent
	private String rubro;
	@Persistent
	private String sueldo;
	
	public trabajo(String time, String rubro, String sueldo) {
		super();
		this.time = time;
		this.rubro = rubro;
		this.sueldo = sueldo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRubro() {
		return rubro;
	}
	public void setRubro(String rubro) {
		this.rubro = rubro;
	}
	public String getSueldo() {
		return sueldo;
	}
	public void setSueldo(String sueldo) {
		this.sueldo = sueldo;
	}
	}