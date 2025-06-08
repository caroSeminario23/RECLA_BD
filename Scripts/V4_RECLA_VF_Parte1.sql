
CREATE TABLE Categoria
(
  id_categoria int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre       varchar(15) NOT NULL UNIQUE,
  PRIMARY KEY (id_categoria)
);

CREATE TABLE Cert_eco
(
  id_aprendiz int        NOT NULL,
  id_certi    int        NOT NULL,
  fec_logro   timestamp  NOT NULL,
  cod_valid   varchar(9) NOT NULL UNIQUE,
  PRIMARY KEY (id_aprendiz, id_certi)
);

CREATE TABLE Certificado
(
  id_certi     int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  titulo       varchar(50) NOT NULL UNIQUE,
  img_link     text        NOT NULL,
  id_coleccion int         NOT NULL,
  meta         int         NOT NULL,
  PRIMARY KEY (id_certi),
  CHECK (meta > 0)
);

COMMENT ON COLUMN Certificado.img_link IS 'portada';

CREATE TABLE Chat
(
  id_chat   int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  fec_creac timestamp NOT NULL,
  id_part1  int       NOT NULL,
  id_part2  int       NOT NULL,
  PRIMARY KEY (id_chat),
  CHECK (id_part1 <> id_part2)
);

CREATE TABLE Coleccion
(
  id_coleccion    int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_categoria    int       NOT NULL,
  nivel           int       NOT NULL,
  id_concepto     int       NOT NULL,
  fec_publicacion timestamp NOT NULL,
  PRIMARY KEY (id_coleccion),
  CHECK (nivel > 0)
);

CREATE TABLE Coment_V
(
  id_cv       int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz int          NOT NULL,
  id_venta    int          NOT NULL,
  mensaje     varchar(250) NOT NULL,
  fec_reg     timestamp    NOT NULL,
  PRIMARY KEY (id_cv)
);

CREATE TABLE Concepto
(
  id_concepto int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre      varchar(10) NOT NULL UNIQUE,
  PRIMARY KEY (id_concepto)
);

COMMENT ON TABLE Concepto IS 'unidad meta';

CREATE TABLE Distrito
(
  id_dist int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre  varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (id_dist)
);

CREATE TABLE Eco_aprendiz
(
  id_aprendiz int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_user     int          NOT NULL,
  nom_priv    varchar(70)  NOT NULL,
  apellido    varchar(100) NOT NULL,
  fec_nac     date         NOT NULL,
  nom_pub     varchar(20)  NOT NULL UNIQUE,
  id_dist     int          NOT NULL,
  es_vendedor boolean      NOT NULL DEFAULT 0,
  ruc         varchar(11)  UNIQUE,
  PRIMARY KEY (id_aprendiz)
);

COMMENT ON COLUMN Eco_aprendiz.es_vendedor IS '0: no, 1: sí';

CREATE TABLE Fuente
(
  id_fuente int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre    varchar(10) NOT NULL UNIQUE,
  PRIMARY KEY (id_fuente)
);

CREATE TABLE Insig_eco
(
  id_aprendiz int       NOT NULL,
  id_insig    int       NOT NULL,
  fec_logro   timestamp NOT NULL,
  PRIMARY KEY (id_aprendiz, id_insig)
);

CREATE TABLE Insignia
(
  id_insig     int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre       varchar(70) NOT NULL UNIQUE,
  img_link     text        NOT NULL,
  id_coleccion int         NOT NULL,
  meta         int         NOT NULL,
  PRIMARY KEY (id_insig),
  CHECK (meta > 0)
);

CREATE TABLE Mascota
(
  id_mascota  int NOT NULL GENERATED ALWAYS AS IDENTITY,
  edad        int NOT NULL DEFAULT 0,
  id_aprendiz int NOT NULL,
  PRIMARY KEY (id_mascota),
  CHECK (edad >= 0 AND edad <= 100)
);

COMMENT ON TABLE Mascota IS 'Cartulín';

CREATE TABLE Material
(
  id_mat int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (id_mat)
);

