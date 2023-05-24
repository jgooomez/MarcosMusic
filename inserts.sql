-- Inserts para la tabla Categoria
INSERT INTO Categoria (nombre, descripcion)
VALUES
    ('Pop', 'Género musical pop'),
    ('Rock', 'Género musical rock'),
    ('Hip Hop', 'Género musical hip hop'),
    ('R&B', 'Género musical R&B'),
    ('Jazz', 'Género musical jazz'),
    ('Reggae', 'Género musical reggae'),
    ('Country', 'Género musical country'),
    ('Electrónica', 'Género musical electrónica'),
    ('Indie', 'Género musical indie'),
    ('Metal', 'Género musical metal'),
    
    ('Clásica', 'Género musical clásica'),
    ('Folk', 'Género musical folk'),
    ('Blues', 'Género musical blues'),
    ('Salsa', 'Género musical salsa'),
    ('Merengue', 'Género musical merengue'),
    ('Cumbia', 'Género musical cumbia'),
    ('Bachata', 'Género musical bachata'),
    ('Reggaetón', 'Género musical reggaetón'),
    ('Funk', 'Género musical funk'),
    ('Soul', 'Género musical soul'),
    
    ('Gospel', 'Género musical gospel'),
    ('Disco', 'Género musical disco'),
    ('Punk', 'Género musical punk'),
    ('Grunge', 'Género musical grunge'),
    ('Ska', 'Género musical ska'),
    ('Trap', 'Género musical trap'),
    ('Noticias', 'Tema de podcast: Noticias'),
    ('Deportes', 'Tema de podcast: Deportes'),
    ('Cine y televisión', 'Tema de podcast: Cine y televisión'),
    ('Historia', 'Tema de podcast: Historia'),
    
    ('Ciencia y tecnología', 'Tema de podcast: Ciencia y tecnología'),
    ('Negocios y finanzas', 'Tema de podcast: Negocios y finanzas'),
    ('Salud y bienestar', 'Tema de podcast: Salud y bienestar'),
    ('Comedia', 'Tema de podcast: Comedia'),
    ('Educación', 'Tema de podcast: Educación'),
    ('Arte y cultura', 'Tema de podcast: Arte y cultura'),
    ('Entrevistas', 'Tema de podcast: Entrevistas'),
    ('Viajes', 'Tema de podcast: Viajes'),
    ('Misterio y crimen', 'Tema de podcast: Misterio y crimen'),
    ('Religión y espiritualidad', 'Tema de podcast: Religión y espiritualidad'),
    
    ('Política', 'Tema de podcast: Política'),
    ('Medio ambiente', 'Tema de podcast: Medio ambiente'),
    ('Autoayuda', 'Tema de podcast: Autoayuda'),
    ('Familia y crianza', 'Tema de podcast: Familia y crianza'),
    ('Amor y relaciones', 'Tema de podcast: Amor y relaciones'),
    ('Tecnología', 'Tema de podcast: Tecnología'),
    ('Literatura', 'Tema de podcast: Literatura'),
    ('Debates', 'Tema de podcast: Debates'),
    ('Humor', 'Tema de podcast: Humor'),
    ('Deportes extremos', 'Tema de podcast: Deportes extremos');

