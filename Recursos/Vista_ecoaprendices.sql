SELECT E.nom_pub, E.id_aprendiz, E.id_user, U.email, U.contra
FROM Eco_aprendiz AS E 
JOIN Usuario AS U
ON E.id_user = U.id_user
ORDER BY E.nom_pub ASC;