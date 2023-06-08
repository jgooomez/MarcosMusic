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
--Procedimiento para crear un departamento y verificar si se creo correctamente--
CREATE PROCEDURE CrearDepartamento
    @nombreDepartamento NVARCHAR(50),
    @fechaCreacion DATE,
    @nombreEncargado NVARCHAR(50),
    @numTrabajadores INT,
    @numSubdepartamentos INT,
    @depCreado BIT OUTPUT
AS
BEGIN
    -- Variable para verificar si el departamento se ha insertado correctamente
    DECLARE @insertExitoso INT;

    -- Insertar el nuevo departamento en la tabla Departamento
    INSERT INTO Departamento (nombre, fechaCreacion, NombreEncargado, numTrabajadores, numSubDpto)
    VALUES (@nombreDepartamento, @fechaCreacion, @nombreEncargado, @numTrabajadores, @numSubdepartamentos);

    -- Obtener el número de filas afectadas para saber si se ha hecho el insert
    SET @insertExitoso = @@ROWCOUNT;

    -- Asignar el valor correspondiente a la variable de salida @depCreado
    IF @insertExitoso > 0
    BEGIN
        SET @depCreado = 0; -- Insert exitoso, devuelve 0
    END
    ELSE
    BEGIN
        SET @depCreado = 1; -- Insert fallido, devuelve 1
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














--	  Wassim Atiki 	  --
--		P R O C E D I M I E N T O S		  --

-- PROCEDIMIENTO 1			(Devuélve el número de usuarios que tienen X tipo de suscripción)
CREATE PROCEDURE ObtenerUsuariosPorTipoSuscripcion
    @tipoSuscripcion VARCHAR(100),
    @numUsuarios INT OUTPUT
AS
BEGIN
    SELECT @numUsuarios = COUNT(*) 
    FROM SubscripcionUsuario su
    INNER JOIN Subscripcion s ON su.idSubscripcion = s.id
    WHERE s.tipo = @tipoSuscripcion;

    -- Devolver el resultado
    SELECT @numUsuarios AS 'CantidadUsuarios';
END

/*		para ejecutar el procedimiento
DECLARE @numUsuarios INT;
EXEC ObtenerUsuariosPorTipoSuscripcion 'premium', @numUsuarios OUTPUT;
SELECT @numUsuarios AS CantidadUsuarios;
*/



-- PROCEDIMIENTO 2			(Muestra los conciertos que tiene un artista)
CREATE PROCEDURE ObtenerConciertosPorArtista
    @nombreArtista VARCHAR(100)
AS
BEGIN
    SELECT c.*
    FROM Concierto c
    INNER JOIN ConciertoArtista ca ON c.codigo = ca.codigoConcierto
    INNER JOIN Artista a ON ca.idArtista = a.id
    WHERE a.nombre = @nombreArtista;
END

/*
EXEC ObtenerConciertosPorArtista 'Nirvana';
*/



-- PROCEDIMIENTO 3			(Obtener el número total de reproducciones de un contenido)
CREATE PROCEDURE ObtenerTotalReproduccionesContenido
    @codigoContenido INT,
    @totalReproducciones INT OUTPUT
AS
BEGIN
    SELECT @totalReproducciones = SUM(numeroReproducciones)
    FROM Contenido
    WHERE codigo = @codigoContenido;

    -- Devolver el resultado
    SELECT @totalReproducciones AS 'TotalReproducciones';
END

/*
DECLARE @totalReproducciones INT;
EXEC ObtenerTotalReproduccionesContenido @codigoContenido = codigo_contenido, @totalReproducciones = @totalReproducciones OUTPUT;
SELECT @totalReproducciones AS TotalReproducciones;
*/



-- PROCEDIMIENTO 4			(Obtener la lista de reproducción más popular)
CREATE PROCEDURE ObtenerListaReproduccionMasPopular
AS
BEGIN
    SELECT TOP 1 *
    FROM ListaReproduccion
    ORDER BY numSeguidores DESC;
END

/*
EXEC ObtenerListaReproduccionMasPopular;
*/



-- PROCEDIMIENTO 5			(Obtener la lista de canciones de una lista de reproducción específica)
CREATE PROCEDURE ObtenerCancionesListaReproduccion
    @codigoLista INT
AS
BEGIN
    SELECT c.*
    FROM Contenido c
    INNER JOIN ListaCanciones lc ON c.codigo = lc.codigoCancion
    WHERE lc.codigoLista = @codigoLista;
END

/*
EXEC ObtenerCancionesListaReproduccion @codigoLista = codigo_lista;
*/



-- PROCEDIMIENTO 6			(Obtener el número de premios ganados por un artista)
CREATE PROCEDURE ObtenerNumeroPremiosArtista
    @nombreArtista VARCHAR(100),
    @numPremios INT OUTPUT
