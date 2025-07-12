CREATE OR REPLACE PROCEDURE registrar_pago (
  p_monto IN FLOAT,
  p_id_tarjeta IN NUMBER
) AS
  v_saldo_actual FLOAT;
BEGIN
  SELECT saldo INTO v_saldo_actual
  FROM tarjetas_corredor
  WHERE id = p_id_tarjeta;

  IF v_saldo_actual >= p_monto THEN
    INSERT INTO transacciones_pagos (monto, fecha, id_tarjeta_corredor)
    VALUES (p_monto, SYSDATE, p_id_tarjeta);
    DBMS_OUTPUT.PUT_LINE('Pago registrado correctamente.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Saldo insuficiente para registrar el pago.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error al registrar pago: ' || SQLERRM);
END;
/
