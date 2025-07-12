CREATE OR REPLACE FUNCTION obtener_saldo (
  p_id_tarjeta IN NUMBER
) RETURN FLOAT IS
  v_saldo FLOAT;
BEGIN
  SELECT saldo INTO v_saldo
  FROM tarjetas_corredor
  WHERE id = p_id_tarjeta;

  RETURN v_saldo;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN -1;
  WHEN OTHERS THEN
    RETURN -2;
END;
/