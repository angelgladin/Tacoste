-- Comensales que m�s han consumido (nombre completo,veces que consumio, total pagado).
select nombre||' '||paterno||' '||materno as nombre, veces_consumo, total
from  (select id_comensal,sum(precio) as total 
      from (select * from consumir natural join contener) 
      natural join producto group by id_comensal) 
natural join (select * from comensal 
              natural join (select id_comensal,count(id_comensal) as veces_consumo
              from consumir group by id_comensal
having count(id_comensal) = (select max(count(id_comensal)) from consumir group by id_comensal)));

--Venta de salsas (Nombre salsa,precio, numero de ventas,nivel picor)
select salsa as nombre,nivel_picor,numero_ventas,precio
from (select id_producto,nombre as salsa,numero_ventas,nivel_picor 
      from (select id_producto,sum(cantidad) as numero_ventas from contener group by id_producto) 
      natural join salsa) 
natural join producto;

--Venta de las salsas en el �ltimo a�o (Nombre salsa,precio, numero de ventas)*/
select salsa as nombre,nivel_picor,numero_ventas,precio
from (select id_producto,nombre as salsa,numero_ventas,nivel_picor 
      from (select id_producto,sum(cantidad) as numero_ventas 
            from (select * 
                  from contener natural join pedido 
                  where EXTRACT(YEAR FROM fecha) in (SELECT EXTRACT(YEAR FROM sysdate) FROM dual)) group by id_producto)
natural join salsa)
natural join producto order by numero_ventas desc;

--Todos los empleados que tienen como sueldo $5000 o mas(RFC,nombre completo,sucursal)*/
 SELECT rfc,nombre||' '||paterno||' '||materno as nombre, id_sucursal as sucursal
 FROM (select * FROM empleado WHERE sueldo >= 5000) natural join empleado_sucursal;

 --RFC,nombre completo de los empleados que son gerentes y su sucursal*/
SELECT rfc,nombre||' '||paterno||' '||materno as nombre, id_sucursal as sucursal
FROM empleado NATURAL JOIN gerencia_sucursal;

--Nombre completo de las personas que son empleados excepto repartidores*/
SELECT curp,nombre||' '||paterno||' '||materno as nombre,rfc
FROM empleado
WHERE curp in (SELECT curp
                           FROM empleado
                           MINUS
                           SELECT curp
                          FROM repartidor);
--Esta consulta nos muestra con que prefieren pagar los clientes, para
--esto usamos
--tablas temporales, para almacenar cu�ntas veces se paga con qu�
--metodo y despu�s
--�nicamente sacar el m�ximo.
CREATE TABLE cuenta_veces
AS SELECT count(forma_pago) pago FROM pedido
WHERE (lower(forma_pago) = 'efectivo') OR (lower(forma_pago) = 'tarjeta')
GROUP BY forma_pago;

SELECT max(pago) as preferida FROM cuenta_veces;

--Que salsa es la que m�s participa en los productos que vende la taquer�a.
CREATE TABLE cuenta_apariciones
AS SELECT count(id_salsa) veces FROM emparejar
GROUP BY id_salsa;

SELECT * FROM salsa
WHERE id_producto = (SELECT max(veces) FROM cuenta_apariciones);

--Vamos a ver qu� producto es el que piden m� en cualquier sucursal.

CREATE TABLE veces_productos
AS SELECT count(id_producto) apariciones FROM contener
GROUP BY id_producto;

SELECT nombre FROM producto
WHERE id_producto = (SELECT max(apariciones) FROM veces_productos);