CREATE TABLE Mensaje
(
  id_msg       int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  contenido    varchar(300) NOT NULL,
  fec_envio    timestamp    NOT NULL,
  id_hist_chat int          NOT NULL,
  id_chat      int          NOT NULL,
  PRIMARY KEY (id_msg)
);

CREATE TABLE Opcion
(
  id_opcion   int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pregunta int         NOT NULL,
  respuesta   varchar(15) NOT NULL,
  validez     boolean     NOT NULL,
  PRIMARY KEY (id_opcion)
);

COMMENT ON COLUMN Opcion.validez IS '0: incorrecta, 1: correcta';

CREATE TABLE Pregunta
(
  id_pregunta  int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_re        int         NOT NULL,
  interrogante varchar(30) NOT NULL,
  orden        int         NOT NULL,
  PRIMARY KEY (id_pregunta),
  CHECK (orden > 0)
);

CREATE TABLE R_Educativo
(
  id_re     int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  titulo    varchar(40) NOT NULL UNIQUE,
  autor     varchar(20) NOT NULL,
  id_fuente int         NOT NULL,
  fec_pub   timestamp   NOT NULL,
  PRIMARY KEY (id_re)
);

CREATE TABLE Racha
(
  id_racha    int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz int NOT NULL,
  n_dias      int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_racha),
  CHECK (n_dias >= 0)
);

CREATE TABLE RE_eco
(
  id_reeco     int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz  int       NOT NULL,
  id_re        int       NOT NULL,
  correcto     int       NOT NULL,
  fec_resuelto timestamp NOT NULL,
  PRIMARY KEY (id_reeco),
  CHECK (correcto >= 0 AND correcto <= 100)
);

COMMENT ON COLUMN RE_eco.correcto IS 'porcentaje de respuestas correctas';


CREATE TABLE Stic_eco
(
  id_aprendiz int       NOT NULL,
  id_sticker  int       NOT NULL,
  fec_logro   timestamp NOT NULL,
  PRIMARY KEY (id_aprendiz, id_sticker)
);

CREATE TABLE Sticker
(
  id_sticker      int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre          varchar(20) NOT NULL UNIQUE,
  id_categoria    int         NOT NULL,
  precio          int         NOT NULL,
  img_link        text        NOT NULL,
  fec_publicacion timestamp   NOT NULL,
  PRIMARY KEY (id_sticker),
  CHECK (precio > 0)
);

COMMENT ON COLUMN Sticker.precio IS 'puntos de app';

CREATE TABLE Tabla_puntos
(
  id_tp       int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz int NOT NULL,
  ptos_exp    int NOT NULL DEFAULT 0,
  ptos_app    int NOT NULL DEFAULT 0,
  ptos_mision int NOT NULL DEFAULT 0,
  ptos_compra int NOT NULL DEFAULT 0,
  ptos_venta  int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_tp),
  CHECK (ptos_exp >=0),
  CHECK (ptos_app >=0),
  CHECK (ptos_mision >=0),
  CHECK (ptos_compra >=0),
  CHECK (ptos_venta >=0)
);

CREATE TABLE Usuario
(
  id_user int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  email   varchar(30)  NOT NULL UNIQUE,
  contra  varchar(255) NOT NULL,
  fec_reg timestamp    NOT NULL,
  PRIMARY KEY (id_user)
);

CREATE TABLE Ven_Mat
(
  id_venta int NOT NULL,
  id_mat   int NOT NULL,
  PRIMARY KEY (id_venta, id_mat)
);

CREATE TABLE Venta
(
  id_venta    int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz int          NOT NULL,
  titulo      varchar(20)  NOT NULL,
  foto_link   text         NOT NULL,
  descrip     varchar(250) NOT NULL,
  precio      numeric(5,2) NOT NULL,
  tipo        boolean      NOT NULL,
  disponible  boolean      NOT NULL,
  fec_reg     timestamp    NOT NULL,
  PRIMARY KEY (id_venta),
  CHECK (precio > 0)
);

COMMENT ON COLUMN Venta.precio IS 'sol peruano';

COMMENT ON COLUMN Venta.tipo IS '0: producto, 1: material';

COMMENT ON COLUMN Venta.disponible IS '1: disponible, 0: comprado';

