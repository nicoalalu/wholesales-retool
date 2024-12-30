-- Insert Factura (Invoice)
INSERT INTO facturas (timestamp, is_deleted, fecha_emision, fecha_desde, fecha_hasta, fecha_vto_pago, tipo_comprobante, numero_comprobante, cuit, razon_social, productos, precios_unitarios, cantidades, total)
VALUES 
('2024-12-28', false, '2024-12-01', '2024-12-01', '2024-12-31', '2024-12-31', 'Factura', 'FAC-001', '20-12345678-9', 'Cliente A', ARRAY['Producto1'], ARRAY[100.00], ARRAY[2], 200.00);

-- As this invoice has no payment, no entry will be made in pagos_facturas.

-- Insert Factura (Invoice)
INSERT INTO facturas (timestamp, is_deleted, fecha_emision, fecha_desde, fecha_hasta, fecha_vto_pago, tipo_comprobante, numero_comprobante, cuit, razon_social, productos, precios_unitarios, cantidades, total)
VALUES 
('2024-12-28', false, '2024-12-01', '2024-12-01', '2024-12-31', '2024-12-31', 'Factura', 'FAC-002', '20-23456789-0', 'Cliente B', ARRAY['Producto2'], ARRAY[150.00], ARRAY[3], 450.00);

-- Insert Pago (Payment)
INSERT INTO pagos (timestamp, is_deleted, tipo_pago, banco, monto, retenciones, estado, observaciones)
VALUES
('2024-12-28 10:00:00', false, 'Transferencia', 'Banco X', 450.00, 0, 'Completado', 'Pago de factura FAC-002');

-- Insert Pago_Factura (Linking Payment to Invoice)
INSERT INTO pagos_facturas (id_pago, id_factura, monto_asignado)
VALUES 
(1, ARRAY['2'], ARRAY[450]);

-- Insert Factura (Invoice)
INSERT INTO facturas (timestamp, is_deleted, fecha_emision, fecha_desde, fecha_hasta, fecha_vto_pago, tipo_comprobante, numero_comprobante, cuit, razon_social, productos, precios_unitarios, cantidades, total)
VALUES 
('2024-12-28', false, '2024-12-01', '2024-12-01', '2024-12-31', '2024-12-31', 'Factura', 'FAC-003', '20-34567890-1', 'Cliente C', ARRAY['Producto3'], ARRAY[200.00], ARRAY[5], 1000.00);

-- Insert Pago (First Payment)
INSERT INTO pagos (timestamp, is_deleted, tipo_pago, banco, monto, retenciones, estado, observaciones)
VALUES
('2024-12-28 11:00:00', false, 'Transferencia', 'Banco Y', 600.00, 0, 'Completado', 'Primer pago de la factura FAC-003');

-- Insert Pago (Second Payment)
INSERT INTO pagos (timestamp, is_deleted, tipo_pago, banco, monto, retenciones, estado, observaciones)
VALUES
('2024-12-28 12:00:00', false, 'Transferencia', 'Banco Y', 400.00, 0, 'Completado', 'Segundo pago de la factura FAC-003');

-- Insert Pago_Factura (Linking Payments to Invoice)
INSERT INTO pagos_facturas (id_pago, id_factura, monto_asignado)
VALUES 
(1, ARRAY['3'], ARRAY[600]),
(2, ARRAY['3'], ARRAY[400]);


--
-- Insert Factura (First Invoice)
INSERT INTO facturas (timestamp, is_deleted, fecha_emision, fecha_desde, fecha_hasta, fecha_vto_pago, tipo_comprobante, numero_comprobante, cuit, razon_social, productos, precios_unitarios, cantidades, total)
VALUES 
('2024-12-28', false, '2024-12-01', '2024-12-01', '2024-12-31', '2024-12-31', 'Factura', 'FAC-004', '20-45678901-2', 'Cliente D', ARRAY['Producto4'], ARRAY[80.00], ARRAY[2], 160.00);

-- Insert Factura (Second Invoice)
INSERT INTO facturas (timestamp, is_deleted, fecha_emision, fecha_desde, fecha_hasta, fecha_vto_pago, tipo_comprobante, numero_comprobante, cuit, razon_social, productos, precios_unitarios, cantidades, total)
VALUES 
('2024-12-28', false, '2024-12-01', '2024-12-01', '2024-12-31', '2024-12-31', 'Factura', 'FAC-005', '20-56789012-3', 'Cliente D', ARRAY['Producto5'], ARRAY[120.00], ARRAY[1], 120.00);

-- Insert Pago (Single Payment covering both invoices)
INSERT INTO pagos (timestamp, is_deleted, tipo_pago, banco, monto, retenciones, estado, observaciones)
VALUES
('2024-12-28 13:00:00', false, 'Transferencia', 'Banco Z', 280.00, 0, 'Completado', 'Pago conjunto de las facturas FAC-004 y FAC-005');

-- Insert Pago_Factura (Linking Payment to Both Invoices)
INSERT INTO pagos_facturas (id_pago, id_factura, monto_asignado)
VALUES 
(1, ARRAY['4', '5'], ARRAY[160, 120]);


select *
from facturas f 
