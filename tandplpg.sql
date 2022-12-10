-- (a) Al agregar una tupla en enrolls, en caso de que la nota sea negativa,
-- cero (0.0) o mayor de 5.00 se debe generar una excepción indicando que el
-- valor a guardar en grade es incorrecto o invalido.
CREATE FUNCTION exception_enrols_grade() RETURNS trigger AS
$$
BEGIN
    IF NEW.grade < 0.00 THEN
        RAISE EXCEPTION  'grade no puede ser negativo';
    END IF;
    IF NEW.grade > 5.00 THEN
        RAISE EXCEPTION  'grade no pude ser mayor a 5.00';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER valor_incorecto_enrols_grade
    BEFORE INSERT ON enrols
    FOR EACH ROW
    EXECUTE FUNCTION exception_enrols_grade();