-- Inserts para la tabla Contenido
INSERT INTO Contenido (titulo, lugarGrabacion, valoracion, numeroReproducciones, album, anyoLanzamiento)
VALUES
    ('Shape of You', 'Londres, Reino Unido', 4.5, 1000000, 'Divide', 2017),
    ('Bohemian Rhapsody', 'Londres, Reino Unido', 4.8, 950000, 'A Night at the Opera', 1975),
    ('Thriller', 'Los Ángeles, Estados Unidos', 4.7, 900000, 'Thriller', 1982),
    ('Hotel California', 'Los Ángeles, Estados Unidos', 4.6, 850000, 'Hotel California', 1976),
    ('Imagine', 'Nueva York, Estados Unidos', 4.4, 800000, 'Imagine', 1971),
    ('Smells Like Teen Spirit', 'Seattle, Estados Unidos', 4.5, 750000, 'Nevermind', 1991),
    ('Hey Jude', 'Londres, Reino Unido', 4.7, 700000, 'The Beatles (The White Album)', 1968),
    ('Like a Rolling Stone', 'Nueva York, Estados Unidos', 4.6, 650000, 'Highway 61 Revisited', 1965),
    ('Boogie Wonderland', 'Los Ángeles, Estados Unidos', 4.3, 600000, 'I Am', 1979),
    ('Dancing Queen', 'Estocolmo, Suecia', 4.7, 550000, 'Arrival', 1976),
    
    ('Billie Jean', 'Los Ángeles, Estados Unidos', 4.6, 500000, 'Thriller', 1982),
    ('Yesterday', 'Londres, Reino Unido', 4.4, 450000, 'Help!', 1965),
    ('Stairway to Heaven', 'Los Ángeles, Estados Unidos', 4.9, 400000, 'Led Zeppelin IV', 1971),
    ('Sultans of Swing', 'Londres, Reino Unido', 4.5, 350000, 'Dire Straits', 1978),
    ('Sweet Child o'' Mine', 'Los Ángeles, Estados Unidos', 4.8, 300000, 'Appetite for Destruction', 1987),
    ('Thunderstruck', 'Vancouver, Canadá', 4.7, 250000, 'The Razors Edge', 1990),
    ('Wonderwall', 'Londres, Reino Unido', 4.6, 200000, '(What''s the Story) Morning Glory?', 1995),
    ('Angie', 'Los Ángeles, Estados Unidos', 4.4, 150000, 'Goats Head Soup', 1973),
    ('Hotel California (Acoustic)', 'Los Ángeles, Estados Unidos', 4.8, 100000, 'Hell Freezes Over', 1994),
    ('Love of My Life', 'Londres, Reino Unido', 4.7, 50000, 'A Night at the Opera', 1975);

-- Inserts para la tabla Artista
INSERT INTO Artista (nombre, fechaInicio, nacionalidad, numPremios, generoMusical)
VALUES
    ('Ed Sheeran', '2004-01-01', 'Reino Unido', 12, 'Pop'),
    ('Queen', '1970-06-27', 'Reino Unido', 20, 'Rock'),
    ('Michael Jackson', '1964-01-01', 'Estados Unidos', 26, 'Pop'),
    ('Eagles', '1971-01-01', 'Estados Unidos', 7, 'Rock'),
    ('John Lennon', '1960-01-01', 'Reino Unido', 8, 'Pop'),
    ('Nirvana', '1987-01-01', 'Estados Unidos', 4, 'Grunge'),
    ('The Beatles', '1960-01-01', 'Reino Unido', 30, 'Pop'),
    ('Bob Dylan', '1959-01-01', 'Estados Unidos', 15, 'Folk'),
    ('Earth, Wind & Fire', '1969-01-01', 'Estados Unidos', 9, 'Funk'),
    ('ABBA', '1972-01-01', 'Suecia', 11, 'Pop');

-- Inserts para la tabla Concierto
INSERT INTO Concierto (lugar, fecha, ciudad, pais, capacidad, dineroRecaudado)
VALUES
    ('Estadio Wembley', '2023-06-15', 'Londres', 'Reino Unido', 90000, 1000000.00),
    ('Madison Square Garden', '2023-07-20', 'Nueva York', 'Estados Unidos', 20000, 500000.00),
    ('Estadio Maracaná', '2023-08-10', 'Río de Janeiro', 'Brasil', 80000, 900000.00),
    ('Estadio Azteca', '2023-09-05', 'Ciudad de México', 'México', 100000, 1200000.00),
    ('Parque de la Ciudadela', '2023-10-12', 'Barcelona', 'España', 30000, 400000.00),
    ('Budokan Hall', '2023-11-18', 'Tokio', 'Japón', 15000, 600000.00),
    ('Estadio Nacional', '2023-12-03', 'Santiago', 'Chile', 50000, 700000.00),
    ('Estadio San Siro', '2024-01-20', 'Milán', 'Italia', 60000, 800000.00),
    ('Estadio Olímpico', '2024-02-08', 'Berlín', 'Alemania', 70000, 950000.00),
    ('Estadio Nacional', '2024-03-15', 'Ciudad de Panamá', 'Panamá', 40000, 550000.00);

