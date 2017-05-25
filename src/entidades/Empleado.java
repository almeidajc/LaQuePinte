package entidades;

public class Empleado {
	
	private int id_empleado;	
	private String nombre;	
	private String apellido;	
	private String usuario;
	private String contraseña;
	private String tipo;
	private int tel;
	private String patente;
	private int id_turno;
	public int getId_turno() {
		return id_turno;
	}

	public void setId_turno(int id_turno) {
		this.id_turno = id_turno;
	}

	private String email;
	
	public String getEmail() {
		return email;
	}

	public int getId_empleado() {
		return id_empleado;
	}
	public void setId_empleado(int id_empleado) {
		this.id_empleado = id_empleado;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContraseña() {
		return contraseña;
	}
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public void setPatente(String paten) {
		// TODO Auto-generated method stub
		this.patente= paten;
	}
	public String getPatente() {
		return patente;
	}

	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;
	}


}
