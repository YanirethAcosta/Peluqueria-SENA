/*
  // este endpoint RF03 es para login del cliente
*/
const dbService = require('../bd/Conexion');
const bcrypt = require('bcrypt');

class loginClienteModelo {
  // Buscar usuario por correo
  static async buscaCorreo(email) {
    const query = 'SELECT * FROM clientes WHERE correo = ?';
    try {
      const result = await dbService.query(query, [email]);
      return result.length ? result[0] : null;
    } catch (err) {
      throw new Error(`Error al buscar el usuario: ${err.message}`);
    }
  }

  // Validar correo y contraseña
  static async validarCredenciales(email, password) {
    try {
      const usuario = await this.buscaCorreo(email); // Se busca el correo
      
      if (!usuario) {
        return null; // Usuario no encontrado
      }

      // 1. VALIDAR EL ESTADO DE LA CUENTA
      // Puedes agregar también 'Bloqueado' u otros estados que manejes.
      if (usuario.estado === 'Inactivo' || usuario.estado === 'Bloqueado') {
        throw new Error('CUENTA_INACTIVA_O_BLOQUEADA');
      }

      // 2. Comparar la contraseña encriptada
      const match = await bcrypt.compare(password, usuario.contrasena);
      if (!match) {
        return null; // Contraseña incorrecta
      }

      return usuario; // Credenciales correctas y cuenta activa
    } catch (err) {
      // 3. Manejar el error específico de cuenta inactiva
      if (err.message === 'CUENTA_INACTIVA_O_BLOQUEADA') {
        throw new Error('Su cuenta ha sido desactivada o bloqueada. Por favor, contacte al administrador.');
      }
      
      // Propagar cualquier otro error
      throw new Error(`Error al validar credenciales: ${err.message}`);
    }
  }
}

module.exports = loginClienteModelo;