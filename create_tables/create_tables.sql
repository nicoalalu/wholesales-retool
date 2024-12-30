-- Eliminar todas las tablas existentes en el esquema público
DO $$ 
BEGIN
    EXECUTE (
        SELECT string_agg('DROP TABLE IF EXISTS ' || tablename || ' CASCADE;', ' ')
        FROM pg_tables
        WHERE schemaname = 'public'
    );
END $$;
----

CREATE TABLE facturas (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	is_deleted boolean not null,
    fecha_emision DATE NOT NULL,
    fecha_desde DATE not null,
    fecha_hasta DATE not null,
    fecha_vto_pago DATE not null,
    tipo_comprobante VARCHAR(50) not null,
    numero_comprobante VARCHAR(50) NOT NULL UNIQUE,
    cuit VARCHAR (50) not null,
    razon_social VARCHAR(100) NOT NULL,
    productos TEXT[] NOT NULL,
    precios_unitarios NUMERIC(10, 2)[] NOT NULL,
    cantidades INT[] NOT NULL,
    total NUMERIC(12, 2) NOT NULL,
    URL VARCHAR(50),
    estado_pago VARCHAR(20) DEFAULT 'Pendiente'
);

-- Crear tabla pagos
CREATE TABLE pagos (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_deleted boolean,
    tipo_pago VARCHAR(50) NOT NULL,
    banco VARCHAR(100),
    monto NUMERIC(12, 2) NOT NULL,
    retenciones NUMERIC(12, 2) DEFAULT 0,
    monto_disponible NUMERIC(12, 2) GENERATED ALWAYS AS (monto + retenciones) STORED,
    estado VARCHAR(20) DEFAULT 'Pendiente',
    observaciones TEXT
);

-- Crear tabla pagos_facturas (intermedia)
CREATE TABLE pagos_facturas (
    id SERIAL PRIMARY KEY,
    id_pago INT REFERENCES pagos(id) ON DELETE CASCADE,
    id_factura text[] not null,
    monto_asignado int[] NOT NULL
);