AS
BEGIN
    SELECT @numPremios = numPremios
    FROM Artista
    WHERE nombre = @nombreArtista;

    -- Devolver el resultado
    SELECT @numPremios AS 'NumeroPremios';
END

/*
DECLARE @numPremios INT;
EXEC ObtenerNumeroPremiosArtista 'nombre_artista', @numPremios = @numPremios OUTPUT;
SELECT @numPremios AS NumeroPremios;
*/



--PROCEDIMIENTO 7			(Obtener la lista de empleados de un departamento junto con la cantidad de subdepartamentos que tiene ese departamento)
CREATE PROCEDURE ObtenerEmpleadosConSubdepartamentos
    @nombreDepartamento NVARCHAR(50)
AS
BEGIN
    SELECT e.*, d.numSubDpto
    FROM Empleado e
    INNER JOIN Departamento d ON e.departamento = d.nombre
    WHERE d.nombre = @nombreDepartamento;
END

/*
EXEC ObtenerEmpleadosConSubdepartamentos @nombreDepartamento = nombre_departamento;
*/



-- PROCEDIMIENTO 8			(Obtener la lista de usuarios que han reproducido un contenido específico y sus detalles de reproducción)
CREATE PROCEDURE ObtenerDetallesReproduccionesContenido
    @codigoContenido INT
AS
BEGIN
    SELECT u.*, r.duracion, r.fechaReproduccion, r.hora, r.valoracion
    FROM Usuario u
    INNER JOIN Reproduccion r ON u.idUsuario = r.idUsuario
    WHERE r.codigoContenido = @codigoContenido;
END

/*
EXEC ObtenerDetallesReproduccionesContenido @codigoContenido = codigo_contenido;
*/


-- PROCEDIMIENTO 9			(Obtener la cantidad total de dinero recaudado en todos los conciertos de un país específico)
CREATE PROCEDURE ObtenerTotalRecaudadoPorPais
    @pais VARCHAR(100),
    @totalRecaudado DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SELECT @totalRecaudado = SUM(dineroRecaudado)
    FROM Concierto
    WHERE pais = @pais;

    -- Devolver el resultado
    SELECT @totalRecaudado AS 'TotalRecaudado';
END

/*
DECLARE @totalRecaudado DECIMAL(10, 2);
EXEC ObtenerTotalRecaudadoPorPais 'nombre_pais', @totalRecaudado = @totalRecaudado OUTPUT;
SELECT @totalRecaudado AS TotalRecaudado;
*/


-- PROCEDIMIENTO 10			(Obtener la lista de usuarios que han suscrito una subscripción específica y su información de tarjeta de crédito)
CREATE PROCEDURE ObtenerUsuariosPorSubscripcion
    @tipoSubscripcion VARCHAR(100)
AS
BEGIN
    SELECT u.*, t.numeroTarjeta, t.tipo, t.nombreTitular, t.cvv, t.caducidad
    FROM Usuario u
    INNER JOIN SubscripcionUsuario su ON u.idUsuario = su.idUsuario
    INNER JOIN Subscripcion s ON su.idSubscripcion = s.id
    INNER JOIN Tarjeta t ON u.idUsuario = t.idUsuario
    WHERE s.tipo = @tipoSubscripcion;
END

/*
EXEC ObtenerUsuariosPorSubscripcion 'tipo_subscripcion';
*/








--		F U N C I O N E S		--

-- FUNCIÓN 1			(Devuelve el número total de categorías)
CREATE FUNCTION ObtenerNumeroCategorias()
RETURNS INT
AS
BEGIN
    DECLARE @numCategorias INT;
    SELECT @numCategorias = COUNT(*) FROM Categoria;
    RETURN @numCategorias;
END


-- FUNCIÓN 2			(Devuelve el artista con más premios)
CREATE FUNCTION ObtenerArtistaMasPremiado()
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @artistaMasPremiado VARCHAR(100);
    SELECT TOP 1 @artistaMasPremiado = nombre FROM Artista ORDER BY numPremios DESC;
    RETURN @artistaMasPremiado;
END


-- FUNCIÓN 3			(Devuelve el promedio de valoración de los contenidos)
CREATE FUNCTION ObtenerPromedioValoracionContenido()
RETURNS DECIMAL(3, 2)
AS
BEGIN
    DECLARE @promedioValoracion DECIMAL(3, 2);
    SELECT @promedioValoracion = AVG(valoracion) FROM Contenido;
    RETURN @promedioValoracion;
END


