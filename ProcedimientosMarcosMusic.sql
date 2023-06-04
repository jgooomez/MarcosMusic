/*Obtiene nombre y descripcion de categoria*/
CREATE OR ALTER PROCEDURE ObtenerNombreYDescripcionCategoria
   @codigo INT,
   @nombre VARCHAR(100) OUTPUT,
   @descripcion VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @nombre = nombre, @descripcion = descripcion
    FROM Categoria
    WHERE codigo = @codigo

    PRINT 'Nombre de la categoría: ' + ISNULL(@nombre, 'N/A')
    PRINT 'Descripción de la categoría: ' + ISNULL(@descripcion, 'N/A')
END

DECLARE @nombreCategoria VARCHAR(100)
DECLARE @descripcionCategoria VARCHAR(100)

EXEC ObtenerNombreYDescripcionCategoria 2, @nombreCategoria OUTPUT, @descripcionCategoria OUTPUT

/*Obtiene alguna información del artista*/

CREATE OR ALTER PROCEDURE ObtenerInfoArtista
    @id INT,
    @nombre VARCHAR(100) OUTPUT,
    @fechaInicio DATE OUTPUT,
    @nacionalidad VARCHAR(100) OUTPUT,
    @generoMusical VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @nombre = nombre, @fechaInicio = fechaInicio, @nacionalidad = nacionalidad, @generoMusical = generoMusical
    FROM Artista
    WHERE id = @id

    PRINT 'Nombre del artista: ' + ISNULL(@nombre, 'N/A')
    PRINT 'Fecha de inicio: ' + ISNULL(CONVERT(VARCHAR(10), @fechaInicio), 'N/A')
    PRINT 'Nacionalidad: ' + ISNULL(@nacionalidad, 'N/A')
    PRINT 'Género musical: ' + ISNULL(@generoMusical, 'N/A')
END

DECLARE @nombreArtista VARCHAR(100)
DECLARE @fechaInicioArtista DATE
DECLARE @nacionalidadArtista VARCHAR(100)
DECLARE @generoMusicalArtista VARCHAR(100)

EXEC ObtenerInfoArtista 2, @nombreArtista OUTPUT, @fechaInicioArtista OUTPUT,
@nacionalidadArtista OUTPUT, @generoMusicalArtista OUTPUT

/*Obtiene informacion de contenido*/

CREATE OR ALTER PROCEDURE ObtenerinfoContenido
    @codigo INT,
    @titulo VARCHAR(100) OUTPUT,
    @lugarGrabacion VARCHAR(100) OUTPUT,
    @valoracion DECIMAL(3, 2) OUTPUT,
    @numeroReproducciones INT OUTPUT,
    @album VARCHAR(100) OUTPUT,
    @anyoLanzamiento INT OUTPUT
AS
BEGIN
    SELECT @titulo = titulo, @lugarGrabacion = lugarGrabacion, @valoracion = valoracion, @numeroReproducciones = numeroReproducciones,
	@album = album, @anyoLanzamiento = anyoLanzamiento
    FROM Contenido
    WHERE codigo = @codigo

    PRINT 'Título del contenido: ' + ISNULL(@titulo, 'N/A')
    PRINT 'Lugar de grabación: ' + ISNULL(@lugarGrabacion, 'N/A')
    PRINT 'Valoración: ' + ISNULL(CONVERT(VARCHAR(10), @valoracion), 'N/A')
    PRINT 'Número de reproducciones: ' + ISNULL(CONVERT(VARCHAR(10), @numeroReproducciones), 'N/A')
    PRINT 'Álbum: ' + ISNULL(@album, 'N/A')
    PRINT 'Año de lanzamiento: ' + ISNULL(CONVERT(VARCHAR(10), @anyoLanzamiento), 'N/A')
END

DECLARE @tituloContenido VARCHAR(100)
DECLARE @lugarGrabacionContenido VARCHAR(100)
DECLARE @valoracionContenido DECIMAL(3, 2)
DECLARE @numeroReproduccionesContenido INT
DECLARE @albumContenido VARCHAR(100)
DECLARE @anyoLanzamientoContenido INT

EXEC ObtenerinfoContenido 1, @tituloContenido OUTPUT, @lugarGrabacionContenido OUTPUT, @valoracionContenido OUTPUT,
@numeroReproduccionesContenido OUTPUT, @albumContenido OUTPUT, @anyoLanzamientoContenido OUTPUT

