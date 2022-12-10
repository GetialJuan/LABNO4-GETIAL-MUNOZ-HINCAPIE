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

-- (b) Durante la actualización de un registro si el valor grade es modificado,
-- usando RAISE NOTICE se debe presentar un mensaje indicando el cambio, si es
-- igual al valor grade en la tabla se debe indicar que el valor no ha sido
-- modificado. Si el grade a actualizar es negativo, cero o mayor de cinco use
-- RAISE EXCEPTION.
CREATE FUNCTION alter_grade_enrols_function() RETURNS trigger AS
$$
BEGIN
    IF NEW.grade <= 0.00 OR NEW.grade > 5.00 THEN
        RAISE EXCEPTION 'valor inavalido para grade';
    END IF;
    IF NEW.grade = OLD.grade THEN
        RAISE NOTICE  'grade no cambio';
    ELSE
        RAISE NOTICE  'grade cambio';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER alter_grade_enrols
    AFTER UPDATE ON enrols
    FOR EACH ROW 
    EXECUTE FUNCTION alter_grade_enrols_function();
