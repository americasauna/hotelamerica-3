package sauna;
import javax.jdo.annotations.*;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Queja {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private String queja;
	@Persistent
	private String nempleado;
	
	public Queja(String queja, String nempleado) {
		super();
		this.queja = queja;
		this.nempleado = nempleado;
	}
	public String getQueja() {
		return queja;
	}
	public void setQueja(String queja) {
		this.queja = queja;
	}
	public String getNempleado() {
		return nempleado;
	}
	public void setNempleado(String nempleado) {
		this.nempleado = nempleado;
	}
	public Long getId() {
		return id;
	}
	@Override
	public String toString() {
		return "Queja [" + (queja != null ? "queja=" + queja + ", " : "")
				+ (nempleado != null ? "nempleado=" + nempleado : "") + "]";
	}
	
}
