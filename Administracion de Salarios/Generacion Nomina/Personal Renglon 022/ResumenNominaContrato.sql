------------------ INSUMOS
-- PR_RESUMEN_POR_CCO_022

-- Q1
SELECT  CCO_DESCRIPCION, CCO_PPR_N1,
	CCO_PPR_N2,
	CCO_PPR_N3,
	CCO_PPR_N4,
	CCO_PPR_N5,
	CCO_PPR_N6,
	CCO_PPR_N7,
                CCO_CODCCO
FROM  	PLA_CCO_CEN_COSTO
WHERE   CCO_CODCIA	= :COMPANIA
       AND CCO_CODIGO IN ('18','28','21','22','19','23','20')
       --AND   CCO_CODIGO IN ('18','19','20','21','22','23')
     -- AND   CCO_CODCCO IN ('1','2','3','4','10','12','13')
ORDER  BY CCO_PPR_N1,
	CCO_PPR_N2,
	CCO_PPR_N3,
	CCO_PPR_N4,
	CCO_PPR_N5,
	CCO_PPR_N6,
	CCO_PPR_N7

-- Q2

SELECT  CCO_CODIGO CCO_COD,
        	CCO_DESCRIPCION CCO_DES,
	CCO_PPR_N1 PPR_N1,
	CCO_PPR_N2 PPR_N2,
	CCO_PPR_N3 PPR_N3,
	CCO_PPR_N4 PPR_N4,
	CCO_PPR_N5 PPR_N5,
	CCO_PPR_N6 PPR_N6,
	CCO_PPR_N7 PPR_N7,
                CCO_CODCCO
FROM  	PLA_CCO_CEN_COSTO
WHERE  CCO_CODCIA = :COMPANIA
       AND CCO_CODIGO IN ('18','28','21','22','19','23','20')
--    AND   CCO_CODIGO IN ('01','28','21','22','19','23')
--('18','19','20','21','22','23')
--      AND   CCO_CODCCO IN  ('1','2','3','4','10','12','13')
ORDER  BY CCO_PPR_N1,
	CCO_PPR_N2,
	CCO_PPR_N3,
	CCO_PPR_N4,
	CCO_PPR_N5,
	CCO_PPR_N6,
	CCO_PPR_N7

-- Q3

SELECT  CCO_CODIGO COD_CCO,
        	CCO_DESCRIPCION CCO_DESCRIP,
	CCO_PPR_N1 C_PPR_N1,
	CCO_PPR_N2 C_PPR_N2,
	CCO_PPR_N3 C_PPR_N3,
	CCO_PPR_N4 C_PPR_N4,
	CCO_PPR_N5 C_PPR_N5,
	CCO_PPR_N6 C_PPR_N6,
	CCO_PPR_N7 C_PPR_N7,
                CCO_CODCCO
FROM  	PLA_CCO_CEN_COSTO
WHERE  CCO_CODCIA = :COMPANIA
       AND CCO_CODIGO IN ('18','28','21','22','19','23','20')
--       AND   CCO_CODIGO IN ('01','28','21','22','19','23')
--('18','19','20','21','22','23')
--      AND   CCO_CODCCO IN ('1','2','3','4','10','12','13')
ORDER  BY CCO_PPR_N1,
	CCO_PPR_N2,
	CCO_PPR_N3,
	CCO_PPR_N4,
	CCO_PPR_N5,
	CCO_PPR_N6,
	CCO_PPR_N7

-- formula columns

function CF_MES_A_LETRASFormula return Char is

FECHA VARCHAR2(300);

BEGIN

  SELECT to_char(PLA_FECHA_AL, 'Month "de" YYYY', 'NLS_DATE_LANGUAGE = SPANISH')
    INTO fecha
    FROM PLA_PLA_PLANILLA
   WHERE PLA_CODTPL = :P_CODTPL
     AND PLA_CODIGO = :P_CODPLA;

  Return ltrim((rtrim(upper(Fecha))));

END;

----- Program Units

function CF_11Formula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
		   --AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		= '01';

   RETURN(V_VALOR);

END;

----