/*Obtiene titulo de contenido aleatorio*/

CREATE OR ALTER PROCEDURE ObtenerTituloContenidoAleatorio
AS
BEGIN
    DECLARE @TituloContenido VARCHAR(100)

    SELECT TOP 1 @TituloContenido = titulo
    FROM Contenido
    ORDER BY NEWID()

    SET @TituloContenido = 'Título de contenido aleatorio: ' + @TituloContenido

    SELECT @TituloContenido AS OutputResult
END

EXEC ObtenerTituloContenidoAleatorio

/*Obtiene el total de reproducciones de un contenido*/

CREATE OR ALTER PROCEDURE ObtenerTotalReproduccionesContenido
    @CodigoContenido INT,
    @TotalReproducciones INT OUTPUT,
    @NombreContenido VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @TotalReproducciones = SUM(numeroReproducciones), @NombreContenido = titulo
    FROM Contenido
    WHERE codigo = @CodigoContenido
    GROUP BY titulo
END

DECLARE @TotalReproduccionesResultado INT
DECLARE @NombreContenidoResultado VARCHAR(100)

EXEC ObtenerTotalReproduccionesContenido @CodigoContenido = 1, 
@TotalReproducciones = @TotalReproduccionesResultado OUTPUT,
@NombreContenido = @NombreContenidoResultado OUTPUT

SELECT @TotalReproduccionesResultado AS TotalReproducciones,
@NombreContenidoResultado AS NombreContenido

/*Obtiene el numero total de premios de un artista*/

CREATE OR ALTER PROCEDURE ObtenerNumeroPremiosArtista
    @IdArtista INT,
    @NombreArtista VARCHAR(100) OUTPUT,
    @NumeroPremios INT OUTPUT
AS
BEGIN
    SELECT @NombreArtista = nombre, @NumeroPremios = numPremios
    FROM Artista
    WHERE id = @IdArtista
END

DECLARE @NombreArtistaResultado VARCHAR(100)
DECLARE @NumeroPremiosResultado INT
EXEC ObtenerNumeroPremiosArtista @IdArtista = 1, @NombreArtista = @NombreArtistaResultado OUTPUT, @NumeroPremios = @NumeroPremiosResultado OUTPUT
SELECT @NombreArtistaResultado AS NombreArtista, @NumeroPremiosResultado AS NumeroPremios

/*Obtiene el lugar del concierto de un artista*/

CREATE OR ALTER PROCEDURE ObtenerLugarConcierto
    @codigo INT,
    @lugar VARCHAR(100) OUTPUT,
    @nombreCantante VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @lugar = c.lugar, @nombreCantante = a.nombre
    FROM Concierto c
    INNER JOIN ConciertoArtista ca ON c.codigo = ca.codigoConcierto
    INNER JOIN Artista a ON ca.idArtista = a.id
    WHERE c.codigo = @codigo

    PRINT 'Lugar del concierto: ' + ISNULL(@lugar, 'N/A')
    PRINT 'Nombre del cantante: ' + ISNULL(@nombreCantante, 'N/A')
END

DECLARE @lugarConcierto VARCHAR(100)
DECLARE @nombreCantante VARCHAR(100)

EXEC ObtenerLugarConcierto 1, @lugarConcierto OUTPUT, @nombreCantante OUTPUT

/*Obtiene nombre de usuario*/

CREATE OR ALTER PROCEDURE ObtenerNombreUsuario
    @idUsuario INT,
    @nombreUsuario VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @nombreUsuario = nombre
    FROM Usuario
    WHERE idUsuario = @idUsuario

    PRINT 'Nombre del usuario: ' + ISNULL(@nombreUsuario, 'N/A')
END

DECLARE @nombreUsuario VARCHAR(100)

EXEC ObtenerNombreUsuario 2, @nombreUsuario OUTPUT

/*Obtiene el precio de suscripcion*/

CREATE OR ALTER PROCEDURE ObtenerPrecioSubscripcion
    @idSubscripcion INT,
    @nombreSubscripcion VARCHAR(100) OUTPUT,
    @precio DECIMAL(5, 2) OUTPUT
AS
BEGIN
    SELECT @nombreSubscripcion = tipo, @precio = precio
    FROM Subscripcion
    WHERE id = @idSubscripcion

    PRINT 'Subscripción: ' + ISNULL(@nombreSubscripcion, 'N/A')
    PRINT 'Precio de la subscripción: $' + ISNULL(CONVERT(VARCHAR(10), @precio), 'N/A')
