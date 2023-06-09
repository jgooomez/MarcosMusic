USE master;
ALTER DATABASE MARCOSMUSIC SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Eliminar la base de datos si existe
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'MARCOSMUSIC')
DROP DATABASE MARCOSMUSIC;

-- Crear la base de datos MARCOSMUSIC
CREATE DATABASE MARCOSMUSIC;

GO
USE MARCOSMUSIC;

CREATE TABLE Categoria (
codigo INT IDENTITY (1,1),
nombre VARCHAR(100),
descripcion VARCHAR(100),
CONSTRAINT PK_Categoria PRIMARY KEY (codigo)
);

CREATE TABLE Artista (
id INT IDENTITY (1,1),
nombre VARCHAR(100),
fechaInicio VARCHAR(100),
nacionalidad VARCHAR(100),
numPremios INT,
generoMusical VARCHAR(100),
CONSTRAINT PK_Artista PRIMARY KEY (id)
);

CREATE TABLE Concierto (
codigo INT IDENTITY (1,1),
lugar VARCHAR(100),
fecha DATE,
ciudad VARCHAR(100),
pais VARCHAR(100),
capacidad INT,
dineroRecaudado DECIMAL(10, 2),
CONSTRAINT PK_Concierto PRIMARY KEY (codigo)
);

CREATE TABLE Usuario (
idUsuario INT IDENTITY (1,1),
nacionalidad VARCHAR(100),
nombre VARCHAR(100),
userName VARCHAR(100),
password VARCHAR(100),
edad INT,
numSeguidores INT,
CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario)
);

