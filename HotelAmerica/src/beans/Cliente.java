package beans;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

import sauna.ReservaHotel;


@PersistenceCapable
public class Cliente{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
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
	private String login;
	@Persistent
	private String password;
	@Persistent
	private ReservaHotel rHotel;
	@Persistent
	private ReservaHotel rSpa;
	@Persistent
	private ReservaLocal local;
	@Persistent
	private String estado;
	
	


	public Cliente(String name, String apellido , String telefono, String dni,String gmail
			 , String sexo, String direccion,String nacimiento, String login, String password) {
		super();
		this.name = name;
		this.apellido = apellido;
		this.sexo = sexo;
		this.dni = dni;
		this.gmail = gmail;
		this.telefono = telefono;
		this.nacimiento = nacimiento;
		this.direccion = direccion;
		this.login = login;
		this.password = password;
		this.estado="activado";
	}
	
	


	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getEstado() {
		return estado;
	}

	
	public Cliente(String user, String password){
		this.login=user;
		this.password=password;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	


	public Key getKey() {
		return key;
	}


	public void setKey(Key key) {
		this.key = key;
	}


	public ReservaHotel getrHotel() {
		return rHotel;
	}


	public void setrHotel(ReservaHotel rHotel) {
		this.rHotel = rHotel;
	}


	public ReservaHotel getrSpa() {
		return rSpa;
	}


	public void setrSpa(ReservaHotel rSpa) {
		this.rSpa = rSpa;
	}


	public ReservaLocal getLocal() {
		return local;
	}


	public void setLocal(ReservaLocal local) {
		this.local = local;
	}
	
	public String bloquear() {
		this.estado="bloqueado";
		return estado;
	}
	public String activar() {
		this.estado="activado";
		return estado;
	}


	@Override
	public String toString() {
		return "Cliente [key=" + key + ", name=" + name + ", apellido="
				+ apellido + ", sexo=" + sexo + ", dni=" + dni + ", gmail="
				+ gmail + ", telefono=" + telefono + ", nacimiento="
				+ nacimiento + ", direccion=" + direccion + ", login=" + login
				+ ", password=" + password + ", rHotel=" + rHotel + ", rSpa="
				+ rSpa + ", local=" + local + ", estado=" + estado + "]";
	}


	

	
}