function CF_424_95Formula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '06';

   RETURN(V_VALOR);

END;

--

function CF_ACEP_8170Formula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('04','07','36');

   RETURN(V_VALOR);

END;

----

function CF_BANCHNFormula return Number is

V_VALOR1 NUMBER;
V_VALOR2 NUMBER;
V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR1
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
--		   AND DSS_CODEMP     < 1000
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
		   AND DSS_CODTDC 		= '37';


		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR2
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '38';

	     V_VALOR := NVL(V_VALOR1,0) + NVL(V_VALOR2,0);

   RETURN(V_VALOR);

END;

----

function CF_BANTRABFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '15';

   RETURN(V_VALOR);

END;

----

function CF_BONIF_PROFFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
	 FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		= '06';

   RETURN(V_VALOR);

END;

----

function CF_BONO_ANTFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		   FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG     = '04';

   RETURN(V_VALOR);

END;

----

function CF_COMPLEM_ESPECIFICFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG     IN ('02','09','11','30','40');

   RETURN(V_VALOR);

END;

----

function CF_COOP_TRABEMPORTFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('10','17','21','31');

   RETURN(V_VALOR);

END;

----

function CF_COOP_UPAFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '27';

   RETURN(V_VALOR);

END;

----

function CF_DESC_JUDIFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '13';

   RETURN(V_VALOR);

END;

----
-- // pendiente
function CF_desFormula return VARCHAR is
CURSOR CENTRO IS
      SELECT DISTINCT CCO_DESCRIPCION,CCO_PPR_N1,CCO_PPR_N3,CCO_CODCCO
      FROM PLA_CCO_CEN_COSTO
       WHERE CCO_CODCIA = '001'
   			 --AND   CCO_CODIGO IN ('18','19','20','21','22','23')
   	     AND CCO_CODIGO IN ('18','28','21','22','19','23')
   	 		 --AND CCO_CODCCO IN ('01','28','21','22','19','23')
   			 --AND CCO_CODCCO IN ('1','3','4','10','11','12','13')
   		 ORDER BY CCO_CODCCO;

NOMBRE VARCHAR2(200);
begin
	FOR I IN CENTRO LOOP
		 IF I.CCO_PPR_N1 = :CCO_PPR_N1 AND I.CCO_PPR_N3 = :CCO_PPR_N3 THEN
		 	  RETURN (I.CCO_DESCRIPCION);
		 END IF;
	END LOOP;
end;

----

function CF_DIETAFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
---		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		= '29';

   RETURN(V_VALOR);

END;

----

function CF_FIANZAFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '05';

   RETURN(V_VALOR);

END;

----

function CF_IGSSFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
---		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '01';

   RETURN(V_VALOR);

END;

----

function CF_ISRFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '02';

   RETURN(V_VALOR);

END;

----

function CF_MES_A_LETRASFormula return Char is

FECHA VARCHAR2(300);

BEGIN

  SELECT to_char(PLA_FECHA_AL, 'Month "de" YYYY', 'NLS_DATE_LANGUAGE = SPANISH')
    INTO fecha
    FROM PLA_PLA_PLANILLA
   WHERE PLA_CODTPL = :P_CODTPL
     AND PLA_CODIGO = :P_CODPLA;

  Return ltrim((rtrim(upper(Fecha))));

END;

----

function CF_MONTEPIOFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '12';
		   --AND DSS_CODTDC 		= '03';

   RETURN(V_VALOR);

END;

----

function CF_OTROS_DESCFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('11','22','23','24','25','26','28',
		                          '29','30','32','33','34','35');

   RETURN(V_VALOR);

END;

----

function CF_PASO_SALFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   --AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		= '03';

   RETURN(V_VALOR);

END;

----

function CF_PLAN_PENSIONESFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('16','20');

   RETURN(V_VALOR);

END;

----

function CF_PRESTAMO_SUTRAFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
	---	   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		= '42';

   RETURN(V_VALOR);

END;

----

function CF_SINDICATOFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('08','18');
		   --AND DSS_CODTDC 		IN ('08','09','18','19');

   RETURN(V_VALOR);

