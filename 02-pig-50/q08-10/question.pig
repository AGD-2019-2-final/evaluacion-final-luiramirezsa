-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{l:TUPLE(sl:CHARARRAY)}, c3:MAP[]);
generador = FOREACH lines GENERATE FLATTEN(c2) AS cf2, FLATTEN(c3) AS cf3;
group_columnas = GROUP generador BY (cf2, cf3);
resultado = FOREACH group_columnas GENERATE group, COUNT(generador);
STORE resultado INTO 'output';