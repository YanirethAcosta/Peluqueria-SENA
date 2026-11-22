
const dbService = require('../bd/Conexion');

class VIstaHorarioTrabajadorModelo {
    static async verHorario(idTrabajador) {
        const query = `
            SELECT
                t.nombres AS nombreTrabajador,
                h.fecha,
                h.horaInicio,
                h.horaFinal,
                rh.estado AS estadoRegistro
            FROM reghorarios rh
            INNER JOIN trabajadores t
                ON rh.idTrabajador = t.idtrabajador
            INNER JOIN horarios h
                ON rh.idHorario = h.idHorario
            WHERE rh.idtrabajador = ?
              AND rh.estado = 'Activo';
        `;

        try {
            const resultado = await dbService.query(query, [idTrabajador]);
            return resultado;
        } catch (err) {
            throw new Error(`Error al buscar el horario: ${err.message}`);
        }
    }
}

module.exports = VIstaHorarioTrabajadorModelo;