CREATE TABLE Contenido (
codigo INT IDENTITY (1,1),
idUsuario INT,
titulo VARCHAR(100),
lugarGrabacion VARCHAR(100),
valoracion DECIMAL(3, 2),
numeroReproducciones INT,
album VARCHAR(100),
anyoLanzamiento INT,
CONSTRAINT PK_Contenido PRIMARY KEY (codigo),
CONSTRAINT FK_Contenido_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Reproduccion (
id INT IDENTITY (1,1),
duracion INT,
codigoContenido INT,
fechaReproduccion DATE,
hora TIME,
valoracion INT,
idUsuario INT,
CONSTRAINT PK_Reproduccion PRIMARY KEY (id),
CONSTRAINT FK_Reproduccion_Contenido FOREIGN KEY (codigoContenido) REFERENCES Contenido(codigo) ON DELETE CASCADE,
CONSTRAINT FK_Reproduccion_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE NO ACTION
);

CREATE TABLE Subscripcion (
id INT IDENTITY (1,1),
tipo VARCHAR(100),
precio DECIMAL(5, 2),
descripcion VARCHAR(500),
CONSTRAINT PK_Subscripcion PRIMARY KEY (id)
);

CREATE TABLE Tarjeta (
numeroTarjeta VARCHAR(16),
telefono VARCHAR(9),
tipo VARCHAR(100),
nombreTitular VARCHAR(100),
cvv INT,
caducidad VARCHAR(5),
idUsuario INT,
CONSTRAINT PK_Tarjeta PRIMARY KEY (numeroTarjeta),
CONSTRAINT FK_Tarjeta_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE ListaReproduccion (
codigo INT IDENTITY (1,1),
fechaCreacion DATE,
nombre VARCHAR(100),
duracionTotal INT,
imagen VARCHAR(100),
numSeguidores INT,
CONSTRAINT PK_ListaReproduccion PRIMARY KEY (codigo)
);

CREATE TABLE ListaCanciones (
codigoLista INT,
codigoCancion INT,
fechaAgregado DATE,
CONSTRAINT PK_ListaCanciones PRIMARY KEY (codigoLista, codigoCancion),
CONSTRAINT FK_ListaCanciones_ListaReproduccion FOREIGN KEY (codigoLista) REFERENCES ListaReproduccion(codigo) ON DELETE CASCADE,
CONSTRAINT FK_ListaCanciones_Contenido FOREIGN KEY (codigoCancion) REFERENCES Contenido(codigo) ON DELETE CASCADE
);

CREATE TABLE ListaPodcasts (
codigoLista INT,
codigoPodcast INT,
fechaAgregado DATE,
CONSTRAINT PK_ListaPodcasts PRIMARY KEY (codigoLista, codigoPodcast),
CONSTRAINT FK_ListaPodcasts_ListaReproduccion FOREIGN KEY (codigoLista) REFERENCES ListaReproduccion(codigo) ON DELETE CASCADE,
CONSTRAINT FK_ListaPodcasts_Contenido FOREIGN KEY (codigoPodcast) REFERENCES Contenido(codigo) ON DELETE CASCADE
);

CREATE TABLE ConciertoArtista (
codigoConcierto INT,
idArtista INT,
CONSTRAINT PK_ConciertoArtista PRIMARY KEY (codigoConcierto, idArtista),
CONSTRAINT FK_ConciertoArtista_Concierto FOREIGN KEY (codigoConcierto) REFERENCES Concierto(codigo) ON DELETE CASCADE,
CONSTRAINT FK_ConciertoArtista_Artista FOREIGN KEY (idArtista) REFERENCES Artista(id) ON DELETE CASCADE
);

CREATE TABLE ArtistaContenido (
idArtista INT,
codigoContenido INT,
CONSTRAINT PK_ArtistaContenido PRIMARY KEY (idArtista, codigoContenido),
CONSTRAINT FK_ArtistaContenido_Artista FOREIGN KEY (idArtista) REFERENCES Artista(id) ON DELETE CASCADE,
CONSTRAINT FK_ArtistaContenido_Contenido FOREIGN KEY (codigoContenido) REFERENCES Contenido(codigo) ON DELETE CASCADE
);

CREATE TABLE SubscripcionUsuario (
idSubscripcion INT,
idUsuario INT,
CONSTRAINT PK_SubscripcionUsuario PRIMARY KEY (idSubscripcion, idUsuario),
CONSTRAINT FK_SubscripcionUsuario_Subscripcion FOREIGN KEY (idSubscripcion) REFERENCES Subscripcion(id) ON DELETE CASCADE,
CONSTRAINT FK_SubscripcionUsuario_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE CuentaPrincipal (
telefono VARCHAR(9),
metodoPago VARCHAR(100),
idUsuario INT,
CONSTRAINT PK_CuentaPrincipal PRIMARY KEY (telefono),
CONSTRAINT FK_CuentaPrincipal_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Departamento (
idDepartamento INT Identity (1,1),
nombre NVARCHAR(50),
fechaCreacion DATE,
NombreEncargado NVARCHAR(50),
numTrabajadores INT,
numSubDpto INT,
CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)
);

CREATE TABLE Empleado (
idEmpleado INT IDENTITY (1,1),
nombre NVARCHAR(50),
edad INT,
nacionalidad NVARCHAR(50),
fechaIncorporacion DATE,
idDepartamento INT,
CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado),
CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento) ON DELETE CASCADE
);


/*Checks*/

-- Check para la tabla Contenido: asegura que la valoración esté dentro del rango válido (entre 0 y 10)
ALTER TABLE Contenido
ADD CONSTRAINT CHK_Valoracion
CHECK (valoracion >= 0 AND valoracion <= 10);

-- Check para la tabla Usuario: asegura que la edad sea un valor positivo
ALTER TABLE Usuario
ADD CONSTRAINT CHK_EdadPositiva
CHECK (edad >= 0);

-- Check para la tabla Reproduccion: asegura que la duración sea un valor positivo
ALTER TABLE Reproduccion
ADD CONSTRAINT CHK_DuracionPositiva
CHECK (duracion >= 0);

-- Check para la tabla Subscripcion: asegura que el precio sea un valor positivo
ALTER TABLE Subscripcion
ADD CONSTRAINT CHK_PrecioPositivo
CHECK (precio >= 0);

-- Check para la tabla Tarjeta: asegura que el número de tarjeta tenga 16 dígitos
ALTER TABLE Tarjeta
ADD CONSTRAINT CHK_LongitudNumeroTarjeta
CHECK (LEN(numeroTarjeta) = 16);

-- Check para la tabla Departamento: asegura que el número de trabajadores.
ALTER TABLE Departamento
ADD CONSTRAINT CHK_NumTrabajadoresPositivo
CHECK (numTrabajadores >= 0);

-- Check para la tabla Artista: asegura que el número de premios sea un valor no negativo
ALTER TABLE Artista
ADD CONSTRAINT CHK_NumPremiosNoNegativo
CHECK (numPremios >= 0);

-- Check para la tabla ListaReproduccion: asegura que la duración total sea un valor positivo
ALTER TABLE ListaReproduccion
ADD CONSTRAINT CHK_DuracionTotalPositiva
CHECK (duracionTotal >= 0);

-- Check para la tabla Empleado: asegura que la edad sea mayor o igual a 18
ALTER TABLE Empleado
ADD CONSTRAINT CHK_EdadMayor18
CHECK (edad >= 18);

-- Check para la tabla Concierto: asegura que la capacidad sea un valor positivo
ALTER TABLE Concierto
ADD CONSTRAINT CHK_CapacidadPositiva
CHECK (capacidad > 0);

-- Check para la tabla SubscripcionUsuario: asegura que el idSubscripcion sea mayor a 0
ALTER TABLE SubscripcionUsuario
ADD CONSTRAINT CHK_IdSubscripcionPositivo
CHECK (idSubscripcion > 0);


-- CATEGORIA
INSERT INTO Categoria (nombre, descripcion)
VALUES
    ('Rock', 'Género musical caracterizado por el uso de instrumentos como la guitarra eléctrica y la batería.'),
    ('Pop', 'Género musical popular que abarca una amplia variedad de estilos y tendencias.'),
    ('Hip Hop', 'Género musical que se caracteriza por la rima y la poesía hablada en ritmo.'),
    ('Jazz', 'Género musical que se originó en comunidades afroamericanas, conocido por su improvisación y swing.'),
    ('Electrónica', 'Género musical que utiliza principalmente instrumentos y tecnología electrónica para su producción.'),
    
    ('Reggae', 'Género musical originario de Jamaica, conocido por su ritmo distintivo y letras sociales.'),
    ('Metal', 'Género musical caracterizado por su sonido pesado, distorsionado y agresivo.'),
    ('R&B', 'Género musical que combina elementos de rhythm and blues, soul y hip hop.'),
    ('Clásica', 'Género musical que se caracteriza por su composición estructurada y uso de instrumentos orquestales.'),
    ('Country', 'Género musical popular en la música folclórica estadounidense, con influencias del blues y el folk.'),
    
    ('True Crime', 'Podcasts que exploran crímenes reales y casos sin resolver.'),
    ('Comedia', 'Podcasts que se centran en el humor y la comedia.'),
    ('Entrevistas', 'Podcasts que presentan entrevistas con personas famosas o expertas en diversos campos.'),
    ('Noticias', 'Podcasts que analizan y discuten noticias actuales y eventos importantes.'),
    ('Historia', 'Podcasts que exploran eventos históricos y narran historias del pasado.'),
    
    ('Ciencia y Tecnología', 'Podcasts que tratan temas relacionados a la ciencia y avances tecnológicos.'),
    ('Sociedad y Cultura', 'Podcasts que exploran temas sociales, culturales y antropológicos.'),
    ('Política', 'Podcasts que discuten temas políticos y analizan eventos políticos actuales.'),
    ('Negocios y Finanzas', 'Podcasts que brindan consejos y análisis sobre negocios y finanzas.'),
    ('Salud y Bienestar', 'Podcasts que ofrecen información y consejos sobre salud física y mental.');


--ARTISTA
INSERT INTO Artista (nombre, fechaInicio, nacionalidad, numPremios, generoMusical)
VALUES
    ('Queen', '1970-06-27', 'Reino Unido', 45, 'Rock'),
    ('Ed Sheeran', '2004-01-01', 'Reino Unido', 23, 'Pop'),
    ('Nirvana', '1987-01-01', 'Estados Unidos', 7, 'Rock'),
    ('Eagles', '1971-02-01', 'Estados Unidos', 35, 'Rock'),
    ('Luis Fonsi', '1998-01-01', 'Puerto Rico', 12, 'Pop'),
    
    ('John Lennon', '1956-01-01', 'Reino Unido', 18, 'Rock'),
    ('Led Zeppelin', '1968-09-25', 'Reino Unido', 30, 'Rock'),
    ('Sting', '1977-01-01', 'Reino Unido', 16, 'Pop'),
    ('Michael Jackson', '1964-01-01', 'Estados Unidos', 79, 'Pop'),
    ('The Beatles', '1960-08-01', 'Reino Unido', 123, 'Rock'),
    
    ('Bob Dylan', '1959-01-01', 'Estados Unidos', 42, 'Folk'),
    ('Metallica', '1981-10-28', 'Estados Unidos', 48, 'Metal'),
    ('Louis C.K.', '1984-01-01', 'Estados Unidos', 9, 'Comedia'),
    ('Dan Carlin', '1996-01-01', 'Estados Unidos', 6, 'Podcast'),
    ('Neil deGrasse Tyson', '1980-01-01', 'Estados Unidos', 11, 'Podcast'),
    
    ('Iker Jiménez', '1987-01-01', 'España', 14, 'Podcast'),
    ('Lana Del Rey', '2005-01-01', 'Estados Unidos', 5, 'Pop'),
    ('The Rolling Stones', '1962-07-12', 'Reino Unido', 72, 'Rock'),
    ('Eva Cassidy', '1986-01-01', 'Estados Unidos', 3, 'Jazz'),
    ('Frank Sinatra', '1935-01-01', 'Estados Unidos', 31, 'Jazz');

--CONCIERTO
INSERT INTO Concierto (lugar, fecha, ciudad, pais, capacidad, dineroRecaudado)
VALUES
    ('Wembley Stadium', '2023-07-15', 'Londres', 'Reino Unido', 80000, 1500000.00),
    ('Madison Square Garden', '2023-09-02', 'Nueva York', 'Estados Unidos', 20000, 1200000.00),
    ('Estadio Azteca', '2023-06-10', 'Ciudad de México', 'México', 90000, 1800000.00),
    ('Estadio Maracaná', '2023-08-20', 'Río de Janeiro', 'Brasil', 75000, 1300000.00),
    ('O2 Arena', '2023-07-30', 'Londres', 'Reino Unido', 18000, 800000.00),
    
    ('Stade de France', '2023-09-12', 'París', 'Francia', 70000, 1400000.00),
    ('Estadio Nacional', '2023-06-25', 'Santiago', 'Chile', 45000, 900000.00),
    ('Arena di Verona', '2023-08-05', 'Verona', 'Italia', 15000, 600000.00),
    ('Estadio Monumental', '2023-07-18', 'Buenos Aires', 'Argentina', 60000, 1100000.00),
    ('Red Rocks Amphitheatre', '2023-09-28', 'Denver', 'Estados Unidos', 9500, 500000.00),
    
    ('The O2', '2023-06-15', 'Dublín', 'Irlanda', 20000, 1000000.00),
    ('Tokyo Dome', '2023-08-10', 'Tokio', 'Japón', 55000, 1200000.00),
    ('Estadio Nacional', '2023-07-22', 'Lima', 'Perú', 35000, 750000.00),
    ('Estádio do Dragão', '2023-09-08', 'Oporto', 'Portugal', 28000, 650000.00),
    ('Estadio Monumental', '2023-06-20', 'Guadalajara', 'México', 40000, 900000.00),
    
    ('Estadio Nacional', '2023-08-15', 'Bogotá', 'Colombia', 50000, 1000000.00),
    ('Hollywood Bowl', '2023-07-27', 'Los Ángeles', 'Estados Unidos', 17000, 800000.00),
    ('Estadio Metropolitano', '2023-09-05', 'Madrid', 'España', 60000, 1300000.00),
    ('Wembley Arena', '2023-06-28', 'Londres', 'Reino Unido', 12000, 600000.00),
    ('Estadio Nacional', '2023-08-18', 'Montevideo', 'Uruguay', 32000, 700000.00);

--USUARIO
INSERT INTO Usuario (nacionalidad, nombre, userName, password, edad, numSeguidores)
VALUES
    ('Estados Unidos', 'John Doe', 'johndoe', 'password1', 28, 5000),
    ('Reino Unido', 'Jane Smith', 'janesmith', 'password2', 32, 7000),
    ('España', 'Pedro López', 'pedrolopez', 'password3', 24, 3000),
    ('Francia', 'Sophie Martin', 'sophiemartin', 'password4', 35, 6000),
    ('Brasil', 'Lucas Silva', 'lucassilva', 'password5', 30, 4000),

    ('Alemania', 'Anna Müller', 'annamuller', 'password6', 29, 5500),
    ('Italia', 'Marco Rossi', 'marcorossi', 'password7', 27, 4800),
    ('México', 'María Hernández', 'mariahernandez', 'password8', 31, 6800),
    ('Canadá', 'Emily Johnson', 'emilyjohnson', 'password9', 26, 5200),
    ('Australia', 'Oliver Wilson', 'oliverwilson', 'password10', 33, 7500),

    ('Argentina', 'Carolina Gómez', 'carolinagomez', 'password11', 29, 4200),
    ('India', 'Raj Patel', 'rajpatel', 'password12', 34, 5700),
    ('China', 'Li Wei', 'liwei', 'password13', 25, 3800),
    ('Japón', 'Yuki Nakamura', 'yukinakamura', 'password14', 23, 4100),
    ('Rusia', 'Ivan Petrov', 'ivanpetrov', 'password15', 28, 4600),

    ('Sudáfrica', 'Lerato Mbeki', 'leratombeki', 'password16', 30, 6200),
    ('Suecia', 'Erik Andersson', 'erikandersson', 'password17', 27, 5500),
    ('Noruega', 'Ingrid Olsen', 'ingridolsen', 'password18', 29, 4900),
    ('Portugal', 'Miguel Silva', 'miguelsilva', 'password19', 32, 5300),
    ('Países Bajos', 'Lotte de Vries', 'lottedevries', 'password20', 31, 5800);


	--CONTENIDO
INSERT INTO Contenido (idUsuario, titulo, lugarGrabacion, valoracion, numeroReproducciones, album, anyoLanzamiento)
VALUES (1, 'Bohemian Rhapsody', 'Estudio A', 4.5, 100, 'A Night at the Opera', 1975),
       (2, 'Hotel California', 'Estudio B', 4.7, 150, 'Hotel California', 1976),
       (3, 'Imagine', 'Estudio C', 4.9, 200, 'Imagine', 1971),
       (4, 'Smells Like Teen Spirit', 'Estudio D', 4.3, 180, 'Nevermind', 1991),
       (5, 'Stairway to Heaven', 'Estudio E', 4.8, 220, 'Led Zeppelin IV', 1971),
       (1, 'Hey Jude', 'Estudio A', 4.6, 120, 'The Beatles (White Album)', 1968),
       (2, 'Yesterday', 'Estudio B', 4.4, 90, 'Help!', 1965),
       (3, 'Wonderwall', 'Estudio C', 4.2, 160, '(What''s the Story) Morning Glory?', 1995),
       (4, 'Sweet Child o'' Mine', 'Estudio D', 4.7, 210, 'Appetite for Destruction', 1987),
       (5, 'Smooth Criminal', 'Estudio E', 4.5, 140, 'Bad', 1987),
       (1, 'Imagine Dragons', 'Estudio A', 4.1, 180, 'Night Visions', 2012),
       (2, 'Rolling in the Deep', 'Estudio B', 4.3, 230, '21', 2010),
       (3, 'Boys Don''t Cry', 'Estudio C', 4.2, 120, 'Three Imaginary Boys', 1979),
       (4, 'Like a Rolling Stone', 'Estudio D', 4.9, 270, 'Highway 61 Revisited', 1965),
       (5, 'I Will Always Love You', 'Estudio E', 4.8, 200, 'The Bodyguard Soundtrack', 1992),
       (1, 'Billie Jean', 'Estudio A', 4.7, 250, 'Thriller', 1982),
       (2, 'Smells Like Teen Spirit', 'Estudio B', 4.5, 220, 'Nevermind', 1991),
       (3, 'Wonderful Tonight', 'Estudio C', 4.6, 190, 'Slowhand', 1977),
       (4, 'Angie', 'Estudio D', 4.4, 170, 'Goats Head Soup', 1973),
       (5, 'Hallelujah', 'Estudio E', 4.9, 260, 'Various Positions', 1984);


--REPRODUCCION
INSERT INTO Reproduccion (duracion, codigoContenido, fechaReproduccion, hora, valoracion, idUsuario)
VALUES
    (240, 1, '2023-05-01', '14:30:00', 5, 1),
    (210, 2, '2023-05-02', '09:45:00', 4, 3),
    (180, 3, '2023-05-03', '18:15:00', 4, 5),
    (300, 4, '2023-05-04', '20:00:00', 5, 7),
    (220, 5, '2023-05-05', '11:20:00', 4, 9),
    
    (260, 6, '2023-05-06', '16:45:00', 5, 11),
    (190, 7, '2023-05-07', '13:10:00', 4, 13),
    (270, 8, '2023-05-08', '10:30:00', 5, 15),
    (230, 9, '2023-05-09', '19:45:00', 4, 17),
    (250, 10, '2023-05-10', '15:20:00', 5, 19),
    
    (180, 11, '2023-05-11', '12:40:00', 4, 2),
    (210, 12, '2023-05-12', '17:55:00', 5, 4),
    (240, 13, '2023-05-13', '14:15:00', 4, 6),
    (290, 14, '2023-05-14', '08:50:00', 5, 8),
    (200, 15, '2023-05-15', '20:30:00', 4, 10),
    
    (250, 16, '2023-05-16', '11:10:00', 5, 12),
    (170, 17, '2023-05-17', '13:35:00', 4, 14),
    (220, 18, '2023-05-18', '09:00:00', 5, 16),
    (190, 19, '2023-05-19', '18:25:00', 4, 18),
    (230, 20, '2023-05-20', '16:05:00', 5, 20);

--Suscripcion

INSERT INTO Subscripcion (tipo, precio, descripcion)
VALUES 
    ('BÁSICA', 0.00, 'La suscripción básica te ofrece acceso limitado a nuestra aplicación de música. Disfruta de una selección de canciones populares de diversos géneros y artistas. Explora nuestras listas de reproducción recomendadas y disfruta de la música en cualquier momento y lugar.'),
    ('PREMIUM INDIVIDUAL', 19.99, 'La suscripción premium individual te brinda acceso ilimitado a nuestra aplicación de música. Descubre millones de canciones de tus artistas favoritos y explora nuevos géneros musicales. Disfruta de una experiencia sin anuncios y descarga canciones para escucharlas sin conexión. Crea tus propias listas de reproducción y comparte tu música con amigos.'),
    ('PREMIUM FAMILY', 29.99, 'La suscripción premium familiar es perfecta para toda la familia. Con esta suscripción, tú y tus seres queridos podrán disfrutar de todas las ventajas de nuestra aplicación de música. Cada miembro de la familia puede crear perfiles personalizados, acceder a una amplia biblioteca de canciones y disfrutar de la música sin interrupciones publicitarias. Comparte y descubre música juntos.'),
    ('PREMIUM DUO', 14.99, 'La suscripción premium dúo es ideal para parejas o amigos amantes de la música. Obtén acceso completo a nuestra aplicación de música y disfruta de todas las características premium diseñadas para dos usuarios. Escucha música ilimitada sin anuncios, descarga tus canciones favoritas para escucharlas sin conexión y disfruta de recomendaciones personalizadas para ambos.'),
    ('PREMIUM STUDENT', 4.99, 'La suscripción premium para estudiantes es una oferta especial pensada exclusivamente para estudiantes. Obtén acceso completo a nuestra aplicación de música y disfruta de todos los beneficios del plan premium a un precio reducido. Escucha tus canciones favoritas sin límites, descubre nuevos artistas y mantente concentrado mientras estudias con nuestras listas de reproducción curadas para estudiantes.');

--tarjeta
INSERT INTO Tarjeta (numeroTarjeta, telefono, tipo, nombreTitular, cvv, caducidad, idUsuario)
VALUES
('1234567890123456', '123456789', 'Visa', 'Juan Perez', 123, '12/23', 1),
('2345678901234567', '234567890', 'Mastercard', 'Maria Lopez', 456, '06/24', 2),
('3456789012345678', '345678901', 'Mastercard', 'Pedro Ramirez', 789, '09/25', 3),
('4567890123456789', '456789012', 'Visa', 'Ana Martinez', 321, '11/23', 4),
('5678901234567890', '567890123', 'Mastercard', 'Luisa Sanchez', 654, '04/24', 5),

('6789012345678901', '678901234', 'Visa', 'Carlos Gonzalez', 987, '10/23', 6),
('7890123456789012', '789012345', 'Mastercard', 'Laura Torres', 210, '03/24', 7),
('8901234567890123', '890123456', 'Visa', 'Andres Herrera', 543, '08/25', 8),
('9012345678901234', '901234567', 'Mastercard', 'Gabriela Castro', 876, '09/23', 9),
('1023456789012345', '102345678', 'Visa', 'Ricardo Gomez', 109, '05/24', 10);

--('1122334455667788', '112233445', 'Mastercard', 'Sofia Ramirez', 242, '07/25', 11),
--('1231231231231231', '987654321', 'Visa', 'Julio Hernandez', 555, '08/23', 12),
--('4564564564564564', '678905432', 'Mastercard', 'Patricia Silva', 888, '02/24', 13),
--('7897897897897897', '543216789', 'Visa', 'Eduardo Torres', 111, '06/25', 14),
--('3213213213213213', '987654321', 'Mastercard', 'Martha Castro', 444, '07/23', 15),

--('6546546546546546', '678905432', 'Visa', 'Roberto Medina', 777, '01/24', 16),
--('9879879879879878', '543216789', 'Mastercard', 'Carolina Vargas', 123, '05/25', 17),
--('1112223334445556', '987654321', 'Visa', 'Fernando Mendoza', 333, '06/23', 18),
--('4445556667778889', '678905432', 'Mastercard', 'Daniela Navarro', 666, '12/24', 19),
--('7778889990001112', '543216789', 'Visa', 'Javier Morales', 999, '04/25', 20);


--Listareproduccion
INSERT INTO ListaReproduccion (fechaCreacion, nombre, duracionTotal, imagen, numSeguidores)
VALUES
('2023-01-01', 'Playlist 1', 120, 'imagen1.jpg', 100),
('2023-02-02', 'Playlist 2', 180, 'imagen2.jpg', 200),
('2023-03-03', 'Playlist 3', 90, 'imagen3.jpg', 150),
('2023-04-04', 'Playlist 4', 240, 'imagen4.jpg', 300),
('2023-05-05', 'Playlist 5', 150, 'imagen5.jpg', 250),

('2023-06-06', 'Playlist 6', 200, 'imagen6.jpg', 400),
('2023-07-07', 'Playlist 7', 170, 'imagen7.jpg', 350),
('2023-08-08', 'Playlist 8', 130, 'imagen8.jpg', 180),
('2023-09-09', 'Playlist 9', 210, 'imagen9.jpg', 220),
('2023-10-10', 'Playlist 10', 160, 'imagen10.jpg', 270),

('2023-11-11', 'Playlist 11', 190, 'imagen11.jpg', 320),
('2023-12-12', 'Playlist 12', 140, 'imagen12.jpg', 150),
('2024-01-01', 'Playlist 13', 120, 'imagen13.jpg', 100),
('2024-02-02', 'Playlist 14', 180, 'imagen14.jpg', 200),
('2024-03-03', 'Playlist 15', 90, 'imagen15.jpg', 150),

('2024-04-04', 'Playlist 16', 240, 'imagen16.jpg', 300),
('2024-05-05', 'Playlist 17', 150, 'imagen17.jpg', 250),
('2024-06-06', 'Playlist 18', 200, 'imagen18.jpg', 400),
('2024-07-07', 'Playlist 19', 170, 'imagen19.jpg', 350),
('2024-08-08', 'Playlist 20', 130, 'imagen20.jpg', 180);

--ListaCanciones
INSERT INTO ListaCanciones (codigoLista, codigoCancion, fechaAgregado)
VALUES
    (1, 1, '2023-05-01'),
    (1, 2, '2023-05-01'),
    (1, 3, '2023-05-02'),
    (2, 4, '2023-05-03'),
    (2, 5, '2023-05-04'),
    (2, 6, '2023-05-04'),
    (3, 7, '2023-05-05'),
    (3, 8, '2023-05-05'),
    (3, 9, '2023-05-06'),
    (4, 10, '2023-05-07'),
    (4, 11, '2023-05-07'),
    (4, 12, '2023-05-08');
    
--ListaPodcast
INSERT INTO ListaPodcasts (codigoLista, codigoPodcast, fechaAgregado)
VALUES
    (5, 13, '2023-05-09'),
    (5, 14, '2023-05-09'),
    (5, 15, '2023-05-10'),
    (6, 16, '2023-05-11'),
    (6, 17, '2023-05-11'),
    (6, 18, '2023-05-12'),
    (7, 19, '2023-05-13'),
    (7, 20, '2023-05-14');

--conciertoArtista
INSERT INTO ConciertoArtista (codigoConcierto, idArtista)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 11),
    (6, 12),
    (7, 13),
    (7, 14),
    (8, 15),
    (8, 16),
    (9, 17),
    (9, 18),
    (10, 19),
    (10, 20);

