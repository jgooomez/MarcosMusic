--FUNCIONES Y PROCEDURES PARA EMPLEADOS Y DEPARTAMENTOS--
--Daniel Pantoja Cedeño

--PROCEDURES
--PROCEDIMIENTO QUE PERMITE ACTUALIZAR AL ENCARGADO DE DEPARTAMENTO--
CREATE PROCEDURE ActualizarEncargado
    @idDepartamento int,
    @NuevoEncargado nvarchar(50)
AS
BEGIN
    UPDATE Departamento
    SET NombreEncargado = @NuevoEncargado
    WHERE idDepartamento = @idDepartamento
END

--PROCEDIMIENTO PARA CAMBIAR EL DEPARTAMENTO DE UN EMPLEADO--
--Nota: no se por qué el procedimiento me da un error como si estuviese haciendo un bucle, pero actualiza el empleado.
CREATE PROCEDURE cambiarDep
    @idEmpleado int,
    @idNuevoDepartamento int
AS
BEGIN
    UPDATE Empleado
    SET idDepartamento = @idNuevoDepartamento
    WHERE idEmpleado = @idEmpleado
END

--FUNCTIONS
--FUNCION PARA OPTENER UNA LISTA DE NOMBRES Y EDADES DE TODOS LOS EMPLEADOS DE UN DEPARTAMENTO--
CREATE FUNCTION getEmpleados (@idDepartamento int)
RETURNS TABLE
AS
RETURN
(
    SELECT idEmpleado AS ID, nombre as Nombre, edad AS Edad
    FROM Empleado
    WHERE idDepartamento = @idDepartamento
)

--FUNCION PARA VER LOS EMPLEADOS A LOS QUE LES QUEDAN 5 AÑOS O MENOS PARA JUBILARSE--
CREATE FUNCTION EmpCercaJubilacion()
RETURNS TABLE
AS
RETURN
(
	SELECT Emp.nombre, Emp.edad, Dep.nombre AS nombreDepartamento
    FROM Empleado Emp
    INNER JOIN Departamento Dep ON Emp.idDepartamento = Dep.idDepartamento
    WHERE EMP.edad >= 60
)

----Alejandro Daniel Pastor Diez----
----FUNCIONES----
--Funcion para comprobar si existe un departamento
CREATE FUNCTION ComprobarExistenciaDepartamento
    (@idDepartamento INT)
RETURNS BIT
AS
BEGIN
    DECLARE @existeDepartamento BIT;

    IF EXISTS (SELECT * FROM Departamento WHERE idDepartamento = @idDepartamento)
        SET @existeDepartamento = 1;
    ELSE
        SET @existeDepartamento = 0;

    RETURN @existeDepartamento;
END

--PROCEDIMIENTOS--
--Procedimiento para crear un departamento SOLO si no existe
CREATE PROCEDURE CrearDepartamento
    @idDepartamento INT,
    @nombreDepartamento NVARCHAR(50),
    @fechaCreacion DATE,
    @nombreEncargado NVARCHAR(50),
    @numTrabajadores INT,
    @numSubdepartamentos INT
AS
BEGIN
    -- Verificar si el departamento ya existe
    IF EXISTS (SELECT 1 FROM Departamento WHERE idDepartamento = @idDepartamento)
    BEGIN
        PRINT 'El departamento ya existe.';
    END
    ELSE
    BEGIN
        -- Insertar el nuevo departamento
        INSERT INTO Departamento (idDepartamento, nombre, fechaCreacion, NombreEncargado, numTrabajadores, numSubDpto)
        VALUES (@idDepartamento, @nombreDepartamento, @fechaCreacion, @nombreEncargado, @numTrabajadores, @numSubdepartamentos);
        PRINT 'El departamento ha sido creado.';
    END
END

--Procedimiento para eliminar un departamento SOLO si existe
CREATE PROCEDURE dbo.EliminarDepartamentoSiExiste
    @idDepartamento INT
AS
BEGIN
    DECLARE @existeDepartamento BIT;

    -- Comprobar si el departamento existe
    SET @existeDepartamento = dbo.ComprobarExistenciaDepartamento(@idDepartamento);

    IF @existeDepartamento = 1
    BEGIN
        -- El departamento existe, proceder a eliminarlo
        DELETE FROM Departamento WHERE idDepartamento = @idDepartamento;
        PRINT 'El departamento ha sido eliminado.';
    END
    ELSE
    BEGIN
        -- El departamento no existe
        PRINT 'El departamento no existe.';
    END
END
