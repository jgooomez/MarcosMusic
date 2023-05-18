create table listaReproduccion (
    codigo int not null,
    fechaCreacion date,
    nombre varchar(100) ,
    duracionTotal int ,
    imagen varchar(100),
    numSeguidores int,
    fechaContenido date,

    CONSTRAINT pk_listaReproduccion PRIMARY KEY (codigo)
);

create table categoria (
    codigo int not null,
    nombre varchar(100),
    descripcion varchar(100),

    CONSTRAINT pk_catergoria PRIMARY KEY (codigo)
);

create table contenido (
    codigo int not null,
    titulo varchar(100),
    lugarGrabacion varchar(100),
    valoracion int,
    numeroReproducciones int,
    album varchar(100),
    anyoLanzamiento date,

    CONSTRAINT pk_contenido PRIMARY KEY (codigo)
);

create table usuario (
    idUsuario int not null,
    nacionalidad varchar(100),
    nombre varchar(100),
    fotoPerfil varchar(100),
    edad int,
    numSeguidores int,

    CONSTRAINT pk_usuario PRIMARY KEY (idUsuario)
);

create table reproduccion (
    id int not null,
    duracion int,
    codigoContenido int,
    fechaReproduccion date,
    hora datetime,
    valoracion int,
    idUsuario int,

    CONSTRAINT pk_reproduccion PRIMARY KEY (id)
);

create table subscripcion (
    id int not null,
    tipo varchar(100),
    precio money,

    CONSTRAINT pk_subscripcion PRIMARY KEY (id)
);

create table tarjeta (
    numeroTarjeta int not null,
    telefono int,
    tipo varchar(100),
    nombreTitular varchar(100),
    cvv int,
    caducidad date,

    CONSTRAINT pk_tarjeta PRIMARY KEY (numeroTarjeta)
);

create table concierto (
    codigo int not null,
    lugar varchar(100),
    fecha date,
    ciudad varchar(100),
    dineroRecaudado money,
    pais varchar(100), 

    CONSTRAINT pk_concierto PRIMARY KEY (codigo)
);

create table artista (
    id int not null,
    nombre varchar(100),
    fechaInicio date,
    nacionalidad varchar(100),
    numPremios int,
    generoMusical varchar(100),

    CONSTRAINT pk_artista PRIMARY KEY (id)
);

/*Tabla a revisar, pocos atributos para crear una primary key con sentido*/
create table cuentaPrincipal (
    telefono int not null,
    metodoPago varchar(100),

    CONSTRAINT pk_cuentaPrincipal PRIMARY KEY (telefono)
);

