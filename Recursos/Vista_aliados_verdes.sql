SELECT A.nombre, A.id_aliado, A.id_user, A.ruc, U.email, U.contra
FROM Aliado_verde AS A
JOIN Usuario AS U
ON A.id_user = U.id_user
ORDER BY A.nombre ASC;