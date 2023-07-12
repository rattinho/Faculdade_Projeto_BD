--Trigger para garantir que a quantidade de internados no hospital não exceda um determinado limite
CREATE OR REPLACE FUNCTION check_hospital_capacity() RETURNS TRIGGER AS $$
DECLARE
    total_internados INT;
BEGIN
    SELECT SUM(QtdInternados) INTO total_internados FROM Internacao WHERE CodHospital = NEW.CodHospital;
    IF total_internados + NEW.QtdInternados > 500 THEN
        RAISE EXCEPTION 'A quantidade de internados no hospital excedeu a capacidade máxima';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_hospital_capacity_before_insert
BEFORE INSERT ON Internacao
FOR EACH ROW EXECUTE PROCEDURE check_hospital_capacity();


--Trigger para garantir que o valor do plano de saúde é sempre positivo:
CREATE OR REPLACE FUNCTION check_plan_value() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ValorPlano < 0 THEN
        RAISE EXCEPTION 'O valor do plano de saúde não pode ser negativo';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_plan_value_after_insert_or_update
AFTER INSERT OR UPDATE ON PlanoSaude
FOR EACH ROW EXECUTE PROCEDURE check_plan_value();

