
WITH CENTROS_COSTO AS (
    SELECT DISTINCT
        CCO_DESCRIPCION,
        CCO_PPR_N1,
        CCO_PPR_N2,
        CCO_PPR_N3,
        CCO_PPR_N4,
        CCO_PPR_N5,
        CCO_PPR_N6,
        CCO_PPR_N7,
        CCO_CODCCO
    FROM PLA_CCO_CEN_COSTO
    WHERE CCO_CODCIA = '001'
    AND CCO_CODIGO IN ('18', '28', '21', '22', '19', '23', '20')
    ORDER BY CCO_PPR_N1, CCO_PPR_N2, CCO_PPR_N3, CCO_PPR_N4, CCO_PPR_N5, CCO_PPR_N6, CCO_PPR_N7
)
SELECT
    CCO_DESCRIPCION,
    CCO_PPR_N1,
    CCO_PPR_N2,
    CCO_PPR_N3,
    CCO_PPR_N4,
    CCO_PPR_N5,
    CCO_PPR_N6,
    CCO_PPR_N7,
    CCO_CODCCO,
    -- CF_11Formula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG = '01') AS CF_11,
    -- CF_424_95Formula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '06') AS CF_424_95,
    -- CF_ACEP_8170Formula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('04', '07', '36')) AS CF_ACEP_8170,
    -- CF_BANCHNFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '37') +
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '38') AS CF_BANCHN,
    -- CF_BANTRABFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODEMP < 1000
     AND DSS_CODTDC = '15') AS CF_BANTRAB,
    -- CF_BONIF_PROFFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG = '06') AS CF_BONIF_PROF,
    -- CF_BONO_ANTFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG = '04') AS CF_BONO_ANT,
    -- CF_COMPLEM_ESPECIFICFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG IN ('02', '09', '11', '30', '40')) AS CF_COMPLEM_ESPECIFIC,
    -- CF_COOP_TRABEMPORTFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('10', '17', '21', '31')) AS CF_COOP_TRABEMPORT,
    -- CF_COOP_UPAFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '27') AS CF_COOP_UPA,
    -- CF_DESC_JUDIFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '13') AS CF_DESC_JUDI,

    -- CF_desFormula
    (SELECT DISTINCT CCO_DESCRIPCION
    FROM PLA_CCO_CEN_COSTO c
    WHERE c.CCO_CODCIA = '001'
    AND c.CCO_CODIGO IN ('18', '28', '21', '22', '19', '23')
    AND c.CCO_PPR_N1 = CENTROS_COSTO.CCO_PPR_N1
    AND c.CCO_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
    AND ROWNUM = 1) AS CF_des,


    -- CF_DIETAFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG = '29') AS CF_DIETA,
    -- CF_FIANZAFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '05') AS CF_FIANZA,
    -- CF_IGSSFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '01') AS CF_IGSS,
    -- CF_ISRFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '02') AS CF_ISR,
    -- CF_MES_A_LETRASFormula
    (SELECT TO_CHAR(PLA_FECHA_AL, 'Month "de" YYYY', 'NLS_DATE_LANGUAGE = SPANISH')
     FROM PLA_PLA_PLANILLA
     WHERE PLA_CODTPL = '26'
     AND PLA_CODIGO = 202406) AS CF_MES_A_LETRAS,
    -- CF_MONTEPIOFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '12') AS CF_MONTEPIO,
    -- CF_OTROS_DESCFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('11', '22', '23', '24', '25', '26', '28',
                        '29', '30', '32', '33', '34', '35')) AS CF_OTROS_DESC,
    -- CF_PASO_SALFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_CODTIG = '03') AS CF_PASO_SAL,
    -- CF_PLAN_PENSIONESFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('16', '20')) AS CF_PLAN_PENSIONES,
    -- CF_PRESTAMO_SUTRAFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '42') AS CF_PRESTAMO_SUTRA,
    -- CF_SINDICATOFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('08', '18')) AS CF_SINDICATO,
    -- CF_SINDICATO_STOPQFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('09', '19')) AS CF_SINDICATO_STOPQ,
    -- CF_SINDICATO_SUTRAPORQUETFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC = '41') AS CF_SINDICATO_SUTRAPORQUET,
    -- CF_SUBSIDIO_FAMFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG = '12') AS CF_SUBSIDIO_FAM,
    -- CF_TITULOFormula
    (SELECT ICR_NOMBRE
     FROM PLA_ICR_INSTITUCION
     WHERE ICR_CODTIN = '01'
     AND ICR_CODIGO = '6817') AS CF_TITULO,
    -- CF_TOTAL_CCOFormula
    (SELECT NVL(SUM(INN_VALOR), 0)
     FROM PLA_INN_INGRESOS
     WHERE INN_CODCIA = '001'
     AND INN_CODTPL = '26'
     AND INN_CODPLA = 202406
     AND INN_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND INN_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND INN_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND INN_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND INN_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND INN_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND INN_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND INN_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND INN_CODTIG IN ('01', '02', '03', '04', '06', '09', '11', '12', '30', '29', '40')) AS CF_TOTAL_CCO,
    -- CF_TOTAL_DESC_CCOFormula
    (SELECT NVL(SUM(DSS_VALOR), 0)
     FROM PLA_DSS_DESCUENTOS
     WHERE DSS_CODCIA = '001'
     AND DSS_CODTPL = '26'
     AND DSS_CODPLA = 202406
     AND DSS_PPR_N2 = CENTROS_COSTO.CCO_PPR_N2
     AND DSS_PPR_N3 = CENTROS_COSTO.CCO_PPR_N3
     AND DSS_PPR_N4 = CENTROS_COSTO.CCO_PPR_N4
     AND DSS_PPR_N5 = CENTROS_COSTO.CCO_PPR_N5
     AND DSS_PPR_N6 = CENTROS_COSTO.CCO_PPR_N6
     AND DSS_PPR_N7 = CENTROS_COSTO.CCO_PPR_N7
     AND DSS_CODEMP IN (
         SELECT Emp_Codigo
         FROM Pla_Emp_Empleado a, Pla_Dpl_Datosplanilla b
         WHERE b.dpl_codcia = a.emp_codcia
         AND b.dpl_codemp = a.emp_codigo
         AND b.dpl_Codicr = NVL('6817', Dpl_Codicr)
     )
     AND DSS_FORMA_PAGO = SUBSTR('A', 1, 1)
     AND DSS_CODTDC IN ('01', '02', '03', '04', '05', '06', '07', '08', '09',
                        '10', '11', '12', '13', '14', '15', '16', '17', '18',
                        '19', '20', '21', '22', '23', '24', '25', '26', '27',
                        '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '41')) AS CF_TOTAL_DESC_CCO
FROM CENTROS_COSTO;