-- Inserts para la tabla Usuario
INSERT INTO Usuario (nacionalidad, nombre, fotoPerfil, edad, numSeguidores)
VALUES
    ('Estados Unidos', 'John Smith', 'perfil1.jpg', 25, 10000),
    ('Reino Unido', 'Emma Johnson', 'perfil2.jpg', 28, 12000),
    ('Brasil', 'Pedro Silva', 'perfil3.jpg', 30, 8000),
    ('México', 'María González', 'perfil4.jpg', 27, 15000),
    ('España', 'David Fernández', 'perfil5.jpg', 32, 9000),
    ('Japón', 'Akihiro Tanaka', 'perfil6.jpg', 29, 11000),
    ('Chile', 'Fernanda Ramírez', 'perfil7.jpg', 26, 13000),
    ('Italia', 'Giuseppe Russo', 'perfil8.jpg', 31, 7000),
    ('Alemania', 'Anna Müller', 'perfil9.jpg', 33, 14000),
    ('Panamá', 'Carlos López', 'perfil10.jpg', 24, 16000);

-- Inserts para la tabla Reproduccion
INSERT INTO Reproduccion (duracion, codigoContenido, fechaReproduccion, hora, valoracion, idUsuario)
VALUES
    (180, 1, '2023-06-16', '10:30:00', 4, 1),
    (240, 2, '2023-06-18', '14:15:00', 5, 2),
    (210, 3, '2023-06-20', '18:45:00', 4, 3),
    (180, 4, '2023-06-22', '22:10:00', 5, 4),
    (240, 5, '2023-06-24', '09:00:00', 4, 5),
    (210, 6, '2023-06-26', '13:30:00', 5, 6),
    (180, 7, '2023-06-28', '17:50:00', 4, 7),
    (240, 8, '2023-06-30', '21:20:00', 5, 8),
    (210, 9, '2023-07-02', '08:45:00', 4, 9),
    (180, 10, '2023-07-04', '12:55:00', 5, 10);

-- Inserts para la tabla Subscripcion
INSERT INTO Subscripcion (tipo, precio)
VALUES
    ('Básica', 9.99),
    ('Premium', 14.99),
    ('Familiar', 19.99),
    ('Estudiante', 4.99),
    ('Empresarial', 29.99),
    ('Gratuita', 0.00),
    ('Mensual', 12.99),
    ('Anual', 99.99),
    ('Trimestral', 29.99),
    ('Semanal', 6.99);

-- Inserts para la tabla Tarjeta
INSERT INTO Tarjeta (telefono, tipo, nombreTitular, cvv, caducidad, idUsuario)
VALUES
    (1234567890, 'Crédito', 'John Smith', 123, '2025-05-31', 1),
    (2345678901, 'Débito', 'Emma Johnson', 234, '2026-08-30', 2),
    (3456789012, 'Crédito', 'Pedro Silva', 345, '2025-12-31', 3),
    (4567890123, 'Débito', 'María González', 456, '2023-09-30', 4),
    (5678901234, 'Crédito', 'David Fernández', 567, '2024-04-30', 5),
    (6789012345, 'Débito', 'Akihiro Tanaka', 678, '2025-10-31', 6),
    (7890123456, 'Crédito', 'Fernanda Ramírez', 789, '2026-03-31', 7),
    (8901234567, 'Débito', 'Giuseppe Russo', 890, '2024-06-30', 8),
    (9012345678, 'Crédito', 'Anna Müller', 901, '2025-02-28', 9),
    (0123456789, 'Débito', 'Carlos López', 012, '2023-11-30', 10);

-- Inserts para la tabla ListaReproduccion
INSERT INTO ListaReproduccion (fechaCreacion, nombre, duracionTotal, imagen, numSeguidores)
VALUES
    ('2023-06-16', 'Éxitos Pop', 3600, 'lista1.jpg', 1000),
    ('2023-06-18', 'Rock Clásico', 4200, 'lista2.jpg', 1500),
    ('2023-06-20', 'Funk y Soul', 3000, 'lista3.jpg', 1200),
    ('2023-06-22', 'Mejores Baladas', 3900, 'lista4.jpg', 1800),
    ('2023-06-24', 'Música Dance', 2700, 'lista5.jpg', 900),
    ('2023-06-26', 'Pop Internacional', 3300, 'lista6.jpg', 1300),
    ('2023-06-28', 'Éxitos 90s', 3600, 'lista7.jpg', 1100),
    ('2023-06-30', 'Música Latina', 4500, 'lista8.jpg', 1700),
    ('2023-07-02', 'Rock Alternativo', 2400, 'lista9.jpg', 1400),
    ('2023-07-04', 'Canciones Románticas', 3000, 'lista10.jpg', 1900);

