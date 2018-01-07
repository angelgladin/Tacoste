--Comensal
ALTER TABLE comensal ADD CONSTRAINT pk_id_comensal PRIMARY KEY(id_comensal);

--Datos comensal
ALTER TABLE datos_comensal ADD CONSTRAINT fk_id_comensal FOREIGN KEY (id_comensal) REFERENCES comensal(id_comensal);

--Pedido
ALTER TABLE pedido ADD CONSTRAINT pk_no_pedido PRIMARY KEY(no_pedido);
ALTER TABLE pedido ADD CONSTRAINT fk_id_comensal_1 FOREIGN KEY (id_comensal) REFERENCES comensal(id_comensal);

--Mesa
ALTER TABLE mesa ADD CONSTRAINT pk_id_mesa PRIMARY KEY(id_mesa);
ALTER TABLE mesa ADD CONSTRAINT fk_id_comensal_2 FOREIGN KEY (id_comensal) REFERENCES comensal(id_comensal);
ALTER TABLE mesa ADD CONSTRAINT fk_id_comensal_25 FOREIGN KEY (id_paymaster) REFERENCES comensal(id_comensal);

--Producto
ALTER TABLE producto ADD CONSTRAINT pk_id_producto PRIMARY KEY(id_producto);

--Contener
ALTER TABLE contener ADD CONSTRAINT fk_no_pedido_1 FOREIGN KEY (no_pedido) REFERENCES pedido(no_pedido);
ALTER TABLE contener ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

--Categoria Producto
ALTER TABLE categoria_producto ADD CONSTRAINT fk_id_producto_c FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

--Ingrediente
ALTER TABLE ingrediente ADD CONSTRAINT pk_nombre_ingrediente PRIMARY KEY(nombre_ingrediente);

--Participar
ALTER TABLE participar ADD CONSTRAINT fk_nom_ingre FOREIGN KEY (nombre_ingrediente) REFERENCES ingrediente(nombre_ingrediente);
ALTER TABLE participar ADD CONSTRAINT fk_id_producto_2 FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

--Consumir
ALTER TABLE consumir ADD CONSTRAINT fk_id_comensal_D FOREIGN KEY (id_comensal) REFERENCES comensal(id_comensal);
ALTER TABLE consumir ADD CONSTRAINT fk_no_pedido5 FOREIGN KEY (no_pedido) REFERENCES pedido(no_pedido);

--etiqueta producto
ALTER TABLE etiqueta_producto ADD CONSTRAINT fk_id_producto_e FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
--Salsa
ALTER TABLE salsa ADD CONSTRAINT pk_id_salsa PRIMARY KEY(id_salsa);
ALTER TABLE salsa ADD CONSTRAINT fk_id_producto_4 FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

--Presentacion salsa
ALTER TABLE presentacion_salsa ADD CONSTRAINT fk_id_producto_5 FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

--Emparejar
ALTER TABLE emparejar ADD CONSTRAINT fk_id_salsa FOREIGN KEY (id_salsa) REFERENCES salsa(id_salsa);
ALTER TABLE emparejar ADD CONSTRAINT fk_id_producto_6 FOREIGN KEY (id_producto) REFERENCES producto(id_producto);


--Restricciones Parte Quiños

--Empleado

ALTER TABLE empleado ADD CONSTRAINT pk_curp PRIMARY KEY(curp);
ALTER TABLE datos_empleado ADD CONSTRAINT fk_curp1 FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE correo_empleado ADD CONSTRAINT fk_curp2 FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE telefono_empleado ADD CONSTRAINT fk_curp3 FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE supervisar ADD CONSTRAINT fk_curp4 FOREIGN KEY (curp) REFERENCES empleado(curp);


-- Restricciones Sucursal

ALTER TABLE sucursal ADD CONSTRAINT pk_id_sucursal PRIMARY KEY(id_sucursal);
ALTER TABLE gerencia_sucursal ADD CONSTRAINT fk_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE gerencia_sucursal ADD CONSTRAINT fk_curp FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE informacion_sucursal ADD CONSTRAINT fk_id_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE telefono_sucursal ADD CONSTRAINT fk_id_sucursal2 FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);


--Licencia
ALTER TABLE licencia ADD CONSTRAINT pk_codigo PRIMARY KEY(codigo);
ALTER TABLE licencia_repartidor ADD CONSTRAINT fk_codigo FOREIGN KEY (codigo) REFERENCES licencia(codigo);
ALTER TABLE licencia_repartidor ADD CONSTRAINT fk_curps FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE datos_licencia ADD CONSTRAINT fk_codigo1 FOREIGN KEY (codigo) REFERENCES licencia(codigo);

--Licencia
ALTER TABLE repartidor ADD CONSTRAINT fk_curp_rep FOREIGN KEY (curp) REFERENCES empleado(curp);
ALTER TABLE repartidor ADD CONSTRAINT fk_codigo_1 FOREIGN KEY (codigo) REFERENCES licencia(codigo);


--Proveedor
ALTER TABLE proveedor ADD CONSTRAINT pk_rfc1 PRIMARY KEY(rfc);
ALTER TABLE identificacion_proveedor ADD CONSTRAINT fk_rfc1 FOREIGN KEY (rfc) REFERENCES proveedor(rfc);
ALTER TABLE datos_proveedor ADD CONSTRAINT fk_rfc_dos FOREIGN KEY (rfc) REFERENCES proveedor(rfc);

--Suministro
ALTER TABLE suministro ADD CONSTRAINT pk_id_suministro PRIMARY KEY(id_suministro);
ALTER TABLE nombre_suministro ADD CONSTRAINT fk_id_suministro FOREIGN KEY (id_suministro) REFERENCES suministro(id_suministro);
ALTER TABLE datos_suministro ADD CONSTRAINT fk_id_suministro1 FOREIGN KEY (id_suministro) REFERENCES suministro(id_suministro);
ALTER TABLE datos_suministro ADD CONSTRAINT fk_rfc_3 FOREIGN KEY (rfc) REFERENCES proveedor(rfc);

--Inventario
ALTER TABLE inventario ADD CONSTRAINT pk_no_lote PRIMARY KEY(no_lote);

--Suministrar
ALTER TABLE suministrar ADD CONSTRAINT fk_id_suministro2 FOREIGN KEY (id_suministro) REFERENCES suministro(id_suministro);
ALTER TABLE suministrar ADD CONSTRAINT fk_no_lote FOREIGN KEY (no_lote) REFERENCES inventario(no_lote);

ALTER TABLE generar ADD CONSTRAINT fk_id_sucursal_3 FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE generar ADD CONSTRAINT fk_no_lote_1 FOREIGN KEY (no_lote) REFERENCES inventario(no_lote);

