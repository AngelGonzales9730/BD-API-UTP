DELIMITER $$
CREATE PROCEDURE SP_InsertarCliente
(
	/*PARAMETROS DE ENTRADA O DE SALIDA*/
    IN _Nombre VARCHAR(45),
    IN _Apellido VARCHAR(45),
    IN _Email VARCHAR(45),
    IN _Telefono CHAR(9),
    IN _Saldo DOUBLE
)
BEGIN
	INSERT INTO cliente (nombre,apellido,email,telefono,saldo) 
    VALUES (_Nombre,_Apellido,_Email,_Telefono,_Saldo);
    
    SELECT 1 estado, 'Se insertó correctamente el cliente' resultado;
END$$
DROP PROCEDURE SP_InsertarCliente
CALL SP_InsertarCliente ('Jhon Luis','Torres Torres','C8787@utp.edu.pe','987678666',1111.00)

DELIMITER $$
CREATE PROCEDURE SP_ActualizarCliente
(
	IN _IdCliente INT,
    IN _Nombre VARCHAR(45),
    IN _Apellido VARCHAR(45),
    IN _Email VARCHAR(45),
    IN _Telefono CHAR(9),
    IN _Saldo DOUBLE
)
BEGIN
	UPDATE Cliente
    SET nombre = _Nombre,
    apellido = _Apellido,
    email = _Email,
    telefono = _Telefono,
    saldo = _Saldo
    WHERE IdCliente = _IdCliente;
END$$

CALL SP_ActualizarCliente (5,'Angel','Gonzales','NP','NP',100);

DROP PROCEDURE SP_ActualizarCliente;

DELIMITER $$
CREATE PROCEDURE SP_EliminarCliente
(
	IN _IdCliente INT
)
BEGIN
	DELETE FROM Cliente WHERE IdCliente = _IdCliente;
    SELECT 1 estado, 'El cliente fue eliminado satisfactoriamente' resultado;
END$$

CALL SP_EliminarCliente (5);

DELIMITER $$
CREATE PROCEDURE SP_BuscarClienteId
(
	IN _IdCliente INT
)
BEGIN
	SELECT IdCliente,nombre,apellido,email,telefono,saldo 
    FROM cliente
    WHERE IdCliente = _IdCliente;
END$$

CALL SP_BuscarClienteId (2);


DELIMITER $$
CREATE PROCEDURE SP_BuscarClienteText
(
	IN _Texto VARCHAR(600)
)
BEGIN
	SELECT IdCliente,nombre,apellido,email,telefono,saldo 
    FROM cliente WHERE nombre LIKE CONCAT('%',_Texto,'%')
    OR apellido LIKE CONCAT('%',_Texto,'%');
END$$

CALL SP_BuscarClienteText ('Gonz')

DELIMITER $$
CREATE PROCEDURE SP_ListarCliente()
BEGIN
	SELECT IdCliente,nombre,apellido,email,telefono,saldo FROM cliente;
END$$

CALL SP_ListarCliente()