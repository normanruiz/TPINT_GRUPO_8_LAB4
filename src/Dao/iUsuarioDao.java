package Dao;

import Dominio.Usuario;

public interface iUsuarioDao {
	
	Usuario Validar(String usuario, String contrase�a);

	int agregarUsuario(Usuario usuarioNuevo);
	
}
