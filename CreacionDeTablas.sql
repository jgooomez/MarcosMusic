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
    codigoLista INT,
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



/* NUEVAS TABLAS */

CREATE TABLE Departamento (
    idDepartamento int,
    nombre nvarchar(50),
    fechaCreacion DATE,
    NombreEncargado nvarchar(50),
    numTrabajadores int,
    numSubDpto int
);

CREATE TABLE Empleado (
    idEmpleado int,
    nombre nvarchar(50),
    edad int,
    nacionalidad nvarchar(50),
    fechaIncorporacion DATE,
    departamento nvarchar(50)
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
