
CREATE TABLE Ben_Per
(
  id_pers  int       NOT NULL,
  id_benef int       NOT NULL,
  fec_obt  timestamp NOT NULL,
  PRIMARY KEY (id_pers, id_benef)
);

CREATE TABLE Beneficio
(
  id_benef int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  titulo   varchar(20)  NOT NULL UNIQUE,
  descrip  varchar(150) NOT NULL,
  tipo     boolean      NOT NULL,
  id_inst  int          NOT NULL,
  PRIMARY KEY (id_benef)
);

COMMENT ON COLUMN Beneficio.tipo IS '0: m prima, 1: servicio';

CREATE TABLE Certificado
(
  id_cert   int        NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_mision int        NOT NULL,
  id_pers   int        NOT NULL,
  fec_emis  timestamp  NOT NULL,
  cod_val   varchar(8) NOT NULL UNIQUE,
  PRIMARY KEY (id_cert)
);

CREATE TABLE Chat
(
  id_chat   int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  fec_creac timestamp NOT NULL,
  PRIMARY KEY (id_chat)
);

CREATE TABLE Comentario
(
  id_coment int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  contenido varchar(250) NOT NULL,
  id_pers   int          NOT NULL,
  id_pub    int          NOT NULL,
  PRIMARY KEY (id_coment)
);

CREATE TABLE Compra
(
  id_compra int       NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers   int       NOT NULL,
  fec_comp  timestamp NOT NULL,
  PRIMARY KEY (id_compra)
);

CREATE TABLE Condicion
(
  id_cond  int          NOT NULL,
  descrip  varchar(100) NOT NULL,
  id_benef int          NOT NULL,
  PRIMARY KEY (id_cond)
);

CREATE TABLE Detal_Prod
(
  id_detal  int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  desc_prod varchar(30) NOT NULL,
  cantidad  int         NOT NULL,
  id_benef  int         NOT NULL,
  PRIMARY KEY (id_detal)
);

CREATE TABLE Distrito
(
  id_dist int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre  varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (id_dist)
);

CREATE TABLE Elem_gam_vis
(
  id_elem int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre  varchar(20) NOT NULL UNIQUE,
  PRIMARY KEY (id_elem)
);

CREATE TABLE Elem_logro
(
  id_el_log   int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers     int NOT NULL,
  id_tip_elem int NOT NULL,
  PRIMARY KEY (id_el_log)
);

CREATE TABLE Hist_chat
(
  id_chat      int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_hist_chat int NOT NULL,
  PRIMARY KEY (id_hist_chat)
);

CREATE TABLE Institucion
(
  id_inst int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre  varchar(30) NOT NULL,
  ruc     varchar(11) NOT NULL UNIQUE,
  id_user int         NOT NULL,
  PRIMARY KEY (id_inst)
);

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
  PRIMARY KEY (id_msg)
);

CREATE TABLE Mision
(
  id_mision  int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  nombre     varchar(50)  NOT NULL UNIQUE,
  descrip    varchar(200) NOT NULL,
  fec_inicio date         NOT NULL,
  fec_fin    date         NOT NULL,
  PRIMARY KEY (id_mision)
);

CREATE TABLE N_ptos_app
(
  id_pt_per int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers   int NOT NULL,
  cantidad  int NOT NULL,
  PRIMARY KEY (id_pt_per)
);

CREATE TABLE N_ptos_exp
(
  id_pt_exp int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_pers   int NOT NULL,
  cantidad  int NOT NULL,
  PRIMARY KEY (id_pt_exp)
);

CREATE TABLE N_ptos_inst
(
  id_pers   int NOT NULL,
  id_pt_ins int NOT NULL,
  cantidad  int NOT NULL,
  PRIMARY KEY (id_pers, id_pt_ins)
);

CREATE TABLE Notificacion
(
  id_not    int         NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_compra int         NOT NULL,
  msg       varchar(40) NOT NULL,
  PRIMARY KEY (id_not)
);

CREATE TABLE Part_chat
(
  id_part_chat int NOT NULL GENERATED ALWAYS AS IDENTITY,
  max_part     int NOT NULL DEFAULT 2,
  id_chat      int NOT NULL,
  id_pers      int NOT NULL,
  PRIMARY KEY (id_part_chat)
);

CREATE TABLE Persona
(
  id_pers  int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  nom_priv varchar(70)  NOT NULL,
  apellido varchar(100) NOT NULL,
  anio_nac date         NOT NULL,
  nom_pub  varchar(20)  NOT NULL UNIQUE,
  id_dist  int          NOT NULL,
  id_user  int          NOT NULL,
  PRIMARY KEY (id_pers)
);

CREATE TABLE Prod_compra
(
  id_pub    int NOT NULL,
  id_compra int NOT NULL,
  PRIMARY KEY (id_pub, id_compra)
);

