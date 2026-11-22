/*
1. este es Rf-03 login cliente funcion validarCredenciales
*/
const modelo = require('../../modelo/clientes/LoginClienteModelo');
const jwt = require('jsonwebtoken'); // <-- Importar JWT

class LoginClienteControlador {
  static async validarCredencial(req, res) {
    const { t1: email, t2: password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ error: 'Correo y contraseña son obligatorios' });
    }

    try {
      const user = await modelo.validarCredenciales(email, password);
      
      if (!user) {
        return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
      }

      // 1. SEGURIDAD: Eliminar la contraseña del objeto antes de enviarlo o firmarlo
      // Esto crea un nuevo objeto 'usuarioSeguro' con todas las propiedades MENOS 'contrasena'
      const { contrasena, ...usuarioSeguro } = user;

      // 2. GENERAR EL JWT
      // Usa una clave secreta. En producción
      const SECRET_KEY = process.env.JWT_SECRET || 'clave_secreta_sena_peluqueria_2026';
      
      const token = jwt.sign(
        { id: usuarioSeguro.id, correo: usuarioSeguro.correo }, // Payload (datos dentro del token)
        SECRET_KEY,
        { expiresIn: '8h' } // El token será válido por 8 horas
      );

      // 3. ENVIAR RESPUESTA SEGURA
      res.json({ 
        mensaje: 'Inicio de sesión exitoso', 
        token: token,              // El frontend guardará esto
        usuario: usuarioSeguro     // Solo datos seguros (sin contraseña)
      });

    } catch (err) {
      if (err.message.includes('desactivada o bloqueada')) {
        return res.status(403).json({ error: err.message });
      }
      res.status(500).json({ error: `Hubo un error al validar las credenciales: ${err.message}` });
    }
  }
}

module.exports = LoginClienteControlador;