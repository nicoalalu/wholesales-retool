INSERT INTO facturas (
    is_deleted, 
    fecha_emision, 
    fecha_desde, 
    fecha_hasta, 
    fecha_vto_pago, 
    tipo_comprobante, 
    numero_comprobante, 
    cuit, 
    razon_social, 
    productos, 
    precios_unitarios, 
    cantidades
)
VALUES (
    false, 
    {{ inputFecha_emision.value }}, 
    {{ inputFecha_desde.value }}, 
    {{ InputFecha_hasta.value }}, 
    {{ InputFecha_vto_pago.value }}, 
    {{ inputTipo_comprobante.value }}, 
    {{ inputNumero_comprobante.value }}, 
    {{ inputCuit.value }}, 
    {{ inputRazon_social.value }}, 
    ARRAY[{{ inputProducto.value }}], 
    ARRAY[{{ inputPrecio_unitario.value }}]::NUMERIC[],
    ARRAY[{{ inputCantidad.value }}]::INTEGER[]
);
