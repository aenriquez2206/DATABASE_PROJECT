-- migrate:up
CREATE TRIGGER actualizar_saldo_ingreso
AFTER INSERT ON transacciones_ingreso
FOR EACH ROW
BEGIN
  UPDATE tarjetas_corredor
  SET saldo = saldo + NEW.monto
  WHERE id = NEW.id_tarjeta_corredor;
END;


-- migrate:down

DROP TRIGGER IF EXISTS actualizar_saldo_ingreso;