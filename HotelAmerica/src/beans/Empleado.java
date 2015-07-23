package beans;

import javax.jdo.annotations.*;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Empleado{
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private String name;
	@Persistent
	private String apellido;
	@Persistent
	private String sexo;
	@Persistent
	private String dni;
	@Persistent
	private String gmail;
	@Persistent
	private String telefono;
	@Persistent
	private String nacimiento;
	@Persistent
	private String direccion;
	@Persistent
	private String area;
	@Persistent
	private String sueldo;
    @Persistent
    private boolean actividad;
	
	


	public Empleado(String name, String apellido, String sexo, String dni,
			String gmail, String telefono, String nacimiento, String direccion,
			String area, String sueldo) {
		super();
		this.name = name;
		this.apellido = apellido;
		this.sexo = sexo;
		this.dni = dni;
		this.gmail = gmail;
		this.telefono = telefono;
		this.nacimiento = nacimiento;
		this.direccion = direccion;
		this.area = area;
		this.sueldo = sueldo;
		this.actividad=true;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSueldo() {
		return sueldo;
	}

	public void setSueldo(String sueldo) {
		this.sueldo = sueldo;
	}
	@Override
	public String toString() {
		return "Empleado [area=" + area + ", sueldo=" + sueldo + ", getName()="
				+ getName() + ", Apellido=" + getApellido() + ", Sexo="
				+ getSexo() + ", Dni=" + getDni() + ", Gmail=" + getGmail()
				+ ", Telefono=" + getTelefono() + ", Nacimiento="
				+ getNacimiento() + ", Direccion=" + getDireccion() + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getGmail() {
		return gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(String nacimiento) {
		this.nacimiento = nacimiento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean getActividad() {
		return actividad;
	}

	public void setActividad(boolean actividad) {
		this.actividad = actividad;
	}

}
