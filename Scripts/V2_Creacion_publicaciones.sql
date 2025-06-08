-- SPRINT 2: Creación de tablas: Material, Publicación, Pub_Mat, Tabla_Puntos

-- TABLA MATERIAL
CREATE TABLE Material
(
  id_mat int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre varchar(30) NOT NULL,
  PRIMARY KEY (id_mat)
);

-- TABLA PUBLICACION
CREATE TABLE Publicacion
(
  id_pub    int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_vend   int          NOT NULL,
  fec_reg   timestamp    NOT NULL,
  foto_link text         NOT NULL,
  descrip   varchar(250) NOT NULL,
  tipo      boolean      NOT NULL,
  estado    boolean      NOT NULL,
  precio    int          NOT NULL,
  PRIMARY KEY (id_pub)
);

COMMENT ON COLUMN Publicacion.tipo IS '0: producto, 1: material';

COMMENT ON COLUMN Publicacion.estado IS '0: disponible, 1: comprado';

COMMENT ON COLUMN Publicacion.precio IS 'en puntos';

-- TABLA PUB_MAT
CREATE TABLE Pub_Mat
(
  id_pub int NOT NULL,
  id_mat int NOT NULL,
  PRIMARY KEY (id_pub, id_mat)
);

-- TABLA TABLA_PUNTOS
CREATE TABLE Tabla_puntos
(
  id_tp    int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_aprendiz  int NOT NULL,
  ptos_exp int NOT NULL DEFAULT 0,
  ptos_app int NOT NULL DEFAULT 0,
  PRIMARY KEY (id_tp)
);

-- CLAVES FORÁNEAS
ALTER TABLE Pub_Mat
  ADD CONSTRAINT FK_Publicacion_TO_Pub_Mat
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Pub_Mat
  ADD CONSTRAINT FK_Material_TO_Pub_Mat
    FOREIGN KEY (id_mat)
    REFERENCES Material (id_mat);

ALTER TABLE Publicacion
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Publicacion
    FOREIGN KEY (id_vend)
    REFERENCES Eco_aprendiz (id_aprendiz);

ALTER TABLE Tabla_puntos
  ADD CONSTRAINT FK_Eco_aprendiz_TO_Tabla_puntos
    FOREIGN KEY (id_aprendiz)
    REFERENCES Eco_aprendiz (id_aprendiz);