ALTER TABLE Eco_aprendiz
  ADD CONSTRAINT FK_Distrito_TO_Eco_aprendiz
    FOREIGN KEY (id_dist)
    REFERENCES Distrito (id_dist);

ALTER TABLE Eco_aprendiz
  ADD CONSTRAINT FK_Usuario_TO_Eco_aprendiz
    FOREIGN KEY (id_user)
    REFERENCES Usuario (id_user);

ALTER TABLE Ven_Mat
  ADD CONSTRAINT FK_Venta_TO_Ven_Mat
    FOREIGN KEY (id_venta)
    REFERENCES Venta (id_venta);

ALTER TABLE Ven_Mat
  ADD CONSTRAINT FK_Material_TO_Ven_Mat
    FOREIGN KEY (id_mat)
    REFERENCES Material (id_mat);

ALTER TABLE Venta
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Venta
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Coment_V
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Coment_V
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Coment_V
  ADD CONSTRAINT FK_Venta_TO_Coment_V
    FOREIGN KEY (id_venta)
    REFERENCES Venta (id_venta);

ALTER TABLE Tabla_puntos
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Tabla_puntos
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Chat
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Chat
    FOREIGN KEY (id_part1)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Chat
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Chat1
    FOREIGN KEY (id_part2)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Mensaje
  ADD CONSTRAINT FK_Chat_TO_Mensaje
    FOREIGN KEY (id_chat)
    REFERENCES Chat (id_chat);

ALTER TABLE Racha
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Racha
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Mascota
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Mascota
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Insignia
  ADD CONSTRAINT FK_Coleccion_TO_Insignia
    FOREIGN KEY (id_coleccion)
    REFERENCES Coleccion (id_coleccion);

ALTER TABLE Certificado
  ADD CONSTRAINT FK_Coleccion_TO_Certificado
    FOREIGN KEY (id_coleccion)
    REFERENCES Coleccion (id_coleccion);

ALTER TABLE Insig_eco
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Insig_eco
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Insig_eco
  ADD CONSTRAINT FK_Insignia_TO_Insig_eco
    FOREIGN KEY (id_insig)
    REFERENCES Insignia (id_insig);

ALTER TABLE Cert_eco
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Cert_eco
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Cert_eco
  ADD CONSTRAINT FK_Certificado_TO_Cert_eco
    FOREIGN KEY (id_certi)
    REFERENCES Certificado (id_certi);

ALTER TABLE Stic_eco
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Stic_eco
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Stic_eco
  ADD CONSTRAINT FK_Sticker_TO_Stic_eco
    FOREIGN KEY (id_sticker)
    REFERENCES Sticker (id_sticker);

ALTER TABLE R_Educativo
  ADD CONSTRAINT FK_Fuente_TO_R_Educativo
    FOREIGN KEY (id_fuente)
    REFERENCES Fuente (id_fuente);

ALTER TABLE Opcion
  ADD CONSTRAINT FK_Pregunta_TO_Opcion
    FOREIGN KEY (id_pregunta)
    REFERENCES Pregunta (id_pregunta);

ALTER TABLE Pregunta
  ADD CONSTRAINT FK_R_Educativo_TO_Pregunta
    FOREIGN KEY (id_re)
    REFERENCES R_Educativo (id_re);

ALTER TABLE RE_eco
  ADD CONSTRAINT FK_Eco_aprendiz_TO_RE_eco
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE RE_eco
  ADD CONSTRAINT FK_R_Educativo_TO_RE_eco
    FOREIGN KEY (id_re)
    REFERENCES R_Educativo (id_re);

ALTER TABLE Sticker
  ADD CONSTRAINT FK_Categoria_TO_Sticker
    FOREIGN KEY (id_categoria)
    REFERENCES Categoria (id_categoria);

ALTER TABLE Coleccion
  ADD CONSTRAINT FK_Categoria_TO_Coleccion
    FOREIGN KEY (id_categoria)
    REFERENCES Categoria (id_categoria);

ALTER TABLE Coleccion
  ADD CONSTRAINT FK_Concepto_TO_Coleccion
    FOREIGN KEY (id_concepto)
    REFERENCES Concepto (id_concepto);
