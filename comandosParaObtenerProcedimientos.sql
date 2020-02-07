--USER_OBJECTS

--OBTENER TODOS LOS PROCEDIMIENTOS
SELECT
    *
FROM
    user_objects
WHERE
    object_type = 'PROCEDURE';

--OBTENER TODOS LOS OBJETOS DEL USUARIO

SELECT
    object_type,
    COUNT(*)
FROM
    user_objects
GROUP BY
    object_type;
    
--OBTENER EL CODIGO DE UN PROCEDIMIENTO

SELECT
    *
FROM
    user_source
WHERE
    name = 'P1';