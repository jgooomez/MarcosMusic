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
