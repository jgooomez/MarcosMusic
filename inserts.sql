-- CATEGORIA
INSERT INTO Categoria (nombre, descripcion)
VALUES
    ('Rock', 'Género musical caracterizado por su energía y uso de guitarras eléctricas.'),
    ('Pop', 'Género musical comercialmente orientado y de fácil acceso.'),
    ('Hip Hop', 'Género musical que se enfoca en el ritmo y la rima.'),
    ('Jazz', 'Género musical que se originó en comunidades afroamericanas y se caracteriza por su improvisación.'),
    ('Electrónica', 'Género musical que utiliza principalmente instrumentos electrónicos y tecnología de producción.'),
    ('Clásica', 'Género musical basado en las tradiciones de la música clásica europea.'),
    ('Reggae', 'Género musical originario de Jamaica que mezcla música caribeña y ritmos de rhythm and blues.'),
    ('Country', 'Género musical popularizado en el sur de Estados Unidos y caracterizado por su instrumentación y narrativa lírica.'),
    ('R&B', 'Género musical que combina elementos de rhythm and blues, soul y funk.'),
    ('Metal', 'Género musical que se caracteriza por su sonido pesado y agresivo.'),
    ('Funk', 'Género musical rítmico que se basa en el groove y la improvisación.'),
    ('Salsa', 'Género musical de origen latino que combina elementos de la música cubana y caribeña.'),
    ('Reguetón', 'Género musical popularizado en América Latina y el Caribe que combina reggae, hip hop y música electrónica.'),
    ('Comedia', 'Podcast enfocado en presentar contenido humorístico y entretenido.'),
    ('Historia', 'Podcast que explora y narra eventos históricos y sucesos relevantes.'),
    ('Ciencia', 'Podcast que aborda temas científicos y descubrimientos en diversas áreas.'),
    ('True Crime', 'Podcast que investiga y relata crímenes reales y casos sin resolver.'),
    ('Tecnología', 'Podcast que analiza las últimas noticias y tendencias tecnológicas.'),
    ('Entrevistas', 'Podcast en el que se realizan entrevistas a personalidades destacadas en diferentes campos.'),
    ('Política', 'Podcast que analiza y discute temas políticos y asuntos de actualidad.');

