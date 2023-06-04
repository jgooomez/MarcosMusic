-- Verificar si la tabla de histórico de reproducciones existe, de lo contrario, crearla
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistoricoReproducciones]'))
BEGIN
    CREATE TABLE [dbo].[HistoricoReproducciones] (
        id INT PRIMARY KEY,
        duracion INT,
        codigoContenido INT,
        fechaReproduccion DATE,
        hora TIME,
        valoracion INT,
        idUsuario INT,
        anioReproduccion INT,
        FOREIGN KEY (codigoContenido) REFERENCES Contenido(codigo),
        FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
    );
END
GO

-- Procedimiento para mover los datos de la tabla de reproducciones a la tabla de histórico
CREATE PROCEDURE MueveReproduccionesMasDeUnAnyo
AS
BEGIN
    DECLARE @anyo_actual INT;
    SET @anyo_actual = YEAR(GETDATE());

    INSERT INTO HistoricoReproducciones (id, duracion, codigoContenido, fechaReproduccion, hora, valoracion, idUsuario, anioReproduccion)
    SELECT id, duracion, codigoContenido, fechaReproduccion, hora, valoracion, idUsuario, YEAR(fechaReproduccion)
    FROM Reproduccion
    WHERE fechaReproduccion <= DATEADD(YEAR, -1, GETDATE());
END

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE devuelveUsuariosMasContenido
AS
BEGIN
    SELECT Usuario.nombre, SUM(Contenido.numeroReproducciones) AS NumContenidosVisualizados
    FROM Usuario
    INNER JOIN Contenido ON Contenido.idUsuario = Usuario.idUsuario
    GROUP BY Usuario.nombre
    ORDER BY NumContenidosVisualizados DESC
END


EXEC devuelveUsuariosMasContenido

/*Crear lista de reproduccion*/
CREATE PROCEDURE CrearListaReproduccion
(
    @idUsuario INT,
    @generoMusical VARCHAR(100) = NULL
)
AS
BEGIN
    DECLARE @codigoLista INT

    -- Crear la lista de reproducción
    INSERT INTO ListaReproduccion (fechaCreacion, nombre, duracionTotal, imagen, numSeguidores)
    VALUES (GETDATE(), 'Nueva Lista', 0, '', 0)

    -- Obtener el código de la lista de reproducción recién creada
    SET @codigoLista = SCOPE_IDENTITY()

    -- Obtener las canciones más exitosas o con mejor valoración
    DECLARE @canciones TABLE (codigo INT)
    
    IF @generoMusical IS NULL
    BEGIN
        INSERT INTO @canciones (codigo)
        SELECT c.codigo
        FROM Contenido c
        INNER JOIN Reproduccion r ON c.codigo = r.codigoContenido
        WHERE r.idUsuario = @idUsuario
    END
    ELSE
    BEGIN
        INSERT INTO @canciones (codigo)
        SELECT TOP 20 c.codigo
        FROM Contenido c
        INNER JOIN Reproduccion r ON c.codigo = r.codigoContenido
        INNER JOIN ArtistaContenido ac ON c.codigo = ac.codigoContenido
        INNER JOIN Artista a ON ac.idArtista = a.id
        WHERE r.idUsuario = @idUsuario AND a.generoMusical = @generoMusical
        ORDER BY c.numeroReproducciones DESC
    END

    -- Agregar las canciones a la lista de reproducción
    INSERT INTO ListaCanciones (codigoLista, codigoCancion, fechaAgregado)
    SELECT @codigoLista, codigo, GETDATE()
    FROM @canciones
END

/*Crear una nueva lista de reproducción sin especificar género*/
EXEC CrearListaReproduccion @idUsuario = 1

/*Crear una nueva lista de reproducción especificando un género*/
EXEC CrearListaReproduccion @idUsuario = 2, @generoMusical = 'Pop'
/*Obtener Canciones mas reproducidas mes/año/semana*/
CREATE OR ALTER FUNCTION ObtenerCancionesMasReproducidasEnEspana
(
    @periodo CHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 10
        C.codigo,
        C.titulo,
        C.lugarGrabacion,
        C.valoracion,
        C.numeroReproducciones,
        C.album,
        C.anyoLanzamiento
    FROM
        Contenido C
    WHERE
        C.codigo IN
        (
            SELECT TOP 10
                R.codigoContenido
            FROM
                Reproduccion R
                INNER JOIN Usuario U ON R.idUsuario = U.idUsuario
            WHERE
                U.nacionalidad = 'España'
                AND
                (
                    (@periodo = 'w' AND R.fechaReproduccion >= DATEADD(WEEK, -1, GETDATE()))
                    OR
                    (@periodo = 'm' AND R.fechaReproduccion >= DATEADD(MONTH, -1, GETDATE()))
                    OR
                    (@periodo = 'y' AND R.fechaReproduccion >= DATEADD(YEAR, -1, GETDATE()))
                )
            GROUP BY
                R.codigoContenido
            ORDER BY
                COUNT(*) DESC
        )
);
SELECT * FROM dbo.ObtenerCancionesMasReproducidasEnEspana('w')
SELECT * FROM dbo.ObtenerCancionesMasReproducidasEnEspana('y')
SELECT * FROM dbo.ObtenerCancionesMasReproducidasEnEspana('m')
