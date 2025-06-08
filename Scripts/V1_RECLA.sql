
CREATE TABLE Ben_adquirido
(
  id_ben_ad int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers   int       NOT NULL,
  id_benef  int       NOT NULL,
  fec_adqui timestamp NOT NULL,
  PRIMARY KEY (id_ben_ad)
);

CREATE TABLE Benef_prod
(
  id_bprod   int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_benef   int         NOT NULL,
  cantidad   int         NOT NULL,
  unidad     varchar(30) NOT NULL,
  ptos_ganar int         NOT NULL,
  PRIMARY KEY (id_bprod)
);

CREATE TABLE Benef_ptos
(
  id_bptos   int NOT NULL GENERATED ALWAYS AS IDENTITY,
  ptos_canje int NOT NULL,
  id_benef   int NOT NULL,
  PRIMARY KEY (id_bptos)
);

CREATE TABLE Benef_ptos_accion
(
  id_baccion   int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  ac_marketing varchar(500) NOT NULL,
  id_benef     int          NOT NULL,
  PRIMARY KEY (id_baccion)
);

CREATE TABLE Beneficio
(
  id_benef int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_inst  int          NOT NULL,
  titulo   varchar(20)  NOT NULL UNIQUE,
  descrip  varchar(150) NOT NULL,
  estado   boolean      NOT NULL DEFAULT 0,
  tipo     int          NOT NULL,
  PRIMARY KEY (id_benef)
);

COMMENT ON COLUMN Beneficio.estado IS '0: activo: 1: inactivo';

COMMENT ON COLUMN Beneficio.tipo IS '0: producto, 1: ptos, 2: accion';

CREATE TABLE Certificado
(
  id_mision   int          NOT NULL,
  id_pers     int          NOT NULL,
  titulo      varchar(50)  NOT NULL,
  descripcion varchar(200) NOT NULL,
  fec_emis    timestamp    NOT NULL,
  cod_val     varchar(8)   NOT NULL UNIQUE,
  PRIMARY KEY (id_mision, id_pers)
);

CREATE TABLE Chat
(
  id_chat   int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  fec_creac timestamp NOT NULL,
  id_part1  int       NOT NULL,
  id_part2  int       NOT NULL,
  PRIMARY KEY (id_chat)
);

CREATE TABLE Comentario
(
  id_coment int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers   int          NOT NULL,
  id_pub    int          NOT NULL,
  contenido varchar(250) NOT NULL,
  fec_reg   timestamp    NOT NULL,
  PRIMARY KEY (id_coment)
);

CREATE TABLE Compra
(
  id_compra    int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pub       int       NOT NULL,
  id_comprador int       NOT NULL,
  fec_comp     timestamp NOT NULL,
  PRIMARY KEY (id_compra)
);

CREATE TABLE Distrito
(
  id_dist int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre  varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (id_dist)
);

CREATE TABLE Elem_logro
(
  id_elem   int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  img_link  text        NOT NULL UNIQUE,
  ptos_comp int         NOT NULL,
  coleccion varchar(70) NOT NULL,
  tipo      int         NOT NULL,
  PRIMARY KEY (id_elem)
);

COMMENT ON COLUMN Elem_logro.tipo IS '0: insignia, 1: sticker, 2: mision';

CREATE TABLE Insignia
(
  id_insig int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre   varchar(70) NOT NULL,
  id_elem  int         NOT NULL,
  PRIMARY KEY (id_insig)
);

CREATE TABLE Institucion
(
  id_inst int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_user int         NOT NULL,
  nombre  varchar(30) NOT NULL UNIQUE,
  ruc     varchar(11) NOT NULL UNIQUE,
  PRIMARY KEY (id_inst)
);

CREATE TABLE Logro_obt
(
  id_logro  int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_elem   int       NOT NULL,
  id_pers   int       NOT NULL,
  fec_logro timestamp NOT NULL,
  PRIMARY KEY (id_logro)
);

CREATE TABLE Mascota
(
  id_mascota   int NOT NULL GENERATED ALWAYS AS IDENTITY,
  experiencia  int NOT NULL,
  estado_animo int NOT NULL,
  id_pers      int NOT NULL,
  PRIMARY KEY (id_mascota)
);

