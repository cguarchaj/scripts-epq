-- se modifico INSERTA_INGRESO_BONO_14

-- se modifico CALCULA_DESC_JUDICIALES_BONO14

-- se modifico OTROS_DESCUENTOS_BONO14

DELETE FROM pla_pla_planilla
WHERE pla_codcia = '001'
  AND pla_codtpl = '05'
  AND pla_codigo = '202407'
  AND pla_fecha_del = TO_DATE('2023-07-01', 'YYYY-MM-DD')
  AND pla_fecha_al = TO_DATE('2024-06-30', 'YYYY-MM-DD')
  AND pla_fecha_pago = TO_DATE('2024-07-15', 'YYYY-MM-DD');

SELECT  * FROM RHEPQ.error_log ORDER BY LOG_ID asc

SELECT COUNT(*) FROM rhepq.pla_pla_planilla
-- 2826
-- 2827

SELECT COUNT(*) FROM rhepq.PLA_INN_INGRESOS
-- 1800552
-- 1801408

SELECT COUNT(*) FROM rhepq.PLA_DSS_DESCUENTOS
-- 1107261
-- 1107261
--------------

----------------- #pruebas


-------- ########### Pruebas generacion nomina bono 14 ############## -------------
SELECT *
FROM v$locked_object lo
JOIN dba_objects do ON lo.object_id = do.object_id
WHERE do.object_name = 'PLA_PLA_PLANILLA';


-- INSERT INTO pla_pla_planilla
   --  (pla_codcia, pla_codtpl, pla_codigo, pla_fecha_del,
     -- pla_fecha_al, pla_estado, pla_autoriza, pla_usuario_crea,
     -- pla_fecha_crea, pla_usuario_mod, pla_fecha_mod, pla_fecha_pago)
-- VALUES
   --  ('001', '05', '202407', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'),
     -- 'G', null, substr('16', 1, 10), sysdate, null, null,
     -- TO_DATE('2024-07-15', 'YYYY-MM-DD'));


DELETE FROM pla_pla_planilla
WHERE pla_codcia = '001'
  AND pla_codtpl = '05'
  AND pla_codigo = '202407'
  AND pla_fecha_del = TO_DATE('2023-07-01', 'YYYY-MM-DD')
  AND pla_fecha_al = TO_DATE('2024-06-30', 'YYYY-MM-DD')
  AND pla_fecha_pago = TO_DATE('2024-07-15', 'YYYY-MM-DD');

SELECT
    a.bon_codemp,
    COUNT(*) AS num_registros
FROM
    Pla_Bon_Bono14 a
LEFT JOIN
    Pla_Plz_Plaza b ON a.bon_codcia = b.plz_codcia AND a.bon_codplz = b.plz_codigo
LEFT JOIN
    Pla_Uni_Unidad c ON a.bon_codcia = c.uni_codcia AND a.bon_coduni = c.uni_codigo
WHERE
    a.bon_codcia = '001'
    AND a.bon_codtpl = '05'
    AND a.bon_codpla = 202407
GROUP BY
    a.bon_codemp
ORDER BY
    a.bon_codemp;


 SELECT DISTINCT
			    a.bon_codcia,
			    a.bon_codemp,
			    a.bon_ppr_n2,
			    a.bon_ppr_n3,
			    a.bon_ppr_n4,
			    a.bon_ppr_n5,
			    a.bon_ppr_n6,
			    a.bon_ppr_n7,
			    a.bon_ppr_n8,
			    a.bon_forma_pago,
			    a.bon_codger,
			    a.bon_coduni,
			    a.bon_codplz,
			    b.plz_nombre,
			    c.uni_nombre,
			    c.uni_codigo_2003,
			    b.plz_codpue,
			    b.plz_codtpp
			FROM
			    Pla_Bon_Bono14 a
			LEFT JOIN
			    Pla_Plz_Plaza b ON a.bon_codcia = b.plz_codcia AND a.bon_codplz = b.plz_codigo
			LEFT JOIN
			    Pla_Uni_Unidad c ON a.bon_codcia = c.uni_codcia AND a.bon_coduni = c.uni_codigo
			WHERE
			    a.bon_codcia = '001'
			    AND a.bon_codtpl = '05'
			    AND a.bon_codpla = 202407
			GROUP BY
			    a.bon_codcia,
			    a.bon_codemp,
			    a.bon_ppr_n2,
			    a.bon_ppr_n3,
			    a.bon_ppr_n4,
			    a.bon_ppr_n5,
			    a.bon_ppr_n6,
			    a.bon_ppr_n7,
			    a.bon_ppr_n8,
			    a.bon_forma_pago,
			    a.bon_codger,
			    a.bon_coduni,
			    a.bon_codplz,
			    b.plz_nombre,
			    c.uni_nombre,
			    c.uni_codigo_2003,
			    b.plz_codpue,
			    b.plz_codtpp
			ORDER BY
			    a.bon_codcia,
			    a.bon_codemp;


