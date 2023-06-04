"--FUNCIONES Y PROCEDURES PARA EMPLEADOS Y DEPARTAMENTOS--"

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
