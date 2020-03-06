-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
date_results = FOREACH u GENERATE birthday, ToString(ToDate(birthday,'yyyy-MM-dd', 'America/Bogota'), 'yyyy-MMM-dd') AS birthday2, ToDate(birthday,'yyyy-MM-dd') AS birthday3;
results = FOREACH date_results GENERATE 
    birthday AS date1 ,
    (
        CASE REGEX_EXTRACT(birthday2, '(.*)-(.*)-(.*)', 2)
            WHEN 'Jan' THEN 'ene'
            WHEN 'Feb' THEN 'feb'
            WHEN 'Mar' THEN 'mar'
            WHEN 'Apr' THEN 'abr'
            WHEN 'May' THEN 'may'
            WHEN 'Jun' THEN 'jun'
            WHEN 'Jul' THEN 'jul'
            WHEN 'Aug' THEN 'ago'
            WHEN 'Sep' THEN 'sep'
            WHEN 'Oct' THEN 'oct'
            WHEN 'Nov' THEN 'nov'
            WHEN 'Dec' THEN 'dic'
        END
    ) AS date2, 
    (
        CASE SIZE((CHARARRAY)GetMonth(birthday3)) 
            WHEN 1 THEN CONCAT('0', (CHARARRAY)GetMonth(birthday3))
            WHEN 2 THEN (CHARARRAY)GetMonth(birthday3)
        END
    ) AS date3,
    (CHARARRAY)GetMonth(birthday3) AS date4;
results = FOREACH results GENERATE CONCAT(date1, ',', date2, ',', date3, ',', date4);
STORE results INTO 'output';