--CONTENIDO
INSERT INTO Contenido (titulo, lugarGrabacion, valoracion, numeroReproducciones, album, anyoLanzamiento)
VALUES
    ('Bohemian Rhapsody', 'Reino Unido', 4.8, 1000000, 'A Night at the Opera', 1975),
    ('Shape of You', 'Estados Unidos', 4.5, 850000, '÷', 2017),
    ('Smells Like Teen Spirit', 'Estados Unidos', 4.7, 900000, 'Nevermind', 1991),
    ('Hotel California', 'Estados Unidos', 4.9, 950000, 'Hotel California', 1976),
    ('Despacito', 'Puerto Rico', 4.6, 950000, 'Vida', 2019),
    ('Imagine', 'Reino Unido', 4.7, 800000, 'Imagine', 1971),
    ('Stairway to Heaven', 'Reino Unido', 4.9, 980000, 'Led Zeppelin IV', 1971),
    ('Shape of My Heart', 'Reino Unido', 4.5, 890000, 'Ten Summoner''s Tales', 1993),
    ('Billie Jean', 'Estados Unidos', 4.8, 920000, 'Thriller', 1982),
    ('Hey Jude', 'Reino Unido', 4.7, 950000, 'Hey Jude', 1968),
    ('Yesterday', 'Reino Unido', 4.9, 970000, 'Help!', 1965),
    ('Like a Rolling Stone', 'Estados Unidos', 4.7, 910000, 'Highway 61 Revisited', 1965),
    ('Podcast de Comedia 1', 'Estados Unidos', 4.2, 50000, NULL, NULL),
    ('Podcast de Historia 1', 'Reino Unido', 4.4, 60000, NULL, NULL),
    ('Podcast de Ciencia 1', 'España', 4.3, 55000, NULL, NULL),
    ('Podcast de True Crime 1', 'Argentina', 4.5, 70000, NULL, NULL),
    ('Podcast de Tecnología 1', 'México', 4.1, 45000, NULL, NULL),
    ('Podcast de Entrevistas 1', 'Estados Unidos', 4.3, 58000, NULL, NULL),
    ('Podcast de Política 1', 'Reino Unido', 4.4, 63000, NULL, NULL),
    ('Podcast de Comedia 2', 'España', 4.2, 52000, NULL, NULL);

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
INSERT INTO Usuario (nacionalidad, nombre, fotoPerfil, edad, numSeguidores)
VALUES
    ('Estados Unidos', 'John Doe', 'dog.png', 28, 5000),
    ('Reino Unido', 'Jane Smith', 'cat.png', 32, 7000),
    ('España', 'Pedro López', 'cookie.png', 24, 3000),
    ('Francia', 'Sophie Martin', 'pig.png', 35, 6000),
    ('Brasil', 'Lucas Silva', 'cloud.png', 30, 4000),
    ('Alemania', 'Anna Müller', 'dog.png', 29, 5500),
    ('Italia', 'Marco Rossi', 'cat.png', 27, 4800),
    ('México', 'María Hernández', 'cookie.png', 31, 6800),
    ('Canadá', 'Emily Johnson', 'pig.png', 26, 5200),
    ('Australia', 'Oliver Wilson', 'cloud.png', 33, 7500),
    ('Argentina', 'Carolina Gómez', 'dog.png', 29, 4200),
    ('India', 'Raj Patel', 'cat.png', 34, 5700),
    ('China', 'Li Wei', 'cookie.png', 25, 3800),
    ('Japón', 'Yuki Nakamura', 'pig.png', 23, 4100),
    ('Rusia', 'Ivan Petrov', 'cloud.png', 28, 4600),
    ('Sudáfrica', 'Lerato Mbeki', 'dog.png', 30, 6200),
    ('Suecia', 'Erik Andersson', 'cat.png', 27, 5500),
    ('Noruega', 'Ingrid Olsen', 'cookie.png', 29, 4900),
    ('Portugal', 'Miguel Silva', 'pig.png', 32, 5300),
    ('Países Bajos', 'Lotte de Vries', 'cloud.png', 31, 5800);

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

INSERT INTO Subscripcion (tipo, precio)
VALUES
    ('básica', 9.99),
    ('premium', 14.99),
    ('familiar', 24.99),
    ('estudiante', 4.99),
    ('mensual', 6.99);

--tarjeta
INSERT INTO Tarjeta (numeroTarjeta, telefono, tipo, nombreTitular, cvv, caducidad, idUsuario)
VALUES
(1234567890123456, 1234567890, 'Visa', 'Juan Perez', 123, '2023-12-31', 1),
(2345678901234567, 2345678901, 'Mastercard', 'Maria Lopez', 456, '2024-06-30', 2),
(3456789012345678, 3456789012, 'American Express', 'Pedro Ramirez', 789, '2025-09-30', 3),
(4567890123456789, 4567890123, 'Visa', 'Ana Martinez', 321, '2023-11-30', 4),
(5678901234567890, 5678901234, 'Mastercard', 'Luisa Sanchez', 654, '2024-04-30', 5),
(6789012345678901, 6789012345, 'Visa', 'Carlos Gonzalez', 987, '2023-10-31', 6),
(7890123456789012, 7890123456, 'Mastercard', 'Laura Torres', 210, '2024-03-31', 7),
(8901234567890123, 8901234567, 'Visa', 'Andres Herrera', 543, '2025-08-31', 8),
(9012345678901234, 9012345678, 'American Express', 'Gabriela Castro', 876, '2023-09-30', 9),
(1023456789012345, 1023456789, 'Visa', 'Ricardo Gomez', 109, '2024-05-31', 10),
(1122334455667788, 1122334455, 'Mastercard', 'Sofia Ramirez', 242, '2025-07-31', 11),
(1231231231231231, 9876543210, 'Visa', 'Julio Hernandez', 555, '2023-08-31', 12),
(4564564564564564, 6789054321, 'Mastercard', 'Patricia Silva', 888, '2024-02-28', 13),
(7897897897897897, 5432167890, 'Visa', 'Eduardo Torres', 111, '2025-06-30', 14),
(3213213213213213, 9876543211, 'Mastercard', 'Martha Castro', 444, '2023-07-31', 15),
(6546546546546546, 6789054322, 'Visa', 'Roberto Medina', 777, '2024-01-31', 16),
(9879879879879878, 5432167891, 'American Express', 'Carolina Vargas', 000, '2025-05-31', 17),
(1112223334445556, 9876543212, 'Visa', 'Fernando Mendoza', 333, '2023-06-30', 18),
(4445556667778889, 6789054323, 'Mastercard', 'Daniela Navarro', 666, '2024-12-31', 19),
(7778889990001112, 5432167892, 'Visa', 'Javier Morales', 999, '2025-04-30', 20);

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
(1234567890, 'Visa', 1),
(9876543210, 'Mastercard', 2),
(5555555555, 'Visa', 3),
(9999999999, 'Mastercard', 4),
(1111111111, 'Visa', 5);