COMMENT ON TABLE Mascota IS 'Cartulín';

COMMENT ON COLUMN Mascota.estado_animo IS '0: alegre, 1: triste, 2: molesto';

CREATE TABLE Material
(
  id_mat int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre varchar(30) NOT NULL,
  PRIMARY KEY (id_mat)
);

CREATE TABLE Mensaje
(
  id_msg       int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  contenido    varchar(300) NOT NULL,
  fec_envío    timestamp    NOT NULL,
  id_hist_chat int          NOT NULL,
  id_chat      int          NOT NULL,
  PRIMARY KEY (id_msg)
);

CREATE TABLE Mision
(
  id_mision int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_elem   int          NOT NULL,
  titulo    varchar(50)  NOT NULL UNIQUE,
  descrip   varchar(200) NOT NULL,
  PRIMARY KEY (id_mision)
);

CREATE TABLE Mision_temp
(
  id_mtemp   int  NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_mision  int  NOT NULL,
  fec_inicio date NOT NULL,
  fec_fin    date NOT NULL,
  PRIMARY KEY (id_mtemp)
);

CREATE TABLE Notificacion
(
  id_not    int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  msg       varchar(40) NOT NULL,
  id_compra int         NOT NULL,
  PRIMARY KEY (id_not)
);

CREATE TABLE Persona
(
  id_pers  int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_user  int          NOT NULL,
  nom_priv varchar(70)  NOT NULL,
  apellido varchar(100) NOT NULL,
  anio_nac date         NOT NULL,
  nom_pub  varchar(20)  NOT NULL UNIQUE,
  id_dist  int          NOT NULL,
  PRIMARY KEY (id_pers)
);

CREATE TABLE Ptos_inst
(
  id_tp   int NOT NULL,
  id_inst int NOT NULL,
  ptos    int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_tp, id_inst)
);

CREATE TABLE Pub_Mat
(
  id_pub int NOT NULL,
  id_mat int NOT NULL,
  PRIMARY KEY (id_pub, id_mat)
);

CREATE TABLE Publicacion
(
  id_pub    int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_vend   int          NOT NULL,
  fec_reg   timestamp    NOT NULL,
  foto_link text         NOT NULL,
  descrip   varchar(250) NOT NULL,
  tipo      boolean      NOT NULL,
  estado    boolean      NOT NULL,
  puntaje   int          NOT NULL,
  PRIMARY KEY (id_pub)
);

COMMENT ON COLUMN Publicacion.tipo IS '0: producto, 1: material';

COMMENT ON COLUMN Publicacion.estado IS '0: disponible, 1: comprado';

CREATE TABLE Racha
(
  id_racha int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers  int NOT NULL,
  n_dias   int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_racha)
);

CREATE TABLE Sticker
(
  id_sticker int NOT NULL GENERATED ALWAYS AS IDENTITY,
  duracion   int NOT NULL,
  id_elem    int NOT NULL,
  PRIMARY KEY (id_sticker)
);

COMMENT ON COLUMN Sticker.duracion IS 'dias';

CREATE TABLE Tabla_puntos
(
  id_tp    int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers  int NOT NULL,
  ptos_exp int NOT NULL DEFAULT 0,
  ptos_app int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_tp)
);

CREATE TABLE Usuario
(
  id_user int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  email   varchar(30)  NOT NULL UNIQUE,
  contra  varchar(255) NOT NULL,
  fec_reg timestamp    NOT NULL,
  PRIMARY KEY (id_user)
);

ALTER TABLE Persona
  ADD CONSTRAINT FK_Distrito_TO_Persona
    FOREIGN KEY (id_dist)
    REFERENCES Distrito (id_dist);

ALTER TABLE Persona
  ADD CONSTRAINT FK_Usuario_TO_Persona
    FOREIGN KEY (id_user)
    REFERENCES Usuario (id_user);

ALTER TABLE Institucion
  ADD CONSTRAINT FK_Usuario_TO_Institucion
    FOREIGN KEY (id_user)
    REFERENCES Usuario (id_user);

ALTER TABLE Pub_Mat
  ADD CONSTRAINT FK_Publicacion_TO_Pub_Mat
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Pub_Mat
  ADD CONSTRAINT FK_Material_TO_Pub_Mat
    FOREIGN KEY (id_mat)
    REFERENCES Material (id_mat);