--artistaContenido
INSERT INTO ArtistaContenido (idArtista, codigoContenido)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 11),
    (6, 12),
    (7, 13),
    (7, 14),
    (8, 15),
    (8, 16),
    (9, 17),
    (9, 18),
    (10, 19),
    (10, 20);

--suscripcionUsuario
INSERT INTO SubscripcionUsuario (idSubscripcion, idUsuario)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (5, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (4, 16),
    (4, 17),
    (4, 18),
    (4, 19),
    (4, 20);

--CuentaPrincipal
INSERT INTO CuentaPrincipal (telefono, metodoPago, idUsuario)
VALUES
    ('123456789', 'Visa', 1),
    ('987654321', 'Mastercard', 2),
    ('555555555', 'Mastercard', 3),
    ('999999999', 'Visa', 4),
    ('111111111', 'Mastercard', 5),
    ('123456780', 'Visa', 6),
    ('987654322', 'Mastercard', 7),
    ('555555556', 'Visa', 8),
    ('999999990', 'Mastercard', 9),
    ('111111112', 'Visa', 10);


    
-- NUEVOS INSERTS

-- Departamento
INSERT INTO Departamento (nombre, fechaCreacion, NombreEncargado, numTrabajadores, numSubDpto)
VALUES
    ('Atencion al Cliente', '2020-01-01', 'Encargado A', 10, 2),
    ('Sonido', '2019-05-15', 'Encargado B', 15, 3),
    ('Video', '2021-03-10', 'Encargado C', 8, 1),
    ('Redes sociales', '2018-11-30', 'Encargado D', 12, 2),
    ('Diseño', '2023-06-01', 'Encargado E', 20, 3);

-- Empleado
INSERT INTO Empleado (nombre, edad, nacionalidad, fechaIncorporacion, idDepartamento)
VALUES
    ('John Smith', 30, 'Estados Unidos', '2019-02-28', 1),
    ('Emma Johnson', 28, 'Canadá', '2020-07-10', 1),
    ('Carlos López', 35, 'México', '2021-01-15', 2),
    ('Sophia Martinez', 32, 'España', '2018-09-20', 2),
    ('Liam Anderson', 27, 'Reino Unido', '2022-03-05', 3),
    ('Isabella Thompson', 31, 'Australia', '2019-06-12', 3),
    ('David Garcia', 29, 'México', '2020-11-25', 4),
    ('Mia Robinson', 33, 'Estados Unidos', '2021-04-30', 4),
    ('Daniel Lee', 26, 'Corea del Sur', '2018-10-15', 5),
    ('Olivia Kim', 30, 'Corea del Sur', '2022-02-01', 5),
    ('Alexander Chen', 28, 'China', '2019-07-20', 1),
    ('Emily Nguyen', 35, 'Vietnam', '2020-12-10', 1),
    ('Michael Ahmed', 32, 'Egipto', '2021-05-15', 2),
    ('Sofia Ramos', 27, 'Brasil', '2018-11-28', 2),
    ('Benjamin Silva', 31, 'Chile', '2022-04-05', 3),
    ('Ava Costa', 29, 'Portugal', '2019-09-18', 3),
    ('James Patel', 33, 'India', '2020-02-25', 4),
    ('Emma Kim', 26, 'Corea del Sur', '2018-12-05', 4),
    ('Lucas Santos', 30, 'Brasil', '2021-01-10', 5),
    ('Sophia Yin', 28, 'China', '2019-06-20', 5);
