-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS result_table;
CREATE TABLE result_table (
    letra   STRING,
    fecha   STRING,
    cuenta  INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/tmp/hive-journals';

LOAD DATA LOCAL INPATH "./data.tsv" OVERWRITE INTO TABLE result_table;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letra, COUNT(*) FROM result_table GROUP BY letra ORDER BY letra ASC;

DROP TABLE result_table;