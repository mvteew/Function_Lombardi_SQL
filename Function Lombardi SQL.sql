CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_localidad_repetida`(localidad_buscar VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE cantidad INTEGER;
  SELECT COUNT(*) INTO cantidad FROM (
    SELECT localidad, COUNT(*) as cantidad_clientes FROM clientes
    GROUP BY localidad
    HAVING COUNT(*) > 1
  ) t WHERE t.localidad = localidad_buscar;
  RETURN cantidad;
END