ALTER TABLE Publicacion
  ADD CONSTRAINT FK_Persona_TO_Publicacion
    FOREIGN KEY (id_vend)
    REFERENCES Persona (id_pers);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Persona_TO_Comentario
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Publicacion_TO_Comentario
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Benef_prod
  ADD CONSTRAINT FK_Beneficio_TO_Benef_prod
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Compra
  ADD CONSTRAINT FK_Persona_TO_Compra
    FOREIGN KEY (id_comprador)
    REFERENCES Persona (id_pers);

ALTER TABLE Certificado
  ADD CONSTRAINT FK_Mision_temp_TO_Certificado
    FOREIGN KEY (id_mision)
    REFERENCES Mision_temp (id_mtemp);

ALTER TABLE Certificado
  ADD CONSTRAINT FK_Persona_TO_Certificado
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Tabla_puntos
  ADD CONSTRAINT FK_Persona_TO_Tabla_puntos
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Ptos_inst
  ADD CONSTRAINT FK_Institucion_TO_Ptos_inst
    FOREIGN KEY (id_inst)
    REFERENCES Institucion (id_inst);

ALTER TABLE Ptos_inst
  ADD CONSTRAINT FK_Tabla_puntos_TO_Ptos_inst
    FOREIGN KEY (id_tp)
    REFERENCES Tabla_puntos (id_tp);

ALTER TABLE Chat
  ADD CONSTRAINT FK_Persona_TO_Chat
    FOREIGN KEY (id_part1)
    REFERENCES Persona (id_pers);

ALTER TABLE Chat
  ADD CONSTRAINT FK_Persona_TO_Chat1
    FOREIGN KEY (id_part2)
    REFERENCES Persona (id_pers);

ALTER TABLE Mensaje
  ADD CONSTRAINT FK_Chat_TO_Mensaje
    FOREIGN KEY (id_chat)
    REFERENCES Chat (id_chat);

ALTER TABLE Compra
  ADD CONSTRAINT FK_Publicacion_TO_Compra
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Racha
  ADD CONSTRAINT FK_Persona_TO_Racha
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Insignia
  ADD CONSTRAINT FK_Elem_logro_TO_Insignia
    FOREIGN KEY (id_elem)
    REFERENCES Elem_logro (id_elem);

ALTER TABLE Sticker
  ADD CONSTRAINT FK_Elem_logro_TO_Sticker
    FOREIGN KEY (id_elem)
    REFERENCES Elem_logro (id_elem);

ALTER TABLE Mision_temp
  ADD CONSTRAINT FK_Mision_TO_Mision_temp
    FOREIGN KEY (id_mision)
    REFERENCES Mision (id_mision);

ALTER TABLE Mascota
  ADD CONSTRAINT FK_Persona_TO_Mascota
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Benef_ptos
  ADD CONSTRAINT FK_Beneficio_TO_Benef_ptos
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Benef_ptos_accion
  ADD CONSTRAINT FK_Beneficio_TO_Benef_ptos_accion
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Beneficio
  ADD CONSTRAINT FK_Institucion_TO_Beneficio
    FOREIGN KEY (id_inst)
    REFERENCES Institucion (id_inst);

ALTER TABLE Ben_adquirido
  ADD CONSTRAINT FK_Persona_TO_Ben_adquirido
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Ben_adquirido
  ADD CONSTRAINT FK_Beneficio_TO_Ben_adquirido
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Mision
  ADD CONSTRAINT FK_Elem_logro_TO_Mision
    FOREIGN KEY (id_elem)
    REFERENCES Elem_logro (id_elem);

ALTER TABLE Logro_obt
  ADD CONSTRAINT FK_Elem_logro_TO_Logro_obt
    FOREIGN KEY (id_elem)
    REFERENCES Elem_logro (id_elem);

ALTER TABLE Logro_obt
  ADD CONSTRAINT FK_Persona_TO_Logro_obt
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Notificacion
  ADD CONSTRAINT FK_Compra_TO_Notificacion
    FOREIGN KEY (id_compra)
    REFERENCES Compra (id_compra);
