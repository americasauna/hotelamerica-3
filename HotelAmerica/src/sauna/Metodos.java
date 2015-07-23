package sauna;


public class Metodos {
	
	public String saberIdioma(String idioma){
		if(idioma==null || idioma.equals("en"))
			idioma="/en/";
		else
			idioma="/";
		return idioma;
	}
	
	public String enviarIdioma(String idiomaEscogi){
		if(idiomaEscogi.equals("ing")){
			idiomaEscogi="/en/";
		}else {
			if(idiomaEscogi.equals("esp"))
				idiomaEscogi="/";
		}
		return idiomaEscogi;
	}
	
	public String Idioma(String idiomaEscogi, String idioma){
		if(idiomaEscogi!=null){
			if(idiomaEscogi.equals("ing")){
				idiomaEscogi="/en/";
			}else {
				if(idiomaEscogi.equals("esp"))
					idiomaEscogi="/";
			}
			return "/WEB-INF"+idiomaEscogi;
		}
		else{
			//REVISAMOS ESTO MAÑANA
			if(idioma.equals("en"))
				idioma="/en/";
			else
				idioma="/";
			return "/WEB-INF"+idioma;
		}
	}
	
	public String IdiomaAdmin(String idiomaEscogi, String idioma){
		if(idiomaEscogi!=null){
			if(idiomaEscogi.equals("ing")){
				idiomaEscogi="/en/";
			}else {
				if(idiomaEscogi.equals("esp"))
					idiomaEscogi="/";
			}
			return "/WEB-INF/admin"+idiomaEscogi;
		}
		else{
			//REVISAMOS ESTO MAÑANA
			if(idioma.equals("en"))
				idioma="/en/";
			else
				idioma="/";
			return "/WEB-INF/admin"+idioma;
		}
	}
}