-- FUNCIÓN 4			(Devuelve el número total de reproducciones de un usuario)
CREATE FUNCTION ObtenerTotalReproduccionesUsuario(@idUsuario INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalReproducciones INT;
    SELECT @totalReproducciones = SUM(numeroReproducciones) FROM Contenido WHERE codigo IN (SELECT codigoContenido FROM Reproduccion WHERE idUsuario = @idUsuario);
    RETURN @totalReproducciones;
END


-- FUNCIÓN 5			(Devuelve la lista de reproducción con la duración más larga)
CREATE FUNCTION ObtenerListaReproduccionMasLarga()
RETURNS INT
AS
BEGIN
    DECLARE @codigoLista INT;
    SELECT TOP 1 @codigoLista = codigo FROM ListaReproduccion ORDER BY duracionTotal DESC;
    RETURN @codigoLista;
END


-- FUNCIÓN 6			(Devuelve el número de conciertos en una ciudad específica)
CREATE FUNCTION ObtenerConciertosEnCiudad(@ciudad VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @numConciertos INT;
    SELECT @numConciertos = COUNT(*) FROM Concierto WHERE ciudad = @ciudad;
    RETURN @numConciertos;
END


-- FUNCIÓN 7			(Devuelve la edad promedio de los artistas)
CREATE FUNCTION ObtenerEdadPromedioArtistas()
RETURNS INT
AS
BEGIN
    DECLARE @edadPromedio INT;
    SELECT @edadPromedio = AVG(DATEDIFF(YEAR, fechaInicio, GETDATE())) FROM Artista;
    RETURN @edadPromedio;
END


-- FUNCIÓN 8			(Devuelve el número total de tarjetas registradas por un usuario)
CREATE FUNCTION ObtenerTotalTarjetasRegistradas(@idUsuario INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalTarjetas INT;
    SELECT @totalTarjetas = COUNT(*) FROM Tarjeta WHERE idUsuario = @idUsuario;
    RETURN @totalTarjetas;
END


-- FUNCIÓN 9			(Devuelve la duración total de una lista de reproducción específica)
CREATE FUNCTION ObtenerDuracionTotalListaReproduccion(@codigoLista INT)
RETURNS INT
AS
BEGIN
    DECLARE @duracionTotal INT;
    SELECT @duracionTotal = duracionTotal FROM ListaReproduccion WHERE codigo = @codigoLista;
    RETURN @duracionTotal;
END


-- FUNCIÓN 10			(Devuelve el número de artistas de una nacionalidad específica)
CREATE FUNCTION ObtenerArtistasNacionalidad(@nacionalidad VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @numArtistas INT;
    SELECT @numArtistas = COUNT(*) FROM Artista WHERE nacionalidad = @nacionalidad;
    RETURN @numArtistas;
END


/* PARA EJECUTAR LAS FUNCIONES */
-- Ejecutar la función 1: ObtenerNumeroCategorias
SELECT dbo.ObtenerNumeroCategorias() AS NumeroCategorias;

-- Ejecutar la función 2: ObtenerArtistaMasPremiado
SELECT dbo.ObtenerArtistaMasPremiado() AS ArtistaMasPremiado;

-- Ejecutar la función 3: ObtenerPromedioValoracionContenido
SELECT dbo.ObtenerPromedioValoracionContenido() AS PromedioValoracionContenido;

-- Ejecutar la función 4: ObtenerTotalReproduccionesUsuario
DECLARE @idUsuario INT;
SET @idUsuario = 1; -- Reemplazar con el ID de usuario deseado
SELECT dbo.ObtenerTotalReproduccionesUsuario(@idUsuario) AS TotalReproduccionesUsuario;

-- Ejecutar la función 5: ObtenerListaReproduccionMasLarga
SELECT dbo.ObtenerListaReproduccionMasLarga() AS ListaReproduccionMasLarga;

-- Ejecutar la función 6: ObtenerConciertosEnCiudad
DECLARE @ciudad VARCHAR(100);
SET @ciudad = 'NombreCiudad'; -- Reemplazar con el nombre de la ciudad deseada
SELECT dbo.ObtenerConciertosEnCiudad(@ciudad) AS NumConciertosEnCiudad;

-- Ejecutar la función 7: ObtenerEdadPromedioArtistas
SELECT dbo.ObtenerEdadPromedioArtistas() AS EdadPromedioArtistas;

-- Ejecutar la función 8: ObtenerTotalTarjetasRegistradas
DECLARE @idUsuario INT;
SET @idUsuario = 1; -- Reemplazar con el ID de usuario deseado
SELECT dbo.ObtenerTotalTarjetasRegistradas(@idUsuario) AS TotalTarjetasRegistradas;

-- Ejecutar la función 9: ObtenerDuracionTotalListaReproduccion
DECLARE @codigoLista INT;
SET @codigoLista = 1; -- Reemplazar con el código de lista de reproducción deseado
SELECT dbo.ObtenerDuracionTotalListaReproduccion(@codigoLista) AS DuracionTotalListaReproduccion;

-- Ejecutar la función 10: ObtenerArtistasNacionalidad
DECLARE @nacionalidad VARCHAR(100);
SET @nacionalidad = 'NombreNacionalidad'; -- Reemplazar con el nombre de la nacionalidad deseada
SELECT dbo.ObtenerArtistasNacionalidad(@nacionalidad) AS NumArtistasNacionalidad;
