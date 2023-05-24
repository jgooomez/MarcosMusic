CREATE TABLE Categoria (
    codigo INT PRIMARY KEY IDENTITY (1,1),
    nombre VARCHAR(100),
    descripcion VARCHAR(100)
);

CREATE TABLE Contenido (
    codigo INT PRIMARY KEY IDENTITY (1,1),
    titulo VARCHAR(100),
    lugarGrabacion VARCHAR(100),
    valoracion DECIMAL(3, 2),
    numeroReproducciones INT,
    album VARCHAR(100),
    anyoLanzamiento INT
);

CREATE TABLE Artista (
    id INT PRIMARY KEY IDENTITY (1,1),
    nombre VARCHAR(100),
    fechaInicio DATE,
    nacionalidad VARCHAR(100),
    numPremios INT,
    generoMusical VARCHAR(100)
);

CREATE TABLE Concierto (
    codigo INT PRIMARY KEY IDENTITY (1,1),
    lugar VARCHAR(100),
    fecha DATE,
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    capacidad INT,
    dineroRecaudado DECIMAL(10, 2)
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY IDENTITY (1,1),
    nacionalidad VARCHAR(100),
    nombre VARCHAR(100),
    fotoPerfil VARCHAR(100),
    edad INT,
    numSeguidores INT
);

CREATE TABLE Reproduccion (
    id INT PRIMARY KEY IDENTITY (1,1),
    duracion INT,
    codigoContenido INT,
    fechaReproduccion DATE,
    hora TIME,
    valoracion INT,
    idUsuario INT,
    FOREIGN KEY (codigoContenido) REFERENCES Contenido(codigo),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Subscripcion (
    id INT PRIMARY KEY IDENTITY (1,1),
    tipo VARCHAR(100),
    precio DECIMAL(5, 2)
);

CREATE TABLE Tarjeta (
    numeroTarjeta INT PRIMARY KEY,
    telefono INT,
    tipo VARCHAR(100),
    nombreTitular VARCHAR(100),
    cvv INT,
    caducidad DATE,
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE ListaReproduccion (
    codigo INT PRIMARY KEY IDENTITY (1,1),
    fechaCreacion DATE,
    nombre VARCHAR(100),
    duracionTotal INT,
    imagen VARCHAR(100),
    numSeguidores INT
);

CREATE TABLE ListaCanciones (
    codigoLista,
    codigoCancion INT,
    fechaAgregado DATE,
    FOREIGN KEY (codigoLista) REFERENCES ListaReproduccion(codigo),
    FOREIGN KEY (codigoCancion) REFERENCES Contenido(codigo),
    PRIMARY KEY (codigoLista, codigoCancion)
);

CREATE TABLE ListaPodcasts (
    codigoLista INT,
    codigoPodcast INT,
    fechaAgregado DATE,
    FOREIGN KEY (codigoLista) REFERENCES ListaReproduccion(codigo),
    FOREIGN KEY (codigoPodcast) REFERENCES Contenido(codigo),
    PRIMARY KEY (codigoLista, codigoPodcast)
);

CREATE TABLE ConciertoArtista (
    codigoConcierto INT,
    idArtista INT,
    FOREIGN KEY (codigoConcierto) REFERENCES Concierto(codigo),
    FOREIGN KEY (idArtista) REFERENCES Artista(id),
    PRIMARY KEY (codigoConcierto, idArtista)
);

CREATE TABLE ArtistaContenido (
    idArtista INT,
    codigoContenido INT,
    FOREIGN KEY (idArtista) REFERENCES Artista(id),
    FOREIGN KEY (codigoContenido) REFERENCES Contenido(codigo),
    PRIMARY KEY (idArtista, codigoContenido)
);

CREATE TABLE SubscripcionUsuario (
    idSubscripcion INT,
    idUsuario INT,
    FOREIGN KEY (idSubscripcion) REFERENCES Subscripcion(id),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    PRIMARY KEY (idSubscripcion, idUsuario)
);

CREATE TABLE CuentaPrincipal (
    telefono INT PRIMARY KEY,
    metodoPago VARCHAR(100),
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);
