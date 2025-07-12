CREATE OR REPLACE FUNCTION tiene_saldo_suficiente (
  p_id_tarjeta IN NUMBER,
  p_monto IN FLOAT
) RETURN BOOLEAN IS
  v_saldo FLOAT;
BEGIN
  SELECT saldo INTO v_saldo
  FROM tarjetas_corredor
  WHERE id = p_id_tarjeta;

  RETURN v_saldo >= p_monto;
EXCEPTION
  WHEN OTHERS THEN
    RETURN FALSE;
END;
/