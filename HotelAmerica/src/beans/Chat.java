package beans;

import java.io.Serializable;
import javax.jdo.annotations.*;

@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class Chat implements Serializable{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long key;
	@Persistent
	private String user;
	@Persistent
	private String mensaje;
	
	public Chat(String user, String mensaje) {
		super();
		this.user = user;
		this.mensaje = mensaje;
	}

	public Long getKey() {
		return key;
	}

	public void setKey(Long key) {
		this.key = key;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	@Override
	public String toString() {
		return "Chat [key=" + key + ", user=" + user + ", mensaje=" + mensaje
				+ "]";
	}

}
