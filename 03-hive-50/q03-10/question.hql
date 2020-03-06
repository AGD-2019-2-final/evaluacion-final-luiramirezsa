-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS result_table;
CREATE TABLE result_table (
    letra   STRING,
    fecha   STRING,
    valor  INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/tmp/hive-journals';

LOAD DATA LOCAL INPATH "./data.tsv" OVERWRITE INTO TABLE result_table;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
SELECT DISTINCT valor FROM result_table ORDER BY valor ASC LIMIT 5;

DROP TABLE result_table;