-- Inserts para la tabla ListaCanciones
INSERT INTO ListaCanciones (codigoLista, codigoCancion, fechaAgregado)
VALUES
    (1, 1, '2023-06-16'),
    (1, 2, '2023-06-16'),
    (1, 3, '2023-06-16'),
    (1, 4, '2023-06-16'),
    (1, 5, '2023-06-16'),
    (2, 2, '2023-06-18'),
    (2, 6, '2023-06-18'),
    (2, 7, '2023-06-18'),
    (2, 8, '2023-06-18'),
    (2, 9, '2023-06-18'),
    (3, 10, '2023-06-20'),
    (3, 11, '2023-06-20'),
    (3, 12, '2023-06-20'),
    (3, 13, '2023-06-20'),
    (3, 14, '2023-06-20'),
    (4, 15, '2023-06-22'),
    (4, 16, '2023-06-22'),
    (4, 17, '2023-06-22'),
    (4, 18, '2023-06-22'),
    (4, 19, '2023-06-22'),
    (5, 20, '2023-06-24'),
    (5, 21, '2023-06-24'),
    (5, 22, '2023-06-24'),
    (5, 23, '2023-06-24'),
    (5, 24, '2023-06-24'),
    (6, 25, '2023-06-26'),
    (6, 26, '2023-06-26'),
    (6, 27, '2023-06-26'),
    (6, 28, '2023-06-26'),
    (6, 29, '2023-06-26'),
    (7, 30, '2023-06-28'),
    (7, 31, '2023-06-28'),
    (7, 32, '2023-06-28'),
    (7, 33, '2023-06-28'),
    (7, 34, '2023-06-28'),
    (8, 35, '2023-06-30'),
    (8, 36, '2023-06-30'),
    (8, 37, '2023-06-30'),
    (8, 38, '2023-06-30'),
    (8, 39, '2023-06-30'),
    (9, 40, '2023-07-02'),
    (9, 41, '2023-07-02'),
    (9, 42, '2023-07-02'),
    (9, 43, '2023-07-02'),
    (9, 44, '2023-07-02'),
    (10, 45, '2023-07-04'),
    (10, 46, '2023-07-04'),
    (10, 47, '2023-07-04'),
    (10, 48, '2023-07-04'),
    (10, 49, '2023-07-04');

-- Inserts para la tabla ListaPodcasts
INSERT INTO ListaPodcasts (codigoLista, codigoPodcast, fechaAgregado)
VALUES
    (1, 1, '2023-06-16'),
    (1, 2, '2023-06-16'),
    (1, 3, '2023-06-16'),
    (1, 4, '2023-06-16'),
    (1, 5, '2023-06-16'),
    (2, 6, '2023-06-18'),
    (2, 7, '2023-06-18'),
    (2, 8, '2023-06-18'),
    (2, 9, '2023-06-18'),
    (2, 10, '2023-06-18'),
    (3, 11, '2023-06-20'),
    (3, 12, '2023-06-20'),
    (3, 13, '2023-06-20'),
    (3, 14, '2023-06-20'),
    (3, 15, '2023-06-20'),
    (4, 16, '2023-06-22'),
    (4, 17, '2023-06-22'),
    (4, 18, '2023-06-22'),
    (4, 19, '2023-06-22'),
    (4, 20, '2023-06-22'),
    (5, 21, '2023-06-24'),
    (5, 22, '2023-06-24'),
    (5, 23, '2023-06-24'),
    (5, 24, '2023-06-24'),
    (5, 25, '2023-06-24'),
    (6, 26, '2023-06-26'),
    (6, 27, '2023-06-26'),
    (6, 28, '2023-06-26'),
    (6, 29, '2023-06-26'),
    (6, 30, '2023-06-26'),
    (7, 31, '2023-06-28'),
    (7, 32, '2023-06-28'),
    (7, 33, '2023-06-28'),
    (7, 34, '2023-06-28'),
    (7, 35, '2023-06-28'),
    (8, 36, '2023-06-30'),
    (8, 37, '2023-06-30'),
    (8, 38, '2023-06-30'),
    (8, 39, '2023-06-30'),
    (8, 40, '2023-06-30'),
    (9, 41, '2023-07-02'),
    (9, 42, '2023-07-02'),
    (9, 43, '2023-07-02'),
    (9, 44, '2023-07-02'),
    (9, 45, '2023-07-02'),
    (10, 46, '2023-07-04'),
    (10, 47, '2023-07-04'),
    (10, 48, '2023-07-04'),
    (10, 49, '2023-07-04'),
    (10, 50, '2023-07-04');