END;

----

function CF_SINDICATO_STOPQFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('09','19');

   RETURN(V_VALOR);

END;

----

function CF_SINDICATO_SUTRAPORQUETFormu return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :PPR_N1
		   AND DSS_PPR_N2 		= :PPR_N2
		   AND DSS_PPR_N3 		= :PPR_N3
		   AND DSS_PPR_N4 		= :PPR_N4
		   AND DSS_PPR_N5 		= :PPR_N5
		   AND DSS_PPR_N6 		= :PPR_N6
		   AND DSS_PPR_N7 		= :PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 	  = '41';


   RETURN(V_VALOR);

END;

----

function CF_SUBSIDIO_FAMFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		= '12';

   RETURN(V_VALOR);

END;

----

-- // Pendiente
function CF_TITULOFormula return Char is
BANCO VARCHAR2(100);

BEGIN

  SELECT ICR_NOMBRE
    INTO BANCO
    FROM PLA_ICR_INSTITUCION
   WHERE ICR_CODTIN = '01'
     AND ICR_CODIGO = :P_CODBAN;

    RETURN(BANCO);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RETURN(NULL);

END;

----

function CF_TOTAL_CCOFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(INN_VALOR),0)
		  INTO V_VALOR
	 FROM PLA_INN_INGRESOS
		 WHERE INN_CODCIA 		= :COMPANIA
		   AND INN_CODCIA 		= :COMPANIA
		   AND INN_CODTPL 		= :P_CODTPL
		   AND INN_CODPLA 		= :P_CODPLA
--		   AND INN_PPR_N1 		= :CCO_PPR_N1
		   AND INN_PPR_N2 		= :CCO_PPR_N2
		   AND INN_PPR_N3 		= :CCO_PPR_N3
		   AND INN_PPR_N4 		= :CCO_PPR_N4
		   AND INN_PPR_N5 		= :CCO_PPR_N5
		   AND INN_PPR_N6 		= :CCO_PPR_N6
		   AND INN_PPR_N7 		= :CCO_PPR_N7
 		   AND INN_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND INN_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND INN_CODEMP     < 1000
		   AND INN_CODTIG 		IN ('01','02','03','04','06','09','11','12','30','29','40');

   RETURN(V_VALOR);

END;

----

function CF_TOTAL_DESC_CCOFormula return Number is

V_VALOR NUMBER;

BEGIN

		SELECT NVL(SUM(DSS_VALOR),0)
		  INTO V_VALOR
		  FROM PLA_DSS_DESCUENTOS
		 WHERE DSS_CODCIA 		= :COMPANIA
		   AND DSS_CODTPL 		= :P_CODTPL
		   AND DSS_CODPLA 		= :P_CODPLA
--		   AND DSS_PPR_N1 		= :C_PPR_N1
		   AND DSS_PPR_N2 		= :C_PPR_N2
		   AND DSS_PPR_N3 		= :C_PPR_N3
		   AND DSS_PPR_N4 		= :C_PPR_N4
		   AND DSS_PPR_N5 		= :C_PPR_N5
		   AND DSS_PPR_N6 		= :C_PPR_N6
		   AND DSS_PPR_N7 		= :C_PPR_N7
 		   AND DSS_CODEMP     IN (Select Emp_Codigo
    													  From Pla_Emp_Empleado a,
		  												       Pla_Dpl_Datosplanilla b
															 Where b.dpl_codcia = a.emp_codcia
															   And b.dpl_codemp = a.emp_codigo
															   And b.dpl_Codicr = Nvl(:P_CODBAN, Dpl_Codicr))
		   AND DSS_FORMA_PAGO = SUBSTR(:P_FORMA_PAGO,1,1)
--		   AND DSS_CODEMP     < 1000
		   AND DSS_CODTDC 		IN ('01','02','03','04','05','06','07','08','09',
		                          '10','11','12','13','14','15','16','17','18',
		                          '19','20','21','22','23','24','25','26','27',
		                          '28','29','30','31','32','33','34','35','36','37','38','41');

   RETURN(V_VALOR);

END;


----------------- SOLUCION