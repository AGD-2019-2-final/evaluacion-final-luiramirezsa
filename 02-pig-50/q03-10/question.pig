-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, valor:INT);
result = ORDER lines BY valor ASC;
result = LIMIT result 5; 
result = FOREACH result GENERATE valor;
STORE result INTO 'output';