-- -- -- NUEVOS INSERTS -- -- --
INSERT INTO Departamento (idDepartamento, nombre, fechaCreacion, NombreEncargado, numTrabajadores, numSubDpto)
VALUES
    (1, 'RRHH', '2020-01-01', 'Encargado A', 10, 2),
    (2, 'Recursos', '2019-05-15', 'Encargado B', 15, 3),
    (3, 'I+D', '2021-03-10', 'Encargado C', 8, 1),
    (4, 'Marketing', '2018-11-30', 'Encargado D', 12, 2);

INSERT INTO Empleado (idEmpleado, nombre, edad, nacionalidad, fechaIncorporacion, departamento)
VALUES
(1, 'John Smith', 30, 'Estados Unidos', '2019-02-28', 'RRHH'),
(2, 'Emma Johnson', 28, 'Canadá', '2020-07-10', 'RRHH'),
(3, 'Carlos López', 35, 'México', '2021-01-15', 'Recursos'),
(4, 'Sophia Martinez', 32, 'España', '2018-09-20', 'Recursos'),
(5, 'Liam Anderson', 27, 'Reino Unido', '2022-03-05', 'I+D'),
(6, 'Isabella Thompson', 31, 'Australia', '2019-06-12', 'I+D'),
(7, 'David Garcia', 29, 'México', '2020-11-25', 'Marketing'),
(8, 'Mia Robinson', 33, 'Estados Unidos', '2021-04-30', 'Marketing'),
(9, 'Daniel Lee', 26, 'Corea del Sur', '2018-10-15', 'RRHH'),
(10, 'Olivia Kim', 30, 'Corea del Sur', '2022-02-01', 'RRHH'),
(11, 'Alexander Chen', 28, 'China', '2019-07-20', 'Recursos'),
(12, 'Emily Nguyen', 35, 'Vietnam', '2020-12-10', 'Recursos'),
(13, 'Michael Ahmed', 32, 'Egipto', '2021-05-15', 'I+D'),
(14, 'Sofia Ramos', 27, 'Brasil', '2018-11-28', 'I+D'),
(15, 'Benjamin Silva', 31, 'Chile', '2022-04-05', 'Marketing'),
(16, 'Ava Costa', 29, 'Portugal', '2019-09-18', 'Marketing'),
(17, 'James Patel', 33, 'India', '2020-02-25', 'RRHH'),
(18, 'Emma Kim', 26, 'Corea del Sur', '2018-12-05', 'RRHH'),
(19, 'Lucas Santos', 30, 'Brasil', '2021-01-10', 'Recursos'),
(20, 'Sophia Yin', 28, 'China', '2019-06-20', 'Recursos');
