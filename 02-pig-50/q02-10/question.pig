-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, valor:INT);
result = ORDER lines BY letra ASC, valor ASC;
STORE result INTO 'output';


