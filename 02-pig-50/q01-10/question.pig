-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, cantidad:INT);
letras = FOREACH lines GENERATE FLATTEN(TOKENIZE(letra)) AS word;
grouped = GROUP letras BY word;
letracount = FOREACH grouped GENERATE group, COUNT(letras);
STORE letracount INTO 'output';