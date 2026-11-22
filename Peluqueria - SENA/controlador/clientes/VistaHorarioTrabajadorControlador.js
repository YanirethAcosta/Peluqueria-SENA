
const modelo = require('../../modelo/clientes/VIstaHorarioTrabajadorModelo');


class VistaHorarioTrabajadorControlador {

    obtenerHorario = async (req, res) => {
        try {
            const { id } = req.params;

            const horario = await modelo.verHorario(id);

            return res.status(200).json({
                exito: true,
                mensaje: 'Horario obtenido con exito',
                datos: horario
            });

        } catch (error) {
            console.error('Error al consultar el horario:', error);

            return res.status(500).json({
                exito: false,
                mensaje: 'Error al consultar el horario',
                error: error.message
            });
        }
    };

}

module.exports = new VistaHorarioTrabajadorControlador();