SELECT * FROM RHEPQ.pla_pla_planilla
WHERE
PLA_CODCIA = '001' AND
PLA_CODIGO = 202407 AND
PLA_CODTPL = '05'
ORDER BY PLA_CODIGO DESC

DELETE FROM pla_pla_planilla
WHERE pla_codcia = '001'
  AND pla_codtpl = '05'
  AND pla_codigo = '202407'
  AND pla_fecha_del = TO_DATE('2023-07-01', 'YYYY-MM-DD')
  AND pla_fecha_al = TO_DATE('2024-06-30', 'YYYY-MM-DD')
  AND pla_fecha_pago = TO_DATE('2024-07-15', 'YYYY-MM-DD');


DELETE FROM RHEPQ.PLA_INN_INGRESOS
WHERE INN_CODCIA = '001'
AND INN_CODTPL = '05'
AND INN_CODPLA = 202407
ORDER BY INN_CODEMP DESC

SELECT  * FROM RHEPQ.error_log ORDER BY LOG_ID asc

SELECT COUNT(*) FROM rhepq.pla_pla_planilla
-- 2826
-- 2827

SELECT COUNT(*) FROM rhepq.PLA_INN_INGRESOS
-- 1800552
-- 1801408

SELECT COUNT(*) FROM rhepq.PLA_DSS_DESCUENTOS
-- 1107261
-- 1107261


-----------------

--####### Pruebas generacion tabla anterior ######
SELECT  * FROM RHEPQ.error_log ORDER BY LOG_ID asc

SELECT COUNT(*) FROM rhepq.PLA_BON_BONO14
-- 185514

-- 022

SELECT  * FROM RHEPQ.PLA_ICR_INSTITUCION

SELECT * FROM RHEPQ.pla_bon_bono14

SELECT COUNT(*) FROM RHEPQ.pla_bon_bono14
-- 193588
--

----------- #### PRUEBAS PARAMETROS DE GENERACION PLANILLA ######### -----------

SELECT  * FROM RHEPQ.PLA_TPL_TIPO_PLANILLA

SELECT  * FROM RHEPQ.PLA_PLA_PLANILLA WHERE PLA_CODIGO = 202407

SELECT * FROM RHEPQ.PLA_PPL_PARAM_PLANI

SELECT * FROM RHEPQ.PLA_PPL_PARAM_PLANI WHERE PPL_CODTPL = '27' ORDER BY PPL_CODPLA DESC

--DELETE  FROM RHEPQ.PLA_PPL_PARAM_PLANI WHERE ppl_codcia = '001' AND PPL_CODTPL = '27' AND ppl_codpla = 202407

-- ############### PRUEBAS GENERACION DE TABLAS ######### ------------------

SELECT COUNT(*) FROM RHEPQ.pla_bon_bono14
-- 193588
-- 193589
-- 193775
-- 193961
-- 194891

--------- ######### PRUEBAS GENERACION NOMINA BONO 14 RENGLON 022 ---------------

SELECT  * FROM RHEPQ.PLA_TPL_TIPO_PLANILLA

SELECT * FROM RHEPQ.pla_pla_planilla
WHERE
PLA_CODCIA = '001' AND
PLA_CODIGO = 202407 AND
PLA_CODTPL = '27'
ORDER BY PLA_CODIGO DESC

DELETE FROM pla_pla_planilla
WHERE pla_codcia = '001'
  AND pla_codtpl = '27'
  AND pla_codigo = '202407'
  AND pla_fecha_del = TO_DATE('2023-07-01', 'YYYY-MM-DD')
  AND pla_fecha_al = TO_DATE('2024-06-30', 'YYYY-MM-DD')
  AND pla_fecha_pago = TO_DATE('2024-07-15', 'YYYY-MM-DD');


DELETE FROM RHEPQ.PLA_INN_INGRESOS
WHERE INN_CODCIA = '001'
AND INN_CODTPL = '27'
AND INN_CODPLA = 202407
ORDER BY INN_CODEMP DESC

SELECT  * FROM RHEPQ.error_log ORDER BY LOG_ID asc

SELECT COUNT(*) FROM rhepq.pla_pla_planilla
-- 2826
-- 2827

SELECT COUNT(*) FROM rhepq.PLA_INN_INGRESOS
-- 1800552
-- 1800738

SELECT COUNT(*) FROM rhepq.PLA_DSS_DESCUENTOS
-- 1107261
--