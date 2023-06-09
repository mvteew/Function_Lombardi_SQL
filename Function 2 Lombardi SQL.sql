CREATE DEFINER=`root`@`localhost` FUNCTION `stock_del_telefono`(nombre_producto VARCHAR(30)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT SUM(s.cantidad) INTO cantidad
    FROM stock s
    JOIN pagos p ON s.id = p.id_producto
    WHERE s.nombre = nombre_producto;
    RETURN cantidad;
END