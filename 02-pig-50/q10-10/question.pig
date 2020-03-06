-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.csv' USING PigStorage(',') AS (Id:INT, Nombre:CHARARRAY, Apellido:CHARARRAY, Fecha:CHARARRAY, N:INT);
longitud_apellidos = FOREACH lines GENERATE Apellido, SIZE(Apellido) AS longitud;
apellidos_ordenados = ORDER longitud_apellidos BY longitud DESC, Apellido ASC;
result = FOREACH apellidos_ordenados GENERATE CONCAT(Apellido, ',', (CHARARRAY)longitud);
result = LIMIT result 5;
STORE result INTO 'output';