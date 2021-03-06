-- SQL Manager for PostgreSQL 5.9.1.49393
-- ---------------------------------------
-- Host      : localhost
-- Database  : new_db
-- Version   : PostgreSQL 9.3.13, compiled by Visual C++ build 1600, 64-bit



SET search_path = public, pg_catalog;
DROP TABLE IF EXISTS public.detalle_factura;
DROP INDEX IF EXISTS public.cabeza_factura_numero_key;
DROP TABLE IF EXISTS public.cabeza_factura;
DROP TABLE IF EXISTS public.clientes;
DROP INDEX IF EXISTS public.product_product_id_key;
DROP TABLE IF EXISTS public.productos;
SET check_function_bodies = false;
--
-- Structure for table productos (OID = 509376) :
--
CREATE TABLE public.productos (
    producto integer NOT NULL,
    nombre_producto varchar(50) NOT NULL,
    valor double precision
)
WITH (oids = false);
--
-- Structure for table detalle_factura (OID = 509379) :
--
CREATE TABLE public.detalle_factura (
    numero integer NOT NULL,
    producto integer NOT NULL,
    cantidad integer,
    valor double precision
)
WITH (oids = false);
--
-- Structure for table cabeza_factura (OID = 509382) :
--
CREATE TABLE public.cabeza_factura (
    numero integer NOT NULL,
    fecha date DEFAULT ('now'::text)::date,
    cliente integer NOT NULL,
    total double precision
)
WITH (oids = false);
--
-- Structure for table clientes (OID = 509386) :
--
CREATE TABLE public.clientes (
    cliente integer NOT NULL,
    nombre_cliente varchar(150),
    direccion varchar(150)
)
WITH (oids = false);
--
-- Data for table public.productos (OID = 509376) (LIMIT 0,16)
--
INSERT INTO productos (producto, nombre_producto, valor)
VALUES (1, 'Producto 1', 10);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (2, 'Producto 2', 20);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (3, 'Producto 3', 30);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (4, 'Producto 4', 40);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (5, 'Producto 5', 50);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (6, 'Producto 6', 60);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (7, 'Producto 7', 70);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (8, 'Producto 8', 80);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (9, 'Producto 9', 90);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (10, 'Producto 10', 100);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (11, 'Producto 11', 110);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (12, 'Producto 12', 120);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (13, 'Producto 13', 130);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (14, 'Producto 14', 90);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (15, 'Producto 15', 656);

INSERT INTO productos (producto, nombre_producto, valor)
VALUES (16, 'Churrasco', 25000);

