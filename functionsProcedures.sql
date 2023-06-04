--FUNC

CREATE PROCEDURE ActualizarEncargado
    @idDepartamento int,
    @NuevoEncargado nvarchar(50)
AS
BEGIN
    UPDATE Departamento
    SET NombreEncargado = @NuevoEncargado
    WHERE idDepartamento = @idDepartamento
END


exec ActualizarEncargado
	@idDepartamento = 1,
	@NuevoEncargado = 'Daniel Pantoja'
