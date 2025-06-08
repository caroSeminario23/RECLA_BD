-- CREACIÓN DE ECO APRENDICES DE PRUEBA
INSERT INTO public.usuario(email, contra, fec_reg)
	VALUES 
	('semivaldi@gmail.com', 'Venom123', '2025-05-01'),
	('jamtuncar@gmail.com', 'Luna567', '2025-05-02');

INSERT INTO public.eco_aprendiz(id_user, nom_priv, apellido, fec_nac, nom_pub, id_dist)
	VALUES 
	(1, 'Carolina Isabel', 'Seminario Valdivia', '2002-06-11', 'FrutoZen', 20),
	(2, 'Jamil Brandy', 'Tuncar Quispe', '2000-03-04', 'AvoVerde', 36);
	

-- CREACIÓN DE ALIADOS VERDES DE PRUEBA
INSERT INTO public.usuario(email, contra, fec_reg)
	VALUES 
	('sanpablo@gmail.com', 'inst1234', '2025-05-01');

INSERT INTO public.aliado_verde(id_user, nombre, ruc)
	VALUES 
	(3, 'San Pablo', '12345678910');