END

DECLARE @nombreSubscripcion VARCHAR(100)
DECLARE @precioSubscripcion DECIMAL(5, 2)

EXEC ObtenerPrecioSubscripcion 2, @nombreSubscripcion OUTPUT, @precioSubscripcion OUTPUT

	/*Obtiene la fecha, nombre del cantante y lugar de un concierto*/
CREATE OR ALTER PROCEDURE ObtenerFechaConcierto
    @codigo INT,
    @fechaConcierto DATE OUTPUT,
    @nombreCantante VARCHAR(100) OUTPUT,
    @lugarConcierto VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @fechaConcierto = c.fecha, @nombreCantante = a.nombre, @lugarConcierto = c.lugar
    FROM Concierto c
    INNER JOIN ConciertoArtista ca ON c.codigo = ca.codigoConcierto
    INNER JOIN Artista a ON ca.idArtista = a.id
    WHERE c.codigo = @codigo

    PRINT 'Fecha del concierto: ' + ISNULL(CONVERT(VARCHAR(10), @fechaConcierto), 'N/A')
    PRINT 'Nombre del cantante: ' + ISNULL(@nombreCantante, 'N/A')
    PRINT 'Lugar del concierto: ' + ISNULL(@lugarConcierto, 'N/A')
END

DECLARE @fechaConcierto DATE
DECLARE @nombreCantante VARCHAR(100)
DECLARE @lugarConcierto VARCHAR(100)

EXEC ObtenerFechaConcierto 2, @fechaConcierto OUTPUT, @nombreCantante OUTPUT, @lugarConcierto OUTPUT

/*Obtiene información de cuenta principal*/

CREATE OR ALTER PROCEDURE ObtenerInformacionCuentaPrincipal
    @telefono VARCHAR(9)
AS
BEGIN
    SELECT telefono AS NumeroTelefono, metodoPago AS MetodoPago, U.nombre AS NombreUsuario, U.nacionalidad AS NacionalidadUsuario,edad AS Edad, numSeguidores AS NumeroSeguidoresUsuario 
	FROM CuentaPrincipal INNER JOIN Usuario U ON CuentaPrincipal.idUsuario = U.idUsuario WHERE telefono = @telefono
END

EXEC ObtenerInformacionCuentaPrincipal @telefono = '123456789'

/*Obtiene informacion del empleado*/

CREATE OR ALTER PROCEDURE ObtenerInformacionBasicaEmpleado
    @idEmpleado INT
AS
BEGIN
    SELECT idEmpleado AS IDEmpleado, nombre AS NombreEmpleado, edad AS Edad, nacionalidad AS Nacionalidad, fechaIncorporacion AS FechaIncorporacion FROM Empleado WHERE idEmpleado = @idEmpleado
END

EXEC ObtenerInformacionBasicaEmpleado @idEmpleado = 1

/*Obtiene informacion del usuario*/
CREATE OR ALTER PROCEDURE ObtenerInformacionBasicaUsuario
    @idUsuario INT
AS
BEGIN
    SELECT idUsuario AS IDUsuario, nacionalidad AS Nacionalidad, nombre AS NombreUsuario, edad AS Edad, numSeguidores AS NumeroSeguidores FROM Usuario WHERE idUsuario = @idUsuario
END

EXEC ObtenerInformacionBasicaUsuario @idUsuario = 1

/*Nuevos Procedmientos*/
/*devuelve tarjeta pasándole el usuario*/

create procedure devuelveTarjetaUsuario @idUsuario int
as
select *
from Tarjeta
where Tarjeta.idUsuario = @idUsuario

exec dbo.devuelveTarjetaUsuario

--devuelve el numero de dinero recaudado en los conciertos pasandole un lugar

create function sumaDineroRecaudadoPorPais (@paisConcierto varchar)
returns
decimal (10,2)
begin
	declare @totalDineroRecaudado decimal (10,2)
	select @totalDineroRecaudado = sum(Concierto.dineroRecaudado), 	Concierto.pais
	from Concierto
	where Concierto.pais = @paisConcierto
	group by Concierto.pais

return @totalDineroRecaudado

select dbo.sumaDineroRecaudadoPorPais from Concierto

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