--
-- Data for table public.detalle_factura (OID = 509379) (LIMIT 0,500)
--
INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (2, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (2, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (2, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (2, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (3, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (3, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (3, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (4, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (4, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (6, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (8, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (8, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (8, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (8, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (8, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (9, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (9, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (9, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (9, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (9, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (11, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (11, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (11, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (11, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (12, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (12, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (12, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (12, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (13, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (13, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (13, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (14, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (14, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (14, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (14, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (15, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (15, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (15, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (15, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (15, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (16, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (17, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (18, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (19, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (20, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (21, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (21, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (21, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (21, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (22, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (22, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (22, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (22, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (23, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (23, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (23, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (24, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (24, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (24, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (24, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (25, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (25, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (25, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (25, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (25, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 5, 2, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (10, 3, 2, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (7, 8, 2, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (4, 12, 2, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (4, 10, 3, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (26, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (27, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (28, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (29, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (30, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (31, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (31, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (31, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (31, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (32, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (32, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (32, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (32, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (33, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (33, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (33, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (34, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (34, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (34, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (34, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (35, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (35, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (35, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (35, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (35, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (36, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (37, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (38, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (39, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (40, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (41, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (41, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (41, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (41, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (42, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (42, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (42, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (42, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (43, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (43, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (43, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (44, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (44, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (44, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (44, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (45, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (45, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (45, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (45, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (45, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (46, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (47, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (48, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (49, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (50, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (51, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (51, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (51, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (51, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (52, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (52, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (52, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (52, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (53, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (53, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (53, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (54, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (54, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (54, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (54, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (55, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (55, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (55, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (55, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (55, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (56, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (57, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (58, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (59, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (60, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (61, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (61, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (61, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (61, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (62, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (62, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (62, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (62, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (63, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (63, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (63, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (64, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (64, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (64, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (64, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (65, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (65, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (65, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (65, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (65, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (66, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (67, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (68, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (69, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (70, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (71, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (71, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (71, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (71, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (72, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (72, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (72, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (72, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (73, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (73, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (73, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (74, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (74, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (74, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (74, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (75, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (75, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (75, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (75, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (75, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (76, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (77, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (78, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (79, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 3, 1, 30);

--
-- Data for table public.detalle_factura (OID = 509379) (LIMIT 500,158)
--
INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (80, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (81, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (81, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (81, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (81, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (82, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (82, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (82, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (82, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (83, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (83, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (83, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (84, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (84, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (84, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (84, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (85, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (85, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (85, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (85, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (85, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (86, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (87, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (88, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (89, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (90, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (91, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (91, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (91, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (91, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (92, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (92, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (92, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (92, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (93, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (93, 10, 2, 200);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (93, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (94, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (94, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (94, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (94, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (95, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (95, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (95, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (95, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (95, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (96, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 7, 2, 140);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (97, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (98, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (99, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 2, 1, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 3, 1, 30);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 4, 1, 40);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 5, 1, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 6, 1, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 7, 1, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 8, 1, 80);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 9, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 10, 1, 100);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 11, 1, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 12, 1, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 13, 1, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (100, 14, 1, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (101, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (101, 5, 5, 50);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (101, 7, 3, 70);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (104, 1, 1, 10);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (104, 6, 4, 60);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (5, 2, 2, 20);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (5, 11, 2, 110);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (5, 12, 3, 120);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (5, 14, 5, 90);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (5, 13, 4, 130);

INSERT INTO detalle_factura (numero, producto, cantidad, valor)
VALUES (3, 4, 2, 40);

--
-- Data for table public.cabeza_factura (OID = 509382) (LIMIT 0,101)
--
INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (3, '2021-08-22', 1, 240);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (2, '2021-08-21', 1, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (6, '2021-08-25', 1, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (11, '2021-08-20', 2, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (12, '2021-08-21', 2, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (14, '2021-08-23', 2, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (15, '2021-08-24', 2, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (16, '2021-08-25', 2, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (18, '2021-08-27', 2, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (19, '2021-08-28', 2, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (20, '2021-08-29', 2, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (21, '2021-08-20', 3, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (22, '2021-08-21', 3, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (24, '2021-08-23', 3, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (25, '2021-08-24', 3, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (26, '2021-08-25', 3, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (28, '2021-08-27', 3, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (29, '2021-08-28', 3, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (30, '2021-08-29', 3, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (31, '2021-08-20', 4, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (32, '2021-08-21', 4, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (34, '2021-08-23', 4, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (35, '2021-08-24', 4, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (36, '2021-08-25', 4, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (38, '2021-08-27', 4, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (39, '2021-08-28', 4, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (41, '2021-08-20', 5, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (42, '2021-08-21', 5, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (44, '2021-08-23', 5, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (45, '2021-08-24', 5, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (46, '2021-08-25', 5, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (48, '2021-08-27', 5, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (49, '2021-08-28', 5, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (50, '2021-08-29', 5, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (51, '2021-08-20', 6, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (52, '2021-08-21', 6, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (54, '2021-08-23', 6, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (55, '2021-08-24', 6, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (56, '2021-08-25', 6, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (58, '2021-08-27', 6, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (59, '2021-08-28', 6, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (60, '2021-08-29', 6, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (61, '2021-08-20', 7, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (62, '2021-08-21', 7, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (64, '2021-08-23', 7, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (65, '2021-08-24', 7, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (66, '2021-08-25', 7, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (68, '2021-08-27', 7, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (69, '2021-08-28', 7, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (70, '2021-08-29', 7, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (71, '2021-08-20', 8, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (72, '2021-08-21', 8, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (74, '2021-08-23', 8, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (75, '2021-08-24', 8, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (76, '2021-08-25', 8, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (78, '2021-08-27', 8, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (79, '2021-08-28', 8, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (80, '2021-08-29', 8, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (81, '2021-08-20', 9, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (82, '2021-08-21', 9, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (84, '2021-08-23', 9, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (85, '2021-08-24', 9, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (86, '2021-08-25', 9, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (88, '2021-08-27', 9, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (89, '2021-08-28', 9, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (90, '2021-08-29', 9, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (91, '2021-08-20', 10, 100);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (92, '2021-08-21', 10, 200);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (94, '2021-08-23', 10, 400);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (95, '2021-08-24', 10, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (96, '2021-08-25', 10, 600);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (98, '2021-08-27', 10, 800);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (99, '2021-08-28', 10, 900);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (100, '2021-08-29', 10, 1000);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (10, '2021-08-29', 1, 1890);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (5, '2021-08-24', 1, 1590);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (7, '2021-08-26', 1, 920);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (8, '2021-08-27', 1, 340);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (9, '2021-08-28', 1, 350);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (13, '2021-08-22', 2, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (17, '2021-08-26', 2, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (23, '2021-08-22', 3, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (27, '2021-08-26', 3, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (33, '2021-08-22', 4, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (37, '2021-08-26', 4, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (40, '2021-08-29', 4, 440);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (43, '2021-08-22', 5, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (47, '2021-08-26', 5, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (53, '2021-08-22', 6, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (57, '2021-08-26', 6, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (63, '2021-08-22', 7, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (67, '2021-08-26', 7, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (73, '2021-08-22', 8, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (77, '2021-08-26', 8, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (83, '2021-08-22', 9, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (87, '2021-08-26', 9, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (93, '2021-08-22', 10, 500);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (97, '2021-08-26', 10, 840);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (101, '2021-08-21', 85477767, 470);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (104, '2021-08-21', 85477767, 250);

INSERT INTO cabeza_factura (numero, fecha, cliente, total)
VALUES (4, '2021-08-23', 1, 720);

--
-- Data for table public.clientes (OID = 509386) (LIMIT 0,11)
--
INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (1, 'Cliente 1 ', 'Direccion 1');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (2, 'Cliente 2', 'Direccion 2');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (3, 'Cliente 3', 'Direccion 3');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (4, 'Cliente 4', 'Direccion 4');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (5, 'Cliente 5', 'Direccion 5');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (6, 'Cliente 6', 'Direccion 6');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (7, 'Cliente 7', 'Direccion 7');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (8, 'Cliente 8', 'Direccion 8');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (9, 'Cliente 9', 'Direccion 9');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (10, 'Cliente 10', 'Direccion 10');

INSERT INTO clientes (cliente, nombre_cliente, direccion)
VALUES (85477767, 'Rodolfo Jimenez B', 'chapinero');

--
-- Definition for index product_product_id_key (OID = 509389) :
--
CREATE UNIQUE INDEX product_product_id_key ON productos USING btree (producto);
--
-- Definition for index cabeza_factura_numero_key (OID = 509390) :
--
CREATE UNIQUE INDEX cabeza_factura_numero_key ON cabeza_factura USING btree (numero);
--
-- Definition for index order_detail_pkey (OID = 509391) :
--
ALTER TABLE ONLY productos
    ADD CONSTRAINT order_detail_pkey
    PRIMARY KEY (producto, nombre_producto);
--
-- Definition for index cliente_product_pkey (OID = 509393) :
--
ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT cliente_product_pkey
    PRIMARY KEY (numero, producto);
--
-- Definition for index cliente_product_fk1 (OID = 509395) :
--
ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT cliente_product_fk1
    FOREIGN KEY (producto) REFERENCES productos(producto) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index clientes_pkey (OID = 509400) :
--
ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey
    PRIMARY KEY (cliente);
--
-- Definition for index cabeza_factura_idx (OID = 509402) :
--
ALTER TABLE ONLY cabeza_factura
    ADD CONSTRAINT cabeza_factura_idx
    PRIMARY KEY (numero, cliente);
--
-- Definition for index detalle_factura_fk (OID = 509404) :
--
ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT detalle_factura_fk
    FOREIGN KEY (numero) REFERENCES cabeza_factura(numero) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index cabeza_factura_fk (OID = 509409) :
--
ALTER TABLE ONLY cabeza_factura
    ADD CONSTRAINT cabeza_factura_fk
    FOREIGN KEY (cliente) REFERENCES clientes(cliente) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';

CREATE ROLE admin02 NOREPLICATION LOGIN;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON public.cabeza_factura TO admin02;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON public.clientes TO admin02;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON public.detalle_factura TO admin02;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON public.productos TO admin02;