-- Inserts para la tabla ConciertoArtista
INSERT INTO ConciertoArtista (codigoConcierto, idArtista)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (3, 12),
    (4, 13),
    (4, 14),
    (4, 15),
    (4, 16),
    (5, 17),
    (5, 18),
    (5, 19),
    (5, 20),
    (6, 21),
    (6, 22),
    (6, 23),
    (6, 24),
    (7, 25),
    (7, 26),
    (7, 27),
    (7, 28),
    (8, 29),
    (8, 30),
    (8, 31),
    (8, 32),
    (9, 33),
    (9, 34),
    (9, 35),
    (9, 36),
    (10, 37),
    (10, 38),
    (10, 39),
    (10, 40);

-- Inserts para la tabla ArtistaContenido
INSERT INTO ArtistaContenido (idArtista, codigoContenido)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40),
    (41, 41),
    (42, 42),
    (43, 43),
    (44, 44),
    (45, 45),
    (46, 46),
    (47, 47),
    (48, 48),
    (49, 49),
    (50, 50);

-- Inserts para la tabla SubscripcionUsuario
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
    (2, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (4, 16),
    (4, 17),
    (4, 18),
    (4, 19),
    (4, 20),
    (5, 21),
    (5, 22),
    (5, 23),
    (5, 24),
    (5, 25),
    (6, 26),
    (6, 27),
    (6, 28),
    (6, 29),
    (6, 30),
    (7, 31),
    (7, 32),
    (7, 33),
    (7, 34),
    (7, 35),
    (8, 36),
    (8, 37),
    (8, 38),
    (8, 39),
    (8, 40),
    (9, 41),
    (9, 42),
    (9, 43),
    (9, 44),
    (9, 45),
    (10, 46),
    (10, 47),
    (10, 48),
    (10, 49),
    (10, 50);

-- Inserts para la tabla CuentaPrincipal
INSERT INTO CuentaPrincipal (telefono, metodoPago, idUsuario)
VALUES
    (1111111111, 'PayPal', 1),
    (2222222222, 'Tarjeta de crédito', 2),
    (3333333333, 'PayPal', 3),
    (4444444444, 'Tarjeta de débito', 4),
    (5555555555, 'PayPal', 5),
    (6666666666, 'Tarjeta de crédito', 6),
    (7777777777, 'PayPal', 7),
    (8888888888, 'Tarjeta de débito', 8),
    (9999999999, 'PayPal', 9),
    (1010101010, 'Tarjeta de crédito', 10),
    (1111111112, 'PayPal', 11),
    (2222222223, 'Tarjeta de crédito', 12),
    (3333333334, 'PayPal', 13),
    (4444444445, 'Tarjeta de débito', 14),
    (5555555556, 'PayPal', 15),
    (6666666667, 'Tarjeta de crédito', 16),
    (7777777778, 'PayPal', 17),
    (8888888889, 'Tarjeta de débito', 18),
    (9999999990, 'PayPal', 19),
    (1010101011, 'Tarjeta de crédito', 20),
    (1111111113, 'PayPal', 21),
    (2222222224, 'Tarjeta de crédito', 22),
    (3333333335, 'PayPal', 23),
    (4444444446, 'Tarjeta de débito', 24),
    (5555555557, 'PayPal', 25),
    (6666666668, 'Tarjeta de crédito', 26),
    (7777777779, 'PayPal', 27),
    (8888888890, 'Tarjeta de débito', 28),
    (9999999991, 'PayPal', 29),
    (1010101012, 'Tarjeta de crédito', 30),
    (1111111114, 'PayPal', 31),
    (2222222225, 'Tarjeta de crédito', 32),
    (3333333336, 'PayPal', 33),
    (4444444447, 'Tarjeta de débito', 34),
    (5555555558, 'PayPal', 35),
    (6666666669, 'Tarjeta de crédito', 36),
    (7777777780, 'PayPal', 37),
    (8888888891, 'Tarjeta de débito', 38),
    (9999999992, 'PayPal', 39),
    (1010101013, 'Tarjeta de crédito', 40),
    (1111111115, 'PayPal', 41),
    (2222222226, 'Tarjeta de crédito', 42),
    (3333333337, 'PayPal', 43),
    (4444444448, 'Tarjeta de débito', 44),
    (5555555559, 'PayPal', 45),
    (6666666670, 'Tarjeta de crédito', 46),
    (7777777781, 'PayPal', 47),
    (8888888892, 'Tarjeta de débito', 48),
    (9999999993, 'PayPal', 49),
    (1010101014, 'Tarjeta de crédito', 50);