CREATE TABLE Ptos_inst
(
  id_pt_ins int NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_inst   int NOT NULL,
  PRIMARY KEY (id_pt_ins)
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
  fec_reg   timestamp    NOT NULL,
  foto_link text         NOT NULL,
  descrip   varchar(250) NOT NULL,
  tipo      boolean      NOT NULL,
  id_pers   int          NOT NULL,
  estado    boolean      NOT NULL,
  puntaje   int          NOT NULL,
  PRIMARY KEY (id_pub)
);

COMMENT ON COLUMN Publicacion.tipo IS '0: producto, 1: material';

COMMENT ON COLUMN Publicacion.estado IS '0: disponible, 1: comprado';

CREATE TABLE Tipo_elem
(
  id_tip_elem int          NOT NULL GENERATED ALWAYS AS IDENTITY,
  id_elem     int          NOT NULL,
  nombre      varchar(40)  NOT NULL UNIQUE,
  objetivo    varchar(100) NOT NULL,
  ptos_nec    int          NOT NULL,
  PRIMARY KEY (id_tip_elem)
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

ALTER TABLE Part_chat
  ADD CONSTRAINT FK_Chat_TO_Part_chat
    FOREIGN KEY (id_chat)
    REFERENCES Chat (id_chat);

ALTER TABLE Hist_chat
  ADD CONSTRAINT FK_Chat_TO_Hist_chat
    FOREIGN KEY (id_chat)
    REFERENCES Chat (id_chat);

ALTER TABLE Part_chat
  ADD CONSTRAINT FK_Persona_TO_Part_chat
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Mensaje
  ADD CONSTRAINT FK_Hist_chat_TO_Mensaje
    FOREIGN KEY (id_hist_chat)
    REFERENCES Hist_chat (id_hist_chat);

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
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Persona_TO_Comentario
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Comentario
  ADD CONSTRAINT FK_Publicacion_TO_Comentario
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Condicion
  ADD CONSTRAINT FK_Beneficio_TO_Condicion
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Detal_Prod
  ADD CONSTRAINT FK_Beneficio_TO_Detal_Prod
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);

ALTER TABLE Compra
  ADD CONSTRAINT FK_Persona_TO_Compra
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Beneficio
  ADD CONSTRAINT FK_Institucion_TO_Beneficio
    FOREIGN KEY (id_inst)
    REFERENCES Institucion (id_inst);

ALTER TABLE Ptos_inst
  ADD CONSTRAINT FK_Institucion_TO_Ptos_inst
    FOREIGN KEY (id_inst)
    REFERENCES Institucion (id_inst);

ALTER TABLE N_ptos_inst
  ADD CONSTRAINT FK_Persona_TO_N_ptos_inst
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE N_ptos_inst
  ADD CONSTRAINT FK_Ptos_inst_TO_N_ptos_inst
    FOREIGN KEY (id_pt_ins)
    REFERENCES Ptos_inst (id_pt_ins);

ALTER TABLE N_ptos_app
  ADD CONSTRAINT FK_Persona_TO_N_ptos_app
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE N_ptos_exp
  ADD CONSTRAINT FK_Persona_TO_N_ptos_exp
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Certificado
  ADD CONSTRAINT FK_Mision_TO_Certificado
    FOREIGN KEY (id_mision)
    REFERENCES Mision (id_mision);

ALTER TABLE Certificado
  ADD CONSTRAINT FK_Persona_TO_Certificado
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Tipo_elem
  ADD CONSTRAINT FK_Elem_gam_vis_TO_Tipo_elem
    FOREIGN KEY (id_elem)
    REFERENCES Elem_gam_vis (id_elem);

ALTER TABLE Elem_logro
  ADD CONSTRAINT FK_Persona_TO_Elem_logro
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Elem_logro
  ADD CONSTRAINT FK_Tipo_elem_TO_Elem_logro
    FOREIGN KEY (id_tip_elem)
    REFERENCES Tipo_elem (id_tip_elem);

ALTER TABLE Notificacion
  ADD CONSTRAINT FK_Compra_TO_Notificacion
    FOREIGN KEY (id_compra)
    REFERENCES Compra (id_compra);

ALTER TABLE Prod_compra
  ADD CONSTRAINT FK_Publicacion_TO_Prod_compra
    FOREIGN KEY (id_pub)
    REFERENCES Publicacion (id_pub);

ALTER TABLE Prod_compra
  ADD CONSTRAINT FK_Compra_TO_Prod_compra
    FOREIGN KEY (id_compra)
    REFERENCES Compra (id_compra);

ALTER TABLE Ben_Per
  ADD CONSTRAINT FK_Persona_TO_Ben_Per
    FOREIGN KEY (id_pers)
    REFERENCES Persona (id_pers);

ALTER TABLE Ben_Per
  ADD CONSTRAINT FK_Beneficio_TO_Ben_Per
    FOREIGN KEY (id_benef)
    REFERENCES Beneficio (id_benef);
