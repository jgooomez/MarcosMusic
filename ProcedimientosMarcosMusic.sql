"-----------------------1--------------------------"
CREATE PROCEDURE ObtenerNombreCategoria
    @codigo INT,
    @nombre VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @nombre = nombre
    FROM Categoria
    WHERE codigo = @codigo


    PRINT 'Nombre de la categoría: ' + ISNULL(@nombre, 'N/A')
END

DECLARE @nombreCategoria VARCHAR(100)


EXEC ObtenerNombreCategoria 1, @nombreCategoria OUTPUT
"-----------------------2--------------------------"
CREATE PROCEDURE ObtenerNombreArtista
    @id INT,
    @nombre VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @nombre = nombre
    FROM Artista
    WHERE id = @id


    PRINT 'Nombre del artista: ' + ISNULL(@nombre, 'N/A')
END

DECLARE @nombreArtista VARCHAR(100)


EXEC ObtenerNombreArtista 2, @nombreArtista OUTPUT
"-----------------------3--------------------------"
CREATE PROCEDURE ObtenerTituloContenido
    @codigo INT,
    @titulo VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @titulo = titulo
    FROM Contenido
    WHERE codigo = @codigo

   
    PRINT 'Título del contenido: ' + ISNULL(@titulo, 'N/A')
END

DECLARE @tituloContenido VARCHAR(100)


EXEC ObtenerTituloContenido 1, @tituloContenido OUTPUT
"-----------------------4--------------------------"
CREATE PROCEDURE ObtenerTituloContenidoAleatorio
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
"-----------------------5--------------------------"
CREATE PROCEDURE ObtenerLugarConciertoAleatorio
AS
BEGIN
    DECLARE @LugarConcierto VARCHAR(100)

    SELECT TOP 1 @LugarConcierto = lugar
    FROM Concierto
    ORDER BY NEWID()

    SET @LugarConcierto = 'Lugar de concierto aleatorio: ' + @LugarConcierto

    SELECT @LugarConcierto AS OutputResult
END

EXEC ObtenerLugarConciertoAleatorio
"-----------------------6--------------------------"
CREATE PROCEDURE ObtenerTotalReproduccionesContenido
    @CodigoContenido INT,
    @TotalReproducciones INT OUTPUT
AS
BEGIN
    SELECT @TotalReproducciones = SUM(numeroReproducciones)
    FROM Contenido
    WHERE codigo = @CodigoContenido
END

DECLARE @TotalReproduccionesResultado INT
EXEC ObtenerTotalReproduccionesContenido @CodigoContenido = 1, @TotalReproducciones = @TotalReproduccionesResultado OUTPUT
SELECT @TotalReproduccionesResultado AS OutputResult
"-----------------------7--------------------------"
CREATE PROCEDURE ObtenerNumeroPremiosArtista
    @IdArtista INT,
    @NumeroPremios INT OUTPUT
AS
BEGIN
    SELECT @NumeroPremios = numPremios
    FROM Artista
    WHERE id = @IdArtista
END

DECLARE @NumeroPremiosResultado INT
EXEC ObtenerNumeroPremiosArtista @IdArtista = 1, @NumeroPremios = @NumeroPremiosResultado OUTPUT
SELECT @NumeroPremiosResultado AS OutputResult
"-----------------------8--------------------------"
CREATE PROCEDURE ObtenerLugarConcierto
    @codigo INT,
    @lugar VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT @lugar = lugar
    FROM Concierto
    WHERE codigo = @codigo

    PRINT 'Lugar del concierto: ' + ISNULL(@lugar, 'N/A')
END

DECLARE @lugarConcierto VARCHAR(100)

EXEC ObtenerLugarConcierto 2, @lugarConcierto OUTPUT
"-----------------------9--------------------------"
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

EXEC ObtenerNombreUsuario 1, @nombreUsuario OUTPUT
"-----------------------10--------------------------"
CREATE PROCEDURE ObtenerPrecioSubscripcion
    @idSubscripcion INT,
    @precio DECIMAL(5, 2) OUTPUT
AS
BEGIN
    SELECT @precio = precio
    FROM Subscripcion
    WHERE id = @idSubscripcion

    PRINT 'Precio de la subscripción: $' + ISNULL(CONVERT(VARCHAR(10), @precio), 'N/A')
END

DECLARE @precioSubscripcion DECIMAL(5, 2)

EXEC ObtenerPrecioSubscripcion 1, @precioSubscripcion OUTPUT
"-----------------------11--------------------------"
CREATE PROCEDURE ObtenerFechaConcierto
    @codigo INT,
    @fechaConcierto DATE OUTPUT
AS
BEGIN
    SELECT @fechaConcierto = fecha
    FROM Concierto
    WHERE codigo = @codigo

    PRINT 'Fecha del concierto: ' + ISNULL(CONVERT(VARCHAR(10), @fechaConcierto), 'N/A')
END

DECLARE @fechaConcierto DATE

EXEC ObtenerFechaConcierto 1, @fechaConcierto OUTPUT
"-----------------------12--------------------------"
CREATE PROCEDURE ObtenerContenidoPorCategoria
    @codigoCategoria INT
AS
BEGIN
    SELECT C.titulo AS TituloContenido, Ca.nombre AS NombreCategoria
    FROM Contenido C
    INNER JOIN Categoria Ca ON C.codigo = Ca.codigo
    WHERE Ca.codigo = @codigoCategoria
END

EXEC ObtenerContenidoPorCategoria @codigoCategoria = 1

