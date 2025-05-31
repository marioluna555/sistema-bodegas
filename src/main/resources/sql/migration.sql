-- Drop tables if they exist to allow re-running the migration
DROP TABLE IF EXISTS material CASCADE;
DROP TABLE IF EXISTS unidad_almacenamiento CASCADE;
DROP TABLE IF EXISTS proveedor CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS transporte CASCADE;
DROP TABLE IF EXISTS orden_compra CASCADE;
DROP TABLE IF EXISTS orden_venta CASCADE;
DROP TABLE IF EXISTS orden_traslado CASCADE;
DROP TABLE IF EXISTS ajuste_inventario CASCADE;

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    numero_cliente VARCHAR(255) NOT NULL UNIQUE,
    nombre_razon_social VARCHAR(255) NOT NULL,
    tipo_cliente VARCHAR(100) NOT NULL,
    nit VARCHAR(100) NOT NULL,
    direccion_facturacion VARCHAR(255) NOT NULL,
    direccion_entrega VARCHAR(255) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    persona_contacto VARCHAR(255) NOT NULL,
    metodo_pago VARCHAR(100) NOT NULL
);

CREATE TABLE proveedor (
    id SERIAL PRIMARY KEY,
    numero_proveedor VARCHAR(255) NOT NULL UNIQUE,
    nombre_razon_social VARCHAR(255) NOT NULL,
    nit VARCHAR(100) NOT NULL,
    tipo_proveedor VARCHAR(100) NOT NULL,
    direccion_fiscal VARCHAR(255),
    representante_legal VARCHAR(255),
    telefono VARCHAR(50),
    metodo_pago VARCHAR(100),
    condicion_pago VARCHAR(100),
    banco VARCHAR(100),
    tipo_cuenta VARCHAR(100),
    numero_cuenta VARCHAR(100)
);

CREATE TABLE unidad_almacenamiento (
    id SERIAL PRIMARY KEY,
    codigo_unidad VARCHAR(255) NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    clase VARCHAR(100),
    bodega_padre INTEGER REFERENCES unidad_almacenamiento(id),
    volumen_total VARCHAR(100),
    ubicacion_fisica VARCHAR(255),
    observaciones VARCHAR(255)
);

CREATE TABLE material (
    id SERIAL PRIMARY KEY,
    codigo_material VARCHAR(255) NOT NULL UNIQUE,
    nombre_material VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    categoria VARCHAR(100),
    presentacion_cantidad VARCHAR(100),
    peso VARCHAR(100),
    volumen VARCHAR(100),
    stock_disponible VARCHAR(100),
    stock_minimo VARCHAR(100),
    stock_maximo VARCHAR(100),
    lote_serie VARCHAR(100),
    fecha_vencimiento DATE,
    ubicacion INTEGER REFERENCES unidad_almacenamiento(id),
    proveedor INTEGER REFERENCES proveedor(id),
    costo_unitario VARCHAR(100),
    costo_total VARCHAR(100),
    observaciones VARCHAR(255)
);

CREATE TABLE transporte (
    id SERIAL PRIMARY KEY,
    numero_transporte VARCHAR(255) NOT NULL UNIQUE,
    tipo_vehiculo VARCHAR(100) NOT NULL,
    placa VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    capacidad VARCHAR(100),
    kilometraje VARCHAR(100),
    conductor VARCHAR(255)
);

-- Movimientos: Orden de Compra
CREATE TABLE orden_compra (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    material_id INTEGER REFERENCES material(id),
    cantidad NUMERIC(12,2) NOT NULL,
    usuario VARCHAR(100),
    recibido BOOLEAN DEFAULT FALSE,
    observaciones VARCHAR(255)
);

-- Movimientos: Orden de Venta
CREATE TABLE orden_venta (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    material_id INTEGER REFERENCES material(id),
    cantidad NUMERIC(12,2) NOT NULL,
    usuario VARCHAR(100),
    entregado BOOLEAN DEFAULT FALSE,
    observaciones VARCHAR(255),
    cliente_id INTEGER REFERENCES cliente(id),
    unidad_almacenamiento_salida INTEGER REFERENCES unidad_almacenamiento(id)
);

