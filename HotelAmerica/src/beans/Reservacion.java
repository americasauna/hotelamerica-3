package beans;

import java.util.ArrayList;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class Reservacion {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private long key;
	@Persistent
	private ArrayList<Cliente> list;
	private String fecha;
	@Persistent
	private String adultos;
	@Persistent
	private String niños;
	@Persistent
	private String evento;
	@Persistent
	private String extra;
	
	
	
	}

