-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (letra:CHARARRAY, smallLetraBag:BAG{l: TUPLE(sl:CHARARRAY)});
single_letras = FOREACH lines GENERATE FLATTEN(smallLetraBag) AS letras;
grouped = GROUP single_letras BY letras;
letras_count = FOREACH grouped GENERATE group, COUNT(single_letras);
STORE letras_count INTO 'output';

