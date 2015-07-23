package beans;

import java.io.Serializable;
import javax.jdo.annotations.*;


@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class Baneo implements Serializable{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long key;
	@Persistent
	private int usuarios;
	@Persistent
	private String ip;
	public Baneo(int usuarios, String ip) {
		super();
		this.usuarios = usuarios;
		this.ip = ip;
	}
	public Long getKey() {
		return key;
	}
	public void setKey(Long key) {
		this.key = key;
	}
	public int getUsuarios() {
		return usuarios;
	}
	public void setUsuarios(int usuarios) {
		this.usuarios = usuarios;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "Baneo [key=" + key + ", usuarios=" + usuarios + ", ip=" + ip
				+ "]";
	}
	
}