-- Movimientos: Orden de Traslado
CREATE TABLE orden_traslado (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    material_id INTEGER REFERENCES material(id),
    cantidad NUMERIC(12,2) NOT NULL,
    almacen_origen INTEGER REFERENCES unidad_almacenamiento(id),
    almacen_destino INTEGER REFERENCES unidad_almacenamiento(id),
    salida BOOLEAN DEFAULT FALSE,
    recibido BOOLEAN DEFAULT FALSE,
    usuario VARCHAR(100),
    observaciones VARCHAR(255)
);

-- Movimientos: Ajuste de Inventario
CREATE TABLE ajuste_inventario (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    material_id INTEGER REFERENCES material(id),
    cantidad NUMERIC(12,2) NOT NULL,
    tipo_ajuste VARCHAR(50) NOT NULL, -- 'AUMENTO' o 'DISMINUCION'
    usuario VARCHAR(100),
    observaciones VARCHAR(255),
    aplicado BOOLEAN NOT NULL DEFAULT FALSE
);

-- Inserts de prueba para cliente
INSERT INTO cliente (numero_cliente, nombre_razon_social, tipo_cliente, nit, direccion_facturacion, direccion_entrega, telefono, correo, persona_contacto, metodo_pago)
VALUES ('1001', 'Cliente Ejemplo S.A.', 'Empresa', '1234567-8', 'Zona 10, Ciudad', 'Zona 12, Ciudad', '5555-1234', 'cliente@ejemplo.com', 'Juan Pérez', 'Transferencia');

-- Inserts de prueba para proveedor
INSERT INTO proveedor (numero_proveedor, nombre_razon_social, nit, tipo_proveedor, direccion_fiscal, representante_legal, telefono, metodo_pago, condicion_pago, banco, tipo_cuenta, numero_cuenta)
VALUES ('2001', 'Proveedor Ejemplo S.A.', '9876543-2', 'Nacional', 'Zona 4, Ciudad', 'Ana López', '5555-5678', 'TRANSFERENCIA', 'CREDITO_30', 'Banco Industrial', 'Monetaria', '1234567890');

-- Inserts de prueba para unidad_almacenamiento
INSERT INTO unidad_almacenamiento (codigo_unidad, nombre, tipo, clase, volumen_total, ubicacion_fisica, observaciones)
VALUES ('BOD-01', 'Bodega Central', 'Bodega', 'General', '1000', 'Zona 2', 'Principal');

-- Inserts de prueba para material
INSERT INTO material (codigo_material, nombre_material, descripcion, categoria, presentacion_cantidad, peso, volumen, stock_disponible, stock_minimo, stock_maximo, lote_serie, fecha_vencimiento, ubicacion, proveedor, costo_unitario, costo_total, observaciones)
VALUES ('MAT-001', 'Material Prueba', 'Material de prueba', 'Materia Prima', 'Caja x 10', '5', '0.02', '100', '10', '200', 'L001', '2025-12-31', 1, 1, '50.00', '5000.00', 'Sin observaciones');

-- Inserts de prueba para transporte
INSERT INTO transporte (numero_transporte, tipo_vehiculo, placa, marca, capacidad, kilometraje, conductor)
VALUES ('T-001', 'Camión', 'P123BCD', 'Isuzu', '5000', '120000', 'Carlos Gómez');

-- Inserts de prueba para orden_compra
INSERT INTO orden_compra (material_id, cantidad, usuario, recibido, observaciones)
VALUES (1, 50, 'admin', false, 'Compra inicial de prueba');

-- Inserts de prueba para orden_venta
INSERT INTO orden_venta (material_id, cantidad, usuario, entregado, observaciones)
VALUES (1, 20, 'admin', false, 'Venta inicial de prueba');

-- Inserts de prueba para orden_traslado
INSERT INTO orden_traslado (material_id, cantidad, almacen_origen, almacen_destino, salida, recibido, usuario, observaciones)
VALUES (1, 10, 1, 1, false, false, 'admin', 'Traslado de prueba');

-- Inserts de prueba para ajuste_inventario
INSERT INTO ajuste_inventario (material_id, cantidad, tipo_ajuste, usuario, observaciones)
VALUES (1, 5, 'AUMENTO', 'admin', 'Ajuste de prueba');
