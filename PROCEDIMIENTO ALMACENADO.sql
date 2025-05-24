-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ana, Mestra>
-- Create date: <Mayo 2025>
-- Description:	<pacienteID y devuelva todas sus citas médicas con detalles del médico>
-- =============================================
CREATE PROCEDURE ObtenerCitasPorPaciente(IN paciente_id INT)
	-- Add the parameters for the stored procedure here
	<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
        citas.id_cita,
        citas.fecha_cita,
        citas.hora_cita,
        citas.motivo_consulta,
        medicos.id_medico,
        medicos.nombre_medico,
        medicos.apellido_medico,
        especialidad.nombre_especialidad
    FROM citas
    JOIN medicos ON citas.id_medico = medicos.id_medico
    JOIN especialidad ON medicos.id_especialidad = especialidad.id_especialidad
    WHERE citas.id_paciente = paciente_id
    ORDER BY citas.fecha_cita

END
GO
