UPDATE public.facturas f
SET saldo_restante = f.total - COALESCE((
    SELECT SUM(t.monto_asignado)
    FROM public.pagos_facturas pf,
         UNNEST(pf.id_factura, pf.monto_asignado) AS t(id_factura, monto_asignado)
    WHERE f.id::text = t.id_factura
), 0); 
