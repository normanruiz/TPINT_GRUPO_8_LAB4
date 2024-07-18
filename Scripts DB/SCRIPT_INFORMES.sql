-- VISTA SALDO POR CLIENTE (PARA INFORME 1)
DROP VIEW IF EXISTS vw_saldo_por_cliente;

CREATE VIEW vw_saldo_por_cliente AS
SELECT id_cliente, SUM(saldo) AS total_saldo
FROM cuentas
GROUP BY id_cliente
ORDER BY total_saldo DESC;

-- INFORME 1: SP BUSCA SALDOS POR CLIENTE MAYORES A
DROP PROCEDURE IF EXISTS sp_buscar_saldos_mayores;
DELIMITER //

CREATE PROCEDURE sp_buscar_saldos_mayores(IN num FLOAT)
BEGIN
    SELECT id_cliente, total_saldo
    FROM vw_saldo_por_cliente
    WHERE total_saldo >= num
    ORDER BY total_saldo ASC;
END //

DELIMITER ;


-- INFORME 2: SP BUSCA SALDOS POR CLIENTE MENORES A
DROP PROCEDURE IF EXISTS sp_buscar_saldos_menores;
DELIMITER //

CREATE PROCEDURE sp_buscar_saldos_menores(IN num FLOAT)
BEGIN
    SELECT id_cliente, total_saldo
    FROM vw_saldo_por_cliente
    WHERE total_saldo <= num
    ORDER BY total_saldo DESC;
END //

DELIMITER ;

-- INFORME 3: CANTIDAD DE CLIENTES POR PROVINCIA
DROP VIEW IF EXISTS vw_clientes_por_provincia;

CREATE VIEW vw_clientes_por_provincia AS
SELECT count(id_cliente) AS ClientesXProvincia, clientes.provincia AS id_provincia, tProv.provincia 
FROM clientes
INNER JOIN provincias AS tProv ON clientes.provincia = tProv.id_provincia 
GROUP BY clientes.provincia
ORDER BY ClientesXProvincia DESC
