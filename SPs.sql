   -- ####### MODULO PARAMETROS GENEREALES ########

CREATE OR REPLACE PROCEDURE RHEPQ.SP_SIDE_GEN_CIA(
    pOpcion IN NUMBER,
    pCiaCodigo IN OUT  VARCHAR2,
    pCiaDes IN VARCHAR2 DEFAULT NULL,
    pCiaRegistro IN VARCHAR2 DEFAULT NULL,
    pCiaGiro IN VARCHAR2 DEFAULT NULL,
    pCiaDireccion IN VARCHAR2 DEFAULT NULL,
    pCiaTelefonos IN VARCHAR2 DEFAULT NULL,
    pCiaNit IN VARCHAR2 DEFAULT NULL,
    pCiaPatronal IN VARCHAR2 DEFAULT NULL,
    pCiaSminimo IN VARCHAR2 DEFAULT NULL,
    pCiaFsvEmp IN VARCHAR2 DEFAULT NULL,
    pCiaFsvPat IN VARCHAR2 DEFAULT NULL,
    pCiaBaseCot IN VARCHAR2 DEFAULT NULL,
    pCiaIsss1Emp IN VARCHAR2 DEFAULT NULL,
    pCiaIsss1Pat IN VARCHAR2 DEFAULT NULL,
    pCiaIsss2Emp IN VARCHAR2 DEFAULT NULL,
    pCiaIsss2Pat IN VARCHAR2 DEFAULT NULL,
    pCiaFax IN VARCHAR2 DEFAULT NULL,
    pCiaInpep IN VARCHAR2 DEFAULT NULL,
    pCiaInpepPat IN VARCHAR2 DEFAULT NULL,
    pCiaMedica IN VARCHAR2 DEFAULT NULL,
    pCiaMedicaPat IN VARCHAR2 DEFAULT NULL,
    pCiaFondo IN VARCHAR2 DEFAULT NULL,
    pCiaFondoPat IN VARCHAR2 DEFAULT NULL,
    pCiaPeriodo IN VARCHAR2 DEFAULT NULL,
    pCiaIvaRenta IN VARCHAR2 DEFAULT NULL,
    pCiaRentaDeducible IN VARCHAR2 DEFAULT NULL,
    pCiaMaximo IN VARCHAR2 DEFAULT NULL,
    pCiaCesantia IN VARCHAR2 DEFAULT NULL,
    pCiaSmaximo IN VARCHAR2 DEFAULT NULL,
    pCiaDegustacion IN VARCHAR2 DEFAULT NULL,
    pCiaMaxAtconsta IN VARCHAR2 DEFAULT NULL,
    pCiaMaxVacacion IN VARCHAR2 DEFAULT NULL,
    pCiaPorVacacion IN VARCHAR2 DEFAULT NULL,
    pCiaFechaAguinaldo IN VARCHAR2 DEFAULT NULL,
    pCiaFechaBonoAntig IN VARCHAR2 DEFAULT NULL,
    pCiaEstado IN VARCHAR2 DEFAULT NULL,
    pCiaCodpai IN VARCHAR2 DEFAULT NULL,
    pCiaCodigoInterno IN VARCHAR2 DEFAULT NULL,
    pCiaPctRevaluacion IN VARCHAR2 DEFAULT NULL,
    pCiaCodEmpresaCiaf IN VARCHAR2 DEFAULT NULL,
    pCiaNoTarjetaResp IN VARCHAR2 DEFAULT NULL,
    pCiaNoTarjetaInv IN VARCHAR2 DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    -- Iniciar transacción
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
    INSERT INTO SIDE_GEN_CIA (
        CIA_CODIGO,
        CIA_DES,
        CIA_REGISTRO,
        CIA_GIRO,
        CIA_DIRECCION,
        CIA_TELEFONOS,
        CIA_NIT,
        CIA_PATRONAL,
        CIA_SMINIMO,
        CIA_FSV_EMP,
        CIA_FSV_PAT,
        CIA_BASE_COT,
        CIA_ISSS1_EMP,
        CIA_ISSS1_PAT,
        CIA_ISSS2_EMP,
        CIA_ISSS2_PAT,
        CIA_FAX,
        CIA_INPEP,
        CIA_INPEP_PAT,
        CIA_MEDICA,
        CIA_MEDICA_PAT,
        CIA_FONDO,
        CIA_FONDO_PAT,
        CIA_PERIODO,
        CIA_IVA_RENTA,
        CIA_RENTA_DEDUCIBLE,
        CIA_MAXIMO,
        CIA_CESANTIA,
        CIA_SMAXIMO,
        CIA_DEGUSTACION,
        CIA_MAX_ATCONSTA,
        CIA_MAX_VACACION,
        CIA_POR_VACACION,
        CIA_FECHA_AGUINALDO,
        CIA_FECHA_BONO_ANTIG,
        CIA_ESTADO,
        CIA_CODPAI,
        CIA_CODIGO_INTERNO,
        CIA_PCT_REVALUACION,
        CIA_COD_EMPRESA_CIAF,
        CIA_NO_TARJETA_RESP,
        CIA_NO_TARJETA_INV
    ) VALUES (
        pCiaCodigo,
        pCiaDes,
        pCiaRegistro,
        pCiaGiro,
        pCiaDireccion,
        pCiaTelefonos,
        pCiaNit,
        pCiaPatronal,
        pCiaSminimo,
        pCiaFsvEmp,
        pCiaFsvPat,
        pCiaBaseCot,
        pCiaIsss1Emp,
        pCiaIsss1Pat,
        pCiaIsss2Emp,
        pCiaIsss2Pat,
        pCiaFax,
        pCiaInpep,
        pCiaInpepPat,
        pCiaMedica,
        pCiaMedicaPat,
        pCiaFondo,
        pCiaFondoPat,
        pCiaPeriodo,
        pCiaIvaRenta,
        pCiaRentaDeducible,
        pCiaMaximo,
        pCiaCesantia,
        pCiaSmaximo,
        pCiaDegustacion,
        pCiaMaxAtconsta,
        pCiaMaxVacacion,
        pCiaPorVacacion,
        pCiaFechaAguinaldo,
        pCiaFechaBonoAntig,
        pCiaEstado,
        pCiaCodpai,
        pCiaCodigoInterno,
        pCiaPctRevaluacion,
        pCiaCodEmpresaCiaf,
        pCiaNoTarjetaResp,
        pCiaNoTarjetaInv
    )
    RETURNING CIA_CODIGO INTO pCiaCodigo;
   
ELSIF pOpcion = 2 THEN
    UPDATE SIDE_GEN_CIA SET
        CIA_CODIGO = pCiaCodigo,
        CIA_DES = pCiaDes,
        CIA_REGISTRO = pCiaRegistro,
        CIA_GIRO = pCiaGiro,
        CIA_DIRECCION = pCiaDireccion,
        CIA_TELEFONOS = pCiaTelefonos,
        CIA_NIT = pCiaNit,
        CIA_PATRONAL = pCiaPatronal,
        CIA_SMINIMO = pCiaSminimo,
        CIA_FSV_EMP = pCiaFsvEmp,
        CIA_FSV_PAT = pCiaFsvPat,
        CIA_BASE_COT = pCiaBaseCot,
        CIA_ISSS1_EMP = pCiaIsss1Emp,
        CIA_ISSS1_PAT = pCiaIsss1Pat,
        CIA_ISSS2_EMP = pCiaIsss2Emp,
        CIA_ISSS2_PAT = pCiaIsss2Pat,
        CIA_FAX = pCiaFax,
        CIA_INPEP = pCiaInpep,
        CIA_INPEP_PAT = pCiaInpepPat,
        CIA_MEDICA = pCiaMedica,
        CIA_MEDICA_PAT = pCiaMedicaPat,
        CIA_FONDO = pCiaFondo,
        CIA_FONDO_PAT = pCiaFondoPat,
        CIA_PERIODO = pCiaPeriodo,
        CIA_IVA_RENTA = pCiaIvaRenta,
        CIA_RENTA_DEDUCIBLE = pCiaRentaDeducible,
        CIA_MAXIMO = pCiaMaximo,
        CIA_CESANTIA = pCiaCesantia,
        CIA_SMAXIMO = pCiaSmaximo,
        CIA_DEGUSTACION = pCiaDegustacion,
        CIA_MAX_ATCONSTA = pCiaMaxAtconsta,
        CIA_MAX_VACACION = pCiaMaxVacacion,
        CIA_POR_VACACION = pCiaPorVacacion,
        CIA_FECHA_AGUINALDO = pCiaFechaAguinaldo,
        CIA_FECHA_BONO_ANTIG = pCiaFechaBonoAntig,
        CIA_CODPAI = pCiaCodpai,
        CIA_CODIGO_INTERNO = pCiaCodigoInterno,
        CIA_PCT_REVALUACION = pCiaPctRevaluacion,
        CIA_COD_EMPRESA_CIAF = pCiaCodEmpresaCiaf,
        CIA_NO_TARJETA_RESP = pCiaNoTarjetaResp,
        CIA_NO_TARJETA_INV = pCiaNoTarjetaInv
    WHERE CIA_CODIGO = pCiaCodigo;
   
    ELSIF pOpcion = 3 THEN
        UPDATE SIDE_GEN_CIA SET
            CIA_ESTADO = pCiaEstado
        WHERE CIA_CODIGO = pCiaCodigo;
       
    END IF;
    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT * FROM SIDE_GEN_CIA WHERE CIA_CODIGO  = pCiaCodigo;
           
    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM SIDE_GEN_CIA;
        pTotalPage := CEIL(vContador / pPageSize);

		OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
						--ROWID,
						CIA_CODIGO,
						CIA_DES,
						CIA_REGISTRO,
						CIA_PATRONAL,
						CIA_GIRO,
						CIA_NIT,
						CIA_DIRECCION,
						CIA_TELEFONOS,
						CIA_SMINIMO,
						CIA_SMAXIMO,
						CIA_MAXIMO,
						CIA_MAX_ATCONSTA,
						CIA_FECHA_AGUINALDO,
						CIA_MAX_VACACION,
						CIA_POR_VACACION,
						CIA_DEGUSTACION,
						CIA_FSV_EMP,
						CIA_FSV_PAT,
						CIA_BASE_COT,
						CIA_ISSS1_EMP,
						CIA_ISSS1_PAT,
						CIA_ISSS2_EMP,
						CIA_ISSS2_PAT 
					FROM SIDE_GEN_CIA 
					ORDER BY CIA_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;		 
           
    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CIA_CODIGO AS value, CIA_DES AS label FROM SIDE_GEN_CIA;
           
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_SIDE_GEN_CIA;


-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_PAI_PAIS(
    pOpcion IN NUMBER,
    pPaiCodigo IN OUT VARCHAR2,
    pPaiDescripcion IN VARCHAR2 DEFAULT NULL,
    pPaiNacionalidad IN VARCHAR2 DEFAULT NULL,
    pPaiCodtgo IN VARCHAR2 DEFAULT NULL,
    pPaiNivel IN VARCHAR2 DEFAULT NULL,
    pPaiCodmon IN NUMBER DEFAULT NULL,
    pPaiCodidi IN VARCHAR2 DEFAULT NULL,
    pPaiMnemonico IN VARCHAR2 DEFAULT NULL,
    pPaiFlete IN NUMBER DEFAULT NULL,
    pPaiCodgrp IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_PAI_PAIS (
            PAI_CODIGO,
            PAI_DESCRIPCION,
            PAI_NACIONALIDAD,
            PAI_CODTGO,
            PAI_NIVEL,
            PAI_CODMON,
            PAI_CODIDI,
            PAI_MNEMONICO,
            PAI_FLETE,
            PAI_CODGRP
        ) VALUES (
            pPaiCodigo,
            pPaiDescripcion,
            pPaiNacionalidad,
            pPaiCodtgo,
            pPaiNivel,
            pPaiCodmon,
            pPaiCodidi,
            pPaiMnemonico,
            pPaiFlete,
            pPaiCodgrp
        )
        RETURNING PAI_CODIGO INTO pPaiCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_PAI_PAIS SET
            PAI_DESCRIPCION = pPaiDescripcion,
            PAI_NACIONALIDAD = pPaiNacionalidad,
            PAI_CODTGO = pPaiCodtgo,
            PAI_NIVEL = pPaiNivel,
            PAI_CODMON = pPaiCodmon,
            PAI_CODIDI = pPaiCodidi,
            PAI_MNEMONICO = pPaiMnemonico,
            PAI_FLETE = pPaiFlete,
            PAI_CODGRP = pPaiCodgrp
        WHERE PAI_CODIGO = pPaiCodigo;
       
    END IF;
   
   COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                PAI_CODIGO,
                PAI_DESCRIPCION,
                PAI_NACIONALIDAD 
            FROM PLA_PAI_PAIS
            WHERE PAI_CODIGO = pPaiCodigo;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM PLA_PAI_PAIS
		WHERE 
		(
		    pPaiDescripcion IS NULL
		    OR pPaiDescripcion = ''
		    OR LOWER(PAI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pPaiDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                PAI_CODIGO,
		                PAI_DESCRIPCION,
		                PAI_NACIONALIDAD 
		            FROM PLA_PAI_PAIS
		            WHERE 
		            (
		                pPaiDescripcion IS NULL
		                OR pPaiDescripcion = ''
		                OR LOWER(PAI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pPaiDescripcion)) || '%'
		            )
		            ORDER BY PAI_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

           
    ELSIF pOpcion = 6 THEN
       open pCursor for
            select PAI_CODIGO AS value, PAI_DESCRIPCION AS label
            from PLA_PAI_PAIS;
           
    END IF; 
   
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_PAI_PAIS;

-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_DEP_DEPARTAMENTO(
    pOpcion IN NUMBER,
    pDepCodigo IN OUT VARCHAR2,
    pDepNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_DEP_DEPARTAMENTO (
            DEP_CODIGO,
            DEP_NOMBRE
        ) VALUES (
            pDepCodigo,
            pDepNombre
        )
        RETURNING DEP_CODIGO INTO pDepCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_DEP_DEPARTAMENTO SET
            DEP_NOMBRE = pDepNombre
        WHERE DEP_CODIGO = pDepCodigo;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                DEP_CODIGO,
                DEP_NOMBRE
            FROM PLA_DEP_DEPARTAMENTO
            WHERE DEP_CODIGO = pDepCodigo;

    ELSIF pOpcion = 5 THEN
       	SELECT COUNT(*) INTO vContador
		FROM PLA_DEP_DEPARTAMENTO
		WHERE 
		(
		    pDepNombre IS NULL
		    OR pDepNombre = ''
		    OR LOWER(DEP_NOMBRE) LIKE '%' || LOWER(TRIM(pDepNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ROWID AS id,
		                DEP_CODIGO,
		                DEP_NOMBRE
		            FROM PLA_DEP_DEPARTAMENTO
		            WHERE 
		            (
		                pDepNombre IS NULL
		                OR pDepNombre = ''
		                OR LOWER(DEP_NOMBRE) LIKE '%' || LOWER(TRIM(pDepNombre)) || '%'
		            )
		            ORDER BY DEP_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT DEP_CODIGO AS value, DEP_NOMBRE AS label
            FROM PLA_DEP_DEPARTAMENTO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_DEP_DEPARTAMENTO;


-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_MUN_MUNICIPIO(
    pOpcion IN NUMBER,    
    pRowId IN OUT VARCHAR2,
    pMunCodigo IN OUT VARCHAR2,
    pMunCodDep IN OUT VARCHAR2,
    pMunNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_MUN_MUNICIPIO (
            MUN_CODDEP,
            MUN_CODIGO,
            MUN_NOMBRE
        ) VALUES (
            pMunCodDep,
            pMunCodigo,
            pMunNombre
        )
        RETURNING ROWID INTO pRowId;  

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_MUN_MUNICIPIO SET
            MUN_NOMBRE = pMunNombre,
            MUN_CODDEP = pMunCodDep
        WHERE ROWID = pRowId;
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                MUN_CODDEP,
                MUN_CODIGO,
                MUN_NOMBRE
            FROM PLA_MUN_MUNICIPIO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
       	SELECT COUNT(*) INTO vContador
		FROM PLA_MUN_MUNICIPIO
		WHERE 
		(
		    pMunNombre IS NULL
		    OR pMunNombre = ''
		    OR LOWER(MUN_NOMBRE) LIKE '%' || LOWER(TRIM(pMunNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ROWID AS id,
		                MUN_CODDEP,
		                MUN_CODIGO,
		                MUN_NOMBRE
		            FROM PLA_MUN_MUNICIPIO
		            WHERE 
		            (
		                pMunNombre IS NULL
		                OR pMunNombre = ''
		                OR LOWER(MUN_NOMBRE) LIKE '%' || LOWER(TRIM(pMunNombre)) || '%'
		            )
		            ORDER BY MUN_CODDEP, MUN_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT MUN_CODIGO AS value, MUN_NOMBRE AS label
            FROM PLA_MUN_MUNICIPIO
            WHERE MUN_CODDEP = pMunCodDep;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_MUN_MUNICIPIO;

-----------------------------------------------------------


CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_TDO_TIPO_DOCUMENTO(
    pOpcion IN NUMBER,
    pTdoCodigo IN OUT VARCHAR2,
    pTdoDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO RHEPQ.REC_TDO_TIPO_DOCUMENTO (
            TDO_CODIGO,
            TDO_DESCRIPCION
        ) VALUES (
            pTdoCodigo,
            pTdoDescripcion
        )
        RETURNING TDO_CODIGO INTO pTdoCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE RHEPQ.REC_TDO_TIPO_DOCUMENTO SET
            TDO_DESCRIPCION = pTdoDescripcion
        WHERE TDO_CODIGO = pTdoCodigo;
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                TDO_CODIGO,
                TDO_DESCRIPCION
            FROM RHEPQ.REC_TDO_TIPO_DOCUMENTO
            WHERE TDO_CODIGO = pTdoCodigo;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador
		FROM REC_TDO_TIPO_DOCUMENTO
		WHERE 
		(
		    pTdoDescripcion IS NULL
		    OR pTdoDescripcion = ''
		    OR LOWER(TDO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTdoDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                TDO_CODIGO,
		                TDO_DESCRIPCION
		            FROM RHEPQ.REC_TDO_TIPO_DOCUMENTO rttd  
		            WHERE 
		            (
		                pTdoDescripcion IS NULL
		                OR pTdoDescripcion = ''
		                OR LOWER(TDO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTdoDescripcion)) || '%'
		            )
		            ORDER BY TDO_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;


    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TDO_CODIGO AS value, TDO_DESCRIPCION AS label
            FROM RHEPQ.REC_TDO_TIPO_DOCUMENTO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_TDO_TIPO_DOCUMENTO;


-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TIN_TIPO_INSTITUCION(
    pOpcion IN NUMBER,
    pTinCodigo IN OUT VARCHAR2,
    pTinNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    --start transaction
    SAVEPOINT transact;

    IF pOpcion = 1 then
        INSERT INTO PLA_TIN_TIPO_INSTITUCION (
            TIN_CODIGO,
            TIN_NOMBRE
        ) VALUES (
            pTinCodigo,
            pTinNombre
        )
        RETURNING TIN_CODIGO INTO pTinCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_TIN_TIPO_INSTITUCION SET
            TIN_NOMBRE = pTinNombre
        WHERE TIN_CODIGO = pTinCodigo;
    END IF;
    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                TIN_CODIGO,
                TIN_NOMBRE
            FROM PLA_TIN_TIPO_INSTITUCION
            WHERE TIN_CODIGO = pTinCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
		FROM PLA_TIN_TIPO_INSTITUCION
		WHERE 
		(
		    pTinNombre IS NULL
		    OR pTinNombre = ''
		    OR LOWER(TIN_NOMBRE) LIKE '%' || LOWER(TRIM(pTinNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                TIN_CODIGO,
		                TIN_NOMBRE
		            FROM PLA_TIN_TIPO_INSTITUCION
		            WHERE 
		            (
		                pTinNombre IS NULL
		                OR pTinNombre = ''
		                OR LOWER(TIN_NOMBRE) LIKE '%' || LOWER(TRIM(pTinNombre)) || '%'
		            )
		            ORDER BY TIN_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TIN_CODIGO AS value, TIN_NOMBRE AS label
            FROM PLA_TIN_TIPO_INSTITUCION;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
       
END SP_PLA_TIN_TIPO_INSTITUCION;

ALTER TABLE RHEPQ.PLA_TIN_TIPO_INSTITUCION
MODIFY TIN_CODIGO VARCHAR2(3);

-----------------------------------------------------------


CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ICR_INSTITUCION(
    pOpcion IN NUMBER,
    pIcrCodigo IN OUT VARCHAR2,
    pIcrCodtin IN VARCHAR2 DEFAULT NULL,
    pIcrNombre IN VARCHAR2 DEFAULT NULL,
    pIcrNombreIng IN VARCHAR2 DEFAULT NULL,
    pIcrDireccion IN VARCHAR2 DEFAULT NULL,
    pIcrTelefono IN VARCHAR2 DEFAULT NULL,
    pIcrFax IN VARCHAR2 DEFAULT NULL,
    pIcrContacto IN VARCHAR2 DEFAULT NULL,
    pIcrFormaPago IN VARCHAR2 DEFAULT NULL,
    pIcrCodIcr IN VARCHAR2 DEFAULT NULL,
    pIcrTipoCuenta IN VARCHAR2 DEFAULT NULL,
    pIcrNumCuenta IN VARCHAR2 DEFAULT NULL,
    pIcrNombreCorto IN VARCHAR2 DEFAULT NULL,
    pIcrCodPai IN VARCHAR2 DEFAULT NULL,
    pIcrReconocido IN VARCHAR2 DEFAULT NULL,
    pIcrPorcentaje IN NUMBER DEFAULT NULL,
    pIcrNit IN VARCHAR2 DEFAULT NULL,
    pIcrRegistro IN VARCHAR2 DEFAULT NULL,
    pIcrCodSuper IN VARCHAR2 DEFAULT NULL,
    pIcrContableEmpleado IN VARCHAR2 DEFAULT NULL,
    pIcrContablePatronal IN VARCHAR2 DEFAULT NULL,
    pIcrEmail IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	-- Inicio de transaccion
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_ICR_INSTITUCION (
            ICR_CODIGO,
            ICR_CODTIN,
            ICR_NOMBRE,
            ICR_NOMBRE_ING,
            ICR_DIRECCION,
            ICR_TELEFONO,
            ICR_FAX,
            ICR_CONTACTO,
            ICR_FORMA_PAGO,
            ICR_CODICR,
            ICR_TIPO_CUENTA,
            ICR_NUM_CUENTA,
            ICR_NOMBRE_CORTO,
            ICR_CODPAI,
            ICR_RECONOCIDO,
            ICR_PORCENTAJE,
            ICR_NIT,
            ICR_REGISTRO,
            ICR_CODSUPER,
            ICR_CONTABLE_EMPLEADO,
            ICR_CONTABLE_PATRONAL,
            ICR_E_MAIL
        ) VALUES (
            pIcrCodigo,
            pIcrCodtin,
            pIcrNombre,
            pIcrNombreIng,
            pIcrDireccion,
            pIcrTelefono,
            pIcrFax,
            pIcrContacto,
            pIcrFormaPago,
            pIcrCodIcr,
            pIcrTipoCuenta,
            pIcrNumCuenta,
            pIcrNombreCorto,
            pIcrCodPai,
            pIcrReconocido,
            pIcrPorcentaje,
            pIcrNit,
            pIcrRegistro,
            pIcrCodSuper,
            pIcrContableEmpleado,
            pIcrContablePatronal,
            pIcrEmail
        )
        RETURNING ICR_CODIGO INTO pIcrCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ICR_INSTITUCION SET
            ICR_CODTIN = pIcrCodtin,
            ICR_NOMBRE = pIcrNombre,
            ICR_NOMBRE_ING = pIcrNombreIng,
            ICR_DIRECCION = pIcrDireccion,
            ICR_TELEFONO = pIcrTelefono,
            ICR_FAX = pIcrFax,
            ICR_CONTACTO = pIcrContacto,
            ICR_FORMA_PAGO = pIcrFormaPago,
            ICR_CODICR = pIcrCodIcr,
            ICR_TIPO_CUENTA = pIcrTipoCuenta,
            ICR_NUM_CUENTA = pIcrNumCuenta,
            ICR_NOMBRE_CORTO = pIcrNombreCorto,
            ICR_CODPAI = pIcrCodPai,
            ICR_RECONOCIDO = pIcrReconocido,
            ICR_PORCENTAJE = pIcrPorcentaje,
            ICR_NIT = pIcrNit,
            ICR_REGISTRO = pIcrRegistro,
            ICR_CODSUPER = pIcrCodSuper,
            ICR_CONTABLE_EMPLEADO = pIcrContableEmpleado,
            ICR_CONTABLE_PATRONAL = pIcrContablePatronal,
            ICR_E_MAIL = pIcrEmail
        WHERE ICR_CODIGO = pIcrCodigo;
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                ICR_CODIGO,
				ICR_CODTIN,
				ICR_NOMBRE,
				ICR_NOMBRE_ING,
				ICR_NOMBRE_CORTO,
				ICR_DIRECCION,
				ICR_CODPAI,
				ICR_REGISTRO,
				ICR_NIT,
				ICR_TELEFONO,
				ICR_FAX,
				ICR_CONTACTO,
				ICR_FORMA_PAGO,
				ICR_CODICR,
				ICR_TIPO_CUENTA,
				ICR_NUM_CUENTA,
				ICR_RECONOCIDO,
				ICR_CONTABLE_EMPLEADO,
				ICR_CONTABLE_PATRONAL,
				ICR_E_MAIL 
            FROM PLA_ICR_INSTITUCION
            WHERE ICR_CODIGO = pIcrCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
		FROM PLA_ICR_INSTITUCION
		WHERE 
		(
		    pIcrNombre IS NULL
		    OR pIcrNombre = ''
		    OR LOWER(ICR_NOMBRE) LIKE '%' || LOWER(TRIM(pIcrNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ICR_CODIGO,
		                ICR_CODTIN,
		                ICR_NOMBRE,
		                ICR_NOMBRE_ING,
		                ICR_NOMBRE_CORTO,
		                ICR_DIRECCION,
		                ICR_CODPAI,
		                ICR_REGISTRO,
		                ICR_NIT,
		                ICR_TELEFONO,
		                ICR_FAX,
		                ICR_CONTACTO,
		                ICR_FORMA_PAGO,
		                ICR_CODICR,
		                ICR_TIPO_CUENTA,
		                ICR_NUM_CUENTA,
		                ICR_RECONOCIDO,
		                ICR_CONTABLE_EMPLEADO,
		                ICR_CONTABLE_PATRONAL,
		                ICR_E_MAIL 
		            FROM PLA_ICR_INSTITUCION
		            WHERE 
		            (
		                pIcrNombre IS NULL
		                OR pIcrNombre = ''
		                OR LOWER(ICR_NOMBRE) LIKE '%' || LOWER(TRIM(pIcrNombre)) || '%'
		            )
		            ORDER BY ICR_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;


    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT ICR_CODIGO AS value, ICR_NOMBRE AS label
            FROM PLA_ICR_INSTITUCION;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ICR_INSTITUCION;


-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_BAN_BONO_ANTIGUEDAD(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pBanTipo IN VARCHAR2,
    pBanAniosDel IN NUMBER DEFAULT NULL,
    pBanAniosAl IN NUMBER DEFAULT NULL,
    pBanBono IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_BAN_BONO_ANTIGUEDAD (
            BAN_TIPO,
            BAN_ANIOS_DEL,
            BAN_ANIOS_AL,
            BAN_BONO
        ) VALUES (
            pBanTipo,
            pBanAniosDel,
            pBanAniosAl,
            pBanBono
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_BAN_BONO_ANTIGUEDAD SET
            BAN_ANIOS_DEL = pBanAniosDel,
            BAN_ANIOS_AL = pBanAniosAl,
            BAN_BONO = pBanBono
        WHERE ROWID = pRowId;
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                BAN_TIPO,
                BAN_ANIOS_DEL,
                BAN_ANIOS_AL,
                BAN_BONO
            FROM PLA_BAN_BONO_ANTIGUEDAD
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador
		FROM PLA_BAN_BONO_ANTIGUEDAD
		WHERE 
		(
		    pBanTipo IS NULL
		    OR pBanTipo = ''
		    OR LOWER(BAN_TIPO) LIKE '%' || LOWER(TRIM(pBanTipo)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                BAN_TIPO,
		                BAN_ANIOS_DEL,
		                BAN_ANIOS_AL,
		                BAN_BONO
		            FROM PLA_BAN_BONO_ANTIGUEDAD
		            WHERE 
		            (
		                pBanTipo IS NULL
		                OR pBanTipo = ''
		                OR LOWER(BAN_TIPO) LIKE '%' || LOWER(TRIM(pBanTipo)) || '%'
		            )
		            ORDER BY BAN_TIPO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT BAN_TIPO AS value, BAN_ANIOS_DEL || ' - ' || BAN_ANIOS_AL AS label
            FROM PLA_BAN_BONO_ANTIGUEDAD;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_BAN_BONO_ANTIGUEDAD;

-- QUEDA PENDIENTE GENERA IGSS

-- ####### MODULO DE AQUI PARA ARRIBA PARAMETROS GENEREALES ######## 
-----------------------------------------------------------

############################## MODULO ESTRUCTURA ORGANIZATIVA ###############################
-- *Frecuencia de Funciones
CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_FRE_FRECUENCIA(
    pOpcion IN NUMBER,
    pFreCodigo IN OUT VARCHAR2,
    pFreNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_FRE_FRECUENCIA (
            FRE_CODIGO,
            FRE_NOMBRE
        ) VALUES (
            pFreCodigo,
            pFreNombre
        )
        RETURNING FRE_CODIGO INTO pFreCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_FRE_FRECUENCIA SET
            FRE_NOMBRE = pFreNombre
        WHERE FRE_CODIGO = pFreCodigo;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                FRE_CODIGO,
                FRE_NOMBRE
            FROM REC_FRE_FRECUENCIA
            WHERE FRE_CODIGO = pFreCodigo;

    ELSIF pOpcion = 5 THEN
	    BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM REC_FRE_FRECUENCIA
	        WHERE 
	        (
	            pFreNombre IS NULL
	            OR pFreNombre = ''
	            OR LOWER(FRE_NOMBRE) LIKE '%' || LOWER(TRIM(pFreNombre)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	       --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT 
	                        FRE_CODIGO,
	                        FRE_NOMBRE
	                    FROM REC_FRE_FRECUENCIA
	                    WHERE 
	                    (
	                        pFreNombre IS NULL
	                        OR pFreNombre = ''
	                        OR LOWER(FRE_NOMBRE) LIKE '%' || LOWER(TRIM(pFreNombre)) || '%'
	                    )
	                    ORDER BY FRE_CODIGO
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT FRE_CODIGO AS value, FRE_NOMBRE AS label
            FROM REC_FRE_FRECUENCIA;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_FRE_FRECUENCIA;

-----------------------------------------------------------

-- *Exigencias y Desiciones para Cargos
CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_EXC_EXIGENCIA_CARGO(
    pOpcion IN NUMBER,
    pExcCodcia IN VARCHAR2,
    pExcCodigo IN OUT NUMBER,
    pExcDescripcion IN VARCHAR2 DEFAULT NULL,
    pExcTipo IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_EXC_EXIGENCIA_CARGO (
            EXC_CODCIA,
            EXC_CODIGO,
            EXC_DESCRIPCION,
            EXC_TIPO
        ) VALUES (
            pExcCodcia,
            pExcCodigo,
            pExcDescripcion,
            pExcTipo
        )
        RETURNING EXC_CODIGO INTO pExcCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_EXC_EXIGENCIA_CARGO SET
            EXC_DESCRIPCION = pExcDescripcion,
            EXC_TIPO = pExcTipo
        WHERE EXC_CODIGO = pExcCodigo;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                EXC_CODCIA,
                EXC_CODIGO,
                EXC_DESCRIPCION,
                EXC_TIPO
            FROM REC_EXC_EXIGENCIA_CARGO
            WHERE EXC_CODIGO = pExcCodigo;

    ELSIF pOpcion = 5 THEN
           BEGIN
		        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
		        SELECT COUNT(*) INTO vContador
		        FROM REC_EXC_EXIGENCIA_CARGO
		        WHERE 
		        (
		            pExcDescripcion IS NULL
		            OR pExcDescripcion = ''
		            OR LOWER(EXC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pExcDescripcion)) || '%'
		        );
		
		        -- Asignar la cantidad total de páginas
		        pTotalPage := vContador;
		       --pTotalPage := CEIL(vContador / pPageSize);
		
		        -- Abrir el cursor para obtener los resultados
		        OPEN pCursor FOR
		            SELECT * FROM (
		                SELECT a.*, ROWNUM rnum
		                FROM (
		                    SELECT 
		                        EXC_CODCIA,
		                        EXC_CODIGO,
		                        EXC_DESCRIPCION,
		                        EXC_TIPO
		                    FROM REC_EXC_EXIGENCIA_CARGO
		                    WHERE 
		                    (
		                        pExcDescripcion IS NULL
		                        OR pExcDescripcion = ''
		                        OR LOWER(EXC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pExcDescripcion)) || '%'
		                    )
		                    ORDER BY EXC_CODIGO
		                ) a
		                WHERE ROWNUM <= pPageNumber * pPageSize
		            )
		            WHERE rnum > (pPageNumber - 1) * pPageSize;
		    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT EXC_CODIGO AS value, EXC_DESCRIPCION AS label
            FROM REC_EXC_EXIGENCIA_CARGO WHERE EXC_CODCIA = pExcCodcia;
           
   ELSIF pOpcion = 7 THEN
        OPEN pCursor FOR
            SELECT EXC_CODIGO AS value, EXC_DESCRIPCION AS label
            FROM REC_EXC_EXIGENCIA_CARGO WHERE EXC_CODCIA = pExcCodcia
            AND EXC_TIPO = pExcTipo;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_EXC_EXIGENCIA_CARGO;

-----------------------------------------------------------

-- Tipos y Descripcion de funciones
CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_TFN_TIPO_FUNCION(
    pOpcion IN NUMBER,
    pTfnCodcia IN VARCHAR2,
    pTfnCodigo IN OUT VARCHAR2,
    pTfnNombre IN VARCHAR2 DEFAULT NULL,
    pTfnNombreCorto IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_TFN_TIPO_FUNCION (
            TFN_CODCIA,
            TFN_CODIGO,
            TFN_NOMBRE,
            TFN_NOMBRE_CORTO
        ) VALUES (
            pTfnCodcia,
            pTfnCodigo,
            pTfnNombre,
            pTfnNombreCorto
        )
        RETURNING TFN_CODIGO INTO pTfnCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_TFN_TIPO_FUNCION SET
            TFN_NOMBRE = pTfnNombre,
            TFN_NOMBRE_CORTO = pTfnNombreCorto
        WHERE TFN_CODCIA = pTfnCodcia AND TFN_CODIGO = pTfnCodigo;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                TFN_CODCIA,
                TFN_CODIGO,
                TFN_NOMBRE,
                TFN_NOMBRE_CORTO
            FROM REC_TFN_TIPO_FUNCION
            WHERE TFN_CODCIA = pTfnCodcia AND TFN_CODIGO = pTfnCodigo;

    ELSIF pOpcion = 5 THEN
       BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM REC_TFN_TIPO_FUNCION
	        WHERE 
	        (
	            pTfnNombre IS NULL
	            OR pTfnNombre = ''
	            OR LOWER(TFN_NOMBRE) LIKE '%' || LOWER(TRIM(pTfnNombre)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
		       --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT 
	                        TFN_CODCIA,
	                        TFN_CODIGO,
	                        TFN_NOMBRE,
	                        TFN_NOMBRE_CORTO
	                    FROM REC_TFN_TIPO_FUNCION
	                    WHERE 
	                    (
	                        pTfnNombre IS NULL
	                        OR pTfnNombre = ''
	                        OR LOWER(TFN_NOMBRE) LIKE '%' || LOWER(TRIM(pTfnNombre)) || '%'
	                    )
	                    ORDER BY TFN_CODIGO
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TFN_CODIGO AS value, TFN_NOMBRE AS label
            FROM REC_TFN_TIPO_FUNCION WHERE TFN_CODCIA = pTfnCodcia
           ORDER BY TFN_CODIGO ASC;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_TFN_TIPO_FUNCION;

-----------------------------------------------------------
-- # FUNCION
CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_FUN_FUNCION(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pFunCodcia IN VARCHAR2,
    pFunCodtfn IN VARCHAR2,
    pFunCodigo IN VARCHAR2,
    pFunNombre IN VARCHAR2 DEFAULT NULL,
    pFunDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_FUN_FUNCION (
            FUN_CODCIA,
            FUN_CODTFN,
            FUN_CODIGO,
            FUN_NOMBRE,
            FUN_DESCRIPCION
        ) VALUES (
            pFunCodcia,
            pFunCodtfn,
            pFunCodigo,
            pFunNombre,
            pFunDescripcion
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_FUN_FUNCION SET
            FUN_NOMBRE = pFunNombre,
            FUN_DESCRIPCION = pFunDescripcion
        WHERE ROWID = pRowId;
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                FUN_CODCIA,
                FUN_CODTFN,
                FUN_CODIGO,
                FUN_NOMBRE,
                FUN_DESCRIPCION
            FROM REC_FUN_FUNCION
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
       BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM REC_FUN_FUNCION
	        WHERE FUN_CODCIA = pFunCodcia AND FUN_CODTFN = pFunCodtfn
	        AND (
	            pFunDescripcion IS NULL
	            OR pFunDescripcion = ''
	            OR LOWER(FUN_DESCRIPCION) LIKE '%' || LOWER(TRIM(pFunDescripcion)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	        --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT 
	                    	ROWID AS id,
	                        FUN_CODCIA,
	                        FUN_CODTFN,
	                        FUN_CODIGO,
	                        FUN_NOMBRE,
	                        FUN_DESCRIPCION
	                    FROM REC_FUN_FUNCION
	                    WHERE FUN_CODCIA = pFunCodcia AND FUN_CODTFN = pFunCodtfn
	                    AND (
	                        pFunDescripcion IS NULL
	                        OR pFunDescripcion = ''
	                        OR LOWER(FUN_DESCRIPCION) LIKE '%' || LOWER(TRIM(pFunDescripcion)) || '%'
	                    )
	                    ORDER BY TO_NUMBER(FUN_CODIGO)
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT FUN_CODIGO AS value, FUN_DESCRIPCION AS label
            FROM REC_FUN_FUNCION WHERE FUN_CODCIA = pFunCodcia;
           
   	ELSIF pOpcion = 7 THEN
        OPEN pCursor FOR
            SELECT FUN_CODIGO AS value, FUN_DESCRIPCION AS label
            FROM REC_FUN_FUNCION WHERE FUN_CODCIA = pFunCodcia AND FUN_CODTFN = pFunCodtfn AND FUN_DESCRIPCION IS NOT NULL;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_FUN_FUNCION;


-----------------------------------------------------------
*--//   Requisitos
CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_TRQ_TIPO_REQUISITO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pTrqCodcia IN VARCHAR2,
    pTrqCodigo IN VARCHAR2,
    pTrqNombre IN VARCHAR2 DEFAULT NULL,
    pTrqNombreIng IN VARCHAR2 DEFAULT NULL,
    pTrqNombreCorto IN VARCHAR2 DEFAULT NULL,
    pTrqOperador IN VARCHAR2 DEFAULT NULL,
    pTrqFiltro IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_TRQ_TIPO_REQUISITO (
            TRQ_CODCIA,
            TRQ_CODIGO,
            TRQ_NOMBRE,
            TRQ_NOMBRE_ING,
            TRQ_NOMBRE_CORTO,
            TRQ_OPERADOR,
            TRQ_FILTRO
        ) VALUES (
            pTrqCodcia,
            pTrqCodigo,
            pTrqNombre,
            pTrqNombreIng,
            pTrqNombreCorto,
            pTrqOperador,
            pTrqFiltro
        )
        RETURNING ROWID INTO pRowId;    

    ELSIF pOpcion = 2 THEN
        UPDATE REC_TRQ_TIPO_REQUISITO SET
            TRQ_NOMBRE = pTrqNombre,
            TRQ_NOMBRE_ING = pTrqNombreIng,
            TRQ_NOMBRE_CORTO = pTrqNombreCorto,
            TRQ_OPERADOR = pTrqOperador,
            TRQ_FILTRO = pTrqFiltro
        	WHERE ROWID = pRowId;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                TRQ_CODCIA,
                TRQ_CODIGO,
                TRQ_NOMBRE,
                TRQ_NOMBRE_ING,
                TRQ_NOMBRE_CORTO,
                TRQ_OPERADOR,
                TRQ_FILTRO
            FROM REC_TRQ_TIPO_REQUISITO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM REC_TRQ_TIPO_REQUISITO
	        WHERE TRQ_CODCIA = pTrqCodcia
	        AND (
	            pTrqNombre IS NULL
	            OR pTrqNombre = ''
	            OR LOWER(TRQ_NOMBRE) LIKE '%' || LOWER(TRIM(pTrqNombre)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	        --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT 
	                    	ROWID AS id,
	                        TRQ_CODCIA,
	                        TRQ_CODIGO,
	                        TRQ_NOMBRE,
	                        TRQ_NOMBRE_ING,
	                        TRQ_NOMBRE_CORTO,
	                        TRQ_OPERADOR,
	                        TRQ_FILTRO
	                    FROM REC_TRQ_TIPO_REQUISITO
	                    WHERE TRQ_CODCIA = pTrqCodcia
	                    AND (
	                        pTrqNombre IS NULL
	                        OR pTrqNombre = ''
	                        OR LOWER(TRQ_NOMBRE) LIKE '%' || LOWER(TRIM(pTrqNombre)) || '%'
	                    )
	                    ORDER BY TRQ_CODCIA, TRQ_CODIGO
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TRQ_CODIGO AS value, TRQ_NOMBRE AS label
            FROM REC_TRQ_TIPO_REQUISITO WHERE TRQ_CODCIA = pTrqCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_TRQ_TIPO_REQUISITO;

-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_REQ_REQUISITO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pReqCodcia IN VARCHAR2,
    pReqCodtrq IN VARCHAR2,
    pReqCodigo IN VARCHAR2,
    pReqNombre IN VARCHAR2 DEFAULT NULL,
    pReqNombreIng IN VARCHAR2 DEFAULT NULL,
    pReqDescripcion IN VARCHAR2 DEFAULT NULL,
    pReqOperador IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_REQ_REQUISITO (
            REQ_CODCIA,
            REQ_CODTRQ,
            REQ_CODIGO,
            REQ_NOMBRE,
            REQ_NOMBRE_ING,
            REQ_DESCRIPCION,
            REQ_OPERADOR
        ) VALUES (
            pReqCodcia,
            pReqCodtrq,
            pReqCodigo,
            pReqNombre,
            pReqNombreIng,
            pReqDescripcion,
            pReqOperador
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_REQ_REQUISITO SET
            REQ_NOMBRE = pReqNombre,
            REQ_NOMBRE_ING = pReqNombreIng,
            REQ_DESCRIPCION = pReqDescripcion,
            REQ_OPERADOR = pReqOperador
        WHERE ROWID = pRowId;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                REQ_CODCIA,
                REQ_CODTRQ,
                REQ_CODIGO,
                REQ_NOMBRE,
                REQ_NOMBRE_ING,
                REQ_DESCRIPCION,
                REQ_OPERADOR
            FROM REC_REQ_REQUISITO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM REC_REQ_REQUISITO
		WHERE 
		(
		    pReqNombre IS NULL
		    OR pReqNombre = ''
		    OR LOWER(REQ_NOMBRE) LIKE '%' || LOWER(TRIM(pReqNombre)) || '%'
		)
		AND REQ_CODCIA = pReqCodcia
		AND REQ_CODTRQ = pReqCodtrq;
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ROWID AS id,
		                REQ_CODCIA,
		                REQ_CODTRQ,
		                REQ_CODIGO,
		                REQ_NOMBRE,
		                REQ_NOMBRE_ING,
		                REQ_DESCRIPCION,
		                REQ_OPERADOR
		            FROM REC_REQ_REQUISITO 
		            WHERE 
		            (
		                pReqNombre IS NULL
		                OR pReqNombre = ''
		                OR LOWER(REQ_NOMBRE) LIKE '%' || LOWER(TRIM(pReqNombre)) || '%'
		            )
		            AND REQ_CODCIA = pReqCodcia
		            AND REQ_CODTRQ = pReqCodtrq
		            ORDER BY REQ_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT REQ_CODIGO AS value, REQ_NOMBRE AS label
            FROM REC_REQ_REQUISITO WHERE REQ_CODCIA = pReqCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_REQ_REQUISITO;

-----------------------------------------------------------

--   Manejo de equipo

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_MEQ_MANEJO_EQUIPO(
    pOpcion IN NUMBER,
    pMeqCodcia IN VARCHAR2,
    pMeqCodigo IN OUT NUMBER,
    pMeqDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_MEQ_MANEJO_EQUIPO (
            MEQ_CODCIA,
            MEQ_CODIGO,
            MEQ_DESCRIPCION
        ) VALUES (
            pMeqCodcia,
            pMeqCodigo,
            pMeqDescripcion
        )
        RETURNING MEQ_CODIGO INTO pMeqCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_MEQ_MANEJO_EQUIPO SET
            MEQ_DESCRIPCION = pMeqDescripcion
        WHERE MEQ_CODIGO = pMeqCodigo;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                MEQ_CODCIA,
                MEQ_CODIGO,
                MEQ_DESCRIPCION
            FROM PLA_MEQ_MANEJO_EQUIPO
            WHERE MEQ_CODIGO = pMeqCodigo;

    ELSIF pOpcion = 5 THEN
       BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM PLA_MEQ_MANEJO_EQUIPO
	        WHERE MEQ_CODCIA = pMeqCodcia
	        AND (
	            pMeqDescripcion IS NULL
	            OR pMeqDescripcion = ''
	            OR LOWER(MEQ_DESCRIPCION) LIKE '%' || LOWER(TRIM(pMeqDescripcion)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	        --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT 
	                        MEQ_CODCIA,
	                        MEQ_CODIGO,
	                        MEQ_DESCRIPCION
	                    FROM PLA_MEQ_MANEJO_EQUIPO
	                    WHERE MEQ_CODCIA = pMeqCodcia
	                    AND (
	                        pMeqDescripcion IS NULL
	                        OR pMeqDescripcion = ''
	                        OR LOWER(MEQ_DESCRIPCION) LIKE '%' || LOWER(TRIM(pMeqDescripcion)) || '%'
	                    )
	                    ORDER BY MEQ_CODIGO
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT MEQ_CODIGO AS value, MEQ_DESCRIPCION AS label
            FROM PLA_MEQ_MANEJO_EQUIPO WHERE MEQ_CODCIA = pMeqCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_MEQ_MANEJO_EQUIPO;

-----------------------------------------------------------

-- areas y Generencias

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ARE_AREA(
    pOpcion IN NUMBER,
    pAreCodcia IN VARCHAR2,
    pAreCodigo IN OUT NUMBER,
    pAreNombre IN VARCHAR2 DEFAULT NULL,
    pArePartidaPresupuestaria IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_ARE_AREA (
            ARE_CODCIA,
            ARE_CODIGO,
            ARE_NOMBRE,
            ARE_PARTIDA_PRESUPUESTARIA
        ) VALUES (
            pAreCodcia,
            pAreCodigo,
            pAreNombre,
            pArePartidaPresupuestaria
        )
        RETURNING ARE_CODIGO INTO pAreCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ARE_AREA SET
            ARE_NOMBRE = pAreNombre,
            ARE_PARTIDA_PRESUPUESTARIA = pArePartidaPresupuestaria
        WHERE ARE_CODIGO = pAreCodigo;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                ARE_CODCIA,
                ARE_CODIGO,
                ARE_NOMBRE,
                ARE_PARTIDA_PRESUPUESTARIA
            FROM PLA_ARE_AREA
            WHERE ARE_CODIGO = pAreCodigo AND ARE_CODCIA = pAreCodcia;

    ELSIF pOpcion = 5 THEN
            BEGIN
		        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
		        SELECT COUNT(*) INTO vContador
		        FROM PLA_ARE_AREA
		        WHERE ARE_CODCIA = pAreCodcia
		        AND (
		            pAreNombre IS NULL
		            OR pAreNombre = ''
		            OR LOWER(ARE_NOMBRE) LIKE '%' || LOWER(TRIM(pAreNombre)) || '%'
		        );
		
		        -- Asignar la cantidad total de páginas
		        pTotalPage := vContador;
		        --pTotalPage := CEIL(vContador / pPageSize);
		
		        -- Abrir el cursor para obtener los resultados
		        OPEN pCursor FOR
		            SELECT * FROM (
		                SELECT a.*, ROWNUM rnum
		                FROM (
		                    SELECT 
		                        ARE_CODCIA,
		                        ARE_CODIGO,
		                        ARE_NOMBRE,
		                        ARE_PARTIDA_PRESUPUESTARIA
		                    FROM PLA_ARE_AREA
		                    WHERE ARE_CODCIA = pAreCodcia
		                    AND (
		                        pAreNombre IS NULL
		                        OR pAreNombre = ''
		                        OR LOWER(ARE_NOMBRE) LIKE '%' || LOWER(TRIM(pAreNombre)) || '%'
		                    )
		                    ORDER BY ARE_CODIGO
		                ) a
		                WHERE ROWNUM <= pPageNumber * pPageSize
		            )
		            WHERE rnum > (pPageNumber - 1) * pPageSize;
		    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT ARE_CODIGO AS value, ARE_NOMBRE AS label
            FROM PLA_ARE_AREA WHERE ARE_CODCIA = pAreCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ARE_AREA;

-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_GER_GERENCIA(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pGerCodcia IN VARCHAR2,
    pGerCodigo IN NUMBER,
    pGerCodare IN NUMBER DEFAULT NULL,
    pGerNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_GER_GERENCIA (
            GER_CODCIA,
            GER_CODIGO,
            GER_CODARE,
            GER_NOMBRE
        ) VALUES (
            pGerCodcia,
            pGerCodigo,
            pGerCodare,
            pGerNombre
        )
        RETURNING ROWID INTO pRowId;   

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_GER_GERENCIA SET
            GER_CODARE = pGerCodare,
            GER_NOMBRE = pGerNombre
        WHERE ROWID = pRowId;
       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
            	ROWID AS id,
                GER_CODCIA,
                GER_CODIGO,
                GER_CODARE,
                GER_NOMBRE
            FROM PLA_GER_GERENCIA
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
       BEGIN
	        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
	        SELECT COUNT(*) INTO vContador
	        FROM PLA_GER_GERENCIA
	        WHERE GER_CODCIA = pGerCodcia AND GER_CODARE = pGerCodare
	        AND (
	            pGerNombre IS NULL
	            OR pGerNombre = ''
	            OR LOWER(GER_NOMBRE) LIKE '%' || LOWER(TRIM(pGerNombre)) || '%'
	        );
	
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	        --pTotalPage := CEIL(vContador / pPageSize);
	
	        -- Abrir el cursor para obtener los resultados
	        OPEN pCursor FOR
	            SELECT * FROM (
	                SELECT a.*, ROWNUM rnum
	                FROM (
	                    SELECT
	                        ROWID AS id,
	                        GER_CODCIA,
	                        GER_CODIGO,
	                        GER_CODARE,
	                        GER_NOMBRE
	                    FROM PLA_GER_GERENCIA
	                    WHERE GER_CODCIA = pGerCodcia AND GER_CODARE = pGerCodare
	                    AND (
	                        pGerNombre IS NULL
	                        OR pGerNombre = ''
	                        OR LOWER(GER_NOMBRE) LIKE '%' || LOWER(TRIM(pGerNombre)) || '%'
	                    )
	                    ORDER BY GER_CODIGO
	                ) a
	                WHERE ROWNUM <= pPageNumber * pPageSize
	            )
	            WHERE rnum > (pPageNumber - 1) * pPageSize;
	    END;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT GER_CODIGO AS value, GER_NOMBRE AS label
            FROM PLA_GER_GERENCIA WHERE GER_CODCIA = pGerCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_GER_GERENCIA;

-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CCO_CEN_COSTO(
    pOpcion IN NUMBER,
    pCcoCodigo IN OUT NUMBER,
    pCcoCodCia IN VARCHAR2 DEFAULT NULL,
    pCcoDescripcion IN VARCHAR2 DEFAULT NULL,
    pCcoValorHora IN NUMBER DEFAULT NULL,
    pCcoTipo IN VARCHAR2 DEFAULT NULL,
    pCcoCodAre IN NUMBER DEFAULT NULL,
    pCcoCodGer IN NUMBER DEFAULT NULL,
    pCcoPprN1 IN NUMBER DEFAULT NULL,
    pCcoPprN2 IN NUMBER DEFAULT NULL,
    pCcoPprN3 IN NUMBER DEFAULT NULL,
    pCcoPprN4 IN NUMBER DEFAULT NULL,
    pCcoPprN5 IN NUMBER DEFAULT NULL,
    pCcoPprN6 IN NUMBER DEFAULT NULL,
    pCcoPprN7 IN NUMBER DEFAULT NULL,
    pCcoCodCco IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CCO_CEN_COSTO (
            CCO_CODIGO,
            CCO_CODCIA,
            CCO_DESCRIPCION,
            CCO_VALOR_HORA,
            CCO_TIPO,
            CCO_CODARE,
            CCO_CODGER,
            CCO_PPR_N1,
            CCO_PPR_N2,
            CCO_PPR_N3,
            CCO_PPR_N4,
            CCO_PPR_N5,
            CCO_PPR_N6,
            CCO_PPR_N7,
            CCO_CODCCO
        ) VALUES (
            pCcoCodigo,
            pCcoCodCia,
            pCcoDescripcion,
            pCcoValorHora,
            pCcoTipo,
            pCcoCodAre,
            pCcoCodGer,
            pCcoPprN1,
            pCcoPprN2,
            pCcoPprN3,
            pCcoPprN4,
            pCcoPprN5,
            pCcoPprN6,
            pCcoPprN7,
            pCcoCodCco
        )
        RETURNING CCO_CODIGO INTO pCcoCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CCO_CEN_COSTO SET
            CCO_CODCIA = pCcoCodCia,
            CCO_DESCRIPCION = pCcoDescripcion,
            CCO_VALOR_HORA = pCcoValorHora,
            CCO_TIPO = pCcoTipo,
            CCO_CODARE = pCcoCodAre,
            CCO_CODGER = pCcoCodGer,
            CCO_PPR_N1 = pCcoPprN1,
            CCO_PPR_N2 = pCcoPprN2,
            CCO_PPR_N3 = pCcoPprN3,
            CCO_PPR_N4 = pCcoPprN4,
            CCO_PPR_N5 = pCcoPprN5,
            CCO_PPR_N6 = pCcoPprN6,
            CCO_PPR_N7 = pCcoPprN7,
            CCO_CODCCO = pCcoCodCco
        WHERE CCO_CODIGO = pCcoCodigo;
       
    END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
 			SELECT 
			    CC.CCO_CODIGO,
			    CC.CCO_CODCIA,
			    CC.CCO_DESCRIPCION,
			    CC.CCO_PPR_N1,
			    CC.CCO_PPR_N2,
			    CC.CCO_PPR_N3,
			    CC.CCO_PPR_N4,
			    CC.CCO_PPR_N5,
			    CC.CCO_PPR_N6,
			    CC.CCO_PPR_N7,
			    CC.CCO_VALOR_HORA,
			    CC.CCO_TIPO,
			    CC.CCO_CODGER,
			    G.GER_NOMBRE AS GERENCIA,
			    CC.CCO_CODARE,
			    A.ARE_NOMBRE AS AREA
			FROM PLA_CCO_CEN_COSTO CC
			LEFT JOIN RHEPQ.PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
			LEFT JOIN RHEPQ.PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
            WHERE CC.CCO_CODCIA = pCcoCodCia AND CC.CCO_CODIGO = pCcoCodigo;            

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*)
		INTO vContador
		FROM PLA_CCO_CEN_COSTO CC
		LEFT JOIN RHEPQ.PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
		LEFT JOIN RHEPQ.PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
		WHERE CC.CCO_CODCIA = pCcoCodCia
		AND (
		    pCcoDescripcion IS NULL
		    OR pCcoDescripcion = ''
		    OR LOWER(CC.CCO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCcoDescripcion)) || '%'
		);
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		              SELECT 
		                CC.CCO_CODIGO,
		                CC.CCO_CODCIA,
		                CC.CCO_DESCRIPCION,
		                CC.CCO_PPR_N1,
		                CC.CCO_PPR_N2,
		                CC.CCO_PPR_N3,
		                CC.CCO_PPR_N4,
		                CC.CCO_PPR_N5,
		                CC.CCO_PPR_N6,
		                CC.CCO_PPR_N7,
		                CC.CCO_VALOR_HORA,
		                CC.CCO_TIPO,
		                CC.CCO_CODGER,
		                G.GER_NOMBRE AS GERENCIA,
		                CC.CCO_CODARE,
		                A.ARE_NOMBRE AS AREA
		            FROM PLA_CCO_CEN_COSTO CC
		            LEFT JOIN RHEPQ.PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
		            LEFT JOIN RHEPQ.PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
		            WHERE CC.CCO_CODCIA = pCcoCodCia
		            AND (
		                pCcoDescripcion IS NULL
		                OR pCcoDescripcion = ''
		                OR LOWER(CC.CCO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCcoDescripcion)) || '%'
		            )
		            ORDER BY CC.CCO_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CCO_CODIGO AS value, CCO_DESCRIPCION AS label            
            FROM PLA_CCO_CEN_COSTO
            WHERE CCO_CODCIA = pCcoCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CCO_CEN_COSTO;

-----------------------------------------------------------

-- # Equivalentes para Centro de Costo

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ECC_EQUIVALE_CCOSTO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pEccCodcia IN VARCHAR2,
    pEccCodcco IN NUMBER,
    pEccPprN1 IN NUMBER DEFAULT NULL,
    pEccPprN2 IN NUMBER DEFAULT NULL,
    pEccPprN3 IN NUMBER DEFAULT NULL,
    pEccPprN4 IN NUMBER DEFAULT NULL,
    pEccPprN5 IN NUMBER DEFAULT NULL,
    pEccPprN6 IN NUMBER DEFAULT NULL,
    pEccPprN7 IN NUMBER DEFAULT NULL,
    pEccDescripcion IN VARCHAR2 DEFAULT NULL,
    pEccCcocod IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_ECC_EQUIVALE_CCOSTO (
            ECC_CODCIA,
            ECC_CODCCO,
            ECC_PPR_N1,
            ECC_PPR_N2,
            ECC_PPR_N3,
            ECC_PPR_N4,
            ECC_PPR_N5,
            ECC_PPR_N6,
            ECC_PPR_N7,
            ECC_DESCRIPCION,
            ECC_CCOCOD
        ) VALUES (
            pEccCodcia,
            pEccCodcco,
            pEccPprN1,
            pEccPprN2,
            pEccPprN3,
            pEccPprN4,
            pEccPprN5,
            pEccPprN6,
            pEccPprN7,
            pEccDescripcion,
            pEccCcocod
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ECC_EQUIVALE_CCOSTO SET
        	ECC_CODCIA = pEccCodcia,
            ECC_PPR_N1 = pEccPprN1,
            ECC_PPR_N2 = pEccPprN2,
            ECC_PPR_N3 = pEccPprN3,
            ECC_PPR_N4 = pEccPprN4,
            ECC_PPR_N5 = pEccPprN5,
            ECC_PPR_N6 = pEccPprN6,
            ECC_PPR_N7 = pEccPprN7,
            ECC_DESCRIPCION = pEccDescripcion,
            ECC_CCOCOD = pEccCcocod
        WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			 SELECT 
			    EC.ROWID AS id,
			    EC.ECC_CODCIA,
			    EC.ECC_CODCCO,
			    CC.CCO_DESCRIPCION AS CC_DESCRIPCION,
			    EC.ECC_PPR_N1,
			    EC.ECC_PPR_N2,
			    EC.ECC_PPR_N3,
			    EC.ECC_PPR_N4,
			    EC.ECC_PPR_N5,
			    EC.ECC_PPR_N6,
			    EC.ECC_PPR_N7,
			    EC.ECC_DESCRIPCION,
			    EC.ECC_CCOCOD,
			    CC.CCO_CODGER,
			    G.GER_NOMBRE AS GERENCIA,
			    CC.CCO_CODARE,
			    A.ARE_NOMBRE AS AREA
			FROM RHEPQ.PLA_ECC_EQUIVALE_CCOSTO EC
			LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CC ON CC.CCO_CODIGO = EC.ECC_CODCCO 
			LEFT JOIN RHEPQ.PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
			LEFT JOIN RHEPQ.PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
            WHERE EC.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM PLA_ECC_EQUIVALE_CCOSTO EC
		LEFT JOIN PLA_CCO_CEN_COSTO CC ON CC.CCO_CODIGO = EC.ECC_CODCCO 
		LEFT JOIN PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
		LEFT JOIN PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
		WHERE EC.ECC_CODCCO = pEccCodcco
		AND (
		    pEccDescripcion IS NULL
		    OR pEccDescripcion = ''
		    OR LOWER(EC.ECC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pEccDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		           SELECT 
		                EC.ROWID AS id,
		                EC.ECC_CODCIA,
		                EC.ECC_CODCCO,
		                CC.CCO_DESCRIPCION AS CC_DESCRIPCION,
		                EC.ECC_PPR_N1,
		                EC.ECC_PPR_N2,
		                EC.ECC_PPR_N3,
		                EC.ECC_PPR_N4,
		                EC.ECC_PPR_N5,
		                EC.ECC_PPR_N6,
		                EC.ECC_PPR_N7,
		                EC.ECC_DESCRIPCION,
		                EC.ECC_CCOCOD,
		                CC.CCO_CODGER,
		                G.GER_NOMBRE AS GERENCIA,
		                CC.CCO_CODARE,
		                A.ARE_NOMBRE AS AREA
		            FROM PLA_ECC_EQUIVALE_CCOSTO EC
		            LEFT JOIN PLA_CCO_CEN_COSTO CC ON CC.CCO_CODIGO = EC.ECC_CODCCO 
		            LEFT JOIN PLA_GER_GERENCIA G ON G.GER_CODIGO = CC.CCO_CODGER 
		            LEFT JOIN PLA_ARE_AREA A ON A.ARE_CODIGO = CC.CCO_CODARE 
		            WHERE EC.ECC_CODCCO = pEccCodcco
		            AND (
		                pEccDescripcion IS NULL
		                OR pEccDescripcion = ''
		                OR LOWER(EC.ECC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pEccDescripcion)) || '%'
		            )
		            ORDER BY EC.ECC_CODCCO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ECC_EQUIVALE_CCOSTO;

-----------------------------------------------------------

-- # Unidades Administrativas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_UNI_UNIDAD(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pUniCodCia IN VARCHAR2,
    pUniCodigo IN NUMBER DEFAULT NULL,
    pUniCodOrganiz IN NUMBER DEFAULT NULL,
    pUniNombre IN VARCHAR2 DEFAULT NULL,
    pUniDependencia IN NUMBER DEFAULT NULL,
    pUniCenCosto IN NUMBER DEFAULT NULL,
    pUniCodUniPadre IN NUMBER DEFAULT NULL,
    pUniEstado IN VARCHAR2 DEFAULT NULL,
    pUniCodigo2003 IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;
   
    IF pOpcion = 1 THEN
        INSERT INTO PLA_UNI_UNIDAD (
            UNI_CODCIA,
            UNI_CODIGO,
            UNI_COD_ORGANIZ,
            UNI_NOMBRE,
            UNI_DEPENDENCIA,
            UNI_CEN_COSTO,
            UNI_CODUNI_PADRE,
            UNI_ESTADO,
            UNI_CODIGO_2003
        ) VALUES (
            pUniCodCia,
            pUniCodigo,
            pUniCodOrganiz,
            pUniNombre,
            pUniDependencia,
            pUniCenCosto,
            pUniCodUniPadre,
            pUniEstado,
            pUniCodigo2003
        )
        RETURNING ROWID INTO pRowId;
       
    ELSIF pOpcion = 2 THEN
        UPDATE PLA_UNI_UNIDAD SET
            UNI_CODIGO = pUniCodigo,
            UNI_COD_ORGANIZ = pUniCodOrganiz,
            UNI_NOMBRE = pUniNombre,
            UNI_DEPENDENCIA = pUniDependencia,
            UNI_CEN_COSTO = pUniCenCosto,
            UNI_CODUNI_PADRE = pUniCodUniPadre,
            UNI_ESTADO = pUniEstado,
            UNI_CODIGO_2003 = pUniCodigo2003
        WHERE ROWID = pRowId;
       
    END IF;
   
    COMMIT;
   
    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                ROWID AS id,
                UNI_CODCIA,
                UNI_CODIGO,
                UNI_COD_ORGANIZ,
                UNI_NOMBRE,
                UNI_DEPENDENCIA,
                UNI_CEN_COSTO,
                UNI_CODUNI_PADRE,
                UNI_ESTADO,
                UNI_CODIGO_2003
            FROM PLA_UNI_UNIDAD
            WHERE ROWID = pRowId;
           
    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador FROM PLA_UNI_UNIDAD
		WHERE (
		    pUniNombre IS NULL
		    OR pUniNombre = ''
		    OR LOWER(UNI_NOMBRE) LIKE '%' || LOWER(TRIM(pUniNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT
		                ROWID AS id,
		                UNI_CODCIA,
		                UNI_CODIGO,
		                UNI_COD_ORGANIZ,
		                UNI_NOMBRE,
		                UNI_DEPENDENCIA,
		                UNI_CEN_COSTO,
		                UNI_CODUNI_PADRE,
		                UNI_ESTADO,
		                UNI_CODIGO_2003
		            FROM PLA_UNI_UNIDAD
		            WHERE (
		                pUniNombre IS NULL
		                OR pUniNombre = ''
		                OR LOWER(UNI_NOMBRE) LIKE '%' || LOWER(TRIM(pUniNombre)) || '%'
		            )
		            ORDER BY UNI_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

           
    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT UNI_CODIGO AS value, UNI_NOMBRE AS label
            FROM PLA_UNI_UNIDAD;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_UNI_UNIDAD;

-----------------------------------------------------------

-- # clasificacion para valuaciones de puestos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CVA_CLASIF_VALUACION(
    pOpcion IN NUMBER,
    pCvaCodcia IN OUT VARCHAR2,
    pCvaCodigo IN OUT VARCHAR2,
    pCvaDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CVA_CLASIF_VALUACION (
            CVA_CODCIA,
            CVA_CODIGO,
            CVA_DESCRIPCION
        ) VALUES (
            pCvaCodcia,
            pCvaCodigo,
            pCvaDescripcion
        )
        RETURNING CVA_CODCIA, CVA_CODIGO INTO pCvaCodcia, pCvaCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CVA_CLASIF_VALUACION SET
        	CVA_CODCIA = pCvaCodcia,
            CVA_DESCRIPCION = pCvaDescripcion
        WHERE CVA_CODCIA = pCvaCodcia AND CVA_CODIGO = pCvaCodigo;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CVA_CODCIA,
                CVA_CODIGO,
                CVA_DESCRIPCION
            FROM PLA_CVA_CLASIF_VALUACION
            WHERE CVA_CODCIA = pCvaCodcia AND CVA_CODIGO = pCvaCodigo;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador FROM PLA_CVA_CLASIF_VALUACION
		WHERE (
		    pCvaDescripcion IS NULL
		    OR pCvaDescripcion = ''
		    OR LOWER(CVA_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCvaDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ROWID AS id,
		                CVA_CODCIA,
		                CVA_CODIGO,
		                CVA_DESCRIPCION
		            FROM PLA_CVA_CLASIF_VALUACION
		            WHERE (
		                pCvaDescripcion IS NULL
		                OR pCvaDescripcion = ''
		                OR LOWER(CVA_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCvaDescripcion)) || '%'
		            )
		            ORDER BY CVA_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;


    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CVA_CODIGO AS value, CVA_DESCRIPCION AS label
            FROM PLA_CVA_CLASIF_VALUACION
            WHERE CVA_CODCIA = pCvaCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CVA_CLASIF_VALUACION;

-----------------------------------------------------------

-- # Escala de salarios

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CSS_CLASALARIAL(
    pOpcion IN NUMBER,
    pCssCodcia IN OUT VARCHAR2,
    pCssCodigo IN OUT NUMBER,
    pCssDescripcion IN VARCHAR2 DEFAULT NULL,
    pCssMinimo IN NUMBER DEFAULT NULL,
    pCssMaximo IN NUMBER DEFAULT NULL,
    pCssMedio IN NUMBER DEFAULT NULL,
    pCssValuacionInicial IN NUMBER DEFAULT NULL,
    pCssValuacionFinal IN NUMBER DEFAULT NULL,
    pCssCodcva IN VARCHAR2 DEFAULT NULL,
    pCssNivel2 IN NUMBER DEFAULT NULL,
    pCssNivel4 IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CSS_CLASALARIAL (
            CSS_CODCIA,
            CSS_CODIGO,
            CSS_DESCRIPCION,
            CSS_MINIMO,
            CSS_MAXIMO,
            CSS_MEDIO,
            CSS_VALUACION_INICIAL,
            CSS_VALUACION_FINAL,
            CSS_CODCVA,
            CSS_NIVEL2,
            CSS_NIVEL4
        ) VALUES (
            pCssCodcia,
            pCssCodigo,
            pCssDescripcion,
            pCssMinimo,
            pCssMaximo,
            pCssMedio,
            pCssValuacionInicial,
            pCssValuacionFinal,
            pCssCodcva,
            pCssNivel2,
            pCssNivel4
        )
        RETURNING CSS_CODCIA, CSS_CODIGO INTO pCssCodcia, pCssCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CSS_CLASALARIAL SET
            CSS_DESCRIPCION = pCssDescripcion,
            CSS_MINIMO = pCssMinimo,
            CSS_MAXIMO = pCssMaximo,
            CSS_MEDIO = pCssMedio,
            CSS_VALUACION_INICIAL = pCssValuacionInicial,
            CSS_VALUACION_FINAL = pCssValuacionFinal,
            CSS_CODCVA = pCssCodcva,
            CSS_NIVEL2 = pCssNivel2,
            CSS_NIVEL4 = pCssNivel4
        WHERE CSS_CODCIA = pCssCodcia AND CSS_CODIGO = pCssCodigo;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
             SELECT 
			    S.ROWID AS id,
			    S.CSS_CODCIA,
			    S.CSS_CODIGO,
			    S.CSS_DESCRIPCION,
			    S.CSS_MINIMO,
			    S.CSS_MAXIMO,
			    S.CSS_MEDIO,
			    S.CSS_VALUACION_INICIAL,
			    S.CSS_VALUACION_FINAL,
			    S.CSS_CODCVA,
			    C.CVA_DESCRIPCION,
			    S.CSS_NIVEL2,
			    S.CSS_NIVEL4
			FROM PLA_CSS_CLASALARIAL S
			LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION C ON C.CVA_CODIGO = S.CSS_CODCVA
            WHERE S.CSS_CODCIA = pCssCodcia AND S.CSS_CODIGO = pCssCodigo;

    ELSIF pOpcion = 5 THEN
	       SELECT COUNT(*) INTO vContador 
			FROM PLA_CSS_CLASALARIAL S
			LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION C ON C.CVA_CODIGO = S.CSS_CODCVA
			WHERE (
			    S.CSS_DESCRIPCION IS NULL
			    OR S.CSS_DESCRIPCION = ''
			    OR LOWER(S.CSS_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCssDescripcion)) || '%'
			);
			
			-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);
			
			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			             SELECT 
			                S.ROWID AS id,
			                S.CSS_CODCIA,
			                S.CSS_CODIGO,
			                S.CSS_DESCRIPCION,
			                S.CSS_MINIMO,
			                S.CSS_MAXIMO,
			                S.CSS_MEDIO,
			                S.CSS_VALUACION_INICIAL,
			                S.CSS_VALUACION_FINAL,
			                S.CSS_CODCVA,
			                C.CVA_DESCRIPCION,
			                S.CSS_NIVEL2,
			                S.CSS_NIVEL4
			            FROM PLA_CSS_CLASALARIAL S
			            LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION C ON C.CVA_CODIGO = S.CSS_CODCVA
			            WHERE (
			                S.CSS_DESCRIPCION IS NULL
			                OR S.CSS_DESCRIPCION = ''
			                OR LOWER(S.CSS_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCssDescripcion)) || '%'
			            )
			            AND S.CSS_CODCIA = pCssCodcia
			            ORDER BY S.CSS_CODIGO
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;


    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CSS_CODIGO AS value, CSS_DESCRIPCION AS label
            FROM PLA_CSS_CLASALARIAL
            WHERE CSS_CODCIA = pCssCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CSS_CLASALARIAL;

-----------------------------------------------------------

-- # Niveles de clasificacion categorias

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CCP_CLASIFICACION(
    pOpcion IN NUMBER,
    pCcpCodcia IN OUT VARCHAR2,
    pCcpCodigo IN OUT NUMBER,
    pCcpNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CCP_CLASIFICACION (
            CCP_CODCIA,
            CCP_CODIGO,
            CCP_NOMBRE
        ) VALUES (
            pCcpCodcia,
            pCcpCodigo,
            pCcpNombre
        )
        RETURNING CCP_CODCIA, CCP_CODIGO INTO pCcpCodcia, pCcpCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CCP_CLASIFICACION SET
            CCP_NOMBRE = pCcpNombre
        WHERE CCP_CODCIA = pCcpCodcia AND CCP_CODIGO = pCcpCodigo;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CCP_CODCIA,
                CCP_CODIGO,
                CCP_NOMBRE
            FROM PLA_CCP_CLASIFICACION
            WHERE CCP_CODCIA = pCcpCodcia AND CCP_CODIGO = pCcpCodigo;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador FROM PLA_CCP_CLASIFICACION WHERE CCP_CODCIA = pCcpCodcia
		AND (
		    pCcpNombre IS NULL
		    OR pCcpNombre = ''
		    OR LOWER(CCP_NOMBRE) LIKE '%' || LOWER(TRIM(pCcpNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                --ROWID AS id,
		                CCP_CODCIA,
		                CCP_CODIGO,
		                CCP_NOMBRE
		            FROM PLA_CCP_CLASIFICACION 
		            WHERE CCP_CODCIA = pCcpCodcia
		            AND (
		                pCcpNombre IS NULL
		                OR pCcpNombre = ''
		                OR LOWER(CCP_NOMBRE) LIKE '%' || LOWER(TRIM(pCcpNombre)) || '%'
		            )
		            ORDER BY CCP_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CCP_CODIGO AS value, CCP_NOMBRE AS label
            FROM PLA_CCP_CLASIFICACION
            WHERE CCP_CODCIA = pCcpCodcia
           	ORDER BY CCP_CODIGO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CCP_CLASIFICACION;

-----------------------------------------------------------

-- # serie de puestos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TPP_TIPUESTO(
    pOpcion IN NUMBER,
    pTppCodcia IN OUT VARCHAR2,
    pTppCodigo IN OUT VARCHAR2,
    pTppDescripcion IN VARCHAR2 DEFAULT NULL,
    pTppDescripcionIng IN VARCHAR2 DEFAULT NULL,
    pTppCodccp IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_TPP_TIPUESTO (
            TPP_CODCIA,
            TPP_CODIGO,
            TPP_DESCRIPCION,
            TPP_DESCRIPCION_ING,
            TPP_CODCCP
        ) VALUES (
            pTppCodcia,
            pTppCodigo,
            pTppDescripcion,
            pTppDescripcionIng,
            pTppCodccp
        )
        RETURNING TPP_CODCIA, TPP_CODIGO INTO pTppCodcia, pTppCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_TPP_TIPUESTO SET
            TPP_DESCRIPCION = pTppDescripcion,
            TPP_DESCRIPCION_ING = pTppDescripcionIng,
            TPP_CODCCP = pTppCodccp
        WHERE TPP_CODCIA = pTppCodcia AND TPP_CODIGO = pTppCodigo;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			SELECT 
			    --ROWID AS id,
			    TP.TPP_CODCIA,
			    TP.TPP_CODIGO,
			    TP.TPP_DESCRIPCION,
			    TP.TPP_DESCRIPCION_ING,
			    TP.TPP_CODCCP,
			    CC.CCP_NOMBRE AS CCP_CATEGORIA
			FROM PLA_TPP_TIPUESTO TP
			LEFT JOIN RHEPQ.PLA_CCP_CLASIFICACION CC ON CC.CCP_CODIGO = TP.TPP_CODCCP
            WHERE TP.TPP_CODCIA = pTppCodcia AND TP.TPP_CODIGO = pTppCodigo;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador 
		FROM PLA_TPP_TIPUESTO TP
		LEFT JOIN RHEPQ.PLA_CCP_CLASIFICACION CC ON CC.CCP_CODIGO = TP.TPP_CODCCP
		WHERE TP.TPP_CODCIA = pTppCodcia
		AND (
		    pTppDescripcion IS NULL
		    OR pTppDescripcion = ''
		    OR LOWER(TP.TPP_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTppDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                --ROWID AS id,
		                TP.TPP_CODCIA,
		                TP.TPP_CODIGO,
		                TP.TPP_DESCRIPCION,
		                TP.TPP_DESCRIPCION_ING,
		                TP.TPP_CODCCP,
		                CC.CCP_NOMBRE AS CCP_CATEGORIA
		            FROM PLA_TPP_TIPUESTO TP
		            LEFT JOIN RHEPQ.PLA_CCP_CLASIFICACION CC ON CC.CCP_CODIGO = TP.TPP_CODCCP
		            WHERE TP.TPP_CODCIA = pTppCodcia
		            AND (
		                pTppDescripcion IS NULL
		                OR pTppDescripcion = ''
		                OR LOWER(TP.TPP_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTppDescripcion)) || '%'
		            )
		            ORDER BY TP.TPP_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TPP_CODIGO AS value, TPP_DESCRIPCION AS label
            FROM PLA_TPP_TIPUESTO
            WHERE TPP_CODCIA = pTppCodcia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TPP_TIPUESTO;

-----------------------------------------------------------

-- # clases de puestos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_PUE_PUESTO(
    pOpcion IN NUMBER,
    pPueCodigo IN OUT NUMBER,
    pPueCodCia IN VARCHAR2,
    pPueCodTpp IN VARCHAR2,
    pPueNombre IN VARCHAR2,
    pPueNombreIng IN VARCHAR2,
    pPueDescripcion IN VARCHAR2,
    pPueEstado IN VARCHAR2,
    pPueFechaSupre IN DATE,
    pPueCodCss IN NUMBER,
    pPueEdadMin IN NUMBER,
    pPueEdadMax IN NUMBER,
    pPueEstCivil IN VARCHAR2,
    pPueSexo IN VARCHAR2,
    pPueCenCosto IN NUMBER,
    pPueBono IN VARCHAR2,
    pPueRecargo IN VARCHAR2,
    pPueCodCpu IN VARCHAR2,
    pPueBonoVolumen IN VARCHAR2,
    pPueIngBonoVolumen IN VARCHAR2,
    pPueBonoMarca IN VARCHAR2,
    pPueIngBonoMarca IN VARCHAR2,
    pPuePremioVolumen IN VARCHAR2,
    pPueIngPremioVolumen IN VARCHAR2,
    pPuePremioMarca IN VARCHAR2,
    pPueIngPremioMarca IN VARCHAR2,
    pPueComision IN VARCHAR2,
    pPueIngComision IN VARCHAR2,
    pPueIncentivos IN VARCHAR2,
    pPueIngIncentivos IN VARCHAR2,
    pPueCodCva IN VARCHAR2,
    pPuePuntajeValuacion IN NUMBER,
    pPueRequiereEvaluacion IN VARCHAR2,
    pPueCodUniGer IN NUMBER,
    pPueCodUniSg IN NUMBER,
    pEstado IN NUMBER,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
    
        INSERT INTO PLA_PUE_PUESTO (
            PUE_CODCIA,
            PUE_CODTPP,
            PUE_CODIGO,
            PUE_NOMBRE,
            PUE_NOMBRE_ING,
            PUE_DESCRIPCION,
            PUE_ESTADO,
            PUE_FECHA_SUPRE,
            PUE_CODCSS,
            PUE_EDAD_MIN,
            PUE_EDAD_MAX,
            PUE_EST_CIVIL,
            PUE_SEXO,
            PUE_CEN_COSTO,
            PUE_BONO,
            PUE_RECARGO,
            PUE_CODCPU,
            PUE_BONO_VOLUMEN,
            PUE_ING_BONO_VOLUMEN,
            PUE_BONO_MARCA,
            PUE_ING_BONO_MARCA,
            PUE_PREMIO_VOLUMEN,
            PUE_ING_PREMIO_VOLUMEN,
            PUE_PREMIO_MARCA,
            PUE_ING_PREMIO_MARCA,
            PUE_COMISION,
            PUE_ING_COMISION,
            PUE_INCENTIVOS,
            PUE_ING_INCENTIVOS,
            PUE_CODCVA,
            PUE_PUNTAJE_VALUACION,
            PUE_REQUIERE_EVALUACION,
            PUE_CODUNI_GER,
            PUE_CODUNI_SG
        ) VALUES (
            pPueCodCia,
            pPueCodTpp,
            pPueCodigo,
            pPueNombre,
            pPueNombreIng,
            pPueDescripcion,
            pPueEstado,
            pPueFechaSupre,
            pPueCodCss,
            pPueEdadMin,
            pPueEdadMax,
            pPueEstCivil,
            pPueSexo,
            pPueCenCosto,
            pPueBono,
            pPueRecargo,
            pPueCodCpu,
            pPueBonoVolumen,
            pPueIngBonoVolumen,
            pPueBonoMarca,
            pPueIngBonoMarca,
            pPuePremioVolumen,
            pPueIngPremioVolumen,
            pPuePremioMarca,
            pPueIngPremioMarca,
            pPueComision,
            pPueIngComision,
            pPueIncentivos,
            pPueIngIncentivos,
            pPueCodCva,
            pPuePuntajeValuacion,
            pPueRequiereEvaluacion,
            pPueCodUniGer,
            pPueCodUniSg
        )
        RETURNING PUE_CODIGO INTO pPueCodigo;
        
    ELSIF pOpcion = 2 THEN
    
         UPDATE PLA_PUE_PUESTO SET
	        PUE_NOMBRE = pPueNombre,
	        PUE_NOMBRE_ING = pPueNombreIng,
	        PUE_DESCRIPCION = pPueDescripcion,
	        PUE_ESTADO = pPueEstado,
	        PUE_FECHA_SUPRE = pPueFechaSupre,
	        PUE_CODCSS = pPueCodCss,
	        PUE_EDAD_MIN = pPueEdadMin,
	        PUE_EDAD_MAX = pPueEdadMax,
	        PUE_EST_CIVIL = pPueEstCivil,
	        PUE_SEXO = pPueSexo,
	        PUE_CEN_COSTO = pPueCenCosto,
	        PUE_BONO = pPueBono,
	        PUE_RECARGO = pPueRecargo,
	        PUE_CODCPU = pPueCodCpu,
	        PUE_BONO_VOLUMEN = pPueBonoVolumen,
	        PUE_ING_BONO_VOLUMEN = pPueIngBonoVolumen,
	        PUE_BONO_MARCA = pPueBonoMarca,
	        PUE_ING_BONO_MARCA = pPueIngBonoMarca,
	        PUE_PREMIO_VOLUMEN = pPuePremioVolumen,
	        PUE_ING_PREMIO_VOLUMEN = pPueIngPremioVolumen,
	        PUE_PREMIO_MARCA = pPuePremioMarca,
	        PUE_ING_PREMIO_MARCA = pPueIngPremioMarca,
	        PUE_COMISION = pPueComision,
	        PUE_ING_COMISION = pPueIngComision,
	        PUE_INCENTIVOS = pPueIncentivos,
	        PUE_ING_INCENTIVOS = pPueIngIncentivos,
	        PUE_CODCVA = pPueCodCva,
	        PUE_PUNTAJE_VALUACION = pPuePuntajeValuacion,
	        PUE_REQUIERE_EVALUACION = pPueRequiereEvaluacion,
	        PUE_CODUNI_GER = pPueCodUniGer,
	        PUE_CODUNI_SG = pPueCodUniSg
	    WHERE PUE_CODCIA = pPueCodCia AND PUE_CODTPP = pPueCodTpp AND PUE_CODIGO = pPueCodigo;

    END IF;

    COMMIT;
   
   IF pOpcion IN (1, 2, 3, 4) THEN
     OPEN pCursor FOR
   		SELECT 
		    P.PUE_CODCIA,
		    P.PUE_CODTPP,
		    TP.TPP_DESCRIPCION,
		    P.PUE_CODIGO,
		    P.PUE_NOMBRE,
		    P.PUE_NOMBRE_ING,
		    P.PUE_DESCRIPCION,
		    P.PUE_ESTADO,
		    P.PUE_FECHA_SUPRE,
		    P.PUE_CODCSS,
		    CSS.CSS_DESCRIPCION,
		    P.PUE_EDAD_MIN,
		    P.PUE_EDAD_MAX,
		    P.PUE_EST_CIVIL,
		    P.PUE_SEXO,
		    P.PUE_CEN_COSTO,
		    --CEN.CCO_DESCRIPCION,
		    P.PUE_BONO,
		    P.PUE_RECARGO,
		    P.PUE_CODCPU,
		    CPU.CPU_DESCRIPCION,
		    P.PUE_BONO_VOLUMEN,
		    P.PUE_ING_BONO_VOLUMEN,
		    P.PUE_BONO_MARCA,
		    P.PUE_ING_BONO_MARCA,
		    P.PUE_PREMIO_VOLUMEN,
		    P.PUE_ING_PREMIO_VOLUMEN,
		    P.PUE_PREMIO_MARCA,
		    P.PUE_ING_PREMIO_MARCA,
		    P.PUE_COMISION,
		    P.PUE_ING_COMISION,
		    P.PUE_INCENTIVOS,
		    P.PUE_ING_INCENTIVOS,
		    P.PUE_CODCVA,
		    CVA.CVA_DESCRIPCION,
		    P.PUE_PUNTAJE_VALUACION,
		    P.PUE_REQUIERE_EVALUACION,
		    P.PUE_CODUNI_GER,
		    GER.UNI_NOMBRE AS NOMBRE_GERENCIA,
		    P.PUE_CODUNI_SG,
		    SUBGER.UNI_NOMBRE AS NOMBRE_SUBGERENCIA
		FROM RHEPQ.PLA_PUE_PUESTO P
		INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TP ON TP.TPP_CODIGO = P.PUE_CODTPP
		LEFT JOIN RHEPQ.PLA_CSS_CLASALARIAL CSS ON CSS.CSS_CODIGO = P.PUE_CODCSS
		--LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = P.PUE_CEN_COSTO
		LEFT JOIN RHEPQ.PLA_CPU_CTA_PUESTO CPU ON CPU.CPU_CODIGO = P.PUE_CODCPU
		LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION CVA ON CVA.CVA_CODIGO = P.PUE_CODCVA
		LEFT JOIN RHEPQ.PLA_UNI_UNIDAD GER ON GER.UNI_CODIGO = P.PUE_CODUNI_GER AND GER.UNI_CODCIA = P.PUE_CODCIA
		LEFT JOIN RHEPQ.PLA_UNI_UNIDAD SUBGER ON SUBGER.UNI_CODIGO = P.PUE_CODUNI_SG AND SUBGER.UNI_CODCIA = P.PUE_CODCIA AND SUBGER.UNI_CODUNI_PADRE = P.PUE_CODUNI_GER
		WHERE P.PUE_CODCIA = pPueCodCia AND P.PUE_CODTPP = pPueCodTpp AND P.PUE_CODIGO = pPueCodigo;


 	ELSIF pOpcion = 5 THEN
	    -- Calcular el total de registros que cumplen con el criterio de búsqueda
		SELECT COUNT(*) INTO vContador
		FROM RHEPQ.PLA_PUE_PUESTO P
		INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TP ON TP.TPP_CODIGO = P.PUE_CODTPP
		LEFT JOIN RHEPQ.PLA_CSS_CLASALARIAL CSS ON CSS.CSS_CODIGO = P.PUE_CODCSS
		--LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = P.PUE_CEN_COSTO
		LEFT JOIN RHEPQ.PLA_CPU_CTA_PUESTO CPU ON CPU.CPU_CODIGO = P.PUE_CODCPU
		LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION CVA ON CVA.CVA_CODIGO = P.PUE_CODCVA
		LEFT JOIN RHEPQ.PLA_UNI_UNIDAD GER ON GER.UNI_CODIGO = P.PUE_CODUNI_GER AND GER.UNI_CODCIA = P.PUE_CODCIA
		LEFT JOIN RHEPQ.PLA_UNI_UNIDAD SUBGER ON SUBGER.UNI_CODIGO = P.PUE_CODUNI_SG AND SUBGER.UNI_CODCIA = P.PUE_CODCIA AND SUBGER.UNI_CODUNI_PADRE = P.PUE_CODUNI_GER
		WHERE 
		(
		    pPueNombre IS NULL
		    OR pPueNombre = ''
		    OR LOWER(P.PUE_NOMBRE) LIKE '%' || LOWER(TRIM(pPueNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		    
		-- Abrir el cursor para obtener los resultados paginados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		               SELECT 
						    P.PUE_CODCIA,
						    P.PUE_CODTPP,
						    TP.TPP_DESCRIPCION,
						    P.PUE_CODIGO,
						    P.PUE_NOMBRE,
						    P.PUE_NOMBRE_ING,
						    P.PUE_DESCRIPCION,
						    P.PUE_ESTADO,
						    P.PUE_FECHA_SUPRE,
						    P.PUE_CODCSS,
						    CSS.CSS_DESCRIPCION,
						    P.PUE_EDAD_MIN,
						    P.PUE_EDAD_MAX,
						    P.PUE_EST_CIVIL,
						    P.PUE_SEXO,
						    P.PUE_CEN_COSTO,
						    --CEN.CCO_DESCRIPCION,
						    P.PUE_BONO,
						    P.PUE_RECARGO,
						    P.PUE_CODCPU,
						    CPU.CPU_DESCRIPCION,
						    P.PUE_BONO_VOLUMEN,
						    P.PUE_ING_BONO_VOLUMEN,
						    P.PUE_BONO_MARCA,
						    P.PUE_ING_BONO_MARCA,
						    P.PUE_PREMIO_VOLUMEN,
						    P.PUE_ING_PREMIO_VOLUMEN,
						    P.PUE_PREMIO_MARCA,
						    P.PUE_ING_PREMIO_MARCA,
						    P.PUE_COMISION,
						    P.PUE_ING_COMISION,
						    P.PUE_INCENTIVOS,
						    P.PUE_ING_INCENTIVOS,
						    P.PUE_CODCVA,
						    CVA.CVA_DESCRIPCION,
						    P.PUE_PUNTAJE_VALUACION,
						    P.PUE_REQUIERE_EVALUACION,
						    P.PUE_CODUNI_GER,
						    GER.UNI_NOMBRE AS NOMBRE_GERENCIA,
						    P.PUE_CODUNI_SG,
						    SUBGER.UNI_NOMBRE AS NOMBRE_SUBGERENCIA
						FROM RHEPQ.PLA_PUE_PUESTO P
						INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TP ON TP.TPP_CODIGO = P.PUE_CODTPP
						LEFT JOIN RHEPQ.PLA_CSS_CLASALARIAL CSS ON CSS.CSS_CODIGO = P.PUE_CODCSS
						--LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = P.PUE_CEN_COSTO
						LEFT JOIN RHEPQ.PLA_CPU_CTA_PUESTO CPU ON CPU.CPU_CODIGO = P.PUE_CODCPU
						LEFT JOIN RHEPQ.PLA_CVA_CLASIF_VALUACION CVA ON CVA.CVA_CODIGO = P.PUE_CODCVA
						LEFT JOIN RHEPQ.PLA_UNI_UNIDAD GER ON GER.UNI_CODIGO = P.PUE_CODUNI_GER AND GER.UNI_CODCIA = P.PUE_CODCIA
						LEFT JOIN RHEPQ.PLA_UNI_UNIDAD SUBGER ON SUBGER.UNI_CODIGO = P.PUE_CODUNI_SG AND SUBGER.UNI_CODCIA = P.PUE_CODCIA AND SUBGER.UNI_CODUNI_PADRE = P.PUE_CODUNI_GER
		            WHERE 
		            (
		                pPueNombre IS NULL
		                OR pPueNombre = ''
		                OR LOWER(P.PUE_NOMBRE) LIKE '%' || LOWER(TRIM(pPueNombre)) || '%'
		            )
		            ORDER BY P.PUE_CODIGO, P.PUE_CODTPP, P.PUE_NOMBRE
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

     ELSIF pOpcion = 6 THEN
	    OPEN pCursor FOR
	        SELECT
	            PUE_CODIGO AS value,
	            PUE_NOMBRE AS label
	        FROM PLA_PUE_PUESTO
	        WHERE PUE_CODCIA = pPueCodCia AND PUE_CODTPP = pPueCodTpp
	        ORDER BY PUE_CODIGO;
	  
	-- Obtener escalasalarial por compania, tipo puesto y puesto.
   	ELSIF pOpcion = 7 THEN
   		OPEN pCursor FOR
   			SELECT
			    P.PUE_CODCSS,
			    CSS.CSS_DESCRIPCION 
			FROM PLA_PUE_PUESTO P
			LEFT JOIN RHEPQ.PLA_CSS_CLASALARIAL CSS ON CSS.CSS_CODIGO = P.PUE_CODCSS
			WHERE P.PUE_CODCIA = pPueCodCia AND P.PUE_CODTPP = pPueCodTpp AND P.PUE_CODIGO = pPueCodigo;
    
       END IF;
		       
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_PUE_PUESTO;

ALTER TABLE RHEPQ.B_PLA_PUE_PUESTOS
MODIFY (MAQUINA VARCHAR2(100));

-----------------------------------------------------------

   -- clases de puestos # Cuenta

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CPU_CTA_PUESTO(
    pOpcion IN NUMBER,
    pCpuCodCia IN OUT VARCHAR2,
    pCpuCodigo IN OUT VARCHAR2,
    pCpuDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CPU_CTA_PUESTO (
            CPU_CODCIA,
            CPU_CODIGO,
            CPU_DESCRIPCION
        ) VALUES (
            pCpuCodCia,
            pCpuCodigo,
            pCpuDescripcion
        )
        RETURNING CPU_CODCIA, CPU_CODIGO INTO pCpuCodCia, pCpuCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CPU_CTA_PUESTO SET
            CPU_DESCRIPCION = pCpuDescripcion
        WHERE CPU_CODCIA = pCpuCodCia AND CPU_CODIGO = pCpuCodigo;

    COMMIT;
   
   END IF;

    -- Lógica para recuperar información específica o paginada
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CPU_CODCIA,
                CPU_CODIGO,
                CPU_DESCRIPCION
            FROM PLA_CPU_CTA_PUESTO
            WHERE CPU_CODCIA = pCpuCodCia AND CPU_CODIGO = pCpuCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_CPU_CTA_PUESTO
        WHERE 
        (
            pCpuDescripcion IS NULL
            OR pCpuDescripcion = ''
            OR LOWER(CPU_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCpuDescripcion)) || '%'
        );
        
        -- Asignar la cantidad total de páginas
        pTotalPage := vContador;
        --pTotalPage := CEIL(vContador / pPageSize);
        
        -- Abrir el cursor para obtener los resultados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        CPU_CODCIA,
                        CPU_CODIGO,
                        CPU_DESCRIPCION
                    FROM PLA_CPU_CTA_PUESTO
                    WHERE 
                    (
                        pCpuDescripcion IS NULL
                        OR pCpuDescripcion = ''
                        OR LOWER(CPU_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCpuDescripcion)) || '%'
                    )
                    ORDER BY CPU_CODCIA, CPU_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                CPU_CODIGO AS value, 
                CPU_DESCRIPCION AS label
            FROM PLA_CPU_CTA_PUESTO
            ORDER BY CPU_CODCIA, CPU_CODIGO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CPU_CTA_PUESTO;

-----------------------------------------------------------

   -- clases de puestos # Jefe inmediato -- PUESTO SUPERVISA

 CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_PSV_PUESTO_SUPERVISA(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pPsvCodcia IN VARCHAR2,
    pPsvCodplz IN NUMBER,
    pPsvCodplzSupervisa IN NUMBER DEFAULT NULL,
    pPsvSupervisorSupervisado IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_PSV_PUESTO_SUPERVISA (
            PSV_CODCIA,
            PSV_CODPLZ,
            PSV_CODPLZ_SUPERVISA,
            PSV_SUPERVISOR_SUPERVISADO
        ) VALUES (
            pPsvCodcia,
            pPsvCodplz,
            pPsvCodplzSupervisa,
            pPsvSupervisorSupervisado
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_PSV_PUESTO_SUPERVISA SET
            PSV_CODCIA = pPsvCodcia,
            PSV_CODPLZ = pPsvCodplz,
            PSV_CODPLZ_SUPERVISA = pPsvCodplzSupervisa,
            PSV_SUPERVISOR_SUPERVISADO = pPsvSupervisorSupervisado
        WHERE ROWID = pRowId;
       
	COMMIT;
    
   	END IF;


    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
        	SELECT
        		PSV.ROWID AS id, 
                P.PLZ_CODIGO AS CodigoPlaza,
			    P.PLZ_NOMBRE AS NombrePlaza,
			    PSV.PSV_CODPLZ_SUPERVISA AS CodigoPlazaSupervisa,
			    PSUPERVISA.PLZ_NOMBRE AS NombrePlazaSupervisa
            FROM RHEPQ.PLA_PLZ_PLAZA P
            INNER JOIN RHEPQ.REC_PSV_PUESTO_SUPERVISA PSV ON PSV.PSV_CODPLZ = P.PLZ_CODIGO
            LEFT JOIN RHEPQ.PLA_PLZ_PLAZA PSUPERVISA ON PSUPERVISA.PLZ_CODIGO = PSV.PSV_CODPLZ_SUPERVISA
            WHERE PSV.ROWID = pRowId
            ORDER BY P.PLZ_CODIGO;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.PLA_PLZ_PLAZA P
	    INNER JOIN RHEPQ.REC_PSV_PUESTO_SUPERVISA PSV ON PSV.PSV_CODPLZ = P.PLZ_CODIGO
	    LEFT JOIN RHEPQ.PLA_PLZ_PLAZA PSUPERVISA ON PSUPERVISA.PLZ_CODIGO = PSV.PSV_CODPLZ_SUPERVISA;
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                	PSV.ROWID AS id, 
                        P.PLZ_CODIGO AS CodigoPlaza,
					    P.PLZ_NOMBRE AS NombrePlaza,
					    PSV.PSV_CODPLZ_SUPERVISA AS CodigoPlazaSupervisa,
					    PSUPERVISA.PLZ_NOMBRE AS NombrePlazaSupervisa
	                FROM RHEPQ.PLA_PLZ_PLAZA P
	                INNER JOIN RHEPQ.REC_PSV_PUESTO_SUPERVISA PSV ON PSV.PSV_CODPLZ = P.PLZ_CODIGO
	                LEFT JOIN RHEPQ.PLA_PLZ_PLAZA PSUPERVISA ON PSUPERVISA.PLZ_CODIGO = PSV.PSV_CODPLZ_SUPERVISA
	                ORDER BY P.PLZ_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
	    
	-- Personal supervisado por plaza
   ELSIF pOpcion = 7 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.PLA_PLZ_PLAZA P
	    INNER JOIN RHEPQ.REC_PSV_PUESTO_SUPERVISA PSV ON PSV.PSV_CODPLZ = P.PLZ_CODIGO
        LEFT JOIN RHEPQ.PLA_PLZ_PLAZA PSUPERVISA ON PSUPERVISA.PLZ_CODIGO = PSV.PSV_CODPLZ_SUPERVISA
       	WHERE PSV.PSV_CODPLZ = pPsvCodplz;
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                	PSV.ROWID AS id,
					    P.PLZ_CODIGO AS CodigoPlaza,
					    P.PLZ_NOMBRE AS NombrePlaza,
					    PSV.PSV_CODPLZ_SUPERVISA AS CodigoPlazaSupervisa,
					    PSUPERVISA.PLZ_NOMBRE AS NombrePlazaSupervisa,
					    CASE
					        WHEN PSV.PSV_SUPERVISOR_SUPERVISADO = 'A' THEN 'Supervisa A'
					        WHEN PSV.PSV_SUPERVISOR_SUPERVISADO = 'P' THEN 'Supervisado Por'
					    END AS Relacion
	                FROM RHEPQ.PLA_PLZ_PLAZA P
	                LEFT JOIN RHEPQ.REC_PSV_PUESTO_SUPERVISA PSV ON PSV.PSV_CODPLZ = P.PLZ_CODIGO
	                LEFT JOIN RHEPQ.PLA_PLZ_PLAZA PSUPERVISA ON PSUPERVISA.PLZ_CODIGO = PSV.PSV_CODPLZ_SUPERVISA
	                WHERE PSV.PSV_CODPLZ = pPsvCodplz
	                ORDER BY PSV.PSV_CODPLZ
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
END SP_REC_PSV_PUESTO_SUPERVISA;

   -----------------------------------------------------------

   -- clases de puestos # Titulo de puesto a cargo

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_CFU_CARGO_FUNCIONAL(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pCfuCodCia IN VARCHAR2,
    pCfuCodTpp IN VARCHAR2,
    pCfuCodPue IN NUMBER,
    pCfuCodTppI IN VARCHAR2,
    pCfuCodPueI IN NUMBER,
    pCfuObservacion IN VARCHAR2,
    pCfuAcceso IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_CFU_CARGO_FUNCIONAL (
            CFU_CODCIA, CFU_CODTPP, CFU_CODPUE, CFU_CODTPP_I, CFU_CODPUE_I, CFU_OBSERVACION, CFU_ACCESO
        ) VALUES (
            pCfuCodCia, pCfuCodTpp, pCfuCodPue, pCfuCodTppI, pCfuCodPueI, pCfuObservacion, pCfuAcceso
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_CFU_CARGO_FUNCIONAL SET
            CFU_CODCIA = pCfuCodCia, 
            CFU_CODTPP = pCfuCodTpp, 
            CFU_CODPUE = pCfuCodPue, 
            CFU_CODTPP_I = pCfuCodTppI, 
            CFU_CODPUE_I = pCfuCodPueI, 
            CFU_OBSERVACION = pCfuObservacion, 
            CFU_ACCESO = pCfuAcceso
        WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Consultar detalles basados en la operación seleccionada
    IF pOpcion IN (1, 2, 3, 4) THEN
        -- Usando la consulta de referencia para mostrar los detalles
        OPEN pCursor FOR
			SELECT 
			    CFU.ROWID AS id,
			    CFU.CFU_CODCIA,
			    CFU.CFU_CODPUE COD_CLASE_PUESTO,
			    PUE_ORIGINAL.PUE_NOMBRE AS NOM_CLASE_PUESTO,
			    CFU.CFU_CODTPP_I COD_TIPO_PUESTO,
			    TPP_INTERINO.TPP_DESCRIPCION AS NOM_TIPO_PUESTO,
			    CFU.CFU_CODPUE_I AS COD_PUESTO,
			    PUE_INTERINO.PUE_NOMBRE AS NOM_PUESTO,
			    CFU.CFU_OBSERVACION,
			    CFU.CFU_ACCESO,
			    TPP_ORIGINAL.TPP_CODIGO AS COD_SERIE_PUESTO,
			    TPP_ORIGINAL.TPP_DESCRIPCION AS NOM_SERIE_PUESTO
			FROM 
			    RHEPQ.REC_CFU_CARGO_FUNCIONAL CFU  
			INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_ORIGINAL ON TPP_ORIGINAL.TPP_CODIGO = CFU.CFU_CODTPP
			INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_ORIGINAL ON PUE_ORIGINAL.PUE_CODIGO = CFU.CFU_CODPUE
			INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_INTERINO ON TPP_INTERINO.TPP_CODIGO = CFU.CFU_CODTPP_I
			INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_INTERINO ON PUE_INTERINO.PUE_CODIGO = CFU.CFU_CODPUE_I
			WHERE CFU.ROWID = pRowId
			ORDER BY CFU.CFU_CODCIA, CFU.CFU_CODTPP, CFU.CFU_CODPUE;

   ELSIF pOpcion = 5 THEN
    -- Calcular el total de registros para la paginación
    SELECT COUNT(*) INTO vContador
    FROM RHEPQ.REC_CFU_CARGO_FUNCIONAL CFU
    INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_ORIGINAL ON TPP_ORIGINAL.TPP_CODIGO = CFU.CFU_CODTPP
    INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_ORIGINAL ON PUE_ORIGINAL.PUE_CODIGO = CFU.CFU_CODPUE
    INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_INTERINO ON TPP_INTERINO.TPP_CODIGO = CFU.CFU_CODTPP_I
    INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_INTERINO ON PUE_INTERINO.PUE_CODIGO = CFU.CFU_CODPUE_I
   	WHERE CFU.CFU_CODCIA = pCfuCodCia AND CFU.CFU_CODPUE = pCfuCodPue;
    
    -- Asignar la cantidad total de páginas
    pTotalPage := vContador;
    --pTotalPage := CEIL(vContador / pPageSize);
    
    -- Abrir el cursor para obtener los resultados paginados
    OPEN pCursor FOR
        SELECT * FROM (
            SELECT a.*, ROWNUM rnum
            FROM (
                SELECT 
                    CFU.ROWID AS id,
				    CFU.CFU_CODCIA,
				    CFU.CFU_CODPUE COD_CLASE_PUESTO,
				    PUE_ORIGINAL.PUE_NOMBRE AS NOM_CLASE_PUESTO,
				    CFU.CFU_CODTPP_I COD_TIPO_PUESTO,
				    TPP_INTERINO.TPP_DESCRIPCION AS NOM_TIPO_PUESTO,
				    CFU.CFU_CODPUE_I AS COD_PUESTO,
				    PUE_INTERINO.PUE_NOMBRE AS NOM_PUESTO,
				    CFU.CFU_OBSERVACION,
				    CFU.CFU_ACCESO,
				    TPP_ORIGINAL.TPP_CODIGO AS COD_SERIE_PUESTO,
				    TPP_ORIGINAL.TPP_DESCRIPCION AS NOM_SERIE_PUESTO
                FROM 
                    RHEPQ.REC_CFU_CARGO_FUNCIONAL CFU
                INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_ORIGINAL ON TPP_ORIGINAL.TPP_CODIGO = CFU.CFU_CODTPP
                INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_ORIGINAL ON PUE_ORIGINAL.PUE_CODIGO = CFU.CFU_CODPUE
                INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP_INTERINO ON TPP_INTERINO.TPP_CODIGO = CFU.CFU_CODTPP_I
                INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE_INTERINO ON PUE_INTERINO.PUE_CODIGO = CFU.CFU_CODPUE_I
                WHERE CFU.CFU_CODCIA = pCfuCodCia AND CFU.CFU_CODPUE = pCfuCodPue
                ORDER BY CFU.CFU_CODCIA, CFU.CFU_CODTPP, CFU.CFU_CODPUE
            ) a
            WHERE ROWNUM <= pPageNumber * pPageSize
        )
        WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_CFU_CARGO_FUNCIONAL;

   -----------------------------------------------------------

   -- clases de puestos # Funciones del puesto

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_FNP_FUNCION_PUESTO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pFnpCodCia IN VARCHAR2 DEFAULT NULL,
    pFnpCodTpp IN VARCHAR2 DEFAULT NULL,
    pFnpCodPue IN NUMBER DEFAULT NULL,
    pFnpCodTfn IN VARCHAR2 DEFAULT NULL,
    pFnpCodFun IN VARCHAR2 DEFAULT NULL,
    pFnpCodFre IN VARCHAR2 DEFAULT NULL,
    pFnpPctTiempo IN NUMBER DEFAULT NULL,
    pFnpOrden IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN

        INSERT INTO RHEPQ.REC_FNP_FUNCION_PUESTO (
            FNP_CODCIA,
            FNP_CODTPP,
            FNP_CODPUE,
            FNP_CODTFN,
            FNP_CODFUN,
            FNP_CODFRE,
            FNP_PCT_TIEMPO,
            FNP_ORDEN
        ) VALUES (
            pFnpCodCia,
            pFnpCodTpp,
            pFnpCodPue,
            pFnpCodTfn,
            pFnpCodFun,
            pFnpCodFre,
            pFnpPctTiempo,
            pFnpOrden
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN

        UPDATE RHEPQ.REC_FNP_FUNCION_PUESTO SET
            FNP_CODTFN = pFnpCodTfn,
            FNP_CODFUN = pFnpCodFun,
            FNP_CODFRE = pFnpCodFre,
            FNP_PCT_TIEMPO = pFnpPctTiempo,
            FNP_ORDEN = pFnpOrden
        WHERE ROWID = pRowId;
    END IF;

    COMMIT;

    -- Lógica para buscar un registro único mediante el ROWID
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
		SELECT
			FNP.ROWID AS id,
		    FNP.FNP_CODTFN,
		    TFN.TFN_NOMBRE,
		    FNP.FNP_CODFUN,
		    FUN.FUN_DESCRIPCION AS DESC_FUN,
		    FNP.FNP_PCT_TIEMPO,
		    FNP.FNP_CODFRE,
		    FRE.FRE_NOMBRE AS DESC_FRE,
		    FNP.FNP_ORDEN
		FROM 
		    RHEPQ.REC_FNP_FUNCION_PUESTO FNP
		    JOIN RHEPQ.REC_FUN_FUNCION FUN ON FNP.FNP_CODCIA = FUN.FUN_CODCIA 
		    AND FNP.FNP_CODTFN = FUN.FUN_CODTFN 
		    AND FNP.FNP_CODFUN = FUN.FUN_CODIGO
		   	INNER JOIN RHEPQ.REC_TFN_TIPO_FUNCION TFN ON TFN.TFN_CODIGO = FUN.FUN_CODTFN AND TFN.TFN_CODCIA = FUN.FUN_CODCIA
		    JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON FNP.FNP_CODFRE = FRE.FRE_CODIGO
            WHERE FNP.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
       -- Cálculo del total de páginas y abrir el cursor para obtener los resultados filtrados
       SELECT COUNT(*) INTO vContador
       FROM REC_FNP_FUNCION_PUESTO FNP
       JOIN REC_FUN_FUNCION FUN ON FNP.FNP_CODCIA = FUN.FUN_CODCIA AND FNP.FNP_CODTFN = FUN.FUN_CODTFN AND FNP.FNP_CODFUN = FUN.FUN_CODIGO
       INNER JOIN RHEPQ.REC_TFN_TIPO_FUNCION TFN ON TFN.TFN_CODIGO = FUN.FUN_CODTFN AND TFN.TFN_CODCIA = FUN.FUN_CODCIA
       JOIN REC_FRE_FRECUENCIA FRE ON FNP.FNP_CODFRE = FRE.FRE_CODIGO
       WHERE 
           FNP.FNP_CODCIA = pFnpCodCia
           AND FNP.FNP_CODTPP = pFnpCodTpp
           AND FNP.FNP_CODPUE = pFnpCodPue;
       
   		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
       
       OPEN pCursor FOR
           SELECT * FROM (
               SELECT 
               	   FNP.ROWID AS id,
                   FNP.FNP_CODTFN,
                   TFN.TFN_NOMBRE,
                   FNP.FNP_CODFUN,
                   FUN.FUN_DESCRIPCION AS DESC_FUN,
                   FNP.FNP_PCT_TIEMPO,
                   FNP.FNP_CODFRE,
                   FRE.FRE_NOMBRE AS DESC_FRE,
                   FNP.FNP_ORDEN,
                   ROWNUM rnum
               FROM REC_FNP_FUNCION_PUESTO FNP
               JOIN REC_FUN_FUNCION FUN ON FNP.FNP_CODCIA = FUN.FUN_CODCIA AND FNP.FNP_CODTFN = FUN.FUN_CODTFN AND FNP.FNP_CODFUN = FUN.FUN_CODIGO
               INNER JOIN RHEPQ.REC_TFN_TIPO_FUNCION TFN ON TFN.TFN_CODIGO = FUN.FUN_CODTFN AND TFN.TFN_CODCIA = FUN.FUN_CODCIA
               JOIN REC_FRE_FRECUENCIA FRE ON FNP.FNP_CODFRE = FRE.FRE_CODIGO
               WHERE 
                   FNP.FNP_CODCIA = pFnpCodCia
                   AND FNP.FNP_CODTPP = pFnpCodTpp
                   AND FNP.FNP_CODPUE = pFnpCodPue
               ORDER BY FNP.FNP_CODTPP ASC 
           )
           WHERE rnum > (pPageNumber - 1) * pPageSize AND rnum <= pPageNumber * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_FNP_FUNCION_PUESTO;

   -----------------------------------------------------------

   -- clases de puestos # Relaciones internas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_RII_RELACION_INTERNA(
    pOpcion IN NUMBER,
    pRIICodigo IN OUT NUMBER,
    pRIICodCia IN VARCHAR2,
    pRIICodTpp IN VARCHAR2,
    pRIICodPue IN NUMBER,
    pRIICodTppI IN VARCHAR2 DEFAULT NULL,
    pRIICodPueI IN NUMBER DEFAULT NULL,
    pRIICodFre IN VARCHAR2 DEFAULT NULL,
    pRIIObservacion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

	IF pOpcion = 1 THEN

		--IF pRIICodigo IS NULL THEN
		  --  SELECT NVL(MAX(RII_CODIGO), 0) + 1 INTO pRIICodigo
		    --FROM REC_RII_RELACION_INTERNA;
		--END IF;

    -- Lógica para generar RII_CODIGO autoincremental
    IF pRIICodigo IS NULL THEN
        SELECT NVL(MAX(RII_CODIGO), 0) + 1 INTO pRIICodigo
        FROM REC_RII_RELACION_INTERNA
        WHERE RII_CODCIA = pRIICodCia
            AND RII_CODTPP = pRIICodTpp
            AND RII_CODPUE = pRIICodPue;
    END IF;
		        
        INSERT INTO REC_RII_RELACION_INTERNA (
            RII_CODCIA,
            RII_CODTPP,
            RII_CODPUE,
            RII_CODTPP_I,
            RII_CODPUE_I,
            RII_CODFRE,
            RII_OBSERVACION,
            RII_CODIGO
        ) VALUES (
            pRIICodCia,
            pRIICodTpp,
            pRIICodPue,
            pRIICodTppI,
            pRIICodPueI,
            pRIICodFre,
            pRIIObservacion,
            pRIICodigo
        )
        RETURNING RII_CODIGO INTO pRIICodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RII_RELACION_INTERNA SET
            RII_CODTPP_I = pRIICodTppI,
            RII_CODPUE_I = pRIICodPueI,
            RII_CODFRE = pRIICodFre,
            RII_OBSERVACION = pRIIObservacion
        WHERE RII_CODCIA = pRIICodCia
          AND RII_CODTPP = pRIICodTpp
          AND RII_CODPUE = pRIICodPue
          AND RII_CODIGO = pRIICodigo;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para opciones 1, 2, 3, 4 (Buscar por llave primaria)
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
           	SELECT 
                RII.RII_CODIGO,
                TPP.TPP_CODIGO,
                TPP.TPP_DESCRIPCION,
                PUE.PUE_CODIGO,
                PUE.PUE_NOMBRE,
                FRE.FRE_CODIGO,
                FRE.FRE_NOMBRE,
                RII.RII_OBSERVACION
            FROM
                RHEPQ.REC_RII_RELACION_INTERNA RII
                INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE ON RII.RII_CODPUE_I = PUE.PUE_CODIGO
                INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON RII.RII_CODTPP_I = TPP.TPP_CODIGO
                INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RII.RII_CODFRE = FRE.FRE_CODIGO
            WHERE RII.RII_CODIGO = pRIICodigo AND  RII_CODCIA = pRIICodCia AND RII_CODTPP = pRIICodTpp AND RII_CODPUE = pRIICodPue;

	ELSIF pOpcion = 5 THEN
	    -- Calcular el total de registros para la paginación
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.REC_RII_RELACION_INTERNA RII
	    INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE ON RII.RII_CODPUE_I = PUE.PUE_CODIGO
	    INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON RII.RII_CODTPP_I = TPP.TPP_CODIGO
	    INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RII.RII_CODFRE = FRE.FRE_CODIGO
	    WHERE RII.RII_CODPUE = pRIICodPue
	      AND RII.RII_CODTPP = pRIICodTpp
	      AND RII.RII_CODCIA = pRIICodCia;
	    
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados paginados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    RII.RII_CODIGO,
	                    TPP.TPP_CODIGO,
	                    TPP.TPP_DESCRIPCION,
	                    PUE.PUE_CODIGO,
	                    PUE.PUE_NOMBRE,
	                    FRE.FRE_CODIGO,
	                    FRE.FRE_NOMBRE,
	                    RII.RII_OBSERVACION
	                FROM
	                    RHEPQ.REC_RII_RELACION_INTERNA RII
	                    INNER JOIN RHEPQ.PLA_PUE_PUESTO PUE ON RII.RII_CODPUE_I = PUE.PUE_CODIGO
	                    INNER JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON RII.RII_CODTPP_I = TPP.TPP_CODIGO
	                    INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RII.RII_CODFRE = FRE.FRE_CODIGO
	                WHERE 
	                    RII.RII_CODPUE = pRIICodPue
	                    AND RII.RII_CODTPP = pRIICodTpp
	                    AND RII.RII_CODCIA = pRIICodCia
	                ORDER BY 
	                    RII.RII_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_RII_RELACION_INTERNA;

   -----------------------------------------------------------

   -- clases de puestos # Relaciones por unidad

CREATE OR REPLACE PROCEDURE RHEPQ.SP_RIU_RELACION_UNIDAD(
    pOpcion IN NUMBER,
    pRIUCodigo IN OUT NUMBER,
    pRIUCodCia IN VARCHAR2,
    pRIUCodTpp IN VARCHAR2,
    pRIUCodPue IN NUMBER,
    pRIUCodUni IN NUMBER DEFAULT NULL,
    pRIUCodFre IN VARCHAR2 DEFAULT NULL,
    pRIUObservacion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        -- Lógica para generar RIU_CODIGO autoincremental
        IF pRIUCodigo IS NULL THEN
            SELECT NVL(MAX(RIU_CODIGO), 0) + 1 INTO pRIUCodigo
            FROM REC_RIU_RELACION_UNIDAD
            WHERE RIU_CODCIA = pRIUCodCia
                AND RIU_CODTPP = pRIUCodTpp
                AND RIU_CODPUE = pRIUCodPue;
        END IF;
        
        INSERT INTO REC_RIU_RELACION_UNIDAD (
            RIU_CODCIA,
            RIU_CODTPP,
            RIU_CODPUE,
            RIU_CODUNI,
            RIU_CODFRE,
            RIU_OBSERVACION,
            RIU_CODIGO
        ) VALUES (
            pRIUCodCia,
            pRIUCodTpp,
            pRIUCodPue,
            pRIUCodUni,
            pRIUCodFre,
            pRIUObservacion,
            pRIUCodigo
        )
        RETURNING RIU_CODIGO INTO pRIUCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RIU_RELACION_UNIDAD SET
            RIU_CODUNI = pRIUCodUni,
            RIU_CODFRE = pRIUCodFre,
            RIU_OBSERVACION = pRIUObservacion
        WHERE RIU_CODCIA = pRIUCodCia
          AND RIU_CODTPP = pRIUCodTpp
          AND RIU_CODPUE = pRIUCodPue
          AND RIU_CODIGO = pRIUCodigo;
         
 	END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
        	SELECT 
                RIU.RIU_CODIGO,
                RIU.RIU_CODUNI,
                UNI.UNI_NOMBRE,
                RIU.RIU_CODFRE,
                FRE.FRE_NOMBRE,
                RIU.RIU_OBSERVACION
            FROM
                RHEPQ.REC_RIU_RELACION_UNIDAD RIU
                INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIU.RIU_CODFRE = FRE.FRE_CODIGO
                INNER JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON RIU.RIU_CODUNI = UNI.UNI_CODIGO AND RIU.RIU_CODCIA = UNI.UNI_CODCIA
            WHERE RIU_CODCIA = pRIUCodCia
		          AND RIU_CODTPP = pRIUCodTpp
		          AND RIU_CODPUE = pRIUCodPue
		          AND RIU_CODIGO = pRIUCodigo;

ELSIF pOpcion = 5 THEN
    -- Calcular el total de registros para la paginación
    SELECT COUNT(*) INTO vContador
    FROM RHEPQ.REC_RIU_RELACION_UNIDAD RIU
    INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIU.RIU_CODFRE = FRE.FRE_CODIGO
    INNER JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON RIU.RIU_CODUNI = UNI.UNI_CODIGO AND RIU.RIU_CODCIA = UNI.UNI_CODCIA
    WHERE RIU.RIU_CODPUE = pRIUCodPue
      AND RIU.RIU_CODTPP = pRIUCodTpp
      AND RIU.RIU_CODCIA = pRIUCodCia;
    
    -- Asignar la cantidad total de páginas
    pTotalPage := vContador;
    --pTotalPage := CEIL(vContador / pPageSize);
    
    -- Abrir el cursor para obtener los resultados paginados
    OPEN pCursor FOR
        SELECT * FROM (
            SELECT a.*, ROWNUM rnum
            FROM (
                SELECT 
                    RIU.RIU_CODIGO,
                    RIU.RIU_CODUNI,
                    UNI.UNI_NOMBRE,
                    RIU.RIU_CODFRE,
                    FRE.FRE_NOMBRE,
                    RIU.RIU_OBSERVACION
                FROM
                    RHEPQ.REC_RIU_RELACION_UNIDAD RIU
                    INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIU.RIU_CODFRE = FRE.FRE_CODIGO
                    INNER JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON RIU.RIU_CODUNI = UNI.UNI_CODIGO AND RIU.RIU_CODCIA = UNI.UNI_CODCIA
                WHERE 
                    RIU.RIU_CODPUE = pRIUCodPue
                    AND RIU.RIU_CODTPP = pRIUCodTpp
                    AND RIU.RIU_CODCIA = pRIUCodCia
                ORDER BY 
                    RIU.RIU_CODIGO ASC
            ) a
            WHERE ROWNUM <= pPageNumber * pPageSize
        )
        WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_RIU_RELACION_UNIDAD;

   -----------------------------------------------------------

   -- clases de puestos # Relaciones externas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_RIE_RELACION_EXTERNA(
    pOpcion IN NUMBER,
    pRIECodigo IN OUT NUMBER,
    pRIECodCia IN VARCHAR2,
    pRIECodTpp IN VARCHAR2,
    pRIECodPue IN NUMBER,
    pRIEDescripcion IN VARCHAR2 DEFAULT NULL,
    pRIECodFre IN VARCHAR2 DEFAULT NULL,
    pRIECodIcr IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        -- Lógica para generar RIE_CODIGO autoincremental
        IF pRIECodigo IS NULL THEN
            SELECT NVL(MAX(RIE_CODIGO), 0) + 1 INTO pRIECodigo
            FROM REC_RIE_RELACION_EXTERNA
            WHERE RIE_CODCIA = pRIECodCia
                AND RIE_CODTPP = pRIECodTpp
                AND RIE_CODPUE = pRIECodPue;
        END IF;
        
        INSERT INTO REC_RIE_RELACION_EXTERNA (
            RIE_CODCIA,
            RIE_CODTPP,
            RIE_CODPUE,
            RIE_DESCRIPCION,
            RIE_CODFRE,
            RIE_CODICR,
            RIE_CODIGO
        ) VALUES (
            pRIECodCia,
            pRIECodTpp,
            pRIECodPue,
            pRIEDescripcion,
            pRIECodFre,
            pRIECodIcr,
            pRIECodigo
        )
        RETURNING RIE_CODIGO INTO pRIECodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RIE_RELACION_EXTERNA SET
            RIE_DESCRIPCION = pRIEDescripcion,
            RIE_CODFRE = pRIECodFre,
            RIE_CODICR = pRIECodIcr
        WHERE RIE_CODCIA = pRIECodCia
          AND RIE_CODTPP = pRIECodTpp
          AND RIE_CODPUE = pRIECodPue
          AND RIE_CODIGO = pRIECodigo;
         
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica para otras opciones con consulta específica
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                RIE.RIE_CODIGO,
                RIE.RIE_DESCRIPCION,
                RIE.RIE_CODFRE,
                FRE.FRE_NOMBRE,
                RIE.RIE_CODICR,
                ICR.ICR_NOMBRE
            FROM RHEPQ.REC_RIE_RELACION_EXTERNA RIE
            INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIE.RIE_CODFRE = FRE.FRE_CODIGO
            INNER JOIN RHEPQ.PLA_ICR_INSTITUCION ICR ON RIE.RIE_CODICR = ICR.ICR_CODIGO
            WHERE RIE.RIE_CODPUE = pRIECodPue
              AND RIE.RIE_CODTPP = pRIECodTpp
              AND RIE.RIE_CODCIA = pRIECodCia
             AND RIE.RIE_CODIGO = pRIECodigo;

    ELSIF pOpcion = 5 THEN
        -- Calcular el total de registros para la paginación
        SELECT COUNT(*) INTO vContador
        FROM RHEPQ.REC_RIE_RELACION_EXTERNA RIE
        INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIE.RIE_CODFRE = FRE.FRE_CODIGO
        INNER JOIN RHEPQ.PLA_ICR_INSTITUCION ICR ON RIE.RIE_CODICR = ICR.ICR_CODIGO
        WHERE RIE.RIE_CODPUE = pRIECodPue
          AND RIE.RIE_CODTPP = pRIECodTpp
          AND RIE.RIE_CODCIA = pRIECodCia;
    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
    
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        RIE.RIE_CODIGO,
                        RIE.RIE_DESCRIPCION,
                        RIE.RIE_CODFRE,
                        FRE.FRE_NOMBRE,
                        RIE.RIE_CODICR,
                        ICR.ICR_NOMBRE
                    FROM
                        RHEPQ.REC_RIE_RELACION_EXTERNA RIE
                        INNER JOIN RHEPQ.REC_FRE_FRECUENCIA FRE ON RIE.RIE_CODFRE = FRE.FRE_CODIGO
                        INNER JOIN RHEPQ.PLA_ICR_INSTITUCION ICR ON RIE.RIE_CODICR = ICR.ICR_CODIGO
                    WHERE 
                        RIE.RIE_CODPUE = pRIECodPue
                        AND RIE.RIE_CODTPP = pRIECodTpp
                        AND RIE.RIE_CODCIA = pRIECodCia
                    ORDER BY 
                        RIE.RIE_CODIGO ASC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_RIE_RELACION_EXTERNA;

   -----------------------------------------------------------

-- clases de puestos # Exigencias del puesto:

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_EXP_EXIGENCIA_PUESTO(
    pOpcion IN NUMBER,
    pEXPCodCia IN VARCHAR2,
    pEXPCodTpp IN VARCHAR2,
    pEXPCodPue IN NUMBER,
    pEXPCodeXC IN NUMBER DEFAULT NULL, 
    pTipoExigencia IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        
        -- INSERT lógica adaptada a la estructura de la nueva tabla
        INSERT INTO REC_EXP_EXIGENCIA_PUESTO (
            EXP_CODCIA,
            EXP_CODTPP,
            EXP_CODPUE,
            EXP_CODEXC
        ) VALUES (
            pEXPCodCia,
            pEXPCodTpp,
            pEXPCodPue,
            pEXPCodeXC
        );

	ELSIF pOpcion = 2 THEN
	    UPDATE REC_EXP_EXIGENCIA_PUESTO SET
	        EXP_CODEXC = pEXPCodeXC
	    WHERE EXP_CODCIA = pEXPCodCia
	      AND EXP_CODTPP = pEXPCodTpp
	      AND EXP_CODPUE = pEXPCodPue
	      AND EXP_CODEXC = pEXPCodeXC;

    END IF; 

    COMMIT;

    -- Lógica para otras opciones con consulta específica adaptada
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                EXP.EXP_CODEXC,
                EXC.EXC_DESCRIPCION 
            FROM RHEPQ.REC_EXP_EXIGENCIA_PUESTO EXP
            INNER JOIN RHEPQ.REC_EXC_EXIGENCIA_CARGO EXC ON EXC.EXC_CODIGO = EXP.EXP_CODEXC AND EXP.EXP_CODCIA = EXC.EXC_CODCIA
            WHERE EXP.EXP_CODPUE = pEXPCodPue AND EXP.EXP_CODTPP = pEXPCodTpp AND EXC.EXC_TIPO = pTipoExigencia
           AND EXP.EXP_CODCIA = pEXPCodCia AND EXP.EXP_CODEXC = pEXPCodeXC;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
   		FROM RHEPQ.REC_EXP_EXIGENCIA_PUESTO EXP
        INNER JOIN RHEPQ.REC_EXC_EXIGENCIA_CARGO EXC ON EXC.EXC_CODIGO = EXP.EXP_CODEXC AND EXP.EXP_CODCIA = EXC.EXC_CODCIA
            WHERE EXP.EXP_CODPUE = pEXPCodPue AND EXP.EXP_CODTPP = pEXPCodTpp AND EXC.EXC_TIPO = pTipoExigencia
           	AND EXP.EXP_CODCIA = pEXPCodCia;
    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
        
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                   SELECT
						EXP.EXP_CODEXC,
						EXC.EXC_DESCRIPCION 
					   		FROM RHEPQ.REC_EXP_EXIGENCIA_PUESTO EXP
			        INNER JOIN RHEPQ.REC_EXC_EXIGENCIA_CARGO EXC ON EXC.EXC_CODIGO = EXP.EXP_CODEXC AND EXP.EXP_CODCIA = EXC.EXC_CODCIA
                    WHERE EXP.EXP_CODPUE = pEXPCodPue AND EXP.EXP_CODTPP = pEXPCodTpp AND EXC.EXC_TIPO = pTipoExigencia
           			AND EXP.EXP_CODCIA = pEXPCodCia
                    ORDER BY EXP.EXP_CODEXC ASC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_EXP_EXIGENCIA_PUESTO;

-----------------------------------------------------------

-- clases de puestos # Decisiones del puesto:

-- se usa el mismo SP de SP_REC_EXP_EXIGENCIA_PUESTO

-----------------------------------------------------------

-- clases de puestos # Manejo equipo: 

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_EQU_EQUIPO(
    pOpcion IN NUMBER,
    pEQUCodeMEQ IN NUMBER,
    pEQUCodCia IN VARCHAR2,
    pEQUCodTpp IN VARCHAR2,
    pEQUCodPue IN NUMBER,
    pEQUDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_EQU_EQUIPO (
            EQU_CODCIA,
            EQU_CODTPP,
            EQU_CODPUE,
            EQU_CODMEQ,
            EQU_DESCRIPCION
        ) VALUES (
            pEQUCodCia,
            pEQUCodTpp,
            pEQUCodPue,
            pEQUCodeMEQ,
            pEQUDescripcion
        );

    ELSIF pOpcion = 2 THEN
        UPDATE REC_EQU_EQUIPO SET
            EQU_DESCRIPCION = pEQUDescripcion
        WHERE EQU_CODCIA = pEQUCodCia
          AND EQU_CODTPP = pEQUCodTpp
          AND EQU_CODPUE = pEQUCodPue
          AND EQU_CODMEQ = pEQUCodeMEQ;
         
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica para consulta específica
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                EQU.EQU_CODMEQ,
                MEQ.MEQ_DESCRIPCION,
                EQU.EQU_DESCRIPCION
            FROM RHEPQ.REC_EQU_EQUIPO EQU
            INNER JOIN RHEPQ.PLA_MEQ_MANEJO_EQUIPO MEQ ON EQU.EQU_CODMEQ = MEQ.MEQ_CODIGO AND EQU.EQU_CODCIA = MEQ.MEQ_CODCIA 
            WHERE EQU.EQU_CODPUE = pEQUCodPue AND EQU.EQU_CODTPP = pEQUCodTpp 
           AND EQU.EQU_CODCIA = pEQUCodCia AND EQU.EQU_CODMEQ = pEQUCodeMEQ;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM RHEPQ.REC_EQU_EQUIPO EQU
        INNER JOIN RHEPQ.PLA_MEQ_MANEJO_EQUIPO MEQ ON EQU.EQU_CODMEQ = MEQ.MEQ_CODIGO AND EQU.EQU_CODCIA = MEQ.MEQ_CODCIA 
        WHERE EQU.EQU_CODPUE = pEQUCodPue AND EQU.EQU_CODTPP = pEQUCodTpp 
          AND EQU.EQU_CODCIA = pEQUCodCia;
    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
    
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        EQU.EQU_CODMEQ,
                        MEQ.MEQ_DESCRIPCION,
                        EQU.EQU_DESCRIPCION
                    FROM
                        RHEPQ.REC_EQU_EQUIPO EQU
                        INNER JOIN RHEPQ.PLA_MEQ_MANEJO_EQUIPO MEQ ON EQU.EQU_CODMEQ = MEQ.MEQ_CODIGO AND EQU.EQU_CODCIA = MEQ.MEQ_CODCIA
                    WHERE 
                        EQU.EQU_CODPUE = pEQUCodPue
                        AND EQU.EQU_CODTPP = pEQUCodTpp
                        AND EQU.EQU_CODCIA = pEQUCodCia
                    ORDER BY 
                        EQU.EQU_CODMEQ ASC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_EQU_EQUIPO;

-----------------------------------------------------------

-- clases de puestos # Datos confidenciales: 

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_RDA_RESPONSABILIDAD_DAT(
    pOpcion IN NUMBER,
    pRDACodigo IN OUT NUMBER,
    pRDACodCia IN VARCHAR2,
    pRDACodTpp IN VARCHAR2,
    pRDACodPue IN NUMBER,
    pRDADescripcion IN VARCHAR2 DEFAULT NULL,
    pRDAAcceso IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        -- Lógica para generar RDA_CODIGO autoincremental
        SELECT NVL(MAX(RDA_CODIGO), 0) + 1 INTO pRDACodigo
        FROM REC_RDA_RESPONSABILIDAD_DATOS
        WHERE RDA_CODCIA = pRDACodCia
          AND RDA_CODTPP = pRDACodTpp
          AND RDA_CODPUE = pRDACodPue;
        
        INSERT INTO REC_RDA_RESPONSABILIDAD_DATOS (
            RDA_CODCIA,
            RDA_CODTPP,
            RDA_CODPUE,
            RDA_CODIGO,
            RDA_DESCRIPCION,
            RDA_ACCESO
        ) VALUES (
            pRDACodCia,
            pRDACodTpp,
            pRDACodPue,
            pRDACodigo,
            pRDADescripcion,
            pRDAAcceso
        )
       	RETURNING RDA_CODIGO INTO pRDACodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RDA_RESPONSABILIDAD_DATOS SET
            RDA_DESCRIPCION = pRDADescripcion,
            RDA_ACCESO = pRDAAcceso
        WHERE RDA_CODCIA = pRDACodCia
          AND RDA_CODTPP = pRDACodTpp
          AND RDA_CODPUE = pRDACodPue
          AND RDA_CODIGO = pRDACodigo;
         
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica para consulta específica
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                RDA.RDA_CODIGO,
                RDA.RDA_DESCRIPCION,
                RDA.RDA_ACCESO
            FROM RHEPQ.REC_RDA_RESPONSABILIDAD_DATOS RDA
            WHERE RDA.RDA_CODPUE = pRDACodPue AND RDA.RDA_CODTPP = pRDACodTpp 
           AND RDA.RDA_CODCIA = pRDACodCia AND RDA.RDA_CODIGO = pRDACodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM RHEPQ.REC_RDA_RESPONSABILIDAD_DATOS RDA
        WHERE RDA.RDA_CODPUE = pRDACodPue AND RDA.RDA_CODTPP = pRDACodTpp 
          AND RDA.RDA_CODCIA = pRDACodCia;
    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
    
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        RDA.RDA_CODIGO,
                        RDA.RDA_DESCRIPCION,
                        RDA.RDA_ACCESO
                    FROM
                        RHEPQ.REC_RDA_RESPONSABILIDAD_DATOS RDA
                    WHERE 
                        RDA.RDA_CODPUE = pRDACodPue
                        AND RDA.RDA_CODTPP = pRDACodTpp
                        AND RDA.RDA_CODCIA = pRDACodCia
                    ORDER BY 
                        RDA.RDA_CODIGO ASC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_RDA_RESPONSABILIDAD_DAT;

-----------------------------------------------------------

-- clases de puestos # Requisitos del puesto: 

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_RPU_REQUISITO_PUESTO(
    pOpcion IN NUMBER,
    pRPUCodCia IN VARCHAR2,
    pRPUCodTpp IN VARCHAR2,
    pRPUCodPue IN NUMBER,
    pRPUCodeTRQ IN VARCHAR2,
    pRPUCodeReq IN VARCHAR2,
    pRPUTareaRepresentativa IN VARCHAR2 DEFAULT NULL,
    pRPUMetrico IN NUMBER DEFAULT NULL,
    pRPUOperador IN VARCHAR2 DEFAULT NULL,
    pRPUFiltro IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_RPU_REQUISITO_PUESTO (
            RPU_CODCIA,
            RPU_CODTPP,
            RPU_CODPUE,
            RPU_CODTRQ,
            RPU_CODREQ,
            RPU_TAREA_REPRESENTATIVA,
            RPU_METRICO,
            RPU_OPERADOR,
            RPU_FILTRO
        ) VALUES (
            pRPUCodCia,
            pRPUCodTpp,
            pRPUCodPue,
            pRPUCodeTRQ,
            pRPUCodeReq,
            pRPUTareaRepresentativa,
            pRPUMetrico,
            pRPUOperador,
            pRPUFiltro
        );

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RPU_REQUISITO_PUESTO SET
            RPU_TAREA_REPRESENTATIVA = pRPUTareaRepresentativa,
            RPU_METRICO = pRPUMetrico,
            RPU_OPERADOR = pRPUOperador,
            RPU_FILTRO = pRPUFiltro
        WHERE RPU_CODCIA = pRPUCodCia
          AND RPU_CODTPP = pRPUCodTpp
          AND RPU_CODPUE = pRPUCodPue
          AND RPU_CODTRQ = pRPUCodeTRQ
          AND RPU_CODREQ = pRPUCodeReq;
         
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                RPU.RPU_CODTRQ,
                TRQ.TRQ_NOMBRE,
                RPU.RPU_CODREQ,
                REQ.REQ_NOMBRE,
                RPU.RPU_TAREA_REPRESENTATIVA,
                RPU.RPU_OPERADOR,
                RPU.RPU_METRICO,
                RPU.RPU_FILTRO
            FROM RHEPQ.REC_RPU_REQUISITO_PUESTO RPU
            INNER JOIN RHEPQ.REC_REQ_REQUISITO REQ ON REQ.REQ_CODCIA = RPU.RPU_CODCIA
                AND REQ.REQ_CODTRQ = RPU.RPU_CODTRQ
                AND REQ.REQ_CODIGO = RPU.RPU_CODREQ
            INNER JOIN RHEPQ.REC_TRQ_TIPO_REQUISITO TRQ ON TRQ.TRQ_CODCIA = RPU.RPU_CODCIA
                AND TRQ.TRQ_CODIGO = RPU.RPU_CODTRQ
            WHERE RPU.RPU_CODPUE = pRPUCodPue AND RPU.RPU_CODTPP = pRPUCodTpp 
           AND RPU.RPU_CODCIA = pRPUCodCia AND RPU.RPU_CODTRQ = pRPUCodeTRQ AND RPU.RPU_CODREQ = pRPUCodeReq;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM RHEPQ.REC_RPU_REQUISITO_PUESTO RPU
        INNER JOIN RHEPQ.REC_REQ_REQUISITO REQ ON REQ.REQ_CODCIA = RPU.RPU_CODCIA
            AND REQ.REQ_CODTRQ = RPU.RPU_CODTRQ
            AND REQ.REQ_CODIGO = RPU.RPU_CODREQ
        INNER JOIN RHEPQ.REC_TRQ_TIPO_REQUISITO TRQ ON TRQ.TRQ_CODCIA = RPU.RPU_CODCIA
            AND TRQ.TRQ_CODIGO = RPU.RPU_CODTRQ
        WHERE RPU.RPU_CODPUE = pRPUCodPue AND RPU.RPU_CODTPP = pRPUCodTpp 
          AND RPU.RPU_CODCIA = pRPUCodCia;
    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
    
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        RPU.RPU_CODTRQ,
                        TRQ.TRQ_NOMBRE,
                        RPU.RPU_CODREQ,
                        REQ.REQ_NOMBRE,
                        RPU.RPU_TAREA_REPRESENTATIVA,
                        RPU.RPU_OPERADOR,
                        RPU.RPU_METRICO,
                        RPU.RPU_FILTRO
                    FROM
                        RHEPQ.REC_RPU_REQUISITO_PUESTO RPU
                        INNER JOIN RHEPQ.REC_REQ_REQUISITO REQ ON REQ.REQ_CODCIA = RPU.RPU_CODCIA
                            AND REQ.REQ_CODTRQ = RPU.RPU_CODTRQ
                            AND REQ.REQ_CODIGO = RPU.RPU_CODREQ
                        INNER JOIN RHEPQ.REC_TRQ_TIPO_REQUISITO TRQ ON TRQ.TRQ_CODCIA = RPU.RPU_CODCIA
                            AND TRQ.TRQ_CODIGO = RPU.RPU_CODTRQ
                    WHERE 
                        RPU.RPU_CODPUE = pRPUCodPue
                        AND RPU.RPU_CODTPP = pRPUCodTpp
                        AND RPU.RPU_CODCIA = pRPUCodCia
                    ORDER BY 
                        RPU.RPU_CODTRQ, RPU.RPU_CODREQ ASC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
        
   END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_RPU_REQUISITO_PUESTO;

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_RPS_REQ_PUESTO_SUST(
    pOpcion IN NUMBER,
    pRPSCodCia IN VARCHAR2,
    pRPSCodTpp IN VARCHAR2,
    pRPSCodPue IN NUMBER,
    pRPSCodTrq IN VARCHAR2,
    pRPSCodReq IN VARCHAR2,
    pRPSCodTrqS IN VARCHAR2,
    pRPSCodReqS IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_RPS_REQ_PUESTO_SUST (
            RPS_CODCIA,
            RPS_CODTPP,
            RPS_CODPUE,
            RPS_CODTRQ,
            RPS_CODREQ,
            RPS_CODTRQ_S,
            RPS_CODREQ_S
        ) VALUES (
            pRPSCodCia,
            pRPSCodTpp,
            pRPSCodPue,
            pRPSCodTrq,
            pRPSCodReq,
            pRPSCodTrqS,
            pRPSCodReqS
        );

    ELSIF pOpcion = 2 THEN
        UPDATE REC_RPS_REQ_PUESTO_SUST SET
            RPS_CODTRQ_S = pRPSCodTrqS,
            RPS_CODREQ_S = pRPSCodReqS
        WHERE RPS_CODCIA = pRPSCodCia
          AND RPS_CODTPP = pRPSCodTpp
          AND RPS_CODPUE = pRPSCodPue
          AND RPS_CODTRQ = pRPSCodTrq
          AND RPS_CODREQ = pRPSCodReq;

   	END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        -- Consulta específica basada en la llave primaria
        OPEN pCursor FOR
            SELECT
                RPS.RPS_CODTRQ,
                RPS.RPS_CODREQ,
                RPS.RPS_CODTRQ_S,
                TRQ.TRQ_NOMBRE AS NOMBRE_TIPO_REQUISITO,
                RPS.RPS_CODREQ_S,
                REQ.REQ_NOMBRE AS NOMBRE_REQUISITO
            FROM REC_RPS_REQ_PUESTO_SUST RPS
            JOIN REC_TRQ_TIPO_REQUISITO TRQ ON RPS.RPS_CODTRQ_S = TRQ.TRQ_CODIGO AND RPS.RPS_CODCIA = TRQ.TRQ_CODCIA
            JOIN REC_REQ_REQUISITO REQ ON RPS.RPS_CODREQ_S = REQ.REQ_CODIGO AND RPS.RPS_CODCIA = REQ.REQ_CODCIA AND RPS.RPS_CODTRQ_S = REQ.REQ_CODTRQ
            WHERE RPS.RPS_CODPUE = pRPSCodPue AND RPS.RPS_CODTPP = pRPSCodTpp AND RPS.RPS_CODCIA = pRPSCodCia 
              AND RPS.RPS_CODTRQ = pRPSCodTrq AND RPS.RPS_CODREQ = pRPSCodReq
             AND RPS_CODTRQ_S = pRPSCodTrqS AND RPS_CODREQ_S = pRPSCodReqS;

	ELSIF pOpcion = 5 THEN
	    -- Calcular el total de registros para la paginación basado en los filtros proporcionados
	    SELECT COUNT(*) INTO vContador
	    FROM REC_RPS_REQ_PUESTO_SUST RPS
	    JOIN REC_TRQ_TIPO_REQUISITO TRQ ON RPS.RPS_CODTRQ_S = TRQ.TRQ_CODIGO AND RPS.RPS_CODCIA = TRQ.TRQ_CODCIA
	    JOIN REC_REQ_REQUISITO REQ ON RPS.RPS_CODREQ_S = REQ.REQ_CODIGO AND RPS.RPS_CODCIA = REQ.REQ_CODCIA AND RPS.RPS_CODTRQ_S = REQ.REQ_CODTRQ
	    WHERE RPS.RPS_CODPUE = pRPSCodPue 
	      AND RPS.RPS_CODTPP = pRPSCodTpp 
	      AND RPS.RPS_CODCIA = pRPSCodCia
	      AND RPS.RPS_CODTRQ = pRPSCodTrq AND RPS.RPS_CODREQ = pRPSCodReq;
	    
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados paginados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    RPS.RPS_CODTRQ,
	                    RPS.RPS_CODREQ,
	                    RPS.RPS_CODTRQ_S,
	                    TRQ.TRQ_NOMBRE AS NOMBRE_TIPO_REQUISITO,
	                    RPS.RPS_CODREQ_S,
	                    REQ.REQ_NOMBRE AS NOMBRE_REQUISITO
	                FROM REC_RPS_REQ_PUESTO_SUST RPS
	                JOIN REC_TRQ_TIPO_REQUISITO TRQ ON RPS.RPS_CODTRQ_S = TRQ.TRQ_CODIGO AND RPS.RPS_CODCIA = TRQ.TRQ_CODCIA
	                JOIN REC_REQ_REQUISITO REQ ON RPS.RPS_CODREQ_S = REQ.REQ_CODIGO AND RPS.RPS_CODCIA = REQ.REQ_CODCIA AND RPS.RPS_CODTRQ_S = REQ.REQ_CODTRQ
	                WHERE RPS.RPS_CODPUE = pRPSCodPue 
	                  AND RPS.RPS_CODTPP = pRPSCodTpp 
	                  AND RPS.RPS_CODCIA = pRPSCodCia
	                  AND RPS.RPS_CODTRQ = pRPSCodTrq
	                  AND RPS.RPS_CODREQ = pRPSCodReq
	                ORDER BY RPS.RPS_CODTRQ, RPS.RPS_CODREQ
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_RPS_REQ_PUESTO_SUST;

-----------------------------------------------------------

   -- catalogo de plazas

   CREATE OR REPLACE FUNCTION RHEPQ.obtener_codigo_empleado_plaza(plaza_codigo NUMBER) RETURN NUMBER
IS
    v_emp_codigo NUMBER;
BEGIN
    SELECT DPL.DPL_CODEMP INTO v_emp_codigo
    FROM RHEPQ.PLA_PLZ_PLAZA PLZ
    JOIN RHEPQ.PLA_DPL_DATOSPLANILLA DPL ON PLZ.PLZ_CODIGO = DPL.DPL_CODPLZ AND PLZ.PLZ_CODCIA = DPL.DPL_CODCIA
    WHERE PLZ.PLZ_CODIGO = plaza_codigo AND PLZ.PLZ_ESTADO = 'O'
    AND ROWNUM = 1; -- Asegura obtener solo una fila

    RETURN v_emp_codigo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_codigo_empleado_plaza;

CREATE OR REPLACE FUNCTION RHEPQ.obtener_nombre_empleado_plaza(plaza_codigo NUMBER) RETURN VARCHAR2
IS
    v_emp_nombre VARCHAR2(100);
BEGIN
    SELECT EMP.EMP_NOMBRE_CIP INTO v_emp_nombre
    FROM RHEPQ.PLA_PLZ_PLAZA PLZ
    JOIN RHEPQ.PLA_DPL_DATOSPLANILLA DPL ON PLZ.PLZ_CODIGO = DPL.DPL_CODPLZ AND PLZ.PLZ_CODCIA = DPL.DPL_CODCIA
    JOIN RHEPQ.PLA_EMP_EMPLEADO EMP ON DPL.DPL_CODEMP = EMP.EMP_CODIGO AND DPL.DPL_CODCIA = EMP.EMP_CODCIA
    WHERE PLZ.PLZ_CODIGO = plaza_codigo AND PLZ.PLZ_ESTADO = 'O'
    AND EMP.EMP_ESTADO = 'A' AND ROWNUM = 1; -- Asegura obtener solo una fila

    RETURN v_emp_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_nombre_empleado_plaza;

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_PLZ_PLAZA(
    pOpcion IN NUMBER,
    pPlzCodcia IN VARCHAR2,
    pPlzCodigo IN OUT NUMBER,
    pCodEmpleado IN NUMBER,
    pPlzNombre IN VARCHAR2,
    pPlzNombreIng IN VARCHAR2,
    pPlzCodtpp IN VARCHAR2,
    pPlzCodpue IN NUMBER,
    pPlzCoduni IN NUMBER,
    pPlzEstado IN VARCHAR2,
    pPlzFechaSupre IN DATE,
    pPlzCodtmo IN VARCHAR2,
    pPlzCodubi IN VARCHAR2,
    pPlzCodafn IN VARCHAR2,
    pPlzValorHora IN NUMBER,
    pPlzAlmuerzo IN VARCHAR2,
    pPlzCodclm IN NUMBER,
    pPlzCodscl IN NUMBER,
    pPlzCodclo IN NUMBER,
    pPlzCodsco IN NUMBER,
    pPlzCenCosto IN NUMBER,
    pPlzCodiGrupSect IN NUMBER,
    pPlzCodiSubgSect IN NUMBER,
    pPlzCodiSect IN NUMBER,
    pPlzZona IN VARCHAR2,
    pPlzRuta IN VARCHAR2,
    pPlzCateg IN VARCHAR2,
    pPlzFechaPpto IN DATE,
    pPlzPartidaPresupuestaria IN VARCHAR2,
    pPlzPprN1 IN NUMBER,
    pPlzPprN2 IN NUMBER,
    pPlzPprN3 IN NUMBER,
    pPlzPprN4 IN NUMBER,
    pPlzPprN5 IN NUMBER,
    pPlzPprN6 IN NUMBER,
    pPlzPprN7 IN NUMBER,
    pPlzPprN8 IN NUMBER,
    pPlzCodgre IN NUMBER,
    pPlzCodesp IN NUMBER,
    pPlzDispresp IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
    vDummy VARCHAR2(3);
    vValor NUMBER(9,2);
    vMensaje VARCHAR2(100);
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 1 THEN
    
    	BEGIN
	    	SELECT NVL(MAX(PLZ_CODIGO),0) + 1
	          INTO pPlzCodigo
	          FROM RHEPQ.PLA_PLZ_PLAZA
	         WHERE PLZ_CODCIA = pPlzCodcia
	           AND PLZ_CODIGO < 99999;
	    END;
	   
        INSERT INTO RHEPQ.PLA_PLZ_PLAZA (
            PLZ_CODCIA,
            PLZ_CODIGO,
            PLZ_NOMBRE,
            PLZ_NOMBRE_ING,
            PLZ_CODTPP,
            PLZ_CODPUE,
            PLZ_CODUNI,
            PLZ_ESTADO,
            PLZ_FECHA_SUPRE,
            PLZ_CODTMO,
            PLZ_CODUBI,
            PLZ_CODAFN,
            PLZ_VALOR_HORA,
            PLZ_ALMUERZO,
            PLZ_CODCLM,
            PLZ_CODSCL,
            PLZ_CODCLO,
            PLZ_CODSCO,
            PLZ_CEN_COSTO,
            PLZ_CODI_GRUP_SECT,
            PLZ_CODI_SUBG_SECT,
            PLZ_CODI_SECT,
            PLZ_ZONA,
            PLZ_RUTA,
            PLZ_CATEG,
            PLZ_FECHA_PPTO,
            PLZ_PARTIDA_PRESUPUESTARIA,
            PLZ_PPR_N1,
            PLZ_PPR_N2,
            PLZ_PPR_N3,
            PLZ_PPR_N4,
            PLZ_PPR_N5,
            PLZ_PPR_N6,
            PLZ_PPR_N7,
            PLZ_PPR_N8,
            PLZ_CODGRE,
            PLZ_CODESP,
            PLZ_DISPRESP
        ) VALUES (
            pPlzCodcia,
            pPlzCodigo,
            pPlzNombre,
            pPlzNombreIng,
            pPlzCodtpp,
            pPlzCodpue,
            pPlzCoduni,
            pPlzEstado,
            pPlzFechaSupre,
            pPlzCodtmo,
            pPlzCodubi,
            pPlzCodafn,
            pPlzValorHora,
            pPlzAlmuerzo,
            pPlzCodclm,
            pPlzCodscl,
            pPlzCodclo,
            pPlzCodsco,
            pPlzCenCosto,
            pPlzCodiGrupSect,
            pPlzCodiSubgSect,
            pPlzCodiSect,
            pPlzZona,
            pPlzRuta,
            pPlzCateg,
            pPlzFechaPpto,
            pPlzPartidaPresupuestaria,
            pPlzPprN1,
            pPlzPprN2,
            pPlzPprN3,
            pPlzPprN4,
            pPlzPprN5,
            pPlzPprN6,
            pPlzPprN7,
            pPlzPprN8,
            pPlzCodgre,
            pPlzCodesp,
            pPlzDispresp
        )
        RETURNING PLZ_CODIGO INTO pPlzCodigo;

    ELSIF pOpcion = 2 THEN
		UPDATE RHEPQ.PLA_PLZ_PLAZA SET
		    PLZ_NOMBRE = pPlzNombre,
		    PLZ_NOMBRE_ING = pPlzNombreIng,
		    PLZ_CODTPP = pPlzCodtpp,
		    PLZ_CODPUE = pPlzCodpue,
		    PLZ_CODUNI = pPlzCoduni,
		    PLZ_ESTADO = pPlzEstado,
		    PLZ_FECHA_SUPRE = pPlzFechaSupre,
		    PLZ_CODTMO = pPlzCodtmo,
		    PLZ_CODUBI = pPlzCodubi,
		    PLZ_CODAFN = pPlzCodafn,
		    PLZ_VALOR_HORA = pPlzValorHora,
		    PLZ_ALMUERZO = pPlzAlmuerzo,
		    PLZ_CODCLM = pPlzCodclm,
		    PLZ_CODSCL = pPlzCodscl,
		    PLZ_CODCLO = pPlzCodclo,
		    PLZ_CODSCO = pPlzCodsco,
		    PLZ_CEN_COSTO = pPlzCenCosto,
		    PLZ_CODI_GRUP_SECT = pPlzCodiGrupSect,
		    PLZ_CODI_SUBG_SECT = pPlzCodiSubgSect,
		    PLZ_CODI_SECT = pPlzCodiSect,
		    PLZ_ZONA = pPlzZona,
		    PLZ_RUTA = pPlzRuta,
		    PLZ_CATEG = pPlzCateg,
		    PLZ_FECHA_PPTO = pPlzFechaPpto,
		    PLZ_PARTIDA_PRESUPUESTARIA = pPlzPartidaPresupuestaria,
		    PLZ_PPR_N1 = pPlzPprN1,
		    PLZ_PPR_N2 = pPlzPprN2,
		    PLZ_PPR_N3 = pPlzPprN3,
		    PLZ_PPR_N4 = pPlzPprN4,
		    PLZ_PPR_N5 = pPlzPprN5,
		    PLZ_PPR_N6 = pPlzPprN6,
		    PLZ_PPR_N7 = pPlzPprN7,
		    PLZ_PPR_N8 = pPlzPprN8,
		    PLZ_CODGRE = pPlzCodgre,
		    PLZ_CODESP = pPlzCodesp,
		    PLZ_DISPRESP = pPlzDispresp
		WHERE PLZ_CODCIA = pPlzCodcia AND PLZ_CODIGO = pPlzCodigo;

       
    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
				PLZ.PLZ_CODIGO,
				PLZ.PLZ_NOMBRE,
				PLZ.PLZ_CODTPP,
				TPP.TPP_DESCRIPCION,
				PLZ.PLZ_CODPUE,
				PUE.PUE_NOMBRE,
				PLZ.PLZ_CODUNI,
				UNI.UNI_COD_ORGANIZ,
				UNI.UNI_NOMBRE,
				PLZ.PLZ_ESTADO,
				PLZ.PLZ_DISPRESP,
				PLZ.PLZ_PPR_N8,
				PLZ.PLZ_CODTMO,
				TMO.TMO_DESCRIPCION,
				PLZ.PLZ_CODUBI,
				PLZ.PLZ_CODTPP,
				PLZ.PLZ_CODAFN,
				GRT.GRT_DESCRIPCION,
				PLZ.PLZ_VALOR_HORA,
				PLZ.PLZ_CEN_COSTO,
				CEN.CCO_DESCRIPCION,
				PLZ.PLZ_CODGRE,
				GRE.GRE_DESCRIPCION,
				PLZ.PLZ_CODESP,
				ESP.ESP_DESCRIPCION,
				PLZ.PLZ_ALMUERZO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
				PLZ.PLZ_PPR_N1,
				PLZ.PLZ_PPR_N2,
				PLZ.PLZ_PPR_N3,
				PLZ.PLZ_PPR_N4,
				PLZ.PLZ_PPR_N5,
				PLZ.PLZ_PPR_N6,
				PLZ.PLZ_PPR_N7,
				'0509' AS PPR_N0509,
				UNI.UNI_CODIGO_2003,
				RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
				RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
			FROM RHEPQ.PLA_PLZ_PLAZA PLZ
			LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
						AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
			LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
						AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
			LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
			LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
						AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
            WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ.PLZ_CODIGO = pPlzCodigo;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.PLA_PLZ_PLAZA PLZ
	    LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
	            AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
	    LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
	            AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
	    LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
	            AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
	    WHERE PLZ.PLZ_CODCIA = pPlzCodcia;
	
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

            OPEN pCursor FOR
		        SELECT * FROM (
		            SELECT a.*, ROWNUM rnum
		            FROM (
		                SELECT
		                    PLZ.PLZ_CODIGO,
		                    PLZ.PLZ_NOMBRE,
		                    PLZ.PLZ_CODTPP,
		                    TPP.TPP_DESCRIPCION,
		                    PLZ.PLZ_CODPUE,
		                    PUE.PUE_NOMBRE,
		                    PLZ.PLZ_CODUNI,
		                    UNI.UNI_COD_ORGANIZ,
		                    UNI.UNI_NOMBRE,
		                    PLZ.PLZ_ESTADO,
		                    PLZ.PLZ_DISPRESP,
		                    PLZ.PLZ_PPR_N8,
		                    PLZ.PLZ_CODTMO,
		                    TMO.TMO_DESCRIPCION,
		                    PLZ.PLZ_CODUBI,
		                    PLZ.PLZ_CODTPP AS PLZ_CODTPP2,
		                    PLZ.PLZ_CODAFN,
		                    GRT.GRT_DESCRIPCION,
		                    PLZ.PLZ_VALOR_HORA,
		                    PLZ.PLZ_CEN_COSTO,
		                    CEN.CCO_DESCRIPCION,
		                    PLZ.PLZ_CODGRE,
		                    GRE.GRE_DESCRIPCION,
		                    PLZ.PLZ_CODESP,
		                    ESP.ESP_DESCRIPCION,
		                    PLZ.PLZ_ALMUERZO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
		                    PLZ.PLZ_PPR_N1,
		                    PLZ.PLZ_PPR_N2,
		                    PLZ.PLZ_PPR_N3,
		                    PLZ.PLZ_PPR_N4,
		                    PLZ.PLZ_PPR_N5,
		                    PLZ.PLZ_PPR_N6,
		                    PLZ.PLZ_PPR_N7,
		                    '0509' AS PPR_N0509,
		                    UNI.UNI_CODIGO_2003,
		                    RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
		                    RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
		                FROM RHEPQ.PLA_PLZ_PLAZA PLZ
		                LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
		                    AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
		                LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
		                    AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
		                LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
		                LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
		                    AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
		                WHERE PLZ.PLZ_CODCIA = pPlzCodcia
		                ORDER BY PLZ.PLZ_CODIGO
		            ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;

	-- Listado de plazas disponibles
	ELSIF pOpcion = 6 THEN
	 OPEN pCursor FOR    
		SELECT 
			P.PLZ_CODIGO AS value, 
			P.PLZ_NOMBRE || ' - ' || U.UNI_NOMBRE AS label
			FROM pla_plz_plaza P
			INNER JOIN pla_uni_unidad U ON P.PLZ_CODUNI = U.UNI_CODIGO
			WHERE p.PLZ_CODCIA = '001' AND P.PLZ_ESTADO = 'V'
			order by P.PLZ_NOMBRE;
	
	-- Listado de plazas
	ELSIF pOpcion = 7 THEN
	 OPEN pCursor FOR    
		SELECT 
			P.PLZ_CODIGO AS value, 
			P.PLZ_NOMBRE AS label
			FROM pla_plz_plaza P
			WHERE p.PLZ_CODCIA = pPlzCodcia;

END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_PLZ_PLAZA;

-----------------------------------------------------------

   -- personal supervisado por plaza

    --  se usa SP_REC_PSV_PUESTO_SUPERVISA en la opcion 7

   -----------------------------------------------------------

   -- Grupos y especialidades

    -- # grupo:

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_GRE_GRUPO_ESPECIALIDAD(
    pOpcion IN NUMBER,
    pGreCodigo IN OUT NUMBER,
    pGreCodCia IN VARCHAR2,    
    pGreDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN

        SELECT NVL(MAX(GRE_CODIGO), 0) + 5 INTO pGreCodigo
        FROM PLA_GRE_GRUPO_ESPECIALIDAD
        WHERE GRE_CODCIA = pGreCodCia;

        INSERT INTO PLA_GRE_GRUPO_ESPECIALIDAD (
            GRE_CODCIA,
            GRE_CODIGO,
            GRE_DESCRIPCION
        ) VALUES (
            pGreCodCia,
            pGreCodigo,
            pGreDescripcion
        )
       RETURNING GRE_CODIGO INTO pGreCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_GRE_GRUPO_ESPECIALIDAD SET
            GRE_DESCRIPCION = pGreDescripcion
        WHERE GRE_CODCIA = pGreCodCia AND GRE_CODIGO = pGreCodigo;
       
   COMMIT;
       
    END IF;


    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                GRE_CODCIA,
                GRE_CODIGO,
                GRE_DESCRIPCION
            FROM PLA_GRE_GRUPO_ESPECIALIDAD
            WHERE GRE_CODCIA = pGreCodCia AND GRE_CODIGO = pGreCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_GRE_GRUPO_ESPECIALIDAD
        WHERE 
        (
            pGreDescripcion IS NULL
            OR pGreDescripcion = ''
            OR LOWER(GRE_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGreDescripcion)) || '%'
        )
        AND GRE_CODCIA = pGreCodCia;
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        GRE_CODCIA,
                        GRE_CODIGO,
                        GRE_DESCRIPCION
                    FROM PLA_GRE_GRUPO_ESPECIALIDAD
                    WHERE
                    (
                        pGreDescripcion IS NULL
                        OR pGreDescripcion = ''
                        OR LOWER(GRE_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGreDescripcion)) || '%'
                    )
                    AND GRE_CODCIA = pGreCodCia
                    ORDER BY GRE_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
           

   ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT GRE_CODIGO AS value, GRE_DESCRIPCION AS label
            FROM RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD
            WHERE GRE_CODCIA = pGreCodCia;


    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_GRE_GRUPO_ESPECIALIDAD;

-- # especialidad:

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ESP_ESPECIALIDAD(
    pOpcion IN NUMBER,
    pEspCodigo IN OUT NUMBER,
    pEspCodCia IN VARCHAR2,
    pEspCodGRE IN NUMBER,
    pEspDescripcion IN VARCHAR2 DEFAULT NULL,
    pEspCodUni IN NUMBER DEFAULT NULL,
    pEspDefinicion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        -- Generar un nuevo código autoincremental para ESP_CODIGO
        SELECT NVL(MAX(ESP_CODIGO), 0) + 1 INTO pEspCodigo
        FROM PLA_ESP_ESPECIALIDAD
        WHERE ESP_CODCIA = pEspCodCia AND ESP_CODGRE = pEspCodGRE;

        -- Insertar un nuevo registro en PLA_ESP_ESPECIALIDAD
        INSERT INTO PLA_ESP_ESPECIALIDAD (
            ESP_CODCIA,
            ESP_CODGRE,
            ESP_CODIGO,
            ESP_DESCRIPCION,
            ESP_CODUNI,
            ESP_DEFINICION
        ) VALUES (
            pEspCodCia,
            pEspCodGRE,
            pEspCodigo,
            pEspDescripcion,
            pEspCodUni,
            pEspDefinicion
        )
       RETURNING ESP_CODIGO INTO pEspCodigo;

    ELSIF pOpcion = 2 THEN
        -- Actualizar un registro existente en PLA_ESP_ESPECIALIDAD
        UPDATE PLA_ESP_ESPECIALIDAD SET
            ESP_DESCRIPCION = pEspDescripcion,
            ESP_CODUNI = pEspCodUni,
            ESP_DEFINICION = pEspDefinicion
        WHERE ESP_CODCIA = pEspCodCia AND ESP_CODGRE = pEspCodGRE AND ESP_CODIGO = pEspCodigo;
       
	END IF;	

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        -- Consulta específica para recuperar los detalles de un registro
        OPEN pCursor FOR
			SELECT
			    ESP.ESP_CODCIA,
			    ESP.ESP_CODGRE,
			    GRE.GRE_DESCRIPCION,
			    ESP.ESP_CODIGO,
			    ESP.ESP_DESCRIPCION,
			    ESP.ESP_CODUNI,
			    ESP.ESP_DEFINICION
			FROM PLA_ESP_ESPECIALIDAD ESP
			INNER JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE AND GRE.GRE_CODCIA = ESP.ESP_CODCIA 
            WHERE ESP_CODCIA = pEspCodCia AND ESP_CODGRE = pEspCodGRE AND ESP_CODIGO = pEspCodigo;

    ELSIF pOpcion = 5 THEN
        -- Calcular el total de registros para la paginación
        SELECT COUNT(*) INTO vContador
        FROM PLA_ESP_ESPECIALIDAD
        WHERE ESP_CODCIA = pEspCodCia AND  ESP_CODGRE = pEspCodGRE AND
              (pEspDescripcion IS NULL OR ESP_DESCRIPCION LIKE '%' || TRIM(pEspDescripcion) || '%');

		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
        
        -- Abrir el cursor para obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
					    ESP.ESP_CODCIA,
					    ESP.ESP_CODGRE,
					    GRE.GRE_DESCRIPCION,
					    ESP.ESP_CODIGO,
					    ESP.ESP_DESCRIPCION,
					    ESP.ESP_CODUNI,
					    ESP.ESP_DEFINICION
					FROM PLA_ESP_ESPECIALIDAD ESP
					INNER JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE AND GRE.GRE_CODCIA = ESP.ESP_CODCIA
                    WHERE ESP_CODCIA = pEspCodCia AND ESP_CODGRE = pEspCodGRE AND
                          (pEspDescripcion IS NULL OR LOWER(ESP_DESCRIPCION)  LIKE '%' || LOWER(TRIM(pEspDescripcion))  || '%')
                    ORDER BY ESP_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        -- Consulta para devolver todos los registros como valores y etiquetas
        OPEN pCursor FOR
            SELECT ESP_CODIGO AS value, ESP_DESCRIPCION AS label
            FROM PLA_ESP_ESPECIALIDAD
            WHERE ESP_CODCIA = pEspCodCia AND ESP_CODGRE = pEspCodGRE;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ESP_ESPECIALIDAD;

   -----------------------------------------------------------

   -- actualizar partidas presupuestarias

   CREATE OR REPLACE PROCEDURE RHEPQ.Actualizar_Anio_Presupuestario (
    pAnioAntiguo IN NUMBER,
    pAnioNuevo IN NUMBER,
    pMensaje OUT VARCHAR2,
    pCursor OUT SYS_REFCURSOR
) AS
BEGIN
    -- Verificar que los parámetros no son nulos
    IF pAnioAntiguo IS NULL OR pAnioNuevo IS NULL THEN
        pMensaje := 'No puede dejar los campos nulos, Verifique!!!!';
        RETURN;
    ELSIF pAnioAntiguo > 0 AND pAnioNuevo <= pAnioAntiguo THEN
        pMensaje := 'El anio antiguo no puede ser mayor o igual que el anio nuevo, Verifique!!!!';
        RETURN;
    END IF;

    -- Realizar la actualización
    UPDATE rhepq.pla_plz_plaza
    SET plz_ppr_n1 = pAnioNuevo
    WHERE plz_ppr_n1 = pAnioAntiguo
    AND plz_estado IN ('O', 'V');

    -- Verificar el número de filas afectadas
    IF SQL%ROWCOUNT > 0 THEN
    	OPEN pCursor FOR
        SELECT 'La partida presupuestaria para el año ' || pAnioNuevo || ' se ha actualizado con EXITO.' AS pMensaje FROM DUAL;
       	RETURN;
    ELSE
        pMensaje := 'No se encontraron registros para actualizar.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        pMensaje := SQLERRM;
END Actualizar_Anio_Presupuestario;

   -----------------------------------------------------------

   -- actualizar paso salarial en Ingresos fijos # Pendiente

   -----------------------------------------------------------

   -- Mano de obra

   CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TMO_TIPO_MANOOBRA(
    pOpcion IN NUMBER,
    pTmoCodigo IN OUT VARCHAR2,
    pTmoCodCia IN VARCHAR2,    
    pTmoDescripcion IN VARCHAR2 DEFAULT NULL,
    pTmoCtaContable IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        -- Insertar un nuevo registro en PLA_TMO_TIPO_MANOOBRA
        INSERT INTO PLA_TMO_TIPO_MANOOBRA (
            TMO_CODCIA,
            TMO_CODIGO,
            TMO_DESCRIPCION,
            TMO_CTA_CONTABLE
        ) VALUES (
            pTmoCodCia,
            pTmoCodigo,
            pTmoDescripcion,
            pTmoCtaContable
        )
       RETURNING TMO_CODIGO INTO pTmoCodigo;

    ELSIF pOpcion = 2 THEN
        -- Actualizar un registro existente en PLA_TMO_TIPO_MANOOBRA
        UPDATE PLA_TMO_TIPO_MANOOBRA SET
            TMO_DESCRIPCION = pTmoDescripcion,
            TMO_CTA_CONTABLE = pTmoCtaContable
        WHERE TMO_CODCIA = pTmoCodCia AND TMO_CODIGO = pTmoCodigo;
       
   COMMIT;
       
    END IF;

    -- Consulta de registros específicos o todos los registros dependiendo de la opción
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                TMO_CODCIA,
                TMO_CODIGO,
                TMO_DESCRIPCION,
                TMO_CTA_CONTABLE
            FROM PLA_TMO_TIPO_MANOOBRA
            WHERE TMO_CODCIA = pTmoCodCia AND TMO_CODIGO = pTmoCodigo;

    ELSIF pOpcion = 5 THEN
        -- Paginación para la búsqueda
        SELECT COUNT(*) INTO vContador
        FROM PLA_TMO_TIPO_MANOOBRA
        WHERE 
        (
            pTmoDescripcion IS NULL
            OR pTmoDescripcion = ''
            OR LOWER(TMO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTmoDescripcion)) || '%'
        )
        AND TMO_CODCIA = pTmoCodCia;
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
        -- Obtener los resultados paginados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        TMO_CODCIA,
                        TMO_CODIGO,
                        TMO_DESCRIPCION,
                        TMO_CTA_CONTABLE
                    FROM PLA_TMO_TIPO_MANOOBRA
                    WHERE
                    (
                        pTmoDescripcion IS NULL
                        OR pTmoDescripcion = ''
                        OR LOWER(TMO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTmoDescripcion)) || '%'
                    )
                    AND TMO_CODCIA = pTmoCodCia
                    ORDER BY TMO_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

   ELSIF pOpcion = 6 THEN
        -- Listar todos los registros para selección
        OPEN pCursor FOR
            SELECT TMO_CODIGO AS value, TMO_DESCRIPCION AS label
            FROM PLA_TMO_TIPO_MANOOBRA
            WHERE TMO_CODCIA = pTmoCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TMO_TIPO_MANOOBRA;

    -----------------------------------------------------------

   -- Ubicaciones de Grupos de trabajo

   CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_UBI_UBICACION(
    pOpcion IN NUMBER,
    pUbiCodCia IN VARCHAR2,
    pUbiCodigo IN OUT VARCHAR2,
    pUbiDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_UBI_UBICACION (
            UBI_CODCIA,
            UBI_CODIGO,
            UBI_DESCRIPCION
        ) VALUES (
            pUbiCodCia,
            pUbiCodigo,
            pUbiDescripcion
        )
       RETURNING UBI_CODIGO INTO pUbiCodigo;

    ELSIF pOpcion = 2 THEN
        -- Actualización de un registro específico.
        UPDATE PLA_UBI_UBICACION SET
            UBI_DESCRIPCION = pUbiDescripcion
        WHERE UBI_CODCIA = pUbiCodCia AND UBI_CODIGO = pUbiCodigo;

    COMMIT;
   
   END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        -- Consulta de un registro específico o de todos los registros relacionados con el código de compañía.
        OPEN pCursor FOR
            SELECT
                UBI_CODCIA,
                UBI_CODIGO,
                UBI_DESCRIPCION
            FROM PLA_UBI_UBICACION
            WHERE UBI_CODCIA = pUbiCodCia AND UBI_CODIGO = pUbiCodigo;

    ELSIF pOpcion = 5 THEN
        -- Conteo para paginación basado en descripción opcional y código de compañía.
        SELECT COUNT(*) INTO vContador
        FROM PLA_UBI_UBICACION
        WHERE 
        (
            pUbiDescripcion IS NULL
            OR pUbiDescripcion = ''
            OR LOWER(UBI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pUbiDescripcion)) || '%'
        )
        AND UBI_CODCIA = pUbiCodCia;
		
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
        -- Obtención de los resultados paginados.
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        UBI_CODCIA,
                        UBI_CODIGO,
                        UBI_DESCRIPCION
                    FROM PLA_UBI_UBICACION
                    WHERE
                    (
                        pUbiDescripcion IS NULL
                        OR pUbiDescripcion = ''
                        OR LOWER(UBI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pUbiDescripcion)) || '%'
                    )
                    AND UBI_CODCIA = pUbiCodCia
                    ORDER BY UBI_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        -- Listado de todos los registros para selección, si es necesario.
        OPEN pCursor FOR
            SELECT UBI_CODIGO AS value, UBI_DESCRIPCION AS label
            FROM PLA_UBI_UBICACION
            WHERE UBI_CODCIA = pUbiCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_UBI_UBICACION;

    -----------------------------------------------------------

   -- Areas funcionales de grupos de trabajo

   CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_AFN_AREAFUNCIONAL(
    pOpcion IN NUMBER,
    pAfnCodCia IN VARCHAR2,
    pAfnCodigo IN OUT VARCHAR2,
    pAfnDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_AFN_AREAFUNCIONAL (
            AFN_CODCIA,
            AFN_CODIGO,
            AFN_DESCRIPCION
        ) VALUES (
            pAfnCodCia,
            pAfnCodigo,
            pAfnDescripcion
        );

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_AFN_AREAFUNCIONAL SET
            AFN_DESCRIPCION = pAfnDescripcion
        WHERE AFN_CODCIA = pAfnCodCia AND AFN_CODIGO = pAfnCodigo;
       
    COMMIT;
   
   END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                AFN_CODCIA,
                AFN_CODIGO,
                AFN_DESCRIPCION
            FROM PLA_AFN_AREAFUNCIONAL
            WHERE AFN_CODCIA = pAfnCodCia AND AFN_CODIGO = pAfnCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_AFN_AREAFUNCIONAL
        WHERE 
        (
            pAfnDescripcion IS NULL
            OR pAfnDescripcion = ''
            OR LOWER(AFN_DESCRIPCION) LIKE '%' || LOWER(TRIM(pAfnDescripcion)) || '%'
        )
        AND AFN_CODCIA = pAfnCodCia;
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT
                        AFN_CODCIA,
                        AFN_CODIGO,
                        AFN_DESCRIPCION
                    FROM PLA_AFN_AREAFUNCIONAL
                    WHERE
                    (
                        pAfnDescripcion IS NULL
                        OR pAfnDescripcion = ''
                        OR LOWER(AFN_DESCRIPCION) LIKE '%' || LOWER(TRIM(pAfnDescripcion)) || '%'
                    )
                    AND AFN_CODCIA = pAfnCodCia
                    ORDER BY AFN_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT AFN_CODIGO AS value, AFN_DESCRIPCION AS label
            FROM PLA_AFN_AREAFUNCIONAL
            WHERE AFN_CODCIA = pAfnCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_AFN_AREAFUNCIONAL;

    -----------------------------------------------------------

   -- catalogo de grupos de trabajo

 CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_GRT_GRUPOTRABAJO(
    pOpcion IN NUMBER,
    pGrtCodCia IN VARCHAR2,
    pGrtCodUbi IN VARCHAR2,
    pGrtCodTpp IN VARCHAR2,
    pGrtCodAfn IN VARCHAR2,
    pGrtDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_GRT_GRUPOTRABAJO (
            GRT_CODCIA,
            GRT_CODUBI,
            GRT_CODTPP,
            GRT_CODAFN,
            GRT_DESCRIPCION
        ) VALUES (
            pGrtCodCia,
            pGrtCodUbi,
            pGrtCodTpp,
            pGrtCodAfn,
            pGrtDescripcion
        );

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_GRT_GRUPOTRABAJO SET
            GRT_DESCRIPCION = pGrtDescripcion
        WHERE GRT_CODCIA = pGrtCodCia AND GRT_CODUBI = pGrtCodUbi
          AND GRT_CODTPP = pGrtCodTpp AND GRT_CODAFN = pGrtCodAfn;
                       
    COMMIT;
   
   END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
        	SELECT
                GRT.GRT_CODCIA,
                GRT.GRT_CODUBI,
                UBI.UBI_DESCRIPCION,
                GRT.GRT_CODTPP,
                TPP.TPP_DESCRIPCION,
                GRT.GRT_CODAFN,
                AFN.AFN_DESCRIPCION,
                GRT.GRT_DESCRIPCION
            FROM PLA_GRT_GRUPOTRABAJO GRT
            LEFT JOIN RHEPQ.PLA_UBI_UBICACION UBI ON UBI.UBI_CODIGO = GRT.GRT_CODUBI AND UBI.UBI_CODCIA = GRT.GRT_CODCIA
            LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = GRT.GRT_CODTPP AND TPP.TPP_CODCIA = GRT.GRT_CODCIA
            LEFT JOIN RHEPQ.PLA_AFN_AREAFUNCIONAL AFN ON AFN.AFN_CODIGO = GRT.GRT_CODAFN AND AFN.AFN_CODCIA = GRT.GRT_CODCIA
            WHERE GRT.GRT_CODCIA = pGrtCodCia AND GRT.GRT_CODUBI = pGrtCodUbi
              AND GRT.GRT_CODTPP = pGrtCodTpp AND GRT.GRT_CODAFN = pGrtCodAfn;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_GRT_GRUPOTRABAJO GRT
        LEFT JOIN RHEPQ.PLA_UBI_UBICACION UBI ON UBI.UBI_CODIGO = GRT.GRT_CODUBI AND UBI.UBI_CODCIA = GRT.GRT_CODCIA
        LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = GRT.GRT_CODTPP AND TPP.TPP_CODCIA = GRT.GRT_CODCIA
        LEFT JOIN RHEPQ.PLA_AFN_AREAFUNCIONAL AFN ON AFN.AFN_CODIGO = GRT.GRT_CODAFN AND AFN.AFN_CODCIA = GRT.GRT_CODCIA
        WHERE 
        (
            pGrtDescripcion IS NULL
            OR pGrtDescripcion = ''
            OR LOWER(GRT.GRT_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGrtDescripcion)) || '%'
        )
        AND GRT.GRT_CODCIA = pGrtCodCia;
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);		
		
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                   SELECT
		                GRT.GRT_CODCIA,
		                GRT.GRT_CODUBI,
		                UBI.UBI_DESCRIPCION,
		                GRT.GRT_CODTPP,
		                TPP.TPP_DESCRIPCION,
		                GRT.GRT_CODAFN,
		                AFN.AFN_DESCRIPCION,
		                GRT.GRT_DESCRIPCION
		            FROM PLA_GRT_GRUPOTRABAJO GRT
		            LEFT JOIN RHEPQ.PLA_UBI_UBICACION UBI ON UBI.UBI_CODIGO = GRT.GRT_CODUBI AND UBI.UBI_CODCIA = GRT.GRT_CODCIA
		            LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = GRT.GRT_CODTPP AND TPP.TPP_CODCIA = GRT.GRT_CODCIA
		            LEFT JOIN RHEPQ.PLA_AFN_AREAFUNCIONAL AFN ON AFN.AFN_CODIGO = GRT.GRT_CODAFN AND AFN.AFN_CODCIA = GRT.GRT_CODCIA
                    WHERE
                    (
                        pGrtDescripcion IS NULL
                        OR pGrtDescripcion = ''
                        OR LOWER(GRT.GRT_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGrtDescripcion)) || '%'
                    )
                    AND GRT.GRT_CODCIA = pGrtCodCia
                    ORDER BY GRT.GRT_CODUBI, GRT.GRT_CODTPP, GRT.GRT_CODAFN
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT GRT_CODAFN AS value, GRT_DESCRIPCION AS label
            FROM PLA_GRT_GRUPOTRABAJO
            WHERE GRT_CODCIA = pGrtCodCia AND GRT_CODUBI = pGrtCodUbi AND GRT_CODTPP = pGrtCodTpp;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_GRT_GRUPOTRABAJO;

    -----------------------------------------------------------
    
    -- Presupuesto de Plazas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PRESUPUESTO_DE_PLAZA(
    pOpcion IN NUMBER,
    pPlzCodcia IN VARCHAR2,
    pPlzCodigo IN OUT NUMBER,
    pPlzNombre IN VARCHAR2,    
    pPlzEstado IN VARCHAR2,
    pPlzFechaPpto IN DATE,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 3 THEN
		UPDATE RHEPQ.PLA_PLZ_PLAZA SET
		    PLZ_ESTADO = pPlzEstado,
		    PLZ_FECHA_PPTO = pPlzFechaPpto
		WHERE PLZ_CODCIA = pPlzCodcia AND PLZ_CODIGO = pPlzCodigo;

	COMMIT;

    END IF;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
				PLZ.PLZ_CODIGO,
				PLZ.PLZ_NOMBRE,
				PLZ.PLZ_CODTPP,
				TPP.TPP_DESCRIPCION,
				PLZ.PLZ_CODPUE,
				PUE.PUE_NOMBRE,
				PLZ.PLZ_CODUNI,
				UNI.UNI_COD_ORGANIZ,
				UNI.UNI_NOMBRE,
				PLZ.PLZ_ESTADO,
				PLZ.PLZ_DISPRESP,
				PLZ.PLZ_PPR_N8,
				PLZ.PLZ_CODTMO,
				TMO.TMO_DESCRIPCION,
				PLZ.PLZ_CODUBI,
				PLZ.PLZ_CODTPP,
				PLZ.PLZ_CODAFN,
				GRT.GRT_DESCRIPCION,
				PLZ.PLZ_VALOR_HORA,
				PLZ.PLZ_CEN_COSTO,
				CEN.CCO_DESCRIPCION,
				PLZ.PLZ_CODGRE,
				GRE.GRE_DESCRIPCION,
				PLZ.PLZ_CODESP,
				ESP.ESP_DESCRIPCION,
				PLZ.PLZ_ALMUERZO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
				PLZ.PLZ_PPR_N1,
				PLZ.PLZ_PPR_N2,
				PLZ.PLZ_PPR_N3,
				PLZ.PLZ_PPR_N4,
				PLZ.PLZ_PPR_N5,
				PLZ.PLZ_PPR_N6,
				PLZ.PLZ_PPR_N7,
				'0509' AS PPR_N0509,
				UNI.UNI_CODIGO_2003,
				RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
				RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
			FROM RHEPQ.PLA_PLZ_PLAZA PLZ
			LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
						AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
			LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
						AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
			LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
			LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
						AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
            WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ.PLZ_CODIGO = pPlzCodigo;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.PLA_PLZ_PLAZA PLZ
	    LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
	            AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
	    LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
	            AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
	    LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
	            AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
	    WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ_ESTADO IN ('V', 'P')
	    AND (
		    pPlzNombre IS NULL
		    OR pPlzNombre = ''
		    OR LOWER(PLZ.PLZ_NOMBRE) LIKE '%' || LOWER(TRIM(pPlzNombre)) || '%'
		);
	
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

            OPEN pCursor FOR
		        SELECT * FROM (
		            SELECT a.*, ROWNUM rnum
		            FROM (
		                SELECT
		                    PLZ.PLZ_CODIGO,
		                    PLZ.PLZ_NOMBRE,
		                    PLZ.PLZ_CODTPP,
		                    TPP.TPP_DESCRIPCION,
		                    PLZ.PLZ_CODPUE,
		                    PUE.PUE_NOMBRE,
		                    PLZ.PLZ_CODUNI,
		                    UNI.UNI_COD_ORGANIZ,
		                    UNI.UNI_NOMBRE,
		                    PLZ.PLZ_ESTADO,
		                    PLZ.PLZ_DISPRESP,
		                    PLZ.PLZ_PPR_N8,
		                    PLZ.PLZ_CODTMO,
		                    TMO.TMO_DESCRIPCION,
		                    PLZ.PLZ_CODUBI,
		                    PLZ.PLZ_CODTPP AS PLZ_CODTPP2,
		                    PLZ.PLZ_CODAFN,
		                    GRT.GRT_DESCRIPCION,
		                    PLZ.PLZ_VALOR_HORA,
		                    PLZ.PLZ_CEN_COSTO,
		                    CEN.CCO_DESCRIPCION,
		                    PLZ.PLZ_CODGRE,
		                    GRE.GRE_DESCRIPCION,
		                    PLZ.PLZ_CODESP,
		                    ESP.ESP_DESCRIPCION,
		                    PLZ.PLZ_ALMUERZO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
		                    PLZ.PLZ_PPR_N1,
		                    PLZ.PLZ_PPR_N2,
		                    PLZ.PLZ_PPR_N3,
		                    PLZ.PLZ_PPR_N4,
		                    PLZ.PLZ_PPR_N5,
		                    PLZ.PLZ_PPR_N6,
		                    PLZ.PLZ_PPR_N7,
		                    '0509' AS PPR_N0509,
		                    UNI.UNI_CODIGO_2003,
		                    RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
		                    RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
		                FROM RHEPQ.PLA_PLZ_PLAZA PLZ
		                LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
		                    AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
		                LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
		                    AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
		                LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
		                LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
		                    AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
		                WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ_ESTADO IN ('V', 'P')
					    AND (
						    pPlzNombre IS NULL
						    OR pPlzNombre = ''
						    OR LOWER(PLZ.PLZ_NOMBRE) LIKE '%' || LOWER(TRIM(pPlzNombre)) || '%'
						)
		                ORDER BY PLZ.PLZ_CODIGO
		            ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;

	END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PRESUPUESTO_DE_PLAZA;

    -----------------------------------------------------------

    -- Reubicacion de plazas por unidad

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_REUBICA_PLAZAS (
    pCompania IN VARCHAR2,
    pViejaUnidad IN NUMBER,
    pNuevaUnidad IN NUMBER,
    pCcosto IN NUMBER,
    pFlag IN VARCHAR2,
    pMensaje OUT VARCHAR2,
    pCursor OUT SYS_REFCURSOR
) AS
    vPlazas NUMBER;
BEGIN
    IF pFlag = 'S' THEN
        UPDATE RHEPQ.pla_plz_plaza
        SET plz_coduni = pNuevaUnidad,
            plz_cen_costo = pCcosto
        WHERE plz_codcia = pCompania
        AND plz_coduni = pViejaUnidad;

    ELSE
        UPDATE RHEPQ.pla_plz_plaza
        SET plz_coduni = pNuevaUnidad
        WHERE plz_codcia = pCompania
        AND plz_coduni = pViejaUnidad;
    END IF;

    vPlazas := SQL%ROWCOUNT;

    -- Usar un cursor para devolver el mensaje
    IF vPlazas > 0 THEN
        OPEN pCursor FOR
        SELECT 'Se reubicaron ' || TO_CHAR(vPlazas) || ' Plazas a la Unidad Especificada con éxito.' AS Mensaje FROM DUAL;
    ELSE
        OPEN pCursor FOR
        SELECT 'No se encontraron registros para actualizar.' AS Mensaje FROM DUAL;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        pMensaje := SQLERRM; 
END SP_REUBICA_PLAZAS;

    -----------------------------------------------------------

    -- Supresion de plazas

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_SUPRESION_PLAZA(
    pOpcion IN NUMBER,
    pPlzCodcia IN VARCHAR2,
    pPlzCodigo IN OUT NUMBER,
    pPlzNombre IN VARCHAR2,    
    pPlzEstado IN VARCHAR2,
    pPlzFechaSupre IN DATE,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 3 THEN
		UPDATE RHEPQ.PLA_PLZ_PLAZA SET
		    PLZ_ESTADO = pPlzEstado,
		    PLZ_FECHA_SUPRE = pPlzFechaSupre
		WHERE PLZ_CODCIA = pPlzCodcia AND PLZ_CODIGO = pPlzCodigo;

	COMMIT;

    END IF;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
				PLZ.PLZ_CODIGO,
				PLZ.PLZ_NOMBRE,
				PLZ.PLZ_CODTPP,
				TPP.TPP_DESCRIPCION,
				PLZ.PLZ_CODPUE,
				PUE.PUE_NOMBRE,
				PLZ.PLZ_CODUNI,
				UNI.UNI_COD_ORGANIZ,
				UNI.UNI_NOMBRE,
				PLZ.PLZ_ESTADO,
				PLZ.PLZ_DISPRESP,
				PLZ.PLZ_PPR_N8,
				PLZ.PLZ_CODTMO,
				TMO.TMO_DESCRIPCION,
				PLZ.PLZ_CODUBI,
				PLZ.PLZ_CODTPP,
				PLZ.PLZ_CODAFN,
				GRT.GRT_DESCRIPCION,
				PLZ.PLZ_VALOR_HORA,
				PLZ.PLZ_CEN_COSTO,
				CEN.CCO_DESCRIPCION,
				PLZ.PLZ_CODGRE,
				GRE.GRE_DESCRIPCION,
				PLZ.PLZ_CODESP,
				ESP.ESP_DESCRIPCION,
				PLZ.PLZ_ALMUERZO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
				RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
				PLZ.PLZ_PPR_N1,
				PLZ.PLZ_PPR_N2,
				PLZ.PLZ_PPR_N3,
				PLZ.PLZ_PPR_N4,
				PLZ.PLZ_PPR_N5,
				PLZ.PLZ_PPR_N6,
				PLZ.PLZ_PPR_N7,
				'0509' AS PPR_N0509,
				UNI.UNI_CODIGO_2003,
				RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
				RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
			FROM RHEPQ.PLA_PLZ_PLAZA PLZ
			LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
						AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
			LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
						AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
			LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
			LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
						AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
			LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
            WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ.PLZ_CODIGO = pPlzCodigo;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.PLA_PLZ_PLAZA PLZ
	    LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
	            AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
	    LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
	            AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
	    LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
	            AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
	    LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
	    WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ_ESTADO = 'V'
	    AND (
		    pPlzNombre IS NULL
		    OR pPlzNombre = ''
		    OR LOWER(PLZ.PLZ_NOMBRE) LIKE '%' || LOWER(TRIM(pPlzNombre)) || '%'
		);
	
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

            OPEN pCursor FOR
		        SELECT * FROM (
		            SELECT a.*, ROWNUM rnum
		            FROM (
		                SELECT
		                    PLZ.PLZ_CODIGO,
		                    PLZ.PLZ_NOMBRE,
		                    PLZ.PLZ_CODTPP,
		                    TPP.TPP_DESCRIPCION,
		                    PLZ.PLZ_CODPUE,
		                    PUE.PUE_NOMBRE,
		                    PLZ.PLZ_CODUNI,
		                    UNI.UNI_COD_ORGANIZ,
		                    UNI.UNI_NOMBRE,
		                    PLZ.PLZ_ESTADO,
		                    PLZ.PLZ_DISPRESP,
		                    PLZ.PLZ_PPR_N8,
		                    PLZ.PLZ_CODTMO,
		                    TMO.TMO_DESCRIPCION,
		                    PLZ.PLZ_CODUBI,
		                    PLZ.PLZ_CODTPP AS PLZ_CODTPP2,
		                    PLZ.PLZ_CODAFN,
		                    GRT.GRT_DESCRIPCION,
		                    PLZ.PLZ_VALOR_HORA,
		                    PLZ.PLZ_CEN_COSTO,
		                    CEN.CCO_DESCRIPCION,
		                    PLZ.PLZ_CODGRE,
		                    GRE.GRE_DESCRIPCION,
		                    PLZ.PLZ_CODESP,
		                    ESP.ESP_DESCRIPCION,
		                    PLZ.PLZ_ALMUERZO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_PPTO) AS PLZ_FECHA_PPTO,
		                    RHEPQ.FORMAT_DATE(PLZ.PLZ_FECHA_SUPRE) AS PLZ_FECHA_SUPRE,
		                    PLZ.PLZ_PPR_N1,
		                    PLZ.PLZ_PPR_N2,
		                    PLZ.PLZ_PPR_N3,
		                    PLZ.PLZ_PPR_N4,
		                    PLZ.PLZ_PPR_N5,
		                    PLZ.PLZ_PPR_N6,
		                    PLZ.PLZ_PPR_N7,
		                    '0509' AS PPR_N0509,
		                    UNI.UNI_CODIGO_2003,
		                    RHEPQ.obtener_codigo_empleado_plaza(PLZ.PLZ_CODIGO) AS EMP_CODIGO,
		                    RHEPQ.obtener_nombre_empleado_plaza(PLZ.PLZ_CODIGO) AS NOMBRE_EMPLEADO
		                FROM RHEPQ.PLA_PLZ_PLAZA PLZ
		                LEFT JOIN RHEPQ.PLA_PUE_PUESTO PUE ON PUE.PUE_CODTPP = PLZ.PLZ_CODTPP AND PUE.PUE_CODIGO = PLZ.PLZ_CODPUE
		                    AND PUE.PUE_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TPP_TIPUESTO TPP ON TPP.TPP_CODIGO = PUE.PUE_CODTPP AND TPP.TPP_CODCIA = PUE.PUE_CODCIA
		                LEFT JOIN RHEPQ.PLA_UNI_UNIDAD UNI ON UNI.UNI_CODIGO = PLZ.PLZ_CODUNI AND UNI.UNI_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_TMO_TIPO_MANOOBRA TMO ON TMO.TMO_CODIGO = PLZ.PLZ_CODTMO AND TMO.TMO_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRT_GRUPOTRABAJO GRT ON GRT.GRT_CODCIA = PLZ.PLZ_CODCIA AND GRT.GRT_CODUBI = PLZ.PLZ_CODUBI 
		                    AND GRT.GRT_CODTPP = PLZ.PLZ_CODTPP AND GRT.GRT_CODAFN = PLZ.PLZ_CODAFN
		                LEFT JOIN RHEPQ.PLA_CCO_CEN_COSTO CEN ON CEN.CCO_CODIGO = PLZ.PLZ_CEN_COSTO AND CEN.CCO_CODCIA = PLZ.PLZ_CODCIA 
		                LEFT JOIN RHEPQ.PLA_ESP_ESPECIALIDAD ESP ON ESP.ESP_CODGRE = PLZ.PLZ_CODGRE AND ESP.ESP_CODIGO = PLZ.PLZ_CODESP
		                    AND ESP.ESP_CODCIA = PLZ.PLZ_CODCIA
		                LEFT JOIN RHEPQ.PLA_GRE_GRUPO_ESPECIALIDAD GRE ON GRE.GRE_CODIGO = ESP.ESP_CODGRE
		                WHERE PLZ.PLZ_CODCIA = pPlzCodcia AND PLZ_ESTADO = 'V'
					    AND (
						    pPlzNombre IS NULL
						    OR pPlzNombre = ''
						    OR LOWER(PLZ.PLZ_NOMBRE) LIKE '%' || LOWER(TRIM(pPlzNombre)) || '%'
						)
		                ORDER BY PLZ.PLZ_CODIGO
		            ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;

	END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_SUPRESION_PLAZA;

    -----------------------------------------------------------

    -- Supresion de puestos y plazas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_SUPRESION_PUESTOS_PLAZAS (
    pCompania IN VARCHAR2,
    pCodTpp IN NUMBER,
    pCodPue IN NUMBER,
    pMensaje OUT VARCHAR2,
    pCursor OUT SYS_REFCURSOR
) AS
    vNumero NUMBER;
BEGIN
    -- Verificar si hay plazas ocupadas asociadas al puesto
    SELECT COUNT(*)
    INTO vNumero
    FROM RHEPQ.pla_plz_plaza
    WHERE plz_codcia = pCompania
    AND plz_codtpp = pCodTpp
    AND plz_codpue = pCodPue
    AND plz_estado = 'O';

    IF vNumero = 0 THEN
        -- No hay plazas ocupadas, proceder con la supresión
        -- Actualiza las Plazas a Suprimidas
        UPDATE RHEPQ.pla_plz_plaza
        SET plz_estado = 'S',
            plz_fecha_supre = SYSDATE
        WHERE plz_codcia = pCompania
        AND plz_codtpp = pCodTpp
        AND plz_codpue = pCodPue;

        -- Actualiza los Puestos a Suprimidos
        UPDATE RHEPQ.pla_pue_puesto
        SET pue_estado = 'S',
            pue_fecha_supre = SYSDATE
        WHERE pue_codcia = pCompania
        AND pue_codtpp = pCodTpp
        AND pue_codigo = pCodPue;

        -- Preparar mensaje de éxito
        OPEN pCursor FOR
        SELECT 'Puesto y plazas asociadas suprimidos con éxito.' AS Mensaje FROM DUAL;
    ELSE
        -- Hay plazas ocupadas, no se puede suprimir
        pMensaje := 'Puesto no puede suprimirse. Usado por plazas ocupadas.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        pMensaje := SQLERRM;
        RAISE;
END SP_SUPRESION_PUESTOS_PLAZAS;


--######################## AQUI TERMINA MODULO ESTRUCTURA ORGANIZATIVA ########################
-----------------------------------------------------------

--######################## SUB MODULO EXPEDIENTES DE PERSONAL ########################

 --// Tipos de Estudio

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_TES_TIPO_ESTUDIO(
    pOpcion IN NUMBER,
    pTesCodigo IN OUT NUMBER,
    pTesDescripcion IN VARCHAR2 DEFAULT NULL,
    pTesDescripcionIng IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_TES_TIPO_ESTUDIO (
            TES_CODIGO,
            TES_DESCRIPCION,
            TES_DESCRIPCION_ING
        ) VALUES (
            pTesCodigo,
            pTesDescripcion,
            pTesDescripcionIng
        )
        RETURNING TES_CODIGO INTO pTesCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_TES_TIPO_ESTUDIO SET
            TES_DESCRIPCION = pTesDescripcion,
            TES_DESCRIPCION_ING = pTesDescripcionIng
        WHERE TES_CODIGO = pTesCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                TES_CODIGO,
                TES_DESCRIPCION,
                TES_DESCRIPCION_ING
            FROM REC_TES_TIPO_ESTUDIO
            WHERE TES_CODIGO = pTesCodigo;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM REC_TES_TIPO_ESTUDIO
		WHERE 
		(
		    pTesDescripcion IS NULL
		    OR pTesDescripcion = ''
		    OR LOWER(TES_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTesDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                TES_CODIGO,
		                TES_DESCRIPCION,
		                TES_DESCRIPCION_ING
		            FROM REC_TES_TIPO_ESTUDIO 
		            WHERE 
		            (
		                pTesDescripcion IS NULL
		                OR pTesDescripcion = ''
		                OR LOWER(TES_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTesDescripcion)) || '%'
		            )
		            ORDER BY TES_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TES_CODIGO AS value, TES_DESCRIPCION AS label
            FROM REC_TES_TIPO_ESTUDIO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_TES_TIPO_ESTUDIO;

-----------------------------------------------

-- // Aficiones

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_AFI_AFICION(
    pOpcion IN NUMBER,
    pAfiCodigo IN OUT VARCHAR2,
    pAfiNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_AFI_AFICION (
            AFI_CODIGO,
            AFI_NOMBRE
        ) VALUES (
            pAfiCodigo,
            pAfiNombre
        )
        RETURNING AFI_CODIGO INTO pAfiCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_AFI_AFICION SET
            AFI_NOMBRE = pAfiNombre
        WHERE AFI_CODIGO = pAfiCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                AFI_CODIGO,
                AFI_NOMBRE
            FROM PLA_AFI_AFICION
            WHERE AFI_CODIGO = pAfiCodigo;

    ELSIF pOpcion = 5 THEN
       	SELECT COUNT(*) INTO vContador
		FROM PLA_AFI_AFICION
		WHERE 
		(
		    pAfiNombre IS NULL
		    OR pAfiNombre = ''
		    OR LOWER(AFI_NOMBRE) LIKE '%' || LOWER(TRIM(pAfiNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ROWID AS id,
		                AFI_CODIGO,
		                AFI_NOMBRE
		            FROM PLA_AFI_AFICION 
		            WHERE 
		            (
		                pAfiNombre IS NULL
		                OR pAfiNombre = ''
		                OR LOWER(AFI_NOMBRE) LIKE '%' || LOWER(TRIM(pAfiNombre)) || '%'
		            )
		            ORDER BY AFI_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT AFI_CODIGO AS value, AFI_NOMBRE AS label
            FROM PLA_AFI_AFICION;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_AFI_AFICION;


------------------------------------------------

   --// Carreras

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_CAR_CARRERA(
    pOpcion IN NUMBER,
    pCarCodigo IN OUT VARCHAR2,
    pCarCodTes IN NUMBER DEFAULT NULL,
    pCarNombre IN VARCHAR2 DEFAULT NULL,
    pCarNombreIng IN VARCHAR2 DEFAULT NULL,
    pCarNombreCorto IN VARCHAR2 DEFAULT NULL,
    pCarIncremento IN NUMBER DEFAULT NULL,
    pCarReconocida IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_CAR_CARRERA (
            CAR_CODIGO,
            CAR_CODTES,
            CAR_NOMBRE,
            CAR_NOMBRE_ING,
            CAR_NOMBRE_CORTO,
            CAR_INCREMENTO,
            CAR_RECONOCIDA
        ) VALUES (
            pCarCodigo,
            pCarCodTes,
            pCarNombre,
            pCarNombreIng,
            pCarNombreCorto,
            pCarIncremento,
            pCarReconocida
        )
        RETURNING CAR_CODIGO INTO pCarCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE REC_CAR_CARRERA SET
            CAR_CODTES = pCarCodTes,
            CAR_NOMBRE = pCarNombre,
            CAR_NOMBRE_ING = pCarNombreIng,
            CAR_NOMBRE_CORTO = pCarNombreCorto,
            CAR_INCREMENTO = pCarIncremento,
            CAR_RECONOCIDA = pCarReconocida
        WHERE CAR_CODIGO = pCarCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CAR_CODIGO,
                CAR_CODTES,
                CAR_NOMBRE,
                CAR_NOMBRE_ING,
                CAR_NOMBRE_CORTO,
                CAR_INCREMENTO,
                CAR_RECONOCIDA
            FROM REC_CAR_CARRERA
            WHERE CAR_CODIGO = pCarCodigo;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador
		FROM REC_CAR_CARRERA
		WHERE 
		(
		    pCarNombre IS NULL
		    OR pCarNombre = ''
		    OR LOWER(CAR_NOMBRE) LIKE '%' || LOWER(TRIM(pCarNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                CAR_CODIGO,
		                CAR_CODTES,
		                CAR_NOMBRE,
		                CAR_NOMBRE_ING,
		                CAR_NOMBRE_CORTO,
		                CAR_INCREMENTO,
		                CAR_RECONOCIDA
		            FROM REC_CAR_CARRERA 
		            WHERE 
		            (
		                pCarNombre IS NULL
		                OR pCarNombre = ''
		                OR LOWER(CAR_NOMBRE) LIKE '%' || LOWER(TRIM(pCarNombre)) || '%'
		            )
		            ORDER BY CAR_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT CAR_CODIGO AS value, CAR_NOMBRE AS label
            FROM REC_CAR_CARRERA;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_CAR_CARRERA;

------------------------------------------------

--// Asociaciones

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ASO_ASOCIACION(
    pOpcion IN NUMBER,
    pAsoCodigo IN OUT VARCHAR2,
    pAsoNombre IN VARCHAR2 DEFAULT NULL,
    pAsoNombreIng IN VARCHAR2 DEFAULT NULL,
    pAsoNaturaleza IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_ASO_ASOCIACION (
            ASO_CODIGO,
            ASO_NOMBRE,
            ASO_NOMBRE_ING,
            ASO_NATURALEZA
        ) VALUES (
            pAsoCodigo,
            pAsoNombre,
            pAsoNombreIng,
            pAsoNaturaleza
        )
        RETURNING ASO_CODIGO INTO pAsoCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ASO_ASOCIACION SET
            ASO_NOMBRE = pAsoNombre,
            ASO_NOMBRE_ING = pAsoNombreIng,
            ASO_NATURALEZA = pAsoNaturaleza
        WHERE ASO_CODIGO = pAsoCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                ASO_CODIGO,
                ASO_NOMBRE,
                ASO_NOMBRE_ING,
                ASO_NATURALEZA
            FROM PLA_ASO_ASOCIACION
            WHERE ASO_CODIGO = pAsoCodigo;

    ELSIF pOpcion = 5 THEN
       SELECT COUNT(*) INTO vContador
		FROM PLA_ASO_ASOCIACION
		WHERE 
		(
		    pAsoNombre IS NULL
		    OR pAsoNombre = ''
		    OR LOWER(ASO_NOMBRE) LIKE '%' || LOWER(TRIM(pAsoNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                ASO_CODIGO,
		                ASO_NOMBRE,
		                ASO_NOMBRE_ING,
		                ASO_NATURALEZA
		            FROM PLA_ASO_ASOCIACION 
		            WHERE 
		            (
		                pAsoNombre IS NULL
		                OR pAsoNombre = ''
		                OR LOWER(ASO_NOMBRE) LIKE '%' || LOWER(TRIM(pAsoNombre)) || '%'
		            )
		            ORDER BY ASO_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT ASO_CODIGO AS value, ASO_NOMBRE AS label
            FROM PLA_ASO_ASOCIACION;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ASO_ASOCIACION;

------------------------------------------------

   --// Tipos de Parentescos
   
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_PRT_PARENTESCO(
    pOpcion IN NUMBER,
    pPrtCodigo IN OUT VARCHAR2,
    pPrtNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_PRT_PARENTESCO (
            PRT_CODIGO,
            PRT_NOMBRE
        ) VALUES (
            pPrtCodigo,
            pPrtNombre
        )
        RETURNING PRT_CODIGO INTO pPrtCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_PRT_PARENTESCO SET
            PRT_NOMBRE = pPrtNombre
        WHERE PRT_CODIGO = pPrtCodigo;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                PRT_CODIGO,
                PRT_NOMBRE
            FROM PLA_PRT_PARENTESCO
            WHERE PRT_CODIGO = pPrtCodigo;

    ELSIF pOpcion = 5 THEN
       	SELECT COUNT(*) INTO vContador
		FROM PLA_PRT_PARENTESCO
		WHERE 
		(
		    pPrtNombre IS NULL
		    OR pPrtNombre = ''
		    OR LOWER(PRT_NOMBRE) LIKE '%' || LOWER(TRIM(pPrtNombre)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                PRT_CODIGO,
		                PRT_NOMBRE
		            FROM PLA_PRT_PARENTESCO 
		            WHERE 
		            (
		                pPrtNombre IS NULL
		                OR pPrtNombre = ''
		                OR LOWER(PRT_NOMBRE) LIKE '%' || LOWER(TRIM(pPrtNombre)) || '%'
		            )
		            ORDER BY PRT_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT PRT_CODIGO AS value, PRT_NOMBRE AS label
            FROM PLA_PRT_PARENTESCO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_PRT_PARENTESCO;


------------------------------------------------

   --// Mantenimiento de Religiones

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_RLI_RELIGION(
    pOpcion IN NUMBER,
    pRliCodigo IN OUT VARCHAR2,
    pRliDescripcion IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_RLI_RELIGION (
            RLI_CODIGO,
            RLI_DESCRIPCION
        ) VALUES (
            pRliCodigo,
            pRliDescripcion
        )
        RETURNING RLI_CODIGO INTO pRliCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_RLI_RELIGION SET
            RLI_DESCRIPCION = pRliDescripcion
        WHERE RLI_CODIGO = pRliCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                RLI_CODIGO,
                RLI_DESCRIPCION
            FROM PLA_RLI_RELIGION
            WHERE RLI_CODIGO = pRliCodigo;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM PLA_RLI_RELIGION
		WHERE 
		(
		    pRliDescripcion IS NULL
		    OR pRliDescripcion = ''
		    OR LOWER(RLI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pRliDescripcion)) || '%'
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                RLI_CODIGO,
		                RLI_DESCRIPCION
		            FROM PLA_RLI_RELIGION 
		            WHERE 
		            (
		                pRliDescripcion IS NULL
		                OR pRliDescripcion = ''
		                OR LOWER(RLI_DESCRIPCION) LIKE '%' || LOWER(TRIM(pRliDescripcion)) || '%'
		            )
		            ORDER BY RLI_CODIGO
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT RLI_CODIGO AS value, RLI_DESCRIPCION AS label
            FROM PLA_RLI_RELIGION;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_RLI_RELIGION;

   --# De aqui para arriba HECHO
   ------------------------------------------------

	--// Empleados

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_EMP_EMPLEADO(
    pOpcion IN NUMBER,
    pEmpCodCia IN OUT VARCHAR2,
    pEmpCodigo IN OUT NUMBER,
    pEmpDpiFechaVence IN DATE,
    pEmpFechaFichadatos IN DATE,
    pEmpInterinato IN VARCHAR2,
    pEmpTipoLicencia IN VARCHAR2,
    pEmpTipfechaLicen IN DATE,
    pEmpServPrestados IN VARCHAR2,
    pEmpRetiroConta IN VARCHAR2,
    pEmpRetiroPpto IN VARCHAR2,
    pEmpFechaingReporte IN DATE,
    pEmpFecharetReporte IN DATE,
    pEmpTercerNom IN VARCHAR2,
    pEmpUnicoNom IN VARCHAR2,
    pEmpUnicoApe IN VARCHAR2,
    pEmpRenglon IN VARCHAR2,
    pEmpLugarNacText IN VARCHAR2,
    pEmpCodren IN NUMBER,
    pEmpElectoralExtendidoEn IN VARCHAR2,
    pEmpTrabajaConyuge IN VARCHAR2,
    pEmpDevengadoConyuge IN NUMBER,
    pEmpColegiadoActivo IN VARCHAR2,
    pEmpTipoBonoEsc IN VARCHAR2,
    pEmpAfectoAcep IN VARCHAR2,
    pEmpDescuentaFianza IN VARCHAR2,
    pEmpAfectoMontepio IN VARCHAR2,
    pEmpCoduni IN NUMBER,
    pEmpSalario IN NUMBER,
    pEmpTipoSalario IN VARCHAR2,
    pEmpAcuerdo IN VARCHAR2,
    pEmpFechaDel IN DATE,
    pEmpFechaAl IN DATE,
    pEmpFrecueciaPago IN VARCHAR2,
    pEmpPlanJubila IN VARCHAR2,
    pEmpNoColegiado IN VARCHAR2,
    pEmpBeca IN VARCHAR2,
    pEmpUsaClinica IN VARCHAR2,
    pEmpAcuerdoBaja IN VARCHAR2,
    pEmpJuntadir IN VARCHAR2,
    pEmpFechaPagoBonoEscolar IN DATE,
    pEmpFechaCertTrabajo IN DATE,
    pEmpJornadaContrato IN VARCHAR2,
    pEmpReligion IN VARCHAR2,
    pEmpOficio IN VARCHAR2,
    pEmpCodgerFun IN VARCHAR2,
    pEmpCoduniFun IN VARCHAR2,
    pEmpCodigoCar IN CHAR,
    pEmpUsuarioOracle IN VARCHAR2,
    pEmpCtaEmpleadosContra IN VARCHAR2,
    pEmpDpi IN VARCHAR2,
    pEmpTelefonoEmpresa IN VARCHAR2,
    pEmpDescIsssJub IN CHAR,
    pEmpCoduniUbi IN NUMBER,
    pEmpPrimerApe IN VARCHAR2,
    pEmpSegundoApe IN VARCHAR2,
    pEmpApellidoCas IN VARCHAR2,
    pEmpPrimerNom IN VARCHAR2,
    pEmpSegundoNom IN VARCHAR2,
    pEmpNombreIsss IN VARCHAR2,
    pEmpNombreNit IN VARCHAR2,
    pEmpNombreCip IN VARCHAR2,
    pEmpDireccion IN VARCHAR2,
    pEmpCoddep IN VARCHAR2,
    pEmpCodmun IN VARCHAR2,
    pEmpTelefono IN VARCHAR2,
    pEmpLugarNac IN VARCHAR2,
    pEmpNacionalidad IN VARCHAR2,
    pEmpFechaNac IN DATE,
    pEmpSexo IN VARCHAR2,
    pEmpProfesion IN VARCHAR2,
    pEmpCip IN VARCHAR2,
    pEmpExpedidaDep IN VARCHAR2,
    pEmpExpedidaMun IN VARCHAR2,
    pEmpExpedidaFecha IN DATE,
    pEmpNit IN VARCHAR2,
    pEmpIsss IN VARCHAR2,
    pEmpElectoral IN VARCHAR2,
    pEmpEstado IN VARCHAR2,
    pEmpEstadoCivil IN VARCHAR2,
    pEmpFechaIngreso IN DATE,
    pEmpFechaRetiro IN DATE,
    pEmpCodmrt IN VARCHAR2,
    pEmpIndemnizacion IN NUMBER,
    pEmpUsuarioCrea IN VARCHAR2,
    pEmpFechaCrea IN DATE,
    pEmpUsuarioMod IN VARCHAR2,
    pEmpFechaMod IN DATE,
    pEmpCodpai IN VARCHAR2,
    pEmpCodubi IN VARCHAR2,
    pEmpCodtpp IN VARCHAR2,
    pEmpCodafn IN VARCHAR2,
    pEmpPeso IN VARCHAR2,
    pEmpEstatura IN NUMBER,
    pEmpDonante IN VARCHAR2,
    pEmpTipoSangre IN VARCHAR2,
    pEmpTarjeta IN VARCHAR2,
    pEmpHoraExtra IN VARCHAR2,
    pEmpReubi IN VARCHAR2,
    pEmpReubiIng IN VARCHAR2,
    pEmpInpep IN VARCHAR2,
    pEmpCodcel IN VARCHAR2,
    pEmpDescIsss IN VARCHAR2,
    pEmpClave IN VARCHAR2,
    pEmpCodigoPostal IN VARCHAR2,
    pEmpCoddepNac IN VARCHAR2,
    pEmpCodrli IN VARCHAR2,
    pEmpCasa IN VARCHAR2,
    pEmpPromIngresoFam IN NUMBER,
    pEmpImpedimento IN VARCHAR2,
    pEmpCarnetResidente IN VARCHAR2,
    pEmpInternet IN VARCHAR2,
    pEmpCuotaVivienda IN NUMBER,
    pEmpQuienCuidaHijos IN VARCHAR2,
    pEmpColegiaturas IN NUMBER,
    pEmpVehiModelo IN VARCHAR2,
    pEmpVehiAno IN VARCHAR2,
    pEmpPlaca IN VARCHAR2,
    pEmpServicioMilitar IN VARCHAR2,
    pEmpGradoMilitar IN VARCHAR2,
    pEmpBebidaAlcoholica IN VARCHAR2,
    pEmpFuma IN VARCHAR2,
    pEmpTallaZapatos IN VARCHAR2,
    pEmpTallaCamisa IN VARCHAR2,
    pEmpTallaPantalon IN VARCHAR2,
    pEmpUsaLentes IN VARCHAR2,
    pEmpCodigoAnterior IN VARCHAR2,
    pEmpNup IN VARCHAR2,
    pEmpAfp IN VARCHAR2,
    pEmpCodtpu IN VARCHAR2,
    pEmpCodpue IN NUMBER,
    pEmpZona IN VARCHAR2,
    pEmpCodAgente IN VARCHAR2,
    pEmpDomiciliado IN VARCHAR2,
    pEmpArea IN VARCHAR2,
    pEmpComision IN VARCHAR2,
    pEmpSupervisor IN VARCHAR2,
    pEmpRentaDomiciliado IN NUMBER,
    pEmpRentaServicio IN NUMBER,    
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
   	vUsername VARCHAR2(255);
BEGIN
    SAVEPOINT transact;
   

    IF pOpcion = 1 THEN
    
    vUsername := obtenerUsername(pUsuario);
    
    INSERT INTO PLA_EMP_EMPLEADO (
        EMP_CODCIA,
        EMP_CODIGO,
        EMP_DPI_FECHA_VENCE,
        EMP_FECHA_FICHADATOS,
        EMP_INTERINATO,
        EMP_TIPO_LICENCIA,
        EMP_TIPFECHA_LICEN,
        EMP_SERV_PRESTADOS,
        EMP_RETIRO_CONTA,
        EMP_RETIRO_PPTO,
        EMP_FECHAING_REPORTE,
        EMP_FECHARET_REPORTE,
        EMP_TERCER_NOM,
        EMP_UNICO_NOM,
        EMP_UNICO_APE,
        EMP_RENGLON,
        EMP_LUGAR_NAC_TEXT,
        EMP_CODREN,
        EMP_ELECTORAL_EXTENDIDO_EN,
        EMP_TRABAJA_CONYUGE,
        EMP_DEVENGADO_CONYUGE,
        EMP_COLEGIADO_ACTIVO,
        EMP_TIPO_BONO_ESC,
        EMP_AFECTO_ACEP,
        EMP_DESCUENTA_FIANZA,
        EMP_AFECTO_MONTEPIO,
        EMP_CODUNI,
        EMP_SALARIO,
        EMP_TIPO_SALARIO,
        EMP_ACUERDO,
        EMP_FECHA_DEL,
        EMP_FECHA_AL,
        EMP_FRECUECIA_PAGO,
        EMP_PLAN_JUBILA,
        EMP_NO_COLEGIADO,
        EMP_BECA,
        EMP_USA_CLINICA,
        EMP_ACUERDO_BAJA,
        EMP_JUNTADIR,
        EMP_FECHA_PAGO_BONOESCOLAR,
        EMP_FECHA_CERT_TRABAJO,
        EMP_JORNADA_CONTRATO,
        EMP_RELIGION,
        EMP_OFICIO,
        EMP_CODGER_FUN,
        EMP_CODUNI_FUN,
        EMP_CODIGO_CAR,
        EMP_USUARIO_ORACLE,
        EMP_CTA_EMPLEADOS_CONTRA,
        EMP_DPI,
        EMP_TELEFONO_EMPRESA,
        EMP_DESC_ISSS_JUB,
        EMP_CODUNI_UBI,
        EMP_PRIMER_APE,
        EMP_SEGUNDO_APE,
        EMP_APELLIDO_CAS,
        EMP_PRIMER_NOM,
        EMP_SEGUNDO_NOM,
        EMP_NOMBRE_ISSS,
        EMP_NOMBRE_NIT,
        EMP_NOMBRE_CIP,
        EMP_DIRECCION,
        EMP_CODDEP,
        EMP_CODMUN,
        EMP_TELEFONO,
        EMP_LUGAR_NAC,
        EMP_NACIONALIDAD,
        EMP_FECHA_NAC,
        EMP_SEXO,
        EMP_PROFESION,
        EMP_CIP,
        EMP_EXPEDIDA_DEP,
        EMP_EXPEDIDA_MUN,
        EMP_EXPEDIDA_FECHA,
        EMP_NIT,
        EMP_ISSS,
        EMP_ELECTORAL,
        EMP_ESTADO,
        EMP_ESTADO_CIVIL,
        EMP_FECHA_INGRESO,
        EMP_FECHA_RETIRO,
        EMP_CODMRT,
        EMP_INDEMNIZACION,
        EMP_USUARIO_CREA,
        EMP_FECHA_CREA,
        EMP_CODPAI,
        EMP_CODUBI,
        EMP_CODTPP,
        EMP_CODAFN,
        EMP_PESO,
        EMP_ESTATURA,
        EMP_DONANTE,
        EMP_TIPO_SANGRE,
        EMP_TARJETA,
        EMP_HORA_EXTRA,
        EMP_REUBI,
        EMP_REUBI_ING,
        EMP_INPEP,
        EMP_CODCEL,
        EMP_DESC_ISSS,
        EMP_CLAVE,
        EMP_CODIGO_POSTAL,
        EMP_CODDEP_NAC,
        EMP_CODRLI,
        EMP_CASA,
        EMP_PROM_INGRESO_FAM,
        EMP_IMPEDIMENTO,
        EMP_CARNET_RESIDENTE,
        EMP_INTERNET,
        EMP_CUOTA_VIVIENDA,
        EMP_QUIEN_CUIDA_HIJOS,
        EMP_COLEGIATURAS,
        EMP_VEHI_MODELO,
        EMP_VEHI_ANO,
        EMP_PLACA,
        EMP_SERVICIO_MILITAR,
        EMP_GRADO_MILITAR,
        EMP_BEBIDA_ALCOHOLICA,
        EMP_FUMA,
        EMP_TALLA_ZAPATOS,
        EMP_TALLA_CAMISA,
        EMP_TALLA_PANTALON,
        EMP_USA_LENTES,
        EMP_CODIGO_ANTERIOR,
        EMP_NUP,
        EMP_AFP,
        EMP_CODTPU,
        EMP_CODPUE,
        EMP_ZONA,
        EMP_COD_AGENTE,
        EMP_DOMICILIADO,
        EMP_AREA,
        EMP_COMISION,
        EMP_SUPERVISOR,
        EMP_RENTA_DOMICILIADO,
        EMP_RENTA_SERVICIO
    ) VALUES (
            pEmpCodCia,
            pEmpCodigo,
            pEmpDpiFechaVence,
            pEmpFechaFichadatos,
            pEmpInterinato,
            pEmpTipoLicencia,
            pEmpTipfechaLicen,
            pEmpServPrestados,
            pEmpRetiroConta,
            pEmpRetiroPpto,
            pEmpFechaingReporte,
            pEmpFecharetReporte,
            pEmpTercerNom,
            pEmpUnicoNom,
            pEmpUnicoApe,
            pEmpRenglon,
            pEmpLugarNacText,
            pEmpCodren,
            pEmpElectoralExtendidoEn,
            pEmpTrabajaConyuge,
            pEmpDevengadoConyuge,
            pEmpColegiadoActivo,
            pEmpTipoBonoEsc,
            pEmpAfectoAcep,
            pEmpDescuentaFianza,
            pEmpAfectoMontepio,
            pEmpCoduni,
            pEmpSalario,
            pEmpTipoSalario,
            pEmpAcuerdo,
            pEmpFechaDel,
            pEmpFechaAl,
            pEmpFrecueciaPago,
            pEmpPlanJubila,
            pEmpNoColegiado,
            pEmpBeca,
            pEmpUsaClinica,
            pEmpAcuerdoBaja,
            pEmpJuntadir,
            pEmpFechaPagoBonoescolar,
            pEmpFechaCertTrabajo,
            pEmpJornadaContrato,
            pEmpReligion,
            pEmpOficio,
            pEmpCodgerFun,
            pEmpCoduniFun,
            pEmpCodigoCar,
            pEmpUsuarioOracle,
            pEmpCtaEmpleadosContra,
            pEmpDpi,
            pEmpTelefonoEmpresa,
            pEmpDescIsssJub,
            pEmpCoduniUbi,
            pEmpPrimerApe,
            pEmpSegundoApe,
            pEmpApellidoCas,
            pEmpPrimerNom,
            pEmpSegundoNom,
            pEmpNombreIsss,
            pEmpNombreNit,
            pEmpNombreCip,
            pEmpDireccion,
            pEmpCoddep,
            pEmpCodmun,
            pEmpTelefono,
            pEmpLugarNac,
            pEmpNacionalidad,
            TRUNC(pEmpFechaNac),
            pEmpSexo,
            pEmpProfesion,
            pEmpCip,
            pEmpExpedidaDep,
            pEmpExpedidaMun,
            pEmpExpedidaFecha,
            pEmpNit,
            pEmpIsss,
            pEmpElectoral,
            pEmpEstado,
            pEmpEstadoCivil,
            TRUNC(pEmpFechaIngreso),
            TRUNC(pEmpFechaRetiro),
            pEmpCodmrt,
            pEmpIndemnizacion,
            vUsername,
            sysdate,
            pEmpCodpai,
            pEmpCodubi,
            pEmpCodtpp,
            pEmpCodafn,
            pEmpPeso,
            pEmpEstatura,
            pEmpDonante,
            pEmpTipoSangre,
            pEmpTarjeta,
            pEmpHoraExtra,
            pEmpReubi,
            pEmpReubiIng,
            pEmpInpep,
            pEmpCodcel,
            pEmpDescIsss,
            pEmpClave,
            pEmpCodigoPostal,
            pEmpCoddepNac,
            pEmpCodrli,
            pEmpCasa,
            pEmpPromIngresoFam,
            pEmpImpedimento,
            pEmpCarnetResidente,
            pEmpInternet,
            pEmpCuotaVivienda,
            pEmpQuienCuidaHijos,
            pEmpColegiaturas,
            pEmpVehiModelo,
            pEmpVehiAno,
            pEmpPlaca,
            pEmpServicioMilitar,
            pEmpGradoMilitar,
            pEmpBebidaAlcoholica,
            pEmpFuma,
            pEmpTallaZapatos,
            pEmpTallaCamisa,
            pEmpTallaPantalon,
            pEmpUsaLentes,
            pEmpCodigoAnterior,
            pEmpNup,
            pEmpAfp,
            pEmpCodtpu,
            pEmpCodpue,
            pEmpZona,
            pEmpCodAgente,
            pEmpDomiciliado,
            pEmpArea,
            pEmpComision,
            pEmpSupervisor,
            pEmpRentaDomiciliado,
            pEmpRentaServicio
        )
        RETURNING EMP_CODIGO INTO pEmpCodigo;

        ELSIF pOpcion = 2 THEN
        
        	vUsername := obtenerUsername(pUsuario);
        
            UPDATE PLA_EMP_EMPLEADO SET
                EMP_CODIGO = pEmpCodigo,
                EMP_CODCIA = pEmpCodCia,
                EMP_DPI_FECHA_VENCE = pEmpDpiFechaVence,
                EMP_FECHA_FICHADATOS = pEmpFechaFichadatos,
                EMP_INTERINATO = pEmpInterinato,
                EMP_TIPO_LICENCIA = pEmpTipoLicencia,
                EMP_TIPFECHA_LICEN = pEmpTipfechaLicen,
                EMP_SERV_PRESTADOS = pEmpServPrestados,
                EMP_RETIRO_CONTA = pEmpRetiroConta,
                EMP_RETIRO_PPTO = pEmpRetiroPpto,
                EMP_FECHAING_REPORTE = pEmpFechaingReporte,
                EMP_FECHARET_REPORTE = pEmpFecharetReporte,
                EMP_TERCER_NOM = pEmpTercerNom,
                EMP_UNICO_NOM = pEmpUnicoNom,
                EMP_UNICO_APE = pEmpUnicoApe,
                EMP_RENGLON = pEmpRenglon,
                EMP_LUGAR_NAC_TEXT = pEmpLugarNacText,
                EMP_CODREN = pEmpCodren,
                EMP_ELECTORAL_EXTENDIDO_EN = pEmpElectoralExtendidoEn,
                EMP_TRABAJA_CONYUGE = pEmpTrabajaConyuge,
                EMP_DEVENGADO_CONYUGE = pEmpDevengadoConyuge,
                EMP_COLEGIADO_ACTIVO = pEmpColegiadoActivo,
                EMP_TIPO_BONO_ESC = pEmpTipoBonoEsc,
                EMP_AFECTO_ACEP = pEmpAfectoAcep,
                EMP_DESCUENTA_FIANZA = pEmpDescuentaFianza,
                EMP_AFECTO_MONTEPIO = pEmpAfectoMontepio,
                EMP_CODUNI = pEmpCoduni,
                EMP_SALARIO = pEmpSalario,
                EMP_TIPO_SALARIO = pEmpTipoSalario,
                EMP_ACUERDO = pEmpAcuerdo,
                EMP_FECHA_DEL = pEmpFechaDel,
                EMP_FECHA_AL = pEmpFechaAl,
                EMP_FRECUECIA_PAGO = pEmpFrecueciaPago,
                EMP_PLAN_JUBILA = pEmpPlanJubila,
                EMP_NO_COLEGIADO = pEmpNoColegiado,
                EMP_BECA = pEmpBeca,
                EMP_USA_CLINICA = pEmpUsaClinica,
                EMP_ACUERDO_BAJA = pEmpAcuerdoBaja,
                EMP_JUNTADIR = pEmpJuntadir,
                EMP_FECHA_PAGO_BONOESCOLAR = pEmpFechaPagoBonoescolar,
                EMP_FECHA_CERT_TRABAJO = pEmpFechaCertTrabajo,
                EMP_JORNADA_CONTRATO = pEmpJornadaContrato,
                EMP_RELIGION = pEmpReligion,
                EMP_OFICIO = pEmpOficio,
                EMP_CODGER_FUN = pEmpCodgerFun,
                EMP_CODUNI_FUN = pEmpCoduniFun,
                EMP_CODIGO_CAR = pEmpCodigoCar,
                EMP_USUARIO_ORACLE = pEmpUsuarioOracle,
                EMP_CTA_EMPLEADOS_CONTRA = pEmpCtaEmpleadosContra,
                EMP_DPI = pEmpDpi,
                EMP_TELEFONO_EMPRESA = pEmpTelefonoEmpresa,
                EMP_DESC_ISSS_JUB = pEmpDescIsssJub,
                EMP_CODUNI_UBI = pEmpCoduniUbi,
                EMP_PRIMER_APE = pEmpPrimerApe,
                EMP_SEGUNDO_APE = pEmpSegundoApe,
                EMP_APELLIDO_CAS = pEmpApellidoCas,
                EMP_PRIMER_NOM = pEmpPrimerNom,
                EMP_SEGUNDO_NOM = pEmpSegundoNom,
                EMP_NOMBRE_ISSS = pEmpNombreIsss,
                EMP_NOMBRE_NIT = pEmpNombreNit,
                EMP_NOMBRE_CIP = pEmpNombreCip,
                EMP_DIRECCION = pEmpDireccion,
                EMP_CODDEP = pEmpCoddep,
                EMP_CODMUN = pEmpCodmun,
                EMP_TELEFONO = pEmpTelefono,
                EMP_LUGAR_NAC = pEmpLugarNac,
                EMP_NACIONALIDAD = pEmpNacionalidad,
                EMP_FECHA_NAC = TRUNC(pEmpFechaNac),
                EMP_SEXO = pEmpSexo,
                EMP_PROFESION = pEmpProfesion,
                EMP_CIP = pEmpCip,
                EMP_EXPEDIDA_DEP = pEmpExpedidaDep,
                EMP_EXPEDIDA_MUN = pEmpExpedidaMun,
                EMP_EXPEDIDA_FECHA = pEmpExpedidaFecha,
                EMP_NIT = pEmpNit,
                EMP_ISSS = pEmpIsss,
                EMP_ELECTORAL = pEmpElectoral,
                EMP_ESTADO = pEmpEstado,
                EMP_ESTADO_CIVIL = pEmpEstadoCivil,
                EMP_FECHA_INGRESO = TRUNC(pEmpFechaIngreso),
                EMP_FECHA_RETIRO = TRUNC(pEmpFechaRetiro),
                EMP_CODMRT = pEmpCodmrt,
                EMP_INDEMNIZACION = pEmpIndemnizacion,
                EMP_USUARIO_MOD = vUsername,
                EMP_FECHA_MOD = SYSDATE,
                EMP_CODPAI = pEmpCodpai,
                EMP_CODUBI = pEmpCodubi,
                EMP_CODTPP = pEmpCodtpp,
                EMP_CODAFN = pEmpCodafn,
                EMP_PESO = pEmpPeso,
                EMP_ESTATURA = pEmpEstatura,
                EMP_DONANTE = pEmpDonante,
                EMP_TIPO_SANGRE = pEmpTipoSangre,
                EMP_TARJETA = pEmpTarjeta,
                EMP_HORA_EXTRA = pEmpHoraExtra,
                EMP_REUBI = pEmpReubi,
                EMP_REUBI_ING = pEmpReubiIng,
                EMP_INPEP = pEmpInpep,
                EMP_CODCEL = pEmpCodcel,
                EMP_DESC_ISSS = pEmpDescIsss,
                EMP_CLAVE = pEmpClave,
                EMP_CODIGO_POSTAL = pEmpCodigoPostal,
                EMP_CODDEP_NAC = pEmpCoddepNac,
                EMP_CODRLI = pEmpCodrli,
                EMP_CASA = pEmpCasa,
                EMP_PROM_INGRESO_FAM = pEmpPromIngresoFam,
                EMP_IMPEDIMENTO = pEmpImpedimento,
                EMP_CARNET_RESIDENTE = pEmpCarnetResidente,
                EMP_INTERNET = pEmpInternet,
                EMP_CUOTA_VIVIENDA = pEmpCuotaVivienda,
                EMP_QUIEN_CUIDA_HIJOS = pEmpQuienCuidaHijos,
                EMP_COLEGIATURAS = pEmpColegiaturas,
                EMP_VEHI_MODELO = pEmpVehiModelo,
                EMP_VEHI_ANO = pEmpVehiAno,
                EMP_PLACA = pEmpPlaca,
                EMP_SERVICIO_MILITAR = pEmpServicioMilitar,
                EMP_GRADO_MILITAR = pEmpGradoMilitar,
                EMP_BEBIDA_ALCOHOLICA = pEmpBebidaAlcoholica,
                EMP_FUMA = pEmpFuma,
                EMP_TALLA_ZAPATOS = pEmpTallaZapatos,
                EMP_TALLA_CAMISA = pEmpTallaCamisa,
                EMP_TALLA_PANTALON = pEmpTallaPantalon,
                EMP_USA_LENTES = pEmpUsaLentes,
                EMP_CODIGO_ANTERIOR = pEmpCodigoAnterior,
                EMP_NUP = pEmpNup,
                EMP_AFP = pEmpAfp,
                EMP_CODTPU = pEmpCodtpu,
                EMP_CODPUE = pEmpCodpue,
                EMP_ZONA = pEmpZona,
                EMP_COD_AGENTE = pEmpCodAgente,
                EMP_DOMICILIADO = pEmpDomiciliado,
                EMP_AREA = pEmpArea,
                EMP_COMISION = pEmpComision,
                EMP_SUPERVISOR = pEmpSupervisor,
                EMP_RENTA_DOMICILIADO = pEmpRentaDomiciliado,
                EMP_RENTA_SERVICIO = pEmpRentaServicio
            WHERE EMP_CODIGO = pEmpCodigo;        

        ELSIF pOpcion = 3 THEN
        
        	vUsername := obtenerUsername(pUsuario);
        
            UPDATE PLA_EMP_EMPLEADO SET
                EMP_ESTADO = pEmpEstado,
                EMP_FECHA_INGRESO = NVL2(pEmpFechaIngreso, TRUNC(pEmpFechaIngreso), EMP_FECHA_INGRESO),
                EMP_USUARIO_MOD = vUsername,
                EMP_FECHA_MOD = SYSDATE
            WHERE EMP_CODIGO = pEmpCodigo;
           
        END IF;
        
        COMMIT;
        
     -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
     OPEN pCursor FOR
         SELECT 
    	    CASE 
		        WHEN F.EMF_FOTO IS NOT NULL THEN 1
		        ELSE 0 
		    END AS FOTO_EXISTE,
            E.EMP_CODIGO,
			E.EMP_CODIGO_ANTERIOR,
			E.EMP_PRIMER_APE,
			E.EMP_SEGUNDO_APE,
			E.EMP_APELLIDO_CAS,
			E.EMP_PRIMER_NOM,
			E.EMP_SEGUNDO_NOM,
			E.EMP_TERCER_NOM,
			E.EMP_NOMBRE_ISSS,
			E.EMP_NOMBRE_CIP,
			E.EMP_NOMBRE_NIT,
			E.EMP_DIRECCION,
			E.EMP_CODDEP,
			D.DEP_NOMBRE,
			E.EMP_CODMUN,
			M.MUN_NOMBRE,
			E.EMP_TELEFONO,
			E.EMP_RENGLON,
			E.EMP_CODIGO_POSTAL,
			E.EMP_FECHA_NAC,
			E.EMP_LUGAR_NAC,
			E.EMP_CODDEP_NAC,
			E.EMP_LUGAR_NAC_TEXT,
			E.EMP_NACIONALIDAD,
			E.EMP_AFP,
			E.EMP_COD_AGENTE,
			E.EMP_SUPERVISOR,
			E.EMP_FECHA_INGRESO,
			E.EMP_SEXO,
			E.EMP_ESTADO_CIVIL,
			E.EMP_TIPO_SANGRE,
			E.EMP_PROFESION,
			E.EMP_CODREN,
			E.EMP_ZONA,
			E.EMP_AREA,
			E.EMP_NO_COLEGIADO,
			E.EMP_FECHAING_REPORTE,
			E.EMP_CODUNI_UBI,
			E.EMP_FECHA_FICHADATOS,
			E.EMP_TARJETA,
			E.EMP_HORA_EXTRA,
			E.EMP_DESC_ISSS,
			E.EMP_DESC_ISSS_JUB,
			E.EMP_COLEGIADO_ACTIVO,
			E.EMP_CIP,
			E.EMP_EXPEDIDA_FECHA,
			E.EMP_DPI_FECHA_VENCE,
			E.EMP_EXPEDIDA_DEP,
			E.EMP_EXPEDIDA_MUN,
			E.EMP_DPI,
			E.EMP_COMISION,
			E.EMP_DOMICILIADO,
			E.EMP_SERV_PRESTADOS,
			E.EMP_RENTA_DOMICILIADO,
			E.EMP_RENTA_SERVICIO,
			E.EMP_ESTADO,
			E.EMP_ACUERDO_BAJA,
			E.EMP_CODUBI,
			E.EMP_CODTPP,
			E.EMP_CODAFN,
			E.EMP_ISSS,
			E.EMP_NIT,
			E.EMP_ELECTORAL,
			E.EMP_ELECTORAL_EXTENDIDO_EN,
			E.EMP_CARNET_RESIDENTE,
			E.EMP_NUP,
			E.EMP_REUBI,
			E.EMP_REUBI_ING,
			E.EMP_FECHA_RETIRO,
			E.EMP_FECHARET_REPORTE,
			E.EMP_CODMRT,
			E.EMP_INDEMNIZACION,
			E.EMP_PESO,
			E.EMP_ESTATURA,
			E.EMP_DONANTE,
			E.EMP_INTERNET,
			E.EMP_TALLA_ZAPATOS,
			E.EMP_TALLA_PANTALON,
			E.EMP_TALLA_CAMISA,
			E.EMP_USA_LENTES,
			E.EMP_FUMA,
			E.EMP_BEBIDA_ALCOHOLICA,
			E.EMP_IMPEDIMENTO,
			E.EMP_SERVICIO_MILITAR,
			E.EMP_GRADO_MILITAR,
			E.EMP_CASA,
			E.EMP_CUOTA_VIVIENDA,
			E.EMP_PROM_INGRESO_FAM,
			E.EMP_COLEGIATURAS,
			E.EMP_QUIEN_CUIDA_HIJOS,
			E.EMP_TIPO_BONO_ESC,
			E.EMP_FECHA_PAGO_BONOESCOLAR,
			E.EMP_VEHI_MODELO,
			E.EMP_VEHI_ANO,
			E.EMP_PLACA,
			E.EMP_TIPO_LICENCIA,
			E.EMP_TIPFECHA_LICEN,
			E.EMP_CODRLI,
			E.EMP_CODCIA,
			E.EMP_FECHA_CREA,
			E.EMP_USUARIO_CREA,
			E.EMP_FECHA_MOD,
			E.EMP_USUARIO_MOD,
			E.EMP_CODTPU,
			E.EMP_CODPUE,
			E.EMP_CODUNI,
			E.EMP_SALARIO,
			E.EMP_TIPO_SALARIO,
			E.EMP_FECHA_DEL,
			E.EMP_FECHA_AL,
			E.EMP_ACUERDO,
			E.EMP_JORNADA_CONTRATO,
			E.EMP_TRABAJA_CONYUGE,
			E.EMP_DEVENGADO_CONYUGE,
			E.EMP_AFECTO_ACEP,
			E.EMP_DESCUENTA_FIANZA,
			E.EMP_AFECTO_MONTEPIO,
			E.EMP_FRECUECIA_PAGO,
			E.EMP_PLAN_JUBILA,
			E.EMP_CODCEL,
			E.EMP_BECA,
			E.EMP_USA_CLINICA,
			E.EMP_CTA_EMPLEADOS_CONTRA,
			E.EMP_JUNTADIR,
			E.EMP_INTERINATO
        FROM PLA_EMP_EMPLEADO E
        LEFT JOIN RHEPQ.PLA_DEP_DEPARTAMENTO D ON D.DEP_CODIGO = E.EMP_CODDEP
        LEFT JOIN RHEPQ.PLA_MUN_MUNICIPIO M ON M.MUN_CODIGO = E.EMP_CODMUN
        LEFT JOIN RHEPQ.PLA_EMF_EMPFOTO F ON F.EMF_CODEMP = E.EMP_CODIGO
        WHERE E.EMP_CODIGO = pEmpCodigo;

		ELSIF pOpcion = 5 THEN
    		BEGIN
		        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
				SELECT COUNT(*) INTO vContador
				FROM PLA_EMP_EMPLEADO E
				LEFT JOIN RHEPQ.PLA_DPL_DATOSPLANILLA DP ON E.EMP_CODIGO = DP.DPL_CODEMP
				LEFT JOIN pla_plz_plaza P ON DP.DPL_CODPLZ = P.PLZ_CODIGO
				WHERE E.EMP_CODCIA = pEmpCodCia AND
				(
				    pEmpNombreIsss IS NULL
				    OR pEmpNombreIsss = ''
				    OR (REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND E.EMP_CODIGO = CASE WHEN REGEXP_LIKE(pEmpNombreIsss, '^\d+$') THEN TO_NUMBER(pEmpNombreIsss) ELSE NULL END)
				    OR (NOT REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(E.EMP_CODIGO)) LIKE '%' || LOWER(TRIM(pEmpNombreIsss)) || '%')
				);
		
		        -- Asignar la cantidad total de páginas
		        pTotalPage := vContador;
		       --pTotalPage := CEIL(vContador / pPageSize);
		
		        -- Abrir el cursor para obtener los resultados
		        OPEN pCursor FOR
		            SELECT * FROM (
		                SELECT a.*, ROWNUM rnum
		                FROM (
		                    SELECT
							    E.EMP_CODIGO,
							    E.EMP_CODIGO_ANTERIOR,
							    E.EMP_PRIMER_APE,
							    E.EMP_SEGUNDO_APE,
							    E.EMP_APELLIDO_CAS,
							    E.EMP_PRIMER_NOM,
							    E.EMP_SEGUNDO_NOM,
							    E.EMP_TERCER_NOM,
							    E.EMP_NOMBRE_ISSS,
							    E.EMP_NOMBRE_CIP,
							    E.EMP_NOMBRE_NIT,
							    E.EMP_DIRECCION,
							    E.EMP_CODDEP,
							    E.EMP_CODMUN,
							    E.EMP_TELEFONO,
							    E.EMP_RENGLON,
							    E.EMP_CODIGO_POSTAL,
							    E.EMP_FECHA_NAC,
							    E.EMP_LUGAR_NAC,
							    E.EMP_CODDEP_NAC,
							    E.EMP_LUGAR_NAC_TEXT,
							    E.EMP_NACIONALIDAD,
							    E.EMP_AFP,
							    E.EMP_COD_AGENTE,
							    E.EMP_SUPERVISOR,
							    E.EMP_FECHA_INGRESO,
							    E.EMP_SEXO,
							    E.EMP_ESTADO_CIVIL,
							    E.EMP_TIPO_SANGRE,
							    E.EMP_PROFESION,
							    E.EMP_CODREN,
							    E.EMP_ZONA,
							    E.EMP_AREA,
							    E.EMP_NO_COLEGIADO,
							    E.EMP_FECHAING_REPORTE,
							    E.EMP_CODUNI_UBI,
							    E.EMP_FECHA_FICHADATOS,
							    E.EMP_TARJETA,
							    E.EMP_HORA_EXTRA,
							    E.EMP_DESC_ISSS,
							    E.EMP_DESC_ISSS_JUB,
							    E.EMP_COLEGIADO_ACTIVO,
							    E.EMP_CIP,
							    E.EMP_EXPEDIDA_FECHA,
							    E.EMP_DPI_FECHA_VENCE,
							    E.EMP_EXPEDIDA_DEP,
							    E.EMP_EXPEDIDA_MUN,
							    E.EMP_DPI,
							    E.EMP_COMISION,
							    E.EMP_DOMICILIADO,
							    E.EMP_SERV_PRESTADOS,
							    E.EMP_RENTA_DOMICILIADO,
							    E.EMP_RENTA_SERVICIO,
							    E.EMP_ESTADO,
							    E.EMP_ACUERDO_BAJA,
							    E.EMP_CODUBI,
							    E.EMP_CODTPP,
							    E.EMP_CODAFN,
							    E.EMP_ISSS,
							    E.EMP_NIT,
							    E.EMP_ELECTORAL,
							    E.EMP_ELECTORAL_EXTENDIDO_EN,
							    E.EMP_CARNET_RESIDENTE,
							    E.EMP_NUP,
							    E.EMP_REUBI,
							    E.EMP_REUBI_ING,
							    E.EMP_FECHA_RETIRO,
							    E.EMP_FECHARET_REPORTE,
							    E.EMP_CODMRT,
							    E.EMP_INDEMNIZACION,
							    E.EMP_PESO,
							    E.EMP_ESTATURA,
							    E.EMP_DONANTE,
							    E.EMP_INTERNET,
							    E.EMP_TALLA_ZAPATOS,
							    E.EMP_TALLA_PANTALON,
							    E.EMP_TALLA_CAMISA,
							    E.EMP_USA_LENTES,
							    E.EMP_FUMA,
							    E.EMP_BEBIDA_ALCOHOLICA,
							    E.EMP_IMPEDIMENTO,
							    E.EMP_SERVICIO_MILITAR,
							    E.EMP_GRADO_MILITAR,
							    E.EMP_CASA,
							    E.EMP_CUOTA_VIVIENDA,
							    E.EMP_PROM_INGRESO_FAM,
							    E.EMP_COLEGIATURAS,
							    E.EMP_QUIEN_CUIDA_HIJOS,
							    E.EMP_TIPO_BONO_ESC,
							    E.EMP_FECHA_PAGO_BONOESCOLAR,
							    E.EMP_VEHI_MODELO,
							    E.EMP_VEHI_ANO,
							    E.EMP_PLACA,
							    E.EMP_TIPO_LICENCIA,
							    E.EMP_TIPFECHA_LICEN,
							    E.EMP_CODRLI,
							    E.EMP_FECHA_CREA,
							    E.EMP_USUARIO_CREA,
							    E.EMP_FECHA_MOD,
							    E.EMP_USUARIO_MOD,
							    E.EMP_CODTPU,
							    E.EMP_CODPUE,
							    E.EMP_CODUNI,
							    E.EMP_SALARIO,
							    E.EMP_TIPO_SALARIO,
							    E.EMP_FECHA_DEL,
							    E.EMP_FECHA_AL,
							    E.EMP_ACUERDO,
							    E.EMP_JORNADA_CONTRATO,
							    E.EMP_TRABAJA_CONYUGE,
							    E.EMP_DEVENGADO_CONYUGE,
							    E.EMP_AFECTO_ACEP,
							    E.EMP_DESCUENTA_FIANZA,
							    E.EMP_AFECTO_MONTEPIO,
							    E.EMP_FRECUECIA_PAGO,
							    E.EMP_PLAN_JUBILA,
							    E.EMP_CODCEL,
							    E.EMP_BECA,
							    E.EMP_USA_CLINICA,
							    E.EMP_CTA_EMPLEADOS_CONTRA,
							    E.EMP_JUNTADIR,
							    E.EMP_INTERINATO,
							    P.PLZ_CODIGO,
							    P.PLZ_NOMBRE
							FROM PLA_EMP_EMPLEADO E
							LEFT JOIN RHEPQ.PLA_DPL_DATOSPLANILLA DP ON E.EMP_CODIGO = DP.DPL_CODEMP
							LEFT JOIN pla_plz_plaza P ON DP.DPL_CODPLZ = P.PLZ_CODIGO
							WHERE E.EMP_CODCIA = pEmpCodCia AND
							(
							    pEmpNombreIsss IS NULL
							    OR pEmpNombreIsss = ''
							    OR (REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND E.EMP_CODIGO = CASE WHEN REGEXP_LIKE(pEmpNombreIsss, '^\d+$') THEN TO_NUMBER(pEmpNombreIsss) ELSE NULL END)
								OR (NOT REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(E.EMP_CODIGO)) LIKE '%' || LOWER(TRIM(pEmpNombreIsss)) || '%')
							)
		                    ORDER BY E.EMP_CODCIA, E.EMP_CODIGO
		                ) a
		                WHERE ROWNUM <= pPageNumber * pPageSize
		            )
		            WHERE rnum > (pPageNumber - 1) * pPageSize;
		    END;
		END IF;

    IF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                EMP_CODIGO AS value,
                EMP_PRIMER_APE || ' ' || 
                NVL(EMP_SEGUNDO_APE, '') || ' ' || 
                NVL(EMP_APELLIDO_CAS, '') || ', ' || 
                EMP_PRIMER_NOM || ' ' || 
                NVL(EMP_SEGUNDO_NOM, '') || ' ' || 
                NVL(EMP_TERCER_NOM, '') AS label,
                EMP_INTERNET AS correo
            FROM PLA_EMP_EMPLEADO
            WHERE EMP_CODCIA = pEmpCodCia AND EMP_ESTADO = pEmpEstado
            ORDER BY EMP_PRIMER_APE, EMP_SEGUNDO_APE, EMP_APELLIDO_CAS, EMP_PRIMER_NOM, EMP_SEGUNDO_NOM, EMP_TERCER_NOM;            

     -- Listado de empleados retirados para la recontratacion de empleados
    ELSIF pOpcion = 7 THEN
        OPEN pCursor FOR
            SELECT
                EMP_CODCIA,
                EMP_CODIGO,
                EMP_NOMBRE_CIP,
                EMP_FECHA_INGRESO,
                EMP_ESTADO
            FROM PLA_EMP_EMPLEADO
            WHERE EMP_ESTADO = 'R'
            ORDER BY EMP_FECHA_INGRESO, EMP_CODIGO;
           
        -- Listado de pantalla prestadores de servicio
    ELSIF pOpcion = 8 THEN
    		BEGIN
		        -- Contar la cantidad de registros que cumplen con los criterios de búsqueda
				SELECT COUNT(*) INTO vContador
				FROM PLA_EMP_EMPLEADO E
				WHERE  E.Emp_codren Not In (011,022) AND E.EMP_CODCIA = pEmpCodCia AND
				(
				    pEmpNombreIsss IS NULL
				    OR pEmpNombreIsss = ''
				    OR (REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND E.EMP_CODIGO = CASE WHEN REGEXP_LIKE(pEmpNombreIsss, '^\d+$') THEN TO_NUMBER(pEmpNombreIsss) ELSE NULL END)
				    OR (NOT REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(E.EMP_CODIGO)) LIKE '%' || LOWER(TRIM(pEmpNombreIsss)) || '%')
				);
		
		        -- Asignar la cantidad total de páginas
		        pTotalPage := vContador;
		       --pTotalPage := CEIL(vContador / pPageSize);
		
		        -- Abrir el cursor para obtener los resultados
		        OPEN pCursor FOR
		            SELECT * FROM (
		                SELECT a.*, ROWNUM rnum
		                FROM (
		                    SELECT
							    E.EMP_CODIGO,
							    E.EMP_CODIGO_ANTERIOR,
							    E.EMP_PRIMER_APE,
							    E.EMP_SEGUNDO_APE,
							    E.EMP_APELLIDO_CAS,
							    E.EMP_PRIMER_NOM,
							    E.EMP_SEGUNDO_NOM,
							    E.EMP_TERCER_NOM,
							    E.EMP_NOMBRE_ISSS,
							    E.EMP_NOMBRE_CIP,
							    E.EMP_NOMBRE_NIT,
							    E.EMP_DIRECCION,
							    E.EMP_CODDEP,
							    E.EMP_CODMUN,
							    E.EMP_TELEFONO,
							    E.EMP_RENGLON,
							    E.EMP_CODIGO_POSTAL,
							    E.EMP_FECHA_NAC,
							    E.EMP_LUGAR_NAC,
							    E.EMP_CODDEP_NAC,
							    E.EMP_LUGAR_NAC_TEXT,
							    E.EMP_NACIONALIDAD,
							    E.EMP_AFP,
							    E.EMP_COD_AGENTE,
							    E.EMP_SUPERVISOR,
							    E.EMP_FECHA_INGRESO,
							    E.EMP_SEXO,
							    E.EMP_ESTADO_CIVIL,
							    E.EMP_TIPO_SANGRE,
							    E.EMP_PROFESION,
							    E.EMP_CODREN,
							    E.EMP_ZONA,
							    E.EMP_AREA,
							    E.EMP_NO_COLEGIADO,
							    E.EMP_FECHAING_REPORTE,
							    E.EMP_CODUNI_UBI,
							    E.EMP_FECHA_FICHADATOS,
							    E.EMP_TARJETA,
							    E.EMP_HORA_EXTRA,
							    E.EMP_DESC_ISSS,
							    E.EMP_DESC_ISSS_JUB,
							    E.EMP_COLEGIADO_ACTIVO,
							    E.EMP_CIP,
							    E.EMP_EXPEDIDA_FECHA,
							    E.EMP_DPI_FECHA_VENCE,
							    E.EMP_EXPEDIDA_DEP,
							    E.EMP_EXPEDIDA_MUN,
							    E.EMP_DPI,
							    E.EMP_COMISION,
							    E.EMP_DOMICILIADO,
							    E.EMP_SERV_PRESTADOS,
							    E.EMP_RENTA_DOMICILIADO,
							    E.EMP_RENTA_SERVICIO,
							    E.EMP_ESTADO,
							    E.EMP_ACUERDO_BAJA,
							    E.EMP_CODUBI,
							    E.EMP_CODTPP,
							    E.EMP_CODAFN,
							    E.EMP_ISSS,
							    E.EMP_NIT,
							    E.EMP_ELECTORAL,
							    E.EMP_ELECTORAL_EXTENDIDO_EN,
							    E.EMP_CARNET_RESIDENTE,
							    E.EMP_NUP,
							    E.EMP_REUBI,
							    E.EMP_REUBI_ING,
							    E.EMP_FECHA_RETIRO,
							    E.EMP_FECHARET_REPORTE,
							    E.EMP_CODMRT,
							    E.EMP_INDEMNIZACION,
							    E.EMP_PESO,
							    E.EMP_ESTATURA,
							    E.EMP_DONANTE,
							    E.EMP_INTERNET,
							    E.EMP_TALLA_ZAPATOS,
							    E.EMP_TALLA_PANTALON,
							    E.EMP_TALLA_CAMISA,
							    E.EMP_USA_LENTES,
							    E.EMP_FUMA,
							    E.EMP_BEBIDA_ALCOHOLICA,
							    E.EMP_IMPEDIMENTO,
							    E.EMP_SERVICIO_MILITAR,
							    E.EMP_GRADO_MILITAR,
							    E.EMP_CASA,
							    E.EMP_CUOTA_VIVIENDA,
							    E.EMP_PROM_INGRESO_FAM,
							    E.EMP_COLEGIATURAS,
							    E.EMP_QUIEN_CUIDA_HIJOS,
							    E.EMP_TIPO_BONO_ESC,
							    E.EMP_FECHA_PAGO_BONOESCOLAR,
							    E.EMP_VEHI_MODELO,
							    E.EMP_VEHI_ANO,
							    E.EMP_PLACA,
							    E.EMP_TIPO_LICENCIA,
							    E.EMP_TIPFECHA_LICEN,
							    E.EMP_CODRLI,
							    E.EMP_FECHA_CREA,
							    E.EMP_USUARIO_CREA,
							    E.EMP_FECHA_MOD,
							    E.EMP_USUARIO_MOD,
							    E.EMP_CODTPU,
							    E.EMP_CODPUE,
							    E.EMP_CODUNI,
							    E.EMP_SALARIO,
							    E.EMP_TIPO_SALARIO,
							    E.EMP_FECHA_DEL,
							    E.EMP_FECHA_AL,
							    E.EMP_ACUERDO,
							    E.EMP_JORNADA_CONTRATO,
							    E.EMP_TRABAJA_CONYUGE,
							    E.EMP_DEVENGADO_CONYUGE,
							    E.EMP_AFECTO_ACEP,
							    E.EMP_DESCUENTA_FIANZA,
							    E.EMP_AFECTO_MONTEPIO,
							    E.EMP_FRECUECIA_PAGO,
							    E.EMP_PLAN_JUBILA,
							    E.EMP_CODCEL,
							    E.EMP_BECA,
							    E.EMP_USA_CLINICA,
							    E.EMP_CTA_EMPLEADOS_CONTRA,
							    E.EMP_JUNTADIR,
							    E.EMP_INTERINATO
							FROM PLA_EMP_EMPLEADO E
							WHERE E.Emp_codren Not In (011,022) AND E.EMP_CODCIA = pEmpCodCia AND
							(
							    pEmpNombreIsss IS NULL
							    OR pEmpNombreIsss = ''
							    OR (REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND E.EMP_CODIGO = CASE WHEN REGEXP_LIKE(pEmpNombreIsss, '^\d+$') THEN TO_NUMBER(pEmpNombreIsss) ELSE NULL END)
								OR (NOT REGEXP_LIKE(pEmpNombreIsss, '^\d+$') AND LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(E.EMP_CODIGO)) LIKE '%' || LOWER(TRIM(pEmpNombreIsss)) || '%')
							)
		                    ORDER BY E.EMP_CODCIA, E.EMP_CODIGO
		                ) a
		                WHERE ROWNUM <= pPageNumber * pPageSize
		            )
		            WHERE rnum > (pPageNumber - 1) * pPageSize;
		    END;
		   
	-- select empleado por renglon y estado
   	ELSIF pOpcion = 9 THEN
        OPEN pCursor FOR
            SELECT 
                EMP_CODIGO AS value,
                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(EMP_CODIGO) AS label
            FROM PLA_EMP_EMPLEADO
            WHERE EMP_CODCIA = pEmpCodCia AND EMP_ESTADO = pEmpEstado AND EMP_CODREN = pEmpCodren
            ORDER BY ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(EMP_CODIGO);  
        
    END IF;
   
   EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_EMP_EMPLEADO;


    ------------------------------------------------
   
	-- ############### PANTALLA DE INGRESOS FIJOS // DATOS DE PLANILLA

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_INF_INGRESOS_FIJOS(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pInfCodCia IN VARCHAR2,
    pInfCodEmp IN NUMBER,
    pInfCodTig IN VARCHAR2,
    pInfValor IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_INF_INGRESOS_FIJOS (
            INF_CODCIA,
            INF_CODEMP,
            INF_CODTIG,
            INF_VALOR
        ) VALUES (
            pInfCodCia,
            pInfCodEmp,
            pInfCodTig,
            pInfValor
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_INF_INGRESOS_FIJOS SET
            INF_CODCIA = pInfCodCia,
            INF_CODEMP = pInfCodEmp,            
            INF_VALOR = pInfValor
        WHERE ROWID = pRowId;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                INF_CODCIA,
                INF_CODEMP,
                INF_CODTIG,
                INF_VALOR
            FROM PLA_INF_INGRESOS_FIJOS
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_INF_INGRESOS_FIJOS WHERE INF_CODCIA = pInfCodCia AND INF_CODEMP = pInfCodEmp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        INF_CODCIA,
                        INF_CODEMP,
                        INF_CODTIG,
                        INF_VALOR
                    FROM PLA_INF_INGRESOS_FIJOS
                    WHERE INF_CODCIA = pInfCodCia AND INF_CODEMP = pInfCodEmp
                    ORDER BY INF_CODCIA, INF_CODEMP, INF_CODTIG
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT INF_CODCIA AS value, INF_CODEMP || '-' || INF_CODTIG AS label
            FROM PLA_INF_INGRESOS_FIJOS
            WHERE INF_CODCIA = pInfCodCia AND INF_CODEMP = pInfCodEmp
            ORDER BY INF_CODCIA, INF_CODEMP, INF_CODTIG;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_INF_INGRESOS_FIJOS;

    ------------------------------------------------
   
-- ############### PANTALLA DE INGRESOS FIJOS // DATOS DE PLANILLA

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_DPL_DATOSPLANILLA(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pDplCodCia IN OUT VARCHAR2,
    pDplCodEmp IN OUT NUMBER,
    pDplSalario IN NUMBER,
    pDplBonificacion IN NUMBER,
    pDplViaticos IN NUMBER,
    pDplHorasDia IN NUMBER,
    pDplCodplz IN NUMBER,
    pDplSegumed IN VARCHAR2,
    pDplSeguvehi IN VARCHAR2,
    pDplPrimavehi IN NUMBER,
    pDplTipoContrato IN VARCHAR2,
    pDplTipoSalario IN VARCHAR2,
    pDplHrsManana IN VARCHAR2,
    pDplHrsTarde IN VARCHAR2,
    pDplFormaPago IN VARCHAR2,
    pDplCodicr IN VARCHAR2,
    pDplCuentaBanco IN VARCHAR2,
    pDplTipoCuenta IN VARCHAR2,
    pDplSindicato IN VARCHAR2,
    pDplFondoVac IN VARCHAR2,
    pDplUltimoAumento IN DATE,
    pDplUsuarioCrea IN VARCHAR2,    
    pDplUsuarioMod IN VARCHAR2,    
    pDplFamilia IN VARCHAR2,
    pDplCodjor IN VARCHAR2,
    pDplMedica IN VARCHAR2,
    pDplFondo IN VARCHAR2,
    pDplInpep IN VARCHAR2,
    pDplTipoRenta IN VARCHAR2,
    pDplAtconsaCuota IN NUMBER,
    pDplAtconsaPor IN NUMBER,
    pDplFondoEmpleado IN NUMBER,
    pDplFondoPatrono IN NUMBER,
    pDplExtra IN NUMBER,
    pDplTransporte IN NUMBER,
    pDplActivo IN VARCHAR2,
    pDplHrsSabado IN VARCHAR2,
    pDplSindicatoStepq IN VARCHAR2,
    pDplSindicatoSinund IN VARCHAR2,
    pDplSindicatoStupepqpz IN VARCHAR2,
    pDplSindicatoOstracompq IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,    
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_DPL_DATOSPLANILLA (
            DPL_CODCIA,
            DPL_CODEMP,
            DPL_SALARIO,
            DPL_BONIFICACION,
            DPL_VIATICOS,
            DPL_HORAS_DIA,
            DPL_CODPLZ,
            DPL_SEGUMED,
            DPL_SEGUVEHI,
            DPL_PRIMAVEHI,
            DPL_TIPO_CONTRATO,
            DPL_TIPO_SALARIO,
            DPL_HRS_MANANA,
            DPL_HRS_TARDE,
            DPL_FORMA_PAGO,
            DPL_CODICR,
            DPL_CUENTA_BANCO,
            DPL_TIPO_CUENTA,
            DPL_SINDICATO,
            DPL_FONDO_VAC,
            DPL_ULTIMO_AUMENTO,
            DPL_USUARIO_CREA,
            DPL_FECHA_CREA,
            DPL_USUARIO_MOD,
            DPL_FECHA_MOD,
            DPL_FAMILIA,
            DPL_CODJOR,
            DPL_MEDICA,
            DPL_FONDO,
            DPL_INPEP,
            DPL_TIPO_RENTA,
            DPL_ATCONSA_CUOTA,
            DPL_ATCONSA_POR,
            DPL_FONDO_EMPLEADO,
            DPL_FONDO_PATRONO,
            DPL_EXTRA,
            DPL_TRANSPORTE,
            DPL_ACTIVO,
            DPL_HRS_SABADO,
            DPL_SINDICATO_STEPQ,
            DPL_SINDICATO_SINUND,
            DPL_SINDICATO_STUPEPQPZ,
            DPL_SINDICATO_OSTRACOMPQ
        ) VALUES (
            pDplCodCia,
            pDplCodEmp,
            pDplSalario,
            pDplBonificacion,
            pDplViaticos,
            pDplHorasDia,
            pDplCodplz,
            pDplSegumed,
            pDplSeguvehi,
            pDplPrimavehi,
            pDplTipoContrato,
            pDplTipoSalario,
            pDplHrsManana,
            pDplHrsTarde,
            pDplFormaPago,
            pDplCodicr,
            pDplCuentaBanco,
            pDplTipoCuenta,
            pDplSindicato,
            pDplFondoVac,
            pDplUltimoAumento,
            pDplUsuarioCrea,
            SYSDATE,
            null,
            null,
            pDplFamilia,
            pDplCodjor,
            pDplMedica,
            pDplFondo,
            pDplInpep,
            pDplTipoRenta,
            pDplAtconsaCuota,
            pDplAtconsaPor,
            pDplFondoEmpleado,
            pDplFondoPatrono,
            pDplExtra,
            pDplTransporte,
            pDplActivo,
            pDplHrsSabado,
            pDplSindicatoStepq,
            pDplSindicatoSinund,
            pDplSindicatoStupepqpz,
            pDplSindicatoOstracompq
        )
        RETURNING ROWID INTO pRowId;      
    

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_DPL_DATOSPLANILLA SET
        	DPL_CODCIA = pDplCodCia,
        	DPL_CODEMP = pDplCodEmp,
            DPL_SALARIO = pDplSalario,
            DPL_BONIFICACION = pDplBonificacion,
            DPL_VIATICOS = pDplViaticos,
            DPL_HORAS_DIA = pDplHorasDia,
            DPL_CODPLZ = pDplCodplz,
            DPL_SEGUMED = pDplSegumed,
            DPL_SEGUVEHI = pDplSeguvehi,
            DPL_PRIMAVEHI = pDplPrimavehi,
            DPL_TIPO_CONTRATO = pDplTipoContrato,
            DPL_TIPO_SALARIO = pDplTipoSalario,
            DPL_HRS_MANANA = pDplHrsManana,
            DPL_HRS_TARDE = pDplHrsTarde,
            DPL_FORMA_PAGO = pDplFormaPago,
            DPL_CODICR = pDplCodicr,
            DPL_CUENTA_BANCO = pDplCuentaBanco,
            DPL_TIPO_CUENTA = pDplTipoCuenta,
            DPL_SINDICATO = pDplSindicato,
            DPL_FONDO_VAC = pDplFondoVac,
            DPL_ULTIMO_AUMENTO = pDplUltimoAumento,
            DPL_USUARIO_MOD = pDplUsuarioMod,
            DPL_FECHA_MOD = SYSDATE,
            DPL_FAMILIA = pDplFamilia,
            DPL_CODJOR = pDplCodjor,
            DPL_MEDICA = pDplMedica,
            DPL_FONDO = pDplFondo,
            DPL_INPEP = pDplInpep,
            DPL_TIPO_RENTA = pDplTipoRenta,
            DPL_ATCONSA_CUOTA = pDplAtconsaCuota,
            DPL_ATCONSA_POR = pDplAtconsaPor,
            DPL_FONDO_EMPLEADO = pDplFondoEmpleado,
            DPL_FONDO_PATRONO = pDplFondoPatrono,
            DPL_EXTRA = pDplExtra,
            DPL_TRANSPORTE = pDplTransporte,
            DPL_ACTIVO = pDplActivo,
            DPL_HRS_SABADO = pDplHrsSabado,
            DPL_SINDICATO_STEPQ = pDplSindicatoStepq,
            DPL_SINDICATO_SINUND = pDplSindicatoSinund,
            DPL_SINDICATO_STUPEPQPZ = pDplSindicatoStupepqpz,
            DPL_SINDICATO_OSTRACOMPQ = pDplSindicatoOstracompq        
       WHERE ROWID = pRowId;
    
   END IF; -- Cierra el primer bloque IF

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			SELECT
			    DPL.ROWID AS id,
			    DPL.DPL_CODCIA,
			    DPL.DPL_CODEMP,
			    DPL.DPL_SALARIO,
			    DPL.DPL_BONIFICACION,
			    DPL.DPL_VIATICOS,
			    DPL.DPL_HORAS_DIA,
			    DPL.DPL_CODPLZ,
			    P.PLZ_NOMBRE AS PlazaNombre,
			    DPL.DPL_SEGUMED,
			    DPL.DPL_SEGUVEHI,
			    DPL.DPL_PRIMAVEHI,
			    DPL.DPL_TIPO_CONTRATO,
			    DPL.DPL_TIPO_SALARIO,
			    DPL.DPL_HRS_MANANA,
			    DPL.DPL_HRS_TARDE,
			    DPL.DPL_FORMA_PAGO,
			    DPL.DPL_CODICR,
			    DPL.DPL_CUENTA_BANCO,
			    DPL.DPL_TIPO_CUENTA,
			    DPL.DPL_SINDICATO,
			    DPL.DPL_FONDO_VAC,
			    DPL.DPL_ULTIMO_AUMENTO,
			    DPL.DPL_USUARIO_CREA,
			    DPL.DPL_FECHA_CREA,
			    DPL.DPL_USUARIO_MOD,
			    DPL.DPL_FECHA_MOD,
			    DPL.DPL_FAMILIA,
			    DPL.DPL_CODJOR,
			    DPL.DPL_CODJOR || ' - ' || JOR.JOR_DESCRIPCION AS JOR_DESCRIPCION,
			    DPL.DPL_MEDICA,
			    DPL.DPL_FONDO,
			    DPL.DPL_INPEP,
			    DPL.DPL_TIPO_RENTA,
			    DPL.DPL_ATCONSA_CUOTA,
			    DPL.DPL_ATCONSA_POR,
			    DPL.DPL_FONDO_EMPLEADO,
			    DPL.DPL_FONDO_PATRONO,
			    DPL.DPL_EXTRA,
			    DPL.DPL_TRANSPORTE,
			    DPL.DPL_ACTIVO,
			    DPL.DPL_HRS_SABADO,
			    DPL.DPL_SINDICATO_STEPQ,
			    DPL.DPL_SINDICATO_SINUND,
			    DPL.DPL_SINDICATO_STUPEPQPZ,
			    DPL.DPL_SINDICATO_OSTRACOMPQ			    
			FROM PLA_DPL_DATOSPLANILLA DPL
			LEFT JOIN pla_plz_plaza P ON P.PLZ_CODIGO = DPL.DPL_CODPLZ
			LEFT JOIN RHEPQ.PLA_JOR_JORNADA JOR ON JOR.JOR_CODIGO = DPL.DPL_CODJOR
			WHERE DPL.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador 
	    FROM PLA_DPL_DATOSPLANILLA DPL
	    LEFT JOIN pla_plz_plaza P ON P.PLZ_CODIGO = DPL.DPL_CODPLZ
	    WHERE DPL.DPL_CODCIA = pDplCodCia AND DPL.DPL_CODEMP = pDplCodEmp;
	    pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir cursor para la consulta paginada con JOIN
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT temp.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    DPL.ROWID AS id,
	                    DPL.DPL_SALARIO,
	                    DPL.DPL_BONIFICACION,
	                    DPL.DPL_VIATICOS,
	                    DPL.DPL_EXTRA,
	                    DPL.DPL_TRANSPORTE,
	                    DPL.DPL_TIPO_SALARIO,
	                    DPL.DPL_TIPO_CONTRATO,
	                    DPL.DPL_FORMA_PAGO,
	                    DPL.DPL_CODICR,
	                    DPL.DPL_CUENTA_BANCO,
	                    DPL.DPL_TIPO_CUENTA,
	                    DPL.DPL_FAMILIA,
	                    DPL.DPL_ULTIMO_AUMENTO,
	                    DPL.DPL_FONDO_EMPLEADO,
	                    DPL.DPL_FONDO_PATRONO,
	                    DPL.DPL_CODPLZ,
	                    P.PLZ_NOMBRE PlazaNombre,
	                    DPL.DPL_HRS_MANANA,
	                    DPL.DPL_HRS_TARDE,
	                    DPL.DPL_HRS_SABADO,
	                    DPL.DPL_CODJOR,
	                    DPL.DPL_CODJOR || ' - ' || JOR.JOR_DESCRIPCION AS JOR_DESCRIPCION,
	                    DPL.DPL_HORAS_DIA,
	                    DPL.DPL_ACTIVO,
	                    DPL.DPL_SINDICATO_STEPQ,
	                    DPL.DPL_SINDICATO,
	                    DPL.DPL_SINDICATO_SINUND,
	                    DPL.DPL_SINDICATO_STUPEPQPZ,
	                    DPL.DPL_SINDICATO_OSTRACOMPQ,
	                    DPL.DPL_ATCONSA_CUOTA,
	                    DPL.DPL_ATCONSA_POR,
	                    DPL.DPL_CODCIA,
	                    DPL.DPL_CODEMP,
	                    DPL.DPL_TIPO_RENTA,
	                    DPL.DPL_SEGUMED,
	                    DPL.DPL_SEGUVEHI,
	                    DPL.DPL_PRIMAVEHI,
	                    DPL.DPL_INPEP,
	                    DPL.DPL_MEDICA,
	                    DPL.DPL_FONDO,
	                    DPL.DPL_USUARIO_CREA,
	                    DPL.DPL_FECHA_CREA,
	                    DPL.DPL_FECHA_MOD,
	                    DPL.DPL_USUARIO_MOD,
	                    DPL.DPL_FONDO_VAC
	                FROM PLA_DPL_DATOSPLANILLA DPL
	                LEFT JOIN pla_plz_plaza P ON P.PLZ_CODIGO = DPL.DPL_CODPLZ
	                LEFT JOIN RHEPQ.PLA_JOR_JORNADA JOR ON JOR.JOR_CODIGO = DPL.DPL_CODJOR
	                WHERE DPL.DPL_CODCIA = pDplCodCia AND DPL.DPL_CODEMP = pDplCodEmp
	                ORDER BY DPL.DPL_CODCIA, DPL.DPL_CODEMP
	            ) temp
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
         ELSIF pOpcion = 7 THEN
	          OPEN pCursor FOR
		         SELECT
				    Dpl.Dpl_CodCia,
				    Dpl.Dpl_CodEmp,
				    Dpl.Dpl_CodPlz,
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N1,'0000'))||'-'||
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N2,'000'))||'-'||
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N3,'00'))||'-'||
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N4,'00'))||'-'||
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N5,'00'))||'-'||
				    LTrim(TO_CHAR(Plz.Plz_Ppr_N6,'00')) AS Partida
				FROM
				    Pla_Dpl_DatosPlanilla Dpl
				INNER JOIN
				    Pla_Plz_Plaza Plz ON Dpl.Dpl_CodCia = Plz.Plz_CodCia AND Dpl.Dpl_CodPlz = Plz.Plz_Codigo
				WHERE
				    Dpl.Dpl_CodCia = 1
				    AND Dpl.Dpl_CodEmp = pDplCodEmp;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_DPL_DATOSPLANILLA;

    ------------------------------------------------
   
	-- ############### PANTALLA DE FAMILIARES DEPENDIENTES // FAMILIARES DEPENDIENTES

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_FDE_FAMILIADEP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pFdeSecuencial IN NUMBER,
    pFdeCodcia IN VARCHAR2,
    pFdeCodemp IN NUMBER,
    pFdeEstudia IN VARCHAR2,
    pFdeNivelEstudio IN VARCHAR2,
    pFdeLugarEstudio IN VARCHAR2,
    pFdeDepende IN VARCHAR2,
    pFdeTrabaja IN VARCHAR2,
    pFdeCedula IN VARCHAR2,
    pFdeBeneficiario IN VARCHAR2,
    pFdePorcSeguroVida IN NUMBER,
    pFdeIncapacidad IN VARCHAR2,
    pFdeEntregoInscripcion IN VARCHAR2,
    pFdeEntregoCierreCiclo IN VARCHAR2,
    pFdeFechaPagoBonoEscolar IN DATE,
    pFdeLugarNac IN VARCHAR2,
    pFdeTipoSangre IN VARCHAR2,
    pFdeProfesion IN VARCHAR2,
    pFdeOficio IN VARCHAR2,
    pFdeReligion IN VARCHAR2,
    pFdeCoddep IN VARCHAR2,
    pFdeCodmun IN VARCHAR2,
    pFdeDireccion IN VARCHAR2,
    pFdeTelefono IN VARCHAR2,
    pFdeDescIncapa IN VARCHAR2,
    pEmpdepCodigo IN NUMBER,
    pFdeNombre IN VARCHAR2,
    pFdeFechaNac IN DATE,
    pFdeCodprt IN VARCHAR2,
    pFdeSexo IN VARCHAR2,
    pFdeEdoCivil IN VARCHAR2,
    pFdeEstado IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

        -- Opción 1: Inserción
    IF pOpcion = 1 THEN
        INSERT INTO PLA_FDE_FAMILIADEP (
            FDE_SECUENCIAL,
            FDE_CODCIA,
            FDE_CODEMP,
            FDE_ESTUDIA,
            FDE_NIVEL_ESTUDIO,
            FDE_LUGAR_ESTUDIO,
            FDE_DEPENDE,
            FDE_TRABAJA,
            FDE_CEDULA,
            FDE_BENEFICIARIO,
            FDE_PORC_SEGURO_VIDA,
            FDE_INCAPACIDAD,
            FDE_ENTREGO_INSCRIPCION,
            FDE_ENTREGO_CIERRE_CICLO,
            FDE_FECHAPAGO_BONOESCOLAR,
            FDE_LUGAR_NAC,
            FDE_TIPO_SANGRE,
            FDE_PROFESION,
            FDE_OFICIO,
            FDE_RELIGION,
            FDE_CODDEP,
            FDE_CODMUN,
            FDE_DIRECCION,
            FDE_TELEFONO,
            FDE_DESC_INCAPA,
            EMPDEP_CODIGO,
            FDE_NOMBRE,
            FDE_FECHA_NAC,
            FDE_CODPRT,
            FDE_SEXO,
            FDE_EDO_CIVIL,
            FDE_ESTADO
        ) VALUES (
            pFdeSecuencial,
            pFdeCodcia,
            pFdeCodemp,
            pFdeEstudia,
            pFdeNivelEstudio,
            pFdeLugarEstudio,
            pFdeDepende,
            pFdeTrabaja,
            pFdeCedula,
            pFdeBeneficiario,
            pFdePorcSeguroVida,
            pFdeIncapacidad,
            pFdeEntregoInscripcion,
            pFdeEntregoCierreCiclo,
            pFdeFechaPagoBonoEscolar,
            pFdeLugarNac,
            pFdeTipoSangre,
            pFdeProfesion,
            pFdeOficio,
            pFdeReligion,
            pFdeCoddep,
            pFdeCodmun,
            pFdeDireccion,
            pFdeTelefono,
            pFdeDescIncapa,
            pEmpdepCodigo,
            pFdeNombre,
            pFdeFechaNac,
            pFdeCodprt,
            pFdeSexo,
            pFdeEdoCivil,
            pFdeEstado
        )
        RETURNING ROWID INTO pRowId;

    -- Opción 2: Actualización
    ELSIF pOpcion = 2 THEN
        UPDATE PLA_FDE_FAMILIADEP SET
            FDE_CODCIA = pFdeCodcia,
            FDE_CODEMP = pFdeCodemp,
            FDE_ESTUDIA = pFdeEstudia,
            FDE_NIVEL_ESTUDIO = pFdeNivelEstudio,
            FDE_LUGAR_ESTUDIO = pFdeLugarEstudio,
            FDE_DEPENDE = pFdeDepende,
            FDE_TRABAJA = pFdeTrabaja,
            FDE_CEDULA = pFdeCedula,
            FDE_BENEFICIARIO = pFdeBeneficiario,
            FDE_PORC_SEGURO_VIDA = pFdePorcSeguroVida,
            FDE_INCAPACIDAD = pFdeIncapacidad,
            FDE_ENTREGO_INSCRIPCION = pFdeEntregoInscripcion,
            FDE_ENTREGO_CIERRE_CICLO = pFdeEntregoCierreCiclo,
            FDE_FECHAPAGO_BONOESCOLAR = pFdeFechaPagoBonoEscolar,
            FDE_LUGAR_NAC = pFdeLugarNac,
            FDE_TIPO_SANGRE = pFdeTipoSangre,
            FDE_PROFESION = pFdeProfesion,
            FDE_OFICIO = pFdeOficio,
            FDE_RELIGION = pFdeReligion,
            FDE_CODDEP = pFdeCoddep,
            FDE_CODMUN = pFdeCodmun,
            FDE_DIRECCION = pFdeDireccion,
            FDE_TELEFONO = pFdeTelefono,
            FDE_DESC_INCAPA = pFdeDescIncapa,
            EMPDEP_CODIGO = pEmpdepCodigo,
            FDE_NOMBRE = pFdeNombre,
            FDE_FECHA_NAC = pFdeFechaNac,
            FDE_CODPRT = pFdeCodprt,
            FDE_SEXO = pFdeSexo,
            FDE_EDO_CIVIL = pFdeEdoCivil          
        WHERE ROWID = pRowId;    
   
       -- Opción 3: Cambio de estado
    ELSIF pOpcion = 3 THEN
        UPDATE PLA_FDE_FAMILIADEP SET
            FDE_ESTADO = pFdeEstado
        WHERE ROWID = pRowId;
    END IF;

    COMMIT;    

     -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
             SELECT 
             	ROWID AS id,
                FDE_SECUENCIAL,
                FDE_CODCIA,
                FDE_CODEMP,
                FDE_ESTUDIA,
                FDE_NIVEL_ESTUDIO,
                FDE_LUGAR_ESTUDIO,
                FDE_DEPENDE,
                FDE_TRABAJA,
                FDE_CEDULA,
                FDE_BENEFICIARIO,
                FDE_PORC_SEGURO_VIDA,
                FDE_INCAPACIDAD,
                FDE_ENTREGO_INSCRIPCION,
                FDE_ENTREGO_CIERRE_CICLO,
                FDE_FECHAPAGO_BONOESCOLAR,
                FDE_LUGAR_NAC,
                FDE_TIPO_SANGRE,
                FDE_PROFESION,
                FDE_OFICIO,
                FDE_RELIGION,
                FDE_CODDEP,
                FDE_CODMUN,
                FDE_DIRECCION,
                FDE_TELEFONO,
                FDE_DESC_INCAPA,
                EMPDEP_CODIGO,
                FDE_NOMBRE,
                FDE_FECHA_NAC,
                FDE_CODPRT,
                FDE_SEXO,
                FDE_EDO_CIVIL,
                FDE_ESTADO
            FROM PLA_FDE_FAMILIADEP
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
            SELECT COUNT(*) INTO vContador FROM PLA_FDE_FAMILIADEP WHERE FDE_CODEMP = pFdeCodemp;
            pTotalPage := CEIL(vContador / pPageSize);

            OPEN pCursor FOR
                SELECT * FROM (
                    SELECT temp.*, ROWNUM rnum
                    FROM (
                        SELECT 
                        	ROWID AS id,
                            FDE_SECUENCIAL,
                            FDE_CODCIA,
                            FDE_CODEMP,
                            FDE_ESTUDIA,
                            FDE_NIVEL_ESTUDIO,
                            FDE_LUGAR_ESTUDIO,
                            FDE_DEPENDE,
                            FDE_TRABAJA,
                            FDE_CEDULA,
                            FDE_BENEFICIARIO,
                            FDE_PORC_SEGURO_VIDA,
                            FDE_INCAPACIDAD,
                            FDE_ENTREGO_INSCRIPCION,
                            FDE_ENTREGO_CIERRE_CICLO,
                            FDE_FECHAPAGO_BONOESCOLAR,
                            FDE_LUGAR_NAC,
                            FDE_TIPO_SANGRE,
                            FDE_PROFESION,
                            FDE_OFICIO,
                            FDE_RELIGION,
                            FDE_CODDEP,
                            FDE_CODMUN,
                            FDE_DIRECCION,
                            FDE_TELEFONO,
                            FDE_DESC_INCAPA,
                            EMPDEP_CODIGO,
                            FDE_NOMBRE,
                            FDE_FECHA_NAC,
                            FDE_CODPRT,
                            FDE_SEXO,
                            FDE_EDO_CIVIL,
                            FDE_ESTADO
                        FROM PLA_FDE_FAMILIADEP
                        WHERE FDE_CODEMP = pFdeCodemp
                        ORDER BY FDE_SECUENCIAL
                    ) temp
                    WHERE ROWNUM <= pPageNumber * pPageSize
                )
                WHERE rnum > (pPageNumber - 1) * pPageSize;

        -- Opción 6: Listado para selección (dropdown, etc.)
        ELSIF pOpcion = 6 THEN
            OPEN pCursor FOR
                SELECT 
                    FDE_SECUENCIAL AS value, 
                    FDE_NOMBRE AS label
                FROM PLA_FDE_FAMILIADEP
                WHERE FDE_CODEMP = pFdeCodemp
                ORDER BY FDE_NOMBRE;
        END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_FDE_FAMILIADEP;

    ------------------------------------------------
   
	-- ############### PANTALLA DE REFERENCIAS // REFERENCIAS

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_REF_REFERENCIAS(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pRefCodcia IN OUT VARCHAR2,
    pRefCodemp IN OUT NUMBER,
    pRefSecuencial IN OUT NUMBER,
    pRefTiempo IN VARCHAR2,
    pRefNombre IN VARCHAR2,
    pRefTelefono IN VARCHAR2,
    pRefDireccion IN VARCHAR2,
    pRefOcupacion IN VARCHAR2,
    pRefPersonalLab IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_REF_REFERENCIAS (
            REF_CODCIA,
            REF_CODEMP,
            REF_SECUENCIAL,
            REF_TIEMPO,
            REF_NOMBRE,
            REF_TELEFONO,
            REF_DIRECCION,
            REF_OCUPACION,
            REF_PERSONAL_LAB
        ) VALUES (
            pRefCodcia,
            pRefCodemp,
            pRefSecuencial,
            pRefTiempo,
            pRefNombre,
            pRefTelefono,
            pRefDireccion,
            pRefOcupacion,
            pRefPersonalLab
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_REF_REFERENCIAS SET
            REF_CODCIA = pRefCodcia,
            REF_CODEMP = pRefCodemp,
            REF_TIEMPO = pRefTiempo,
            REF_NOMBRE = pRefNombre,
            REF_TELEFONO = pRefTelefono,
            REF_DIRECCION = pRefDireccion,
            REF_OCUPACION = pRefOcupacion,
            REF_PERSONAL_LAB = pRefPersonalLab
        WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                REF_TIEMPO,
                REF_CODCIA,
                REF_CODEMP,
                REF_SECUENCIAL,
                REF_NOMBRE,
                REF_TELEFONO,
                REF_DIRECCION,
                REF_OCUPACION,
                REF_PERSONAL_LAB
            FROM PLA_REF_REFERENCIAS
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_REF_REFERENCIAS WHERE REF_CODEMP = pRefCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        REF_TIEMPO,
                        REF_CODCIA,
                        REF_CODEMP,
                        REF_SECUENCIAL,
                        REF_NOMBRE,
                        REF_TELEFONO,
                        REF_DIRECCION,
                        REF_OCUPACION,
                        REF_PERSONAL_LAB
                    FROM PLA_REF_REFERENCIAS
                    WHERE REF_CODEMP = pRefCodemp
                    ORDER BY REF_SECUENCIAL
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                REF_SECUENCIAL AS value, 
                REF_NOMBRE AS label
            FROM PLA_REF_REFERENCIAS
            WHERE REF_CODEMP = pRefCodemp
            ORDER BY REF_NOMBRE;
    END IF;

    -- Manejo de excepciones
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
END SP_PLA_REF_REFERENCIAS;


    ------------------------------------------------
   
-- ############### PANTALLA DE EMPLEOS ANTERIORES // Empleos Anteriores

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_EMA_EMPLEOANTE(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pEmaCodcia IN OUT VARCHAR2,
    pEmaCodemp IN OUT NUMBER,
    pEmaCodicr IN VARCHAR2,
    pEmaUltPuesto IN VARCHAR2,
    pEmaUltPuestoIng IN VARCHAR2,
    pEmaFechaRet IN DATE,
    pEmaTelefonoCia IN VARCHAR2,
    pEmaMotivo IN VARCHAR2,
    pEmaFechaIng IN DATE,
    pEmaUltSalario IN NUMBER,
    pEmaJefeInmediato IN VARCHAR2,
    pEmaCargoJefe IN VARCHAR2,
    pEmaDesempeno IN VARCHAR2,
    pEmaRelInterpersonal IN VARCHAR2,
    pEmaObservaciones IN VARCHAR2,
    pEmaUnidad IN VARCHAR2,
    pEmaFaxCia IN VARCHAR2,
    pEmaAplicaBonoante IN CHAR,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_EMA_EMPLEOANTE (
            EMA_CODCIA,
            EMA_CODEMP,
            EMA_CODICR,
            EMA_ULT_PUESTO,
            EMA_ULT_PUESTO_ING,
            EMA_FECHA_RET,
            EMA_TELEFONO_CIA,
            EMA_MOTIVO,
            EMA_FECHA_ING,
            EMA_ULT_SALARIO,
            EMA_JEFE_INMEDIATO,
            EMA_CARGO_JEFE,
            EMA_DESEMPENO,
            EMA_REL_INTERPERSONAL,
            EMA_OBSERVACIONES,
            EMA_UNIDAD,
            EMA_FAX_CIA,
            EMA_APLICA_BONOANTE
        ) VALUES (
            pEmaCodcia,
            pEmaCodemp,
            pEmaCodicr,
            pEmaUltPuesto,
            pEmaUltPuestoIng,
            pEmaFechaRet,
            pEmaTelefonoCia,
            pEmaMotivo,
            pEmaFechaIng,
            pEmaUltSalario,
            pEmaJefeInmediato,
            pEmaCargoJefe,
            pEmaDesempeno,
            pEmaRelInterpersonal,
            pEmaObservaciones,
            pEmaUnidad,
            pEmaFaxCia,
            pEmaAplicaBonoante
        )
        RETURNING ROWID INTO pRowId;    

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_EMA_EMPLEOANTE SET
            EMA_CODCIA = pEmaCodcia,
            EMA_CODICR = pEmaCodicr,
            EMA_ULT_PUESTO = pEmaUltPuesto,
            EMA_ULT_PUESTO_ING = pEmaUltPuestoIng,
            EMA_FECHA_RET = pEmaFechaRet,
            EMA_TELEFONO_CIA = pEmaTelefonoCia,
            EMA_MOTIVO = pEmaMotivo,
            EMA_FECHA_ING = pEmaFechaIng,
            EMA_ULT_SALARIO = pEmaUltSalario,
            EMA_JEFE_INMEDIATO = pEmaJefeInmediato,
            EMA_CARGO_JEFE = pEmaCargoJefe,
            EMA_DESEMPENO = pEmaDesempeno,
            EMA_REL_INTERPERSONAL = pEmaRelInterpersonal,
            EMA_OBSERVACIONES = pEmaObservaciones,
            EMA_UNIDAD = pEmaUnidad,
            EMA_FAX_CIA = pEmaFaxCia,
            EMA_APLICA_BONOANTE = pEmaAplicaBonoante
        WHERE ROWID = pRowId;
       
       END IF;
      
      	COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                EMA_CODCIA,
                EMA_CODEMP,
                EMA_CODICR,
                EMA_ULT_PUESTO,
                EMA_ULT_PUESTO_ING,
                EMA_FECHA_RET,
                EMA_TELEFONO_CIA,
                EMA_MOTIVO,
                EMA_FECHA_ING,
                EMA_ULT_SALARIO,
                EMA_JEFE_INMEDIATO,
                EMA_CARGO_JEFE,
                EMA_DESEMPENO,
                EMA_REL_INTERPERSONAL,
                EMA_OBSERVACIONES,
                EMA_UNIDAD,
                EMA_FAX_CIA,
                EMA_APLICA_BONOANTE
            FROM PLA_EMA_EMPLEOANTE
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_EMA_EMPLEOANTE WHERE EMA_CODEMP = pEmaCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        EMA_CODCIA,
                        EMA_CODEMP,
                        EMA_CODICR,
                        EMA_ULT_PUESTO,
                        EMA_ULT_PUESTO_ING,
                        EMA_FECHA_RET,
                        EMA_TELEFONO_CIA,
                        EMA_MOTIVO,
                        EMA_FECHA_ING,
                        EMA_ULT_SALARIO,
                        EMA_JEFE_INMEDIATO,
                        EMA_CARGO_JEFE,
                        EMA_DESEMPENO,
                        EMA_REL_INTERPERSONAL,
                        EMA_OBSERVACIONES,
                        EMA_UNIDAD,
                        EMA_FAX_CIA,
                        EMA_APLICA_BONOANTE
                    FROM PLA_EMA_EMPLEOANTE
                    WHERE EMA_CODEMP = pEmaCodemp
                    ORDER BY EMA_FECHA_ING DESC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                EMA_CODEMP AS value, 
                EMA_ULT_PUESTO AS label
            FROM PLA_EMA_EMPLEOANTE
            WHERE EMA_CODEMP = pEmaCodemp
            ORDER BY EMA_ULT_PUESTO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_EMA_EMPLEOANTE;


    ------------------------------------------------
   
-- ############### PANTALLA DE CAPACITACIONES // CAPACITACIONES RECIBIDAS

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CAP_CAPACITACION(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pCapCodcia IN OUT VARCHAR2,
    pCapCodemp IN OUT NUMBER,
    pCapSecuencial IN OUT NUMBER,
    pCapTipo IN VARCHAR2,
    pCapNombre IN VARCHAR2,
    pCapFecha IN DATE,
    pCapDuracion IN VARCHAR2,
    pCapCosto IN NUMBER,
    pCapUsuarioCrea IN VARCHAR2,
    pCapFechaCrea IN DATE,
    pCapFechaMod IN DATE,
    pCapUsuarioMod IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,    
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_CAP_CAPACITACION (
            CAP_CODCIA,
            CAP_CODEMP,
            CAP_SECUENCIAL,
            CAP_TIPO,
            CAP_NOMBRE,
            CAP_FECHA,
            CAP_DURACION,
            CAP_COSTO,
            CAP_USUARIO_CREA,
            CAP_FECHA_CREA
        ) VALUES (
            pCapCodcia,
            pCapCodemp,
            pCapSecuencial,
            pCapTipo,
            pCapNombre,
            pCapFecha,
            pCapDuracion,
            pCapCosto,
            pCapUsuarioCrea,
            pCapFechaCrea
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_CAP_CAPACITACION SET
            CAP_CODCIA = pCapCodcia,
            CAP_CODEMP = pCapCodemp,
            CAP_TIPO = pCapTipo,
            CAP_NOMBRE = pCapNombre,
            CAP_FECHA = pCapFecha,
            CAP_DURACION = pCapDuracion,
            CAP_COSTO = pCapCosto,
            CAP_USUARIO_MOD = pCapUsuarioMod,
            CAP_FECHA_MOD = pCapFechaMod
        WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CAP_CODCIA,
                CAP_CODEMP,
                CAP_SECUENCIAL,
                CAP_TIPO,
                CAP_NOMBRE,
                CAP_FECHA,
                CAP_DURACION,
                CAP_COSTO
            FROM PLA_CAP_CAPACITACION
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_CAP_CAPACITACION WHERE CAP_CODEMP = pCapCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                        CAP_SECUENCIAL,
                        CAP_TIPO,
                        CAP_NOMBRE,
                        CAP_FECHA,
                        CAP_DURACION,
                        CAP_COSTO,
                        CAP_CODCIA,
                        CAP_CODEMP
                    FROM PLA_CAP_CAPACITACION
                    WHERE CAP_CODEMP = pCapCodemp
                    ORDER BY CAP_FECHA DESC
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                CAP_SECUENCIAL AS value, 
                CAP_NOMBRE AS label
            FROM PLA_CAP_CAPACITACION
            WHERE CAP_CODEMP = pCapCodemp
            ORDER BY CAP_NOMBRE;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CAP_CAPACITACION;

    ------------------------------------------------
   
-- ############### PANTALLA DE OBSERVACIONES

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_OBS_OBSERVACION(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pObsCodcia IN OUT VARCHAR2,
    pObsCodemp IN OUT NUMBER,
    pObsSecuencial IN OUT NUMBER,
    pObsObservacion IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,   
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_OBS_OBSERVACION (
            OBS_CODCIA,
            OBS_CODEMP,
            OBS_SECUENCIAL,
            OBS_OBSERVACION
        ) VALUES (
            pObsCodcia,
            pObsCodemp,
            pObsSecuencial,
            pObsObservacion
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_OBS_OBSERVACION SET
        	OBS_SECUENCIAL = pObsSecuencial,
            OBS_CODCIA = pObsCodcia,
            OBS_CODEMP = pObsCodemp,
            OBS_OBSERVACION = pObsObservacion        
       WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                OBS_CODCIA,
                OBS_CODEMP,
                OBS_SECUENCIAL,
                OBS_OBSERVACION
            FROM PLA_OBS_OBSERVACION
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_OBS_OBSERVACION WHERE OBS_CODEMP = pObsCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        OBS_CODEMP,
                        OBS_CODCIA,
                        OBS_SECUENCIAL,
                        OBS_OBSERVACION
                    FROM PLA_OBS_OBSERVACION
                    WHERE OBS_CODEMP = pObsCodemp
                    ORDER BY OBS_SECUENCIAL
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                OBS_SECUENCIAL AS value, 
                OBS_OBSERVACION AS label
            FROM PLA_OBS_OBSERVACION
            WHERE OBS_CODEMP = pObsCodemp
            ORDER BY OBS_OBSERVACION;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_OBS_OBSERVACION;

    ------------------------------------------------
   
-- ############### PANTALLA DE ASOCIACIONES A LAS QUE PERTENECE EL EMPLEADO

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ASE_ASOCIACION_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pAseCodcia IN OUT VARCHAR2,
    pAseCodemp IN OUT NUMBER,
    pAseCodaso IN OUT VARCHAR2,
    pAseDesde IN DATE,
    pAseHasta IN DATE,
    pAseTiempo IN NUMBER,
    pAseCargo IN VARCHAR2,
    pAseCargoIng IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_ASE_ASOCIACION_EMP (
            ASE_CODCIA,
            ASE_CODEMP,
            ASE_CODASO,
            ASE_DESDE,
            ASE_HASTA,
            ASE_TIEMPO,
            ASE_CARGO,
            ASE_CARGO_ING
        ) VALUES (
            pAseCodcia,
            pAseCodemp,
            pAseCodaso,
            pAseDesde,
            pAseHasta,
            pAseTiempo,
            pAseCargo,
            pAseCargoIng
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ASE_ASOCIACION_EMP SET
        	ASE_CODCIA = pAseCodcia,
        	ASE_CODEMP = pAseCodemp,
        	ASE_CODASO = pAseCodaso,
            ASE_DESDE = pAseDesde,
            ASE_HASTA = pAseHasta,
            ASE_TIEMPO = pAseTiempo,
            ASE_CARGO = pAseCargo,
            ASE_CARGO_ING = pAseCargoIng        
       WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
            	AE.ROWID AS id,
                AE.ASE_CODASO,
                AE.ASE_DESDE,
                AE.ASE_HASTA,
                AE.ASE_TIEMPO,
                AE.ASE_CARGO,
                AE.ASE_CARGO_ING,
                AE.ASE_CODEMP,
                AE.ASE_CODCIA
            FROM PLA_ASE_ASOCIACION_EMP AE
            INNER JOIN RHEPQ.PLA_ASO_ASOCIACION A ON A.ASO_CODIGO = AE.ASE_CODASO
            INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = AE.ASE_CODEMP                       
			WHERE AE.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador 
        FROM PLA_ASE_ASOCIACION_EMP AE
        INNER JOIN RHEPQ.PLA_ASO_ASOCIACION A ON A.ASO_CODIGO = AE.ASE_CODASO
        INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = AE.ASE_CODEMP
        WHERE AE.ASE_CODEMP = pAseCodemp;

        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	AE.ROWID AS id,
                        AE.ASE_CODASO,
                        AE.ASE_DESDE,
                        AE.ASE_HASTA,
                        AE.ASE_TIEMPO,
                        AE.ASE_CARGO,
                        AE.ASE_CARGO_ING,
                        AE.ASE_CODEMP,
                        AE.ASE_CODCIA
                    FROM PLA_ASE_ASOCIACION_EMP AE
                    INNER JOIN RHEPQ.PLA_ASO_ASOCIACION A ON A.ASO_CODIGO = AE.ASE_CODASO
                    INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = AE.ASE_CODEMP
                    WHERE AE.ASE_CODEMP = pAseCodemp
                    ORDER BY AE.ASE_CODASO
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                ASE_CODASO AS value, 
                ASE_CARGO AS label
            FROM PLA_ASE_ASOCIACION_EMP
            WHERE ASE_CODEMP = pAseCodemp
            ORDER BY ASE_CARGO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ASE_ASOCIACION_EMP;


    ------------------------------------------------
   
-- ############### PANTALLA AFICIONES DE EL EMPLEADO

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_AFE_AFICION_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pAfeCodcia IN OUT VARCHAR2,
    pAfeCodemp IN OUT NUMBER,
    pAfeCodafi IN VARCHAR2,
    pAfePractica IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_AFE_AFICION_EMP (
            AFE_CODCIA,
            AFE_CODEMP,
            AFE_CODAFI,
            AFE_PRACTICA
        ) VALUES (
            pAfeCodcia,
            pAfeCodemp,
            pAfeCodafi,
            pAfePractica
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_AFE_AFICION_EMP SET
        	AFE_CODCIA = pAfeCodcia,
        	AFE_CODEMP = pAfeCodemp,
            AFE_CODAFI = pAfeCodafi,
            AFE_PRACTICA = pAfePractica        
       	WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			  SELECT 
				AFE.ROWID AS id,
			    AFE.AFE_CODCIA,
			    AFE.AFE_CODEMP,
			    AFE.AFE_CODAFI,
			    A.AFI_NOMBRE AS aficion,
			    AFE.AFE_PRACTICA
			FROM PLA_AFE_AFICION_EMP AFE
			INNER JOIN RHEPQ.PLA_AFI_AFICION A ON A.AFI_CODIGO = AFE.AFE_CODAFI
            WHERE AFE.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_AFE_AFICION_EMP WHERE AFE_CODEMP = pAfeCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
					  SELECT 
						AFE.ROWID AS id,
					    AFE.AFE_CODCIA,
					    AFE.AFE_CODEMP,
					    AFE.AFE_CODAFI,
					    A.AFI_NOMBRE AS aficion,
					    AFE.AFE_PRACTICA
					FROM PLA_AFE_AFICION_EMP AFE
					INNER JOIN RHEPQ.PLA_AFI_AFICION A ON A.AFI_CODIGO = AFE.AFE_CODAFI
					WHERE AFE.AFE_CODEMP = pAfeCodemp                
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_AFE_AFICION_EMP;


    ------------------------------------------------
   
-- ############### PANTALLA DE EN CASO DE EMERGENCIA LLAMAR A

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_EME_EMERGENCIA_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pEmeCodcia IN OUT VARCHAR2,
    pEmeCodemp IN OUT NUMBER,
    pEmeSecuencial IN OUT NUMBER,
    pEmeNombre IN VARCHAR2,
    pEmeCodprt IN VARCHAR2,
    pEmeDireccion IN VARCHAR2,
    pEmeTelefonos IN VARCHAR2,
    pEmeTrabajo IN VARCHAR2,
    pEmeTelefonoTrabajo IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_EME_EMERGENCIA_EMP (
            EME_TRABAJO,
            EME_TELEFONO_TRABAJO,
            EME_CODCIA,
            EME_CODEMP,
            EME_SECUENCIAL,
            EME_NOMBRE,
            EME_CODPRT,
            EME_DIRECCION,
            EME_TELEFONOS
        ) VALUES (
            pEmeTrabajo,
            pEmeTelefonoTrabajo,
            pEmeCodcia,
            pEmeCodemp,
            pEmeSecuencial,
            pEmeNombre,
            pEmeCodprt,
            pEmeDireccion,
            pEmeTelefonos
        )
        RETURNING ROWID INTO pRowId;  

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_EME_EMERGENCIA_EMP SET
        	EME_SECUENCIAL = pEmeSecuencial,
            EME_CODCIA = pEmeCodcia,
            EME_CODEMP = pEmeCodemp,
            EME_NOMBRE = pEmeNombre,
            EME_CODPRT = pEmeCodprt,
            EME_DIRECCION = pEmeDireccion,
            EME_TELEFONOS = pEmeTelefonos,
            EME_TRABAJO = pEmeTrabajo,
            EME_TELEFONO_TRABAJO = pEmeTelefonoTrabajo        
      	WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                EME_SECUENCIAL,
                EME_NOMBRE,
                EME_CODPRT,
                EME_DIRECCION,
                EME_TELEFONOS,
                EME_TRABAJO,
                EME_TELEFONO_TRABAJO,
                EME_CODEMP,
                EME_CODCIA
            FROM PLA_EME_EMERGENCIA_EMP
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_EME_EMERGENCIA_EMP WHERE EME_CODEMP = pEmeCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        EME_SECUENCIAL,
                        EME_NOMBRE,
                        EME_CODPRT,
                        EME_DIRECCION,
                        EME_TELEFONOS,
                        EME_TRABAJO,
                        EME_TELEFONO_TRABAJO,
                        EME_CODEMP,
                        EME_CODCIA
                    FROM PLA_EME_EMERGENCIA_EMP
                    WHERE EME_CODEMP = pEmeCodemp
                    ORDER BY EME_SECUENCIAL
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                EME_SECUENCIAL AS value,
                EME_NOMBRE || ' - ' || EME_DIRECCION AS label
            FROM PLA_EME_EMERGENCIA_EMP
            WHERE EME_CODEMP = pEmeCodemp
            ORDER BY EME_NOMBRE;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_EME_EMERGENCIA_EMP;


    ------------------------------------------------
   
-- ############### PANTALLA DE HABILIDADES DEL EMPLEADO

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_HAE_HABILIDAD_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pHaeCodcia IN VARCHAR2,
    pHaeCodemp IN NUMBER,
    pHaeCodtrq IN VARCHAR2,
    pHaeCodreq IN VARCHAR2,
    pHaeDominio IN VARCHAR2,
    pHaeTiempoExperiencia IN NUMBER,
    pHaeMetrico IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_HAE_HABILIDAD_EMPLEADO (
            HAE_CODCIA,
            HAE_CODEMP,
            HAE_CODTRQ,
            HAE_CODREQ,
            HAE_DOMINIO,
            HAE_TIEMPO_EXPERIENCIA,
            HAE_METRICO
        ) VALUES (
            pHaeCodcia,
            pHaeCodemp,
            pHaeCodtrq,
            pHaeCodreq,
            pHaeDominio,
            pHaeTiempoExperiencia,
            pHaeMetrico
        )       
       RETURNING ROWID INTO pRowId;     

    ELSIF pOpcion = 2 THEN
        UPDATE REC_HAE_HABILIDAD_EMPLEADO SET
            HAE_CODCIA = pHaeCodcia,
            HAE_CODEMP = pHaeCodemp,
            HAE_CODTRQ = pHaeCodtrq,
            HAE_CODREQ = pHaeCodreq,
            HAE_DOMINIO = pHaeDominio,
            HAE_TIEMPO_EXPERIENCIA = pHaeTiempoExperiencia,
            HAE_METRICO = pHaeMetrico        
        WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

   
    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
            	ROWID AS id,
                HAE_CODTRQ,
                HAE_CODREQ,
                HAE_DOMINIO,
                HAE_TIEMPO_EXPERIENCIA,
                HAE_METRICO,
                HAE_CODEMP,
                HAE_CODCIA
            FROM REC_HAE_HABILIDAD_EMPLEADO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM REC_HAE_HABILIDAD_EMPLEADO WHERE HAE_CODEMP = pHaeCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT
                    	ROWID AS id,
                        HAE_CODTRQ,
                        HAE_CODREQ,
                        HAE_DOMINIO,
                        HAE_TIEMPO_EXPERIENCIA,
                        HAE_METRICO,
                        HAE_CODEMP,
                        HAE_CODCIA
                    FROM REC_HAE_HABILIDAD_EMPLEADO
                    WHERE HAE_CODEMP = pHaeCodemp
                    ORDER BY HAE_CODTRQ, HAE_CODREQ
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT
                HAE_CODTRQ || '-' || HAE_CODREQ AS value,
                HAE_DOMINIO || ' - Exp: ' || HAE_TIEMPO_EXPERIENCIA || ' Años' AS label
            FROM REC_HAE_HABILIDAD_EMPLEADO
            WHERE HAE_CODEMP = pHaeCodemp
            ORDER BY HAE_CODTRQ, HAE_CODREQ;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_HAE_HABILIDAD_EMP;

    ------------------------------------------------
   
-- ############### PANTALLA DE ESTUDIOS REALIZADOS POR EL EMPLEADO // EDUCACION RECIBIDAPOR EL EMPLEADO

CREATE OR REPLACE PROCEDURE RHEPQ.SP_REC_EDE_EDUCACION(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pEdeCodcia IN OUT VARCHAR2,
    pEdeCodemp IN OUT NUMBER,
    pEdeCodicr IN VARCHAR2,
    pEdeCodcar IN VARCHAR2,
    pEdePeriodoInicial IN DATE,
    pEdePeriodoFinal IN DATE,
    pEdeTotalMaterias IN NUMBER,
    pEdeMateriasAprobadas IN NUMBER,
    pEdeTituloObtenido IN VARCHAR2,
    pEdeSituacion IN VARCHAR2,
    pEdeNivel IN NUMBER,
    pEdeCodtrq IN VARCHAR2,
    pEdeCodreq IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO REC_EDE_EDUCACION (
            EDE_CODCIA,
            EDE_CODEMP,
            EDE_CODICR,
            EDE_CODCAR,
            EDE_PERIODO_INICIAL,
            EDE_PERIODO_FINAL,
            EDE_TOTAL_MATERIAS,
            EDE_MATERIAS_APROBADAS,
            EDE_TITULO_OBTENIDO,
            EDE_SITUACION,
            EDE_NIVEL,
            EDE_CODTRQ,
            EDE_CODREQ
        ) VALUES (
            pEdeCodcia,
            pEdeCodemp,
            pEdeCodicr,
            pEdeCodcar,
            pEdePeriodoInicial,
            pEdePeriodoFinal,
            pEdeTotalMaterias,
            pEdeMateriasAprobadas,
            pEdeTituloObtenido,
            pEdeSituacion,
            pEdeNivel,
            pEdeCodtrq,
            pEdeCodreq
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE REC_EDE_EDUCACION SET
        	EDE_CODCIA = pEdeCodcia,
        	EDE_CODEMP = pEdeCodemp,
            EDE_CODICR = pEdeCodicr,
            EDE_CODCAR = pEdeCodcar,
            EDE_PERIODO_INICIAL = pEdePeriodoInicial,
            EDE_PERIODO_FINAL = pEdePeriodoFinal,
            EDE_TOTAL_MATERIAS = pEdeTotalMaterias,
            EDE_MATERIAS_APROBADAS = pEdeMateriasAprobadas,
            EDE_TITULO_OBTENIDO = pEdeTituloObtenido,
            EDE_SITUACION = pEdeSituacion,
            EDE_NIVEL = pEdeNivel,
            EDE_CODTRQ = pEdeCodtrq,
            EDE_CODREQ = pEdeCodreq        
       WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			 SELECT
				E.ROWID AS id,
			    E.EDE_CODICR,
			    I.ICR_NOMBRE AS INSTITUCION,
			    E.EDE_CODCAR,
			    C.CAR_NOMBRE AS CARRERA,
			    E.EDE_PERIODO_INICIAL,
			    E.EDE_PERIODO_FINAL,
			    E.EDE_TOTAL_MATERIAS,
			    E.EDE_MATERIAS_APROBADAS,
			    E.EDE_NIVEL,
			    E.EDE_TITULO_OBTENIDO,
			    E.EDE_SITUACION,
			    E.EDE_CODTRQ,
			    E.EDE_CODREQ,
			    E.EDE_CODEMP,
			    E.EDE_CODCIA
			FROM REC_EDE_EDUCACION E
			LEFT JOIN REC_CAR_CARRERA C ON C.CAR_CODIGO = E.EDE_CODCAR 
			LEFT JOIN PLA_ICR_INSTITUCION I ON I.ICR_CODIGO = E.EDE_CODICR
            WHERE E.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM REC_EDE_EDUCACION WHERE EDE_CODCIA = pEdeCodcia AND EDE_CODEMP = pEdeCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
           			 SELECT
						E.ROWID AS id,
					    E.EDE_CODICR,
					    I.ICR_NOMBRE AS INSTITUCION,
					    E.EDE_CODCAR,
					    C.CAR_NOMBRE AS CARRERA,
					    E.EDE_PERIODO_INICIAL,
					    E.EDE_PERIODO_FINAL,
					    E.EDE_TOTAL_MATERIAS,
					    E.EDE_MATERIAS_APROBADAS,
					    E.EDE_NIVEL,
					    E.EDE_TITULO_OBTENIDO,
					    E.EDE_SITUACION,
					    E.EDE_CODTRQ,
					    E.EDE_CODREQ,
					    E.EDE_CODEMP,
					    E.EDE_CODCIA
					FROM REC_EDE_EDUCACION E
					LEFT JOIN REC_CAR_CARRERA C ON C.CAR_CODIGO = E.EDE_CODCAR 
					LEFT JOIN PLA_ICR_INSTITUCION I ON I.ICR_CODIGO = E.EDE_CODICR
                    WHERE E.EDE_CODCIA = pEdeCodcia AND E.EDE_CODEMP = pEdeCodemp
                    ORDER BY EDE_PERIODO_INICIAL DESC
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT
                EDE_CODICR || '-' || EDE_CODCAR AS value,
                EDE_TITULO_OBTENIDO || ' (' || EDE_PERIODO_INICIAL || ' - ' || EDE_PERIODO_FINAL || ')' AS label
            FROM REC_EDE_EDUCACION
            WHERE EDE_CODCIA = pEdeCodcia AND EDE_CODEMP = pEdeCodemp
            ORDER BY EDE_PERIODO_INICIAL DESC;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_REC_EDE_EDUCACION;


    ------------------------------------------------
   
-- ############### PANTALLA DE LICENCIAS DE CONDUCIR // Licencias de conducir del empleado

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_LEM_LICENCIA_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pLemCodcia IN OUT VARCHAR2,
    pLemCodemp IN OUT NUMBER,
    pLemCodigo IN VARCHAR2,
    pLemTipo IN VARCHAR2,
    pLemNumero IN VARCHAR2,
    pLemVence IN DATE,
    pLemExtendido IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_LEM_LICENCIA_EMP (
            LEM_CODCIA,
            LEM_CODEMP,
            LEM_CODIGO,
            LEM_TIPO,
            LEM_NUMERO,
            LEM_VENCE,
            LEM_EXTENDIDO
        ) VALUES (
            pLemCodcia,
            pLemCodemp,
            pLemCodigo,
            pLemTipo,
            pLemNumero,
            pLemVence,
            pLemExtendido
        )
        RETURNING ROWID INTO pRowId;  

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_LEM_LICENCIA_EMP SET
        	LEM_CODIGO = pLemCodigo,
            LEM_CODCIA = pLemCodcia,
            LEM_CODEMP = pLemCodemp,
            LEM_TIPO = pLemTipo,
            LEM_NUMERO = pLemNumero,
            LEM_VENCE = pLemVence,
            LEM_EXTENDIDO = pLemExtendido
        WHERE ROWID = pRowId;

    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                LEM_CODIGO,
                LEM_TIPO,
                LEM_NUMERO,
                LEM_VENCE,
                LEM_EXTENDIDO,
                LEM_CODEMP,
                LEM_CODCIA
            FROM PLA_LEM_LICENCIA_EMP
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_LEM_LICENCIA_EMP WHERE LEM_CODEMP = pLemCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        LEM_CODIGO,
                        LEM_TIPO,
                        LEM_NUMERO,
                        LEM_VENCE,
                        LEM_EXTENDIDO,
                        LEM_CODEMP,
                        LEM_CODCIA
                    FROM PLA_LEM_LICENCIA_EMP
                    WHERE LEM_CODEMP = pLemCodemp
                    ORDER BY LEM_CODIGO
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                LEM_CODIGO AS value, 
                LEM_TIPO || ' - ' || LEM_NUMERO || ' (' || LEM_VENCE || ')' AS label
            FROM PLA_LEM_LICENCIA_EMP
            WHERE LEM_CODEMP = pLemCodemp
            ORDER BY LEM_CODIGO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_LEM_LICENCIA_EMP;

    ------------------------------------------------
   
-- ############### PANTALLA DE SEGUROS DEL EMPLEADO // seguros del empleado

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_SUE_SEGURO_EMPLEADO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pSueCodcia IN OUT VARCHAR2,
    pSueCodemp IN OUT NUMBER,
    pSueTipo IN VARCHAR2,
    pSueMonto IN NUMBER,
    pSueValorPrima IN NUMBER,
    pSueDescuentoPlanilla IN NUMBER,
    pSueCodtdc IN VARCHAR2,
    pSueNoPoliza IN NUMBER,
    pSueCertificado IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_SUE_SEGURO_EMPLEADO (
            SUE_CODCIA,
            SUE_CODEMP,
            SUE_TIPO,
            SUE_MONTO,
            SUE_VALOR_PRIMA,
            SUE_DESCUENTO_PLANILLA,
            SUE_CODTDC,
            SUE_NO_POLIZA,
            SUE_CERTIFICADO
        ) VALUES (
            pSueCodcia,
            pSueCodemp,
            pSueTipo,
            pSueMonto,
            pSueValorPrima,
            pSueDescuentoPlanilla,
            pSueCodtdc,
            pSueNoPoliza,
            pSueCertificado
        )
        RETURNING ROWID INTO pRowId;      

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_SUE_SEGURO_EMPLEADO SET
        	SUE_CODEMP = pSueCodemp,
            SUE_CODCIA = pSueCodcia,
            SUE_TIPO = pSueTipo,
            SUE_MONTO = pSueMonto,
            SUE_VALOR_PRIMA = pSueValorPrima,
            SUE_DESCUENTO_PLANILLA = pSueDescuentoPlanilla,
            SUE_CODTDC = pSueCodtdc,
            SUE_NO_POLIZA = pSueNoPoliza,
            SUE_CERTIFICADO = pSueCertificado        
       WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                SUE_CODCIA,
                SUE_CODEMP,
                SUE_TIPO,
                SUE_MONTO,
                SUE_VALOR_PRIMA,
                SUE_DESCUENTO_PLANILLA,
                SUE_CODTDC,
                SUE_NO_POLIZA,
                SUE_CERTIFICADO
            FROM PLA_SUE_SEGURO_EMPLEADO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_SUE_SEGURO_EMPLEADO WHERE SUE_CODEMP = pSueCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        SUE_CODCIA,
                        SUE_CODEMP,
                        SUE_TIPO,
                        SUE_MONTO,
                        SUE_VALOR_PRIMA,
                        SUE_DESCUENTO_PLANILLA,
                        SUE_CODTDC,
                        SUE_NO_POLIZA,
                        SUE_CERTIFICADO
                    FROM PLA_SUE_SEGURO_EMPLEADO
                    WHERE SUE_CODEMP = pSueCodemp
                    ORDER BY SUE_CODCIA, SUE_CODEMP
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                SUE_CODCIA || '-' || SUE_CODEMP AS value, 
                SUE_TIPO || ' - ' || SUE_MONTO AS label
            FROM PLA_SUE_SEGURO_EMPLEADO
            WHERE SUE_CODEMP = pSueCodemp
            ORDER BY SUE_CODCIA, SUE_CODEMP;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_SUE_SEGURO_EMPLEADO;


    ------------------------------------------------
   
-- ############### PANTALLA DE RECORDS DE TRABAJO DEL EMPLEADO // Records de trabajo del empleado

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_RTR_RECORD_TRABAJO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,   
    pRtrCodcia IN VARCHAR2,
    pRtrCodemp IN NUMBER,
    pRtrFecha IN DATE,
    pRtrPuesto IN VARCHAR2,
    pRtrCoduni IN NUMBER,
    pRtrNombreUni IN VARCHAR2,
    pRtrSalario IN NUMBER,
    pRtrFechaIni IN DATE,
    pRtrFechaFin IN DATE,
    pRtrAcuerdoBaja IN VARCHAR2,
    pRtrCodmrt IN VARCHAR2,
    pRtrCodigo IN OUT NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_RTR_RECORD_TRABAJO (
            RTR_CODIGO,
            RTR_CODCIA,
            RTR_CODEMP,
            RTR_FECHA,
            RTR_PUESTO,
            RTR_CODUNI,
            RTR_NOMBRE_UNI,
            RTR_SALARIO,
            RTR_FECHA_INI,
            RTR_FECHA_FIN,
            RTR_ACUERDO_BAJA,
            RTR_CODMRT
        ) VALUES (
            pRtrCodigo,
            pRtrCodcia,
            pRtrCodemp,
            pRtrFecha,
            pRtrPuesto,
            pRtrCoduni,
            pRtrNombreUni,
            pRtrSalario,
            pRtrFechaIni,
            pRtrFechaFin,
            pRtrAcuerdoBaja,
            pRtrCodmrt
        )
        RETURNING ROWID INTO pRowId;   

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_RTR_RECORD_TRABAJO SET        	
        	RTR_CODIGO = pRtrCodigo,
            RTR_CODCIA = pRtrCodcia,
            RTR_CODEMP = pRtrCodemp,
            RTR_FECHA = pRtrFecha,
            RTR_PUESTO = pRtrPuesto,
            RTR_CODUNI = pRtrCoduni,
            RTR_NOMBRE_UNI = pRtrNombreUni,
            RTR_SALARIO = pRtrSalario,
            RTR_FECHA_INI = pRtrFechaIni,
            RTR_FECHA_FIN = pRtrFechaFin,
            RTR_ACUERDO_BAJA = pRtrAcuerdoBaja,
            RTR_CODMRT = pRtrCodmrt        
       	WHERE ROWID = pRowId;

    END IF;

    COMMIT;


    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
             SELECT 
				RT.ROWID AS id,
			    RT.RTR_CODCIA,
			    RT.RTR_CODEMP,
			    RT.RTR_FECHA,
			    RT.RTR_PUESTO,
			    RT.RTR_CODUNI,
			    RT.RTR_NOMBRE_UNI,
			    RT.RTR_SALARIO,
			    RT.RTR_FECHA_INI,
			    RT.RTR_FECHA_FIN,
			    RT.RTR_ACUERDO_BAJA,
			    RT.RTR_CODMRT,
			    MR.MRT_NOMBRE AS RTR_NOMMRT,
			    RTR_CODIGO
			FROM PLA_RTR_RECORD_TRABAJO RT
			LEFT JOIN PLA_MRT_MOTRETIRO MR ON MR.MRT_CODIGO = RT.RTR_CODMRT 
            WHERE RT.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_RTR_RECORD_TRABAJO WHERE RTR_CODEMP = pRtrCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
						RT.ROWID AS id,
					    RT.RTR_CODCIA,
					    RT.RTR_CODEMP,
					    RT.RTR_FECHA,
					    RT.RTR_PUESTO,
					    RT.RTR_CODUNI,
					    RT.RTR_NOMBRE_UNI,
					    RT.RTR_SALARIO,
					    RT.RTR_FECHA_INI,
					    RT.RTR_FECHA_FIN,
					    RT.RTR_ACUERDO_BAJA,
					    RT.RTR_CODMRT,
					    MR.MRT_NOMBRE AS RTR_NOMMRT,
					    RTR_CODIGO
					FROM PLA_RTR_RECORD_TRABAJO RT
					LEFT JOIN PLA_MRT_MOTRETIRO MR ON MR.MRT_CODIGO = RT.RTR_CODMRT 
                    WHERE RT.RTR_CODEMP = pRtrCodemp
                    ORDER BY RT.RTR_FECHA_INI
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT RTR_CODIGO AS value, RTR_PUESTO AS label
            FROM PLA_RTR_RECORD_TRABAJO
            WHERE RTR_CODEMP = pRtrCodemp
            ORDER BY RTR_FECHA_INI;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_RTR_RECORD_TRABAJO;


    ------------------------------------------------
   
-- ############### PANTALLA DE PLAN DE CAPACITACION // 

CREATE OR REPLACE PROCEDURE RHEPQ.SP_CAP_PRT_EVENTO(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pPrtCodcia IN OUT VARCHAR2,
    pPrtEmpleado IN OUT NUMBER,
    pPrtEvento IN VARCHAR2,
    pPrtCorrelativo IN OUT NUMBER,
    pPrtEstado IN VARCHAR2,
    pPrtNotaEmpleado IN NUMBER,
    pPrtDiasATrabajar IN NUMBER,
    pPrtMontoACancelar IN NUMBER,
    pPrtNoCuotas IN NUMBER,
    pPrtValorCuota IN NUMBER,
    pPrtFechaini IN DATE,
    pPrtPorcentaje IN NUMBER,    
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO CAP_PRT_EVENTO (
            PRT_CODCIA,
            PRT_EMPLEADO,
            PRT_EVENTO,
            PRT_CORRELATIVO,
            PRT_ESTADO,
            PRT_NOTA_EMPLEADO,
            PRT_DIAS_A_TRABAJAR,
            PRT_MONTO_A_CANCELAR,
            PRT_NO_CUOTAS,
            PRT_VALOR_CUOTA,
            PRT_FECHAINI,
            PRT_PORCENTAJE
        ) VALUES (
            pPrtCodcia,
            pPrtEmpleado,
            pPrtEvento,
            pPrtCorrelativo,
            pPrtEstado,
            pPrtNotaEmpleado,
            pPrtDiasATrabajar,
            pPrtMontoACancelar,
            pPrtNoCuotas,
            pPrtValorCuota,
            pPrtFechaini,
            pPrtPorcentaje
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE CAP_PRT_EVENTO SET
        	PRT_CODCIA = pPrtCodcia,
        	PRT_EMPLEADO = pPrtEmpleado,
        	PRT_CORRELATIVO = pPrtCorrelativo,
            PRT_EVENTO = pPrtEvento,
            PRT_ESTADO = pPrtEstado,
            PRT_NOTA_EMPLEADO = pPrtNotaEmpleado,
            PRT_DIAS_A_TRABAJAR = pPrtDiasATrabajar,
            PRT_MONTO_A_CANCELAR = pPrtMontoACancelar,
            PRT_NO_CUOTAS = pPrtNoCuotas,
            PRT_VALOR_CUOTA = pPrtValorCuota,
            PRT_FECHAINI = pPrtFechaini,
            PRT_PORCENTAJE = pPrtPorcentaje
        WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                ROWID AS id,
                PRT_CODCIA,
                PRT_EMPLEADO,
                PRT_EVENTO,
                PRT_CORRELATIVO,
                PRT_ESTADO,
                PRT_NOTA_EMPLEADO,
                PRT_DIAS_A_TRABAJAR,
                PRT_MONTO_A_CANCELAR,
                PRT_NO_CUOTAS,
                PRT_VALOR_CUOTA,
                PRT_FECHAINI,
                PRT_PORCENTAJE
            FROM CAP_PRT_EVENTO
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM CAP_PRT_EVENTO WHERE PRT_EMPLEADO = pPrtEmpleado;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                        ROWID AS id,
                        PRT_CODCIA,
                        PRT_EMPLEADO,
                        PRT_EVENTO,
                        PRT_CORRELATIVO,
                        PRT_ESTADO,
                        PRT_NOTA_EMPLEADO,
                        PRT_DIAS_A_TRABAJAR,
                        PRT_MONTO_A_CANCELAR,
                        PRT_NO_CUOTAS,
                        PRT_VALOR_CUOTA,
                        PRT_FECHAINI,
                        PRT_PORCENTAJE
                    FROM CAP_PRT_EVENTO
                    WHERE PRT_EMPLEADO = pPrtEmpleado
                    ORDER BY PRT_CORRELATIVO
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                PRT_CORRELATIVO AS value, 
                PRT_EVENTO AS label
            FROM CAP_PRT_EVENTO
            WHERE PRT_ESTADO = 'A' AND PRT_EMPLEADO = pPrtEmpleado
            ORDER BY PRT_CORRELATIVO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_CAP_PRT_EVENTO;


    ------------------------------------------------
   
	-- ############### PANTALLA DE TRASLADOS // Traslados

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TRA_TRASLADO_OFICIOS(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pTtoCodplzDel IN NUMBER,
    pTtoCoduniAl IN NUMBER,
    pTtoCodplzAl IN NUMBER,
    pTtoUsuarioCrea IN VARCHAR2,
    pTtoMaquinaCrea IN VARCHAR2,
    pTtoFechaCrea IN DATE,
    pTtoCodcia IN VARCHAR2,
    pTtoCodemp IN NUMBER,
    pTtoNoOficio IN VARCHAR2,
    pTtoFechaTras IN DATE,
    pTtoCoduniDel IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_TRA_TRASLADO_OFICIOS (
            TTO_CODPLZ_DEL,
            TTO_CODUNI_AL,
            TTO_CODPLZ_AL,
            TTO_USUARIO_CREA,
            TTO_MAQUINA_CREA,
            TTO_FECHA_CREA,
            TTO_CODCIA,
            TTO_CODEMP,
            TTO_NO_OFICIO,
            TTO_FECHA_TRAS,
            TTO_CODUNI_DEL
        ) VALUES (
            pTtoCodplzDel,
            pTtoCoduniAl,
            pTtoCodplzAl,
            pTtoUsuarioCrea,
            pTtoMaquinaCrea,
            pTtoFechaCrea,
            pTtoCodcia,
            pTtoCodemp,
            pTtoNoOficio,
            pTtoFechaTras,
            pTtoCoduniDel
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_TRA_TRASLADO_OFICIOS SET
        	TTO_CODCIA = pTtoCodcia,
        	TTO_CODEMP = pTtoCodemp,
            TTO_CODPLZ_DEL = pTtoCodplzDel,
            TTO_CODUNI_AL = pTtoCoduniAl,
            TTO_CODPLZ_AL = pTtoCodplzAl,
            TTO_USUARIO_CREA = pTtoUsuarioCrea,
            TTO_MAQUINA_CREA = pTtoMaquinaCrea,
            TTO_FECHA_CREA = pTtoFechaCrea,
            TTO_NO_OFICIO = pTtoNoOficio,
            TTO_FECHA_TRAS = pTtoFechaTras,
            TTO_CODUNI_DEL = pTtoCoduniDel        
       WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                TTO_CODPLZ_DEL,
                TTO_CODUNI_AL,
                TTO_CODPLZ_AL,
                TTO_USUARIO_CREA,
                TTO_MAQUINA_CREA,
                TTO_FECHA_CREA,
                TTO_CODCIA,
                TTO_CODEMP,
                TTO_NO_OFICIO,
                TTO_FECHA_TRAS,
                TTO_CODUNI_DEL
            FROM PLA_TRA_TRASLADO_OFICIOS
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_TRA_TRASLADO_OFICIOS WHERE TTO_CODEMP = pTtoCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        TTO_CODPLZ_DEL,
                        TTO_CODUNI_AL,
                        TTO_CODPLZ_AL,
                        TTO_USUARIO_CREA,
                        TTO_MAQUINA_CREA,
                        TTO_FECHA_CREA,
                        TTO_CODCIA,
                        TTO_CODEMP,
                        TTO_NO_OFICIO,
                        TTO_FECHA_TRAS,
                        TTO_CODUNI_DEL
                    FROM PLA_TRA_TRASLADO_OFICIOS
                    WHERE TTO_CODEMP = pTtoCodemp
                    ORDER BY TTO_CODPLZ_DEL
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                TTO_CODPLZ_DEL AS value, 
                TTO_NO_OFICIO AS label
            FROM PLA_TRA_TRASLADO_OFICIOS
            WHERE TTO_CODEMP = pTtoCodemp
            ORDER BY TTO_CODPLZ_DEL;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TRA_TRASLADO_OFICIOS;


    ------------------------------------------------
   
	-- ############### PANTALLA DE VACUNAS // Vacunas

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_VAC_VACUNA(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pVacCodcia IN OUT VARCHAR2,
    pVacCodemp IN OUT NUMBER,
    pVacCorrela IN OUT NUMBER,
    pVacNodosis IN NUMBER,
    pVacTipoVacuna IN NUMBER,
    pVacEnfermedad IN NUMBER,
    pVacFecha IN DATE,
    pVacLugarInstitucion IN VARCHAR2,
    pVacUsuarioCrea IN VARCHAR2,
    pVacMaquinaCrea IN VARCHAR2,
    pVacFechaCrea IN DATE,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_VAC_VACUNA (
            VAC_CODCIA,
            VAC_CODEMP,
            VAC_CORRELA,
            VAC_NODOSIS,
            VAC_TIPO_VACUNA,
            VAC_ENFEMEDAD,
            VAC_FECHA,
            VAC_LUGAR_INSTITUCION,
            VAC_USUARIO_CREA,
            VAC_MAQUINA_CREA,
            VAC_FECHA_CREA
        ) VALUES (
            pVacCodcia,
            pVacCodemp,
            pVacCorrela,
            pVacNodosis,
            pVacTipoVacuna,
            pVacEnfermedad,
            pVacFecha,
            pVacLugarInstitucion,
            pVacUsuarioCrea,
            pVacMaquinaCrea,
            SYSDATE
        )
        RETURNING ROWID INTO pRowId;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_VAC_VACUNA SET
        	VAC_CODCIA = pVacCodcia,
        	VAC_CODEMP = pVacCodemp,
        	VAC_CORRELA = pVacCorrela,
            VAC_NODOSIS = pVacNodosis,
            VAC_TIPO_VACUNA = pVacTipoVacuna,
            VAC_ENFEMEDAD = pVacEnfermedad,
            VAC_FECHA = pVacFecha,
            VAC_LUGAR_INSTITUCION = pVacLugarInstitucion  
       WHERE ROWID = pRowId;

    END IF;

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
            	ROWID AS id,
                VAC_CODCIA,
                VAC_CODEMP,
                VAC_CORRELA,
                VAC_NODOSIS,
                VAC_TIPO_VACUNA,
                VAC_ENFEMEDAD,
                VAC_FECHA,
                VAC_LUGAR_INSTITUCION,
                VAC_USUARIO_CREA,
                VAC_MAQUINA_CREA,
                VAC_FECHA_CREA
            FROM PLA_VAC_VACUNA
            WHERE ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM PLA_VAC_VACUNA WHERE VAC_CODEMP = pVacCodemp;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT temp.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ROWID AS id,
                        VAC_CODCIA,
                        VAC_CODEMP,
                        VAC_CORRELA,
                        VAC_NODOSIS,
                        VAC_TIPO_VACUNA,
                        VAC_ENFEMEDAD,
                        VAC_FECHA,
                        VAC_LUGAR_INSTITUCION,
                        VAC_USUARIO_CREA,
                        VAC_MAQUINA_CREA,
                        VAC_FECHA_CREA
                    FROM PLA_VAC_VACUNA
                    WHERE VAC_CODEMP = pVacCodemp
                    ORDER BY VAC_CORRELA
                ) temp
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT 
                VAC_CORRELA AS value, 
                VAC_TIPO_VACUNA AS label
            FROM PLA_VAC_VACUNA
            WHERE VAC_CODEMP = pVacCodemp
            ORDER BY VAC_CORRELA;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_VAC_VACUNA;


    ------------------------------------------------
   
	--// Prestadores de servicio

SELECT ROWID,EMP_CODIGO,EMP_CODIGO_ANTERIOR,EMP_PRIMER_APE,EMP_SEGUNDO_APE,EMP_APELLIDO_CAS,EMP_PRIMER_NOM,EMP_SEGUNDO_NOM,EMP_TERCER_NOM,EMP_NOMBRE_ISSS,EMP_NOMBRE_CIP,EMP_NOMBRE_NIT,EMP_DIRECCION,EMP_CODDEP,EMP_CODMUN,EMP_TELEFONO,EMP_RENGLON,EMP_CODIGO_POSTAL,EMP_FECHA_NAC,EMP_LUGAR_NAC,EMP_CODDEP_NAC,EMP_LUGAR_NAC_TEXT,EMP_NACIONALIDAD,EMP_COD_AGENTE,EMP_SUPERVISOR,EMP_FECHA_INGRESO,EMP_SEXO,EMP_ESTADO_CIVIL,EMP_TIPO_SANGRE,EMP_PROFESION,EMP_CODREN,EMP_NO_COLEGIADO,EMP_AFP,EMP_TARJETA,EMP_HORA_EXTRA,EMP_DESC_ISSS,EMP_COLEGIADO_ACTIVO,EMP_CIP,EMP_EXPEDIDA_FECHA,EMP_EXPEDIDA_DEP,EMP_EXPEDIDA_MUN,EMP_DPI,EMP_AREA,EMP_ZONA,EMP_COMISION,EMP_DOMICILIADO,EMP_SERV_PRESTADOS,EMP_RENTA_DOMICILIADO,EMP_RENTA_SERVICIO,EMP_ESTADO,EMP_ACUERDO_BAJA,EMP_CODUBI,EMP_CODTPP,EMP_CODAFN,EMP_ISSS,EMP_NIT,EMP_ELECTORAL,EMP_ELECTORAL_EXTENDIDO_EN,EMP_CARNET_RESIDENTE,EMP_NUP,EMP_REUBI,EMP_REUBI_ING,EMP_FECHA_RETIRO,EMP_FECHARET_REPORTE,EMP_CODMRT,EMP_INDEMNIZACION,EMP_PESO,EMP_ESTATURA,EMP_DONANTE,EMP_INTERNET,EMP_TALLA_ZAPATOS,EMP_TALLA_PANTALON,EMP_TALLA_CAMISA,EMP_USA_LENTES,EMP_FUMA,EMP_BEBIDA_ALCOHOLICA,EMP_IMPEDIMENTO,EMP_SERVICIO_MILITAR,EMP_GRADO_MILITAR,EMP_CASA,EMP_CUOTA_VIVIENDA,EMP_PROM_INGRESO_FAM,EMP_COLEGIATURAS,EMP_QUIEN_CUIDA_HIJOS,EMP_TIPO_BONO_ESC,EMP_FECHA_PAGO_BONOESCOLAR,EMP_VEHI_MODELO,EMP_VEHI_ANO,EMP_PLACA,EMP_CODRLI,EMP_CODCIA,EMP_FECHA_CREA,EMP_USUARIO_CREA,EMP_FECHA_MOD,EMP_USUARIO_MOD,EMP_CODTPU,EMP_CODPUE,EMP_CODUNI,EMP_SALARIO,EMP_TIPO_SALARIO,EMP_FECHA_DEL,EMP_FECHA_AL,EMP_ACUERDO,EMP_JORNADA_CONTRATO,EMP_TRABAJA_CONYUGE,EMP_DEVENGADO_CONYUGE,EMP_AFECTO_ACEP,EMP_DESCUENTA_FIANZA,EMP_AFECTO_MONTEPIO,EMP_FRECUECIA_PAGO,EMP_PLAN_JUBILA,EMP_USA_CLINICA,EMP_BECA,EMP_JUNTADIR,EMP_FECHAING_REPORTE,EMP_CODCEL,EMP_CTA_EMPLEADOS_CONTRA FROM PLA_EMP_EMPLEADO WHERE Emp_codren Not In (011,022) and (EMP_CODCIA=:1) and (fadsfasdf)

-- Familia dependiente
SELECT ROWID,EMP_CODIGO,EMP_CODIGO_ANTERIOR,EMP_PRIMER_APE,EMP_SEGUNDO_APE,EMP_APELLIDO_CAS,EMP_PRIMER_NOM,EMP_SEGUNDO_NOM,EMP_TERCER_NOM,EMP_NOMBRE_ISSS,EMP_NOMBRE_CIP,EMP_NOMBRE_NIT,EMP_DIRECCION,EMP_CODDEP,EMP_CODMUN,EMP_TELEFONO,EMP_RENGLON,EMP_CODIGO_POSTAL,EMP_FECHA_NAC,EMP_LUGAR_NAC,EMP_CODDEP_NAC,EMP_LUGAR_NAC_TEXT,EMP_NACIONALIDAD,EMP_COD_AGENTE,EMP_SUPERVISOR,EMP_FECHA_INGRESO,EMP_SEXO,EMP_ESTADO_CIVIL,EMP_TIPO_SANGRE,EMP_PROFESION,EMP_CODREN,EMP_NO_COLEGIADO,EMP_AFP,EMP_TARJETA,EMP_HORA_EXTRA,EMP_DESC_ISSS,EMP_COLEGIADO_ACTIVO,EMP_CIP,EMP_EXPEDIDA_FECHA,EMP_EXPEDIDA_DEP,EMP_EXPEDIDA_MUN,EMP_DPI,EMP_AREA,EMP_ZONA,EMP_COMISION,EMP_DOMICILIADO,EMP_SERV_PRESTADOS,EMP_RENTA_DOMICILIADO,EMP_RENTA_SERVICIO,EMP_ESTADO,EMP_ACUERDO_BAJA,EMP_CODUBI,EMP_CODTPP,EMP_CODAFN,EMP_ISSS,EMP_NIT,EMP_ELECTORAL,EMP_ELECTORAL_EXTENDIDO_EN,EMP_CARNET_RESIDENTE,EMP_NUP,EMP_REUBI,EMP_REUBI_ING,EMP_FECHA_RETIRO,EMP_FECHARET_REPORTE,EMP_CODMRT,EMP_INDEMNIZACION,EMP_PESO,EMP_ESTATURA,EMP_DONANTE,EMP_INTERNET,EMP_TALLA_ZAPATOS,EMP_TALLA_PANTALON,EMP_TALLA_CAMISA,EMP_USA_LENTES,EMP_FUMA,EMP_BEBIDA_ALCOHOLICA,EMP_IMPEDIMENTO,EMP_SERVICIO_MILITAR,EMP_GRADO_MILITAR,EMP_CASA,EMP_CUOTA_VIVIENDA,EMP_PROM_INGRESO_FAM,EMP_COLEGIATURAS,EMP_QUIEN_CUIDA_HIJOS,EMP_TIPO_BONO_ESC,EMP_FECHA_PAGO_BONOESCOLAR,EMP_VEHI_MODELO,EMP_VEHI_ANO,EMP_PLACA,EMP_CODRLI,EMP_CODCIA,EMP_FECHA_CREA,EMP_USUARIO_CREA,EMP_FECHA_MOD,EMP_USUARIO_MOD,EMP_CODTPU,EMP_CODPUE,EMP_CODUNI,EMP_SALARIO,EMP_TIPO_SALARIO,EMP_FECHA_DEL,EMP_FECHA_AL,EMP_ACUERDO,EMP_JORNADA_CONTRATO,EMP_TRABAJA_CONYUGE,EMP_DEVENGADO_CONYUGE,EMP_AFECTO_ACEP,EMP_DESCUENTA_FIANZA,EMP_AFECTO_MONTEPIO,EMP_FRECUECIA_PAGO,EMP_PLAN_JUBILA,EMP_USA_CLINICA,EMP_BECA,EMP_JUNTADIR,EMP_FECHAING_REPORTE,EMP_CODCEL,EMP_CTA_EMPLEADOS_CONTRA FROM PLA_EMP_EMPLEADO WHERE Emp_codren Not In (011,022) and (EMP_CODCIA=:1) and (fadsfasdf)

    -- Se utilizo el SP de empleados

    ------------------------------------------------
   
	--// Recontratacion de empleados
   
    -- se utilizo el SP de empleados

 ------------------------------------------------

   --// Registro de acuerdos 022

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_CON_CONTRATO (
    pOpcion IN NUMBER,
    pConContrato IN OUT VARCHAR2,
    pConCodEmp IN NUMBER,
    pConContratoMod IN VARCHAR2,
    pConAcuerdo IN VARCHAR2,
    pConPPr1 IN NUMBER,
    pConPPr2 IN NUMBER,
    pConPPr3 IN NUMBER,
    pConPPr4 IN NUMBER,
    pConPPr5 IN NUMBER,
    pConPPr6 IN NUMBER,
    pConPPr7 IN NUMBER,
    pConPPr8 IN NUMBER,
    pConCodCia IN VARCHAR2,
    pUsuario IN NUMBER,
    pEstado IN NUMBER DEFAULT 1,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
   vUsername VARCHAR2(255);
BEGIN
    SAVEPOINT transact;
      	

    IF pOpcion = 1 THEN
    
    vUsername := rhepq.obtenerUsername(pUsuario);
    
        INSERT INTO pla_con_contrato (
            CON_CONTRATO,
            CON_CODEMP,
            CON_CONTRATO_MOD,
            CON_ACUERDO,
            CON_PPR1,
            CON_PPR2,
            CON_PPR3,
            CON_PPR4,
            CON_PPR5,
            CON_PPR6,
            CON_PPR7,
            CON_PPR8,
            CON_CODCIA,
            CON_USUARIO_CREA,
            CON_FECHA_CREA,
            CON_MAQUINA_CREA
        ) VALUES (
            pConContrato,
            pConCodEmp,
            pConContratoMod,
            pConAcuerdo,
            pConPPr1,
            pConPPr2,
            pConPPr3,
            pConPPr4,
            pConPPr5,
            pConPPr6,
            pConPPr7,
            pConPPr8,
            pConCodCia,
            vUsername,
            SYSDATE,
            vUsername
        )
        RETURNING CON_CONTRATO INTO pConContrato;

    ELSIF pOpcion = 2 THEN
	    UPDATE pla_con_contrato SET
	        CON_CODEMP = pConCodEmp,
	        CON_CONTRATO_MOD = pConContratoMod,
	        CON_ACUERDO = pConAcuerdo,
	        CON_PPR1 = pConPPr1,
	        CON_PPR2 = pConPPr2,
	        CON_PPR3 = pConPPr3,
	        CON_PPR4 = pConPPr4,
	        CON_PPR5 = pConPPr5,
	        CON_PPR6 = pConPPr6,
	        CON_PPR7 = pConPPr7,
	        CON_PPR8 = pConPPr8,
	        CON_CODCIA = pConCodCia
	    WHERE CON_CONTRATO = pConContrato;
	   
    END IF;

    COMMIT;

    -- Lógica adicional para opciones de consulta
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                CON_CONTRATO,
                CON_CODEMP,
                CON_CONTRATO_MOD,
                CON_ACUERDO,
                CON_PPR1,
                CON_PPR2,
                CON_PPR3,
                CON_PPR4,
                CON_PPR5,
                CON_PPR6,
                CON_PPR7,
                CON_PPR8
            FROM pla_con_contrato
            WHERE CON_CONTRATO = pConContrato;

    ELSIF pOpcion = 5 THEN
 		SELECT COUNT(*) INTO vContador
        FROM pla_con_contrato
        WHERE 
        (
            (pConContrato IS NULL OR pConContrato = '' OR LOWER(CON_CONTRATO) LIKE '%' || LOWER(TRIM(pConContrato)) || '%')
            AND (pConCodEmp IS NULL OR CON_CODEMP = pConCodEmp)
        );

		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

        -- Abrir el cursor para obtener los resultados, incluyendo el filtro por CON_CODEMP
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        CON_CONTRATO,
                        CON_CODEMP,
                        CON_CONTRATO_MOD,
                        CON_ACUERDO,
                        CON_PPR1,
                        CON_PPR2,
                        CON_PPR3,
                        CON_PPR4,
                        CON_PPR5,
                        CON_PPR6,
                        CON_PPR7,
                        CON_PPR8
                    FROM pla_con_contrato
                    WHERE 
                    (
                        (pConContrato IS NULL OR pConContrato = '' OR LOWER(CON_CONTRATO) LIKE '%' || LOWER(TRIM(pConContrato)) || '%')
                        AND (pConCodEmp IS NULL OR CON_CODEMP = pConCodEmp)
                    )
                    ORDER BY CON_FECHA_CREA DESC
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
           
   		ELSIF pOpcion = 7 THEN
           OPEN pCursor FOR
	           SELECT 
	          	'022' AS CON_RENGLON,
	          	'0509' AS CON_509
	           FROM DUAL;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_CON_CONTRATO;

--DELETE FROM PLA_CON_CONTRATO WHERE CON_CONTRATO IS NULL

ALTER TABLE RHEPQ.PLA_CON_CONTRATO
ADD CONSTRAINT CON_CONTRATO_PK PRIMARY KEY (CON_CONTRATO);


 ------------------------------------------------  
 --# De aqui para abajo HECHO
   --// Otras Unidades
   
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_FISICA_UNIDADES(
    pOpcion IN NUMBER,
    pFisCodCia IN OUT VARCHAR2,
    pFisCodUni IN OUT NUMBER,
    pFisUniNombre IN VARCHAR2 DEFAULT NULL,
    pFisUsuarioCrea IN VARCHAR2 DEFAULT NULL,
    pFisFechaCrea IN DATE DEFAULT NULL,
    pFisMaquinaCrea IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
   	vUsername VARCHAR2(255);
BEGIN
	
    SAVEPOINT transact;      

    IF pOpcion = 1 THEN
    
    	BEGIN
		   SELECT USERNAME INTO vUsername FROM RHEPQ.ADMUSUARIO WHERE ID = pUsuario;         	
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN
		        vUsername := NULL;
		END;
    
        INSERT INTO PLA_FISICA_UNIDADES (
            FIS_CODCIA,
            FIS_CODUNI,
            FIS_UNI_NOMBRE,
            FIS_USUARIO_CREA,
            FIS_FECHA_CREA,
            FIS_MAQUINA_CREA
        ) VALUES (
            pFisCodCia,
            pFisCodUni,
            pFisUniNombre,
            vUsername,
            SYSDATE,
            vUsername
        )
        RETURNING FIS_CODUNI INTO pFisCodUni;

    ELSIF pOpcion = 2 THEN
    
       	BEGIN
		   SELECT USERNAME INTO vUsername FROM RHEPQ.ADMUSUARIO WHERE ID = pUsuario;         	
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN
		        vUsername := NULL;
		END;
    
        UPDATE PLA_FISICA_UNIDADES SET
            FIS_UNI_NOMBRE = pFisUniNombre,
            FIS_MAQUINA_CREA = vUsername,
            FIS_CODCIA = pFisCodCia
        WHERE FIS_CODUNI = pFisCodUni AND FIS_CODCIA = pFisCodCia;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                FIS_CODCIA,
                FIS_CODUNI,
                FIS_UNI_NOMBRE,
                FIS_USUARIO_CREA,
                FIS_FECHA_CREA,
                FIS_MAQUINA_CREA
            FROM PLA_FISICA_UNIDADES
            WHERE FIS_CODUNI = pFisCodUni AND FIS_CODCIA = pFisCodCia;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM PLA_FISICA_UNIDADES
		WHERE 
		(
		    FIS_CODCIA = pFisCodCia
		    AND (
		        pFisUniNombre IS NULL
		        OR pFisUniNombre = ''
		        OR LOWER(FIS_UNI_NOMBRE) LIKE '%' || LOWER(TRIM(pFisUniNombre)) || '%'
		    )
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT
		                FIS_CODCIA,
		                FIS_CODUNI,
		                FIS_UNI_NOMBRE,
		                FIS_USUARIO_CREA,
		                FIS_FECHA_CREA,
		                FIS_MAQUINA_CREA
		            FROM PLA_FISICA_UNIDADES 
		            WHERE 
		            (
		                FIS_CODCIA = pFisCodCia
		                AND (
		                    pFisUniNombre IS NULL
		                    OR pFisUniNombre = ''
		                    OR LOWER(FIS_UNI_NOMBRE) LIKE '%' || LOWER(TRIM(pFisUniNombre)) || '%'
		                )
		            )
		            ORDER BY FIS_CODUNI
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT FIS_CODUNI AS value, FIS_UNI_NOMBRE AS label
            FROM PLA_FISICA_UNIDADES
            WHERE FIS_CODCIA = pFisCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_FISICA_UNIDADES;


------------------------------------------------

   --// Boleto de Ornato
   
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_BOO_BOLETO_ORNATO(
    pOpcion IN NUMBER,
    pBooCodCia IN OUT VARCHAR2,
    pBooCodigo IN OUT NUMBER,
    pBooDesde IN NUMBER DEFAULT NULL,
    pBooHasta IN NUMBER DEFAULT NULL,
    pBooArbitrio IN NUMBER DEFAULT NULL,
    pBooTipo IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_BOO_BOLETO_ORNATO (
            BOO_CODCIA,
            BOO_CODIGO,
            BOO_DESDE,
            BOO_HASTA,
            BOO_ARBITRIO,
            BOO_TIPO
        ) VALUES (
            pBooCodCia,
            pBooCodigo,
            pBooDesde,
            pBooHasta,
            pBooArbitrio,
            pBooTipo
        )
        RETURNING BOO_CODIGO INTO pBooCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_BOO_BOLETO_ORNATO SET
            BOO_DESDE = pBooDesde,
            BOO_HASTA = pBooHasta,
            BOO_ARBITRIO = pBooArbitrio,
            BOO_TIPO = pBooTipo
        WHERE BOO_CODIGO = pBooCodigo AND BOO_CODCIA = pBooCodCia;
        
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
   
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                BOO_CODCIA,
                BOO_CODIGO,
                BOO_DESDE,
                BOO_HASTA,
                BOO_ARBITRIO,
                BOO_TIPO
            FROM PLA_BOO_BOLETO_ORNATO
            WHERE BOO_CODIGO = pBooCodigo AND BOO_CODCIA = pBooCodCia;

    ELSIF pOpcion = 5 THEN
			SELECT COUNT(*) INTO vContador
			FROM PLA_BOO_BOLETO_ORNATO
			WHERE BOO_CODCIA = pBooCodCia
			AND (
			    pBooDesde IS NULL
			    OR pBooDesde = ''
			    OR BOO_DESDE = TO_NUMBER(pBooDesde)
			    OR BOO_HASTA = TO_NUMBER(pBooDesde)
			);
			
	        -- Asignar la cantidad total de páginas
	        pTotalPage := vContador;
	       --pTotalPage := CEIL(vContador / pPageSize);
			
			-- Abrir el cursor para obtener los resultados
			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                BOO_CODCIA,
			                BOO_CODIGO,
			                BOO_DESDE,
			                BOO_HASTA,
			                BOO_ARBITRIO,
			                BOO_TIPO
			            FROM PLA_BOO_BOLETO_ORNATO
			            WHERE BOO_CODCIA = pBooCodCia
			            AND (
			                pBooDesde IS NULL
			                OR pBooDesde = ''
			                OR BOO_DESDE = TO_NUMBER(pBooDesde)
			                OR BOO_HASTA = TO_NUMBER(pBooDesde)
			            )
			            ORDER BY BOO_CODIGO
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
	    OPEN pCursor FOR
	        SELECT BOO_CODIGO AS value,
	               'Desde ' || BOO_DESDE || ' Hasta ' || BOO_HASTA AS label
	        FROM PLA_BOO_BOLETO_ORNATO
	        WHERE BOO_CODCIA = pBooCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_BOO_BOLETO_ORNATO;


------------------------------------------------

   --// Boleto de Ornato por Empleados
   
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_BOE_BORNATO_EMP(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pBoeCodCia IN OUT VARCHAR2,
    pBoeCodEmp IN OUT NUMBER,
    pBoeAnio IN NUMBER DEFAULT NULL,
    pBoeArbitrio IN NUMBER DEFAULT NULL,
    pBoeAplica IN VARCHAR2 DEFAULT NULL,
    pBoeBolNum IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_BOE_BORNATO_EMP (
            BOE_CODCIA,
            BOE_CODEMP,
            BOE_ANIO,
            BOE_ARBITRIO,
            BOE_APLICA,
            BOE_BOLNUM
        ) VALUES (
            pBoeCodCia,
            pBoeCodEmp,
            pBoeAnio,
            pBoeArbitrio,
            pBoeAplica,
            pBoeBolNum
        )
        RETURNING ROWID INTO pRowId; 

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_BOE_BORNATO_EMP SET
        	BOE_CODCIA = pBoeCodCia,
        	BOE_CODEMP = pBoeCodEmp,
            BOE_ANIO = pBoeAnio,
            BOE_ARBITRIO = pBoeArbitrio,
            BOE_APLICA = pBoeAplica,
            BOE_BOLNUM = pBoeBolNum        
       WHERE ROWID = pRowId;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
           	SELECT 
           		B.ROWID AS id,
			    BOE_CODCIA,
			    BOE_CODEMP,
			    ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(B.BOE_CODEMP) AS EMPLEADO,
			    BOE_ANIO,
			    BOE_ARBITRIO,
			    BOE_BOLNUM,
			    BOE_APLICA
			FROM PLA_BOE_BORNATO_EMP B
			LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = B.BOE_CODEMP
            WHERE B.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador 
		FROM PLA_BOE_BORNATO_EMP B
		LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = B.BOE_CODEMP
		WHERE B.BOE_ANIO = pBoeAnio AND B.BOE_CODCIA = pBoeCodCia
		AND (
		    pBoeCodEmp IS NULL
		    OR pBoeCodEmp = 0 -- Asumiendo que 0 es el valor predeterminado si el parámetro está vacío
		    OR B.BOE_CODEMP = TO_NUMBER(pBoeCodEmp)
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                B.ROWID AS id,
		                B.BOE_CODCIA,
		                B.BOE_CODEMP,
		                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(B.BOE_CODEMP) AS EMPLEADO,
		                B.BOE_ANIO,
		                B.BOE_ARBITRIO,
		                B.BOE_BOLNUM,
		                B.BOE_APLICA
		            FROM PLA_BOE_BORNATO_EMP B
		            LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = B.BOE_CODEMP
		            WHERE B.BOE_ANIO = pBoeAnio AND B.BOE_CODCIA = pBoeCodCia
		            AND (
		                pBoeCodEmp IS NULL
		                OR pBoeCodEmp = 0 -- Asumiendo que 0 es el valor predeterminado si el parámetro está vacío
		                OR B.BOE_CODEMP = TO_NUMBER(pBoeCodEmp)
		            )
		            ORDER BY B.BOE_CODEMP DESC
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT BOE_CODEMP AS value, BOE_BOLNUM AS label
            FROM PLA_BOE_BORNATO_EMP
            WHERE BOE_CODCIA = pBoeCodCia AND BOE_ANIO = pBoeAnio;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_BOE_BORNATO_EMP;


------------------------------------------------

   --// Ley de Probidad de empleados

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_EMP_PROBIDAD(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pProCodCia IN OUT VARCHAR2,
    pProCodEmp IN OUT NUMBER,
    pProNumero IN VARCHAR2 DEFAULT NULL,
    pProFechaPrimeraDeclaracion IN DATE DEFAULT NULL,
    pProFechaEntregaCargo IN DATE DEFAULT NULL,
    pProFechaEntregaColegio IN DATE DEFAULT NULL,
    pProObservaciones IN VARCHAR2 DEFAULT NULL,
    pProFechaIngreso IN DATE DEFAULT NULL,
    pProUsuarioIngreso IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_EMP_PROBIDAD (
            PRO_CODCIA,
            PRO_CODEMP,
            PRO_NUMERO,
            PRO_FECHA_PRIMERA_DECLARACION,
            PRO_FECHA_ENTREGA_CARGO,
            PRO_FECHA_ENTREGA_COLEGIO,
            PRO_OBSERVACIONES,
            PRO_FECHA_INGRESO,
            PRO_USUARIO_INGRESO
        ) VALUES (
            pProCodCia,
            pProCodEmp,
            pProNumero,
            pProFechaPrimeraDeclaracion,
            pProFechaEntregaCargo,
            pProFechaEntregaColegio,
            pProObservaciones,
            SYSDATE,
            pProUsuarioIngreso
        )
        RETURNING ROWID INTO pRowId;    

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_EMP_PROBIDAD SET
        	PRO_CODCIA = pProCodCia,
        	PRO_CODEMP = pProCodEmp,
            PRO_NUMERO = pProNumero,
            PRO_FECHA_PRIMERA_DECLARACION = pProFechaPrimeraDeclaracion,
            PRO_FECHA_ENTREGA_CARGO = pProFechaEntregaCargo,
            PRO_FECHA_ENTREGA_COLEGIO = pProFechaEntregaColegio,
            PRO_OBSERVACIONES = pProObservaciones    
       	WHERE ROWID = pRowId;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
             SELECT 
             	P.ROWID AS id,
			    P.PRO_CODCIA,
			    P.PRO_CODEMP,
			    ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(P.PRO_CODEMP) AS EMPLEADO,
			    P.PRO_NUMERO,
			    P.PRO_FECHA_PRIMERA_DECLARACION,
			    P.PRO_FECHA_ENTREGA_CARGO,
			    P.PRO_FECHA_ENTREGA_COLEGIO,
			    P.PRO_OBSERVACIONES,
			    P.PRO_FECHA_INGRESO,
			    P.PRO_USUARIO_INGRESO
			FROM PLA_EMP_PROBIDAD P
			LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
            WHERE P.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
   		SELECT COUNT(*) INTO vContador
		FROM PLA_EMP_PROBIDAD P
		LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
		WHERE P.PRO_CODCIA = pProCodCia
		AND (
		    pProNumero IS NULL
		    OR pProNumero = ''
		    OR P.PRO_NUMERO LIKE '%' || pProNumero || '%' -- Uso de LIKE para búsquedas parciales
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		-- Abrir el cursor para obtener los resultados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                P.ROWID AS id,
		                P.PRO_CODCIA,
		                P.PRO_CODEMP,
		                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(P.PRO_CODEMP) AS EMPLEADO,
		                P.PRO_NUMERO,
		                P.PRO_FECHA_PRIMERA_DECLARACION,
		                P.PRO_FECHA_ENTREGA_CARGO,
		                P.PRO_FECHA_ENTREGA_COLEGIO,
		                P.PRO_OBSERVACIONES,
		                P.PRO_FECHA_INGRESO,
		                P.PRO_USUARIO_INGRESO
		            FROM PLA_EMP_PROBIDAD P
		            LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
		            WHERE P.PRO_CODCIA = pProCodCia
		            AND (
		                pProNumero IS NULL
		                OR pProNumero = ''
		                OR P.PRO_NUMERO LIKE '%' || pProNumero || '%' -- Uso de LIKE para búsquedas parciales
		            )
		            ORDER BY P.PRO_CODEMP DESC
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
			SELECT PRO_CODEMP AS value,
			       'Código: ' || TO_CHAR(PRO_CODEMP) || ', ' ||
			       'Número: ' || TO_CHAR(PRO_NUMERO) || ', ' ||
			       'Fecha Primera Declaración: ' || TO_CHAR(PRO_FECHA_PRIMERA_DECLARACION, 'DD/MM/YYYY') AS label
			FROM PLA_EMP_PROBIDAD
			WHERE PRO_CODCIA = pProCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_EMP_PROBIDAD;


------------------------------------------------

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_EMP_PROBIDAD_DET(
    pOpcion IN NUMBER,
    pRowId IN OUT VARCHAR2,
    pProdCodCia IN OUT VARCHAR2,
    pProdCodEmp IN OUT NUMBER,
    pProdNumero IN OUT VARCHAR2,
    pProdTipoDeclaracion IN NUMBER DEFAULT NULL,
    pProdCorrelativo IN NUMBER DEFAULT NULL,
    pProdFechaDocumento IN DATE DEFAULT NULL,
    pProdObservaciones IN VARCHAR2 DEFAULT NULL,
    pProdFechaIngreso IN DATE DEFAULT NULL,
    pProdUsuarioIngreso IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_EMP_PROBIDAD_DET (
            PROD_CODCIA,
            PROD_CODEMP,
            PROD_NUMERO,
            PROD_TIPO_DECLARACION,
            PROD_CORRELATIVO,
            PROD_FECHA_DOCUMENTO,
            PROD_OBSERVACIONES,
            PROD_FECHA_INGRESO,
            PROD_USUARIO_INGRESO
        ) VALUES (
            pProdCodCia,
            pProdCodEmp,
            pProdNumero,
            pProdTipoDeclaracion,
            pProdCorrelativo,
            pProdFechaDocumento,
            pProdObservaciones,
            SYSDATE,
            pProdUsuarioIngreso
        )
        RETURNING ROWID INTO pRowId;    

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_EMP_PROBIDAD_DET SET
        	PROD_NUMERO = pProdNumero,
        	PROD_CODEMP = pProdCodEmp,
        	PROD_CODCIA = pProdCodCia,
            PROD_TIPO_DECLARACION = pProdTipoDeclaracion,
            PROD_CORRELATIVO = pProdCorrelativo,
            PROD_FECHA_DOCUMENTO = pProdFechaDocumento,
            PROD_OBSERVACIONES = pProdObservaciones    
       	WHERE ROWID = pRowId;
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			SELECT 
			    D.ROWID AS id,
			    P.PRO_CODCIA,
			    P.PRO_CODEMP,
			    ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(P.PRO_CODEMP) AS EMPLEADO,
			    P.PRO_NUMERO,
			    P.PRO_FECHA_PRIMERA_DECLARACION,
			    P.PRO_FECHA_ENTREGA_CARGO,
			    P.PRO_FECHA_ENTREGA_COLEGIO,
			    P.PRO_OBSERVACIONES,
			    P.PRO_FECHA_INGRESO,
			    P.PRO_USUARIO_INGRESO,
			    D.PROD_CODCIA,
			    D.PROD_TIPO_DECLARACION,
			    D.PROD_CORRELATIVO,
			    D.PROD_FECHA_DOCUMENTO,
			    D.PROD_OBSERVACIONES AS DET_OBSERVACIONES,
			    D.PROD_FECHA_INGRESO AS DET_FECHA_INGRESO,
			    D.PROD_USUARIO_INGRESO AS DET_USUARIO_INGRESO
			FROM PLA_EMP_PROBIDAD P
			LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
			LEFT JOIN RHEPQ.PLA_EMP_PROBIDAD_DET D ON D.PROD_CODEMP = P.PRO_CODEMP
            WHERE D.ROWID = pRowId;

    ELSIF pOpcion = 5 THEN
		SELECT COUNT(*) INTO vContador
		FROM PLA_EMP_PROBIDAD_DET D
		LEFT JOIN PLA_EMP_PROBIDAD P ON D.PROD_CODEMP = P.PRO_CODEMP
		LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
		WHERE D.PROD_CODCIA = pProdCodCia 
		AND D.PROD_CODEMP = pProdCodEmp
		AND (
		    pProdCorrelativo IS NULL
		    OR D.PROD_CORRELATIVO = pProdCorrelativo
		);
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT
		                D.ROWID AS id,
		                P.PRO_CODCIA,
		                P.PRO_CODEMP,
		                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(P.PRO_CODEMP) AS EMPLEADO,
		                P.PRO_NUMERO,
		                P.PRO_FECHA_PRIMERA_DECLARACION,
		                P.PRO_FECHA_ENTREGA_CARGO,
		                P.PRO_FECHA_ENTREGA_COLEGIO,
		                P.PRO_OBSERVACIONES,
		                P.PRO_FECHA_INGRESO,
		                P.PRO_USUARIO_INGRESO,
		                D.PROD_CODCIA,
		                D.PROD_TIPO_DECLARACION,
		                D.PROD_CORRELATIVO,
		                D.PROD_FECHA_DOCUMENTO,
		                D.PROD_OBSERVACIONES AS DET_OBSERVACIONES,
		                D.PROD_FECHA_INGRESO AS DET_FECHA_INGRESO,
		                D.PROD_USUARIO_INGRESO AS DET_USUARIO_INGRESO
		            FROM PLA_EMP_PROBIDAD P
		            LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = P.PRO_CODEMP
		            LEFT JOIN RHEPQ.PLA_EMP_PROBIDAD_DET D ON D.PROD_CODEMP = P.PRO_CODEMP
		            WHERE D.PROD_CODCIA = pProdCodCia 
		            AND D.PROD_CODEMP = pProdCodEmp
		            AND (
		                pProdCorrelativo IS NULL
		                OR D.PROD_CORRELATIVO = pProdCorrelativo
		            )
		            ORDER BY D.PROD_CORRELATIVO DESC
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT PROD_CODEMP AS value, PROD_NUMERO AS label
            FROM PLA_EMP_PROBIDAD_DET
            WHERE PROD_CODCIA = pProdCodCia AND PROD_CODEMP = pProdCodEmp;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_EMP_PROBIDAD_DET;


------------------------------------------------

   --// Uniformes empleados EPQ # Pendiente


------------------------------------------------

   --// Marcas de reloj  # Pendiente


------------------------------------------------

   --// Control de cafeteria -- no se utiliza


   ------------------------------------------------
   
   --// Control de reloj -- no se utiliza


-----------------------------------------------------------

--######################## AQUI TERMINA SUB MODULO EXPEDIENTES DE PERSONAL ########################

----------------------------------------------------------

-------------------------- #### MODULO PERSONAL AJENO ----------------------------------

--- ############ SUBMODULO DE CATALOGOS

------------------------------------------------

   --// Tipos de gafetes

CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_TIPO_GAFETE (
    pOpcion IN NUMBER,
    pGafCodigo IN OUT NUMBER,
    pGafDescripcion IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    -- Punto de guardado para manejar transacciones
    SAVEPOINT transact;
   
    IF pOpcion = 1 THEN
        INSERT INTO CIP_TIPO_GAFETE (
            CIP_GAF_CODIGO,
            CIP_GAF_DESCRIPCION
        ) VALUES (
            pGafCodigo,
            pGafDescripcion
        )
        RETURNING CIP_GAF_CODIGO INTO pGafCodigo;
       
    ELSIF pOpcion = 2 THEN
        UPDATE CIP_TIPO_GAFETE SET
            CIP_GAF_DESCRIPCION = pGafDescripcion
        WHERE CIP_GAF_CODIGO = pGafCodigo;
       
   COMMIT;
       
    END IF;

    -- Opciones de selección y paginación
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                CIP_GAF_CODIGO,
                CIP_GAF_DESCRIPCION
            FROM CIP_TIPO_GAFETE
            WHERE CIP_GAF_CODIGO = pGafCodigo;

    ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM CIP_TIPO_GAFETE
	    WHERE 
	    (
	        pGafDescripcion IS NULL
	        OR pGafDescripcion = ''
	        OR LOWER(CIP_GAF_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGafDescripcion)) || '%'
	    );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados considerando la búsqueda por descripción
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                    CIP_GAF_CODIGO,
	                    CIP_GAF_DESCRIPCION
	                FROM CIP_TIPO_GAFETE
	                WHERE 
	                (
	                    pGafDescripcion IS NULL
	                    OR pGafDescripcion = ''
	                    OR LOWER(CIP_GAF_DESCRIPCION) LIKE '%' || LOWER(TRIM(pGafDescripcion)) || '%'
	                )
	                ORDER BY CIP_GAF_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
     ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT CIP_GAF_CODIGO AS value, CIP_GAF_DESCRIPCION AS label
            FROM CIP_TIPO_GAFETE;
           
    END IF;

    EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK TO transact;
                RAISE;
    END SP_CIP_TIPO_GAFETE;

------------------------------------------------

   --// Areas de Acceso

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_AREAS (
    pOpcion IN NUMBER,
    pCipAreaCodigo IN OUT NUMBER,
    pCipAreaDescripcion IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;
    IF pOpcion = 1 THEN -- Inserción
        INSERT INTO RHEPQ.CIP_AREAS (
            CIP_AREA_CODIGO,
            CIP_AREA_DESCRIPCION
        ) VALUES (
            pCipAreaCodigo,
            pCipAreaDescripcion
        )
        RETURNING CIP_AREA_CODIGO INTO pCipAreaCodigo;
    ELSIF pOpcion = 2 THEN -- Actualización
        UPDATE RHEPQ.CIP_AREAS SET
            CIP_AREA_DESCRIPCION = pCipAreaDescripcion
        WHERE CIP_AREA_CODIGO = pCipAreaCodigo;
    END IF; -- Cierra el primer bloque IF
    COMMIT;
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                CIP_AREA_CODIGO,
                CIP_AREA_DESCRIPCION
            FROM RHEPQ.CIP_AREAS
            WHERE CIP_AREA_CODIGO = pCipAreaCodigo;
    ELSIF pOpcion = 5 THEN -- Paginación
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.CIP_AREAS
	    WHERE (pCipAreaDescripcion IS NULL
	           OR pCipAreaDescripcion = ''
	           OR LOWER(CIP_AREA_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipAreaDescripcion)) || '%');
	
	   		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                    CIP_AREA_CODIGO,
	                    CIP_AREA_DESCRIPCION
	                FROM RHEPQ.CIP_AREAS
	                WHERE (pCipAreaDescripcion IS NULL
	                       OR pCipAreaDescripcion = ''
	                       OR LOWER(CIP_AREA_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipAreaDescripcion)) || '%')
	                ORDER BY CIP_AREA_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT CIP_AREA_CODIGO AS value, CIP_AREA_DESCRIPCION AS label
            FROM RHEPQ.CIP_AREAS;
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
    END SP_CIP_AREAS;

------------------------------------------------

   --// Tipos de Empresa

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_TIPO_EMPRESA (
    pOpcion IN NUMBER,
    pCipTipCodigo IN OUT NUMBER,
    pCipTipDescripcion IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;
   
    IF pOpcion = 1 THEN -- Inserción
        INSERT INTO RHEPQ.CIP_TIPO_EMPRESA (
            CIP_TIP_CODIGO,
            CIP_TIP_DESCRIPCION
        ) VALUES (
            pCipTipCodigo,
            pCipTipDescripcion
        )
        RETURNING CIP_TIP_CODIGO INTO pCipTipCodigo;
       
    ELSIF pOpcion = 2 THEN -- Actualización
        UPDATE RHEPQ.CIP_TIPO_EMPRESA SET
            CIP_TIP_DESCRIPCION = pCipTipDescripcion
        WHERE CIP_TIP_CODIGO = pCipTipCodigo;
       
	COMMIT;
       
   END IF; -- Cierra el primer bloque IF
   
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                CIP_TIP_CODIGO,
                CIP_TIP_DESCRIPCION
            FROM RHEPQ.CIP_TIPO_EMPRESA
            WHERE CIP_TIP_CODIGO = pCipTipCodigo;
           
    ELSIF pOpcion = 5 THEN -- Paginación
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.CIP_TIPO_EMPRESA
	    WHERE (pCipTipDescripcion IS NULL
	           OR pCipTipDescripcion = ''
	           OR LOWER(CIP_TIP_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipTipDescripcion)) || '%');
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                    CIP_TIP_CODIGO,
	                    CIP_TIP_DESCRIPCION
	                FROM RHEPQ.CIP_TIPO_EMPRESA
	                WHERE (pCipTipDescripcion IS NULL
	                       OR pCipTipDescripcion = ''
	                       OR LOWER(CIP_TIP_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipTipDescripcion)) || '%')
	                ORDER BY CIP_TIP_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize -- Límite superior para la paginación
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize; 
       
    ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT CIP_TIP_CODIGO AS value, CIP_TIP_DESCRIPCION AS label
            FROM RHEPQ.CIP_TIPO_EMPRESA;
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
    END SP_CIP_TIPO_EMPRESA;

------------------------------------------------

   --// Estatus

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_ESTATUS (
    pOpcion IN NUMBER,
    pCipEstCodigo IN OUT NUMBER,
    pCipEstDescripcion IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;
   
    IF pOpcion = 1 THEN -- Inserción
        INSERT INTO RHEPQ.CIP_ESTATUS (
            CIP_EST_CODIGO,
            CIP_EST_DESCRIPCION
        ) VALUES (
            pCipEstCodigo,
            pCipEstDescripcion
        )
        RETURNING CIP_EST_CODIGO INTO pCipEstCodigo;
       
    ELSIF pOpcion = 2 THEN -- Actualización
        UPDATE RHEPQ.CIP_ESTATUS SET
            CIP_EST_DESCRIPCION = pCipEstDescripcion
        WHERE CIP_EST_CODIGO = pCipEstCodigo;

   COMMIT;
       
    END IF; -- Cierra el primer bloque IF
    
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                CIP_EST_CODIGO,
                CIP_EST_DESCRIPCION
            FROM RHEPQ.CIP_ESTATUS
            WHERE CIP_EST_CODIGO = pCipEstCodigo;
           
    ELSIF pOpcion = 5 THEN -- Paginación
	  SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.CIP_ESTATUS
	    WHERE (pCipEstDescripcion IS NULL
	           OR pCipEstDescripcion = ''
	           OR LOWER(CIP_EST_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipEstDescripcion)) || '%');
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                    CIP_EST_CODIGO,
	                    CIP_EST_DESCRIPCION
	                FROM RHEPQ.CIP_ESTATUS
	                WHERE (pCipEstDescripcion IS NULL
	                       OR pCipEstDescripcion = ''
	                       OR LOWER(CIP_EST_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipEstDescripcion)) || '%')
	                ORDER BY CIP_EST_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize -- Límite superior para la paginación
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT CIP_EST_CODIGO AS value, CIP_EST_DESCRIPCION AS label
            FROM RHEPQ.CIP_ESTATUS;
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
    END SP_CIP_ESTATUS;

------------------------------------------------

   --// Tipos de Puestos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_PUESTO (
    pOpcion IN NUMBER,
    pCipPuestoCodigo IN OUT NUMBER,
    pCipEmpCodigo IN NUMBER,
    pCipTipCodigo IN NUMBER,
    pCipPuestoDescripcion IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;
   
    IF pOpcion = 1 THEN -- Inserción
        SELECT COUNT(*) + 1 INTO vContador
            FROM RHEPQ.CIP_PUESTO
            WHERE CIP_EMP_CODIGO = pCipEmpCodigo
              AND CIP_TIP_CODIGO = pCipTipCodigo
              AND CIP_PUESTO_DESCRIPCION <> pCipPuestoDescripcion;
        INSERT INTO RHEPQ.CIP_PUESTO (
            CIP_PUESTO_CODIGO,
            CIP_EMP_CODIGO,
            CIP_TIP_CODIGO,
            CIP_PUESTO_DESCRIPCION
        ) VALUES (
            vContador,
            pCipEmpCodigo,
            pCipTipCodigo,
            pCipPuestoDescripcion
        )
        RETURNING CIP_PUESTO_CODIGO INTO pCipPuestoCodigo;
       
    ELSIF pOpcion = 2 THEN -- Actualización
        UPDATE RHEPQ.CIP_PUESTO SET
            CIP_PUESTO_DESCRIPCION = pCipPuestoDescripcion
        WHERE CIP_PUESTO_CODIGO = pCipPuestoCodigo
          AND CIP_EMP_CODIGO = pCipEmpCodigo
          AND CIP_TIP_CODIGO = pCipTipCodigo;

    COMMIT;
         
    END IF; -- Cierra el primer bloque IF
   
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT DISTINCT
                        p.CIP_PUESTO_CODIGO,
                        p.CIP_EMP_CODIGO,
                        e.CIP_EMP_NOMBRE AS EMPRESA_NOMBRE,
                        p.CIP_TIP_CODIGO,
                        t.CIP_TIP_DESCRIPCION AS TIPO_EMPRESA_DESCRIPCION,
                        p.CIP_PUESTO_DESCRIPCION
                    FROM 
                        RHEPQ.CIP_PUESTO p
                        JOIN RHEPQ.CIP_EMPRESAS e ON p.CIP_EMP_CODIGO = e.CIP_EMP_CODIGO
                        JOIN RHEPQ.CIP_TIPO_EMPRESA t ON p.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
            WHERE p.CIP_PUESTO_CODIGO = pCipPuestoCodigo
              AND p.CIP_EMP_CODIGO = pCipEmpCodigo
              AND p.CIP_TIP_CODIGO = pCipTipCodigo;
             
    ELSIF pOpcion = 5 THEN -- Paginación
        SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.CIP_PUESTO p
	    LEFT JOIN RHEPQ.CIP_EMPRESAS e ON p.CIP_EMP_CODIGO = e.CIP_EMP_CODIGO AND P.CIP_TIP_CODIGO = E.CIP_TIP_CODIGO
	    LEFT JOIN RHEPQ.CIP_TIPO_EMPRESA t ON p.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
	    WHERE (pCipPuestoDescripcion IS NULL
	           OR pCipPuestoDescripcion = ''
	           OR LOWER(p.CIP_PUESTO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipPuestoDescripcion)) || '%');
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT DISTINCT
	                    p.CIP_PUESTO_CODIGO,
	                    p.CIP_EMP_CODIGO,
	                    e.CIP_EMP_NOMBRE AS EMPRESA_NOMBRE,
	                    p.CIP_TIP_CODIGO,
	                    t.CIP_TIP_DESCRIPCION AS TIPO_EMPRESA_DESCRIPCION,
	                    p.CIP_PUESTO_DESCRIPCION
	                FROM 
	                    RHEPQ.CIP_PUESTO p
	                    LEFT JOIN RHEPQ.CIP_EMPRESAS e ON p.CIP_EMP_CODIGO = e.CIP_EMP_CODIGO AND P.CIP_TIP_CODIGO = E.CIP_TIP_CODIGO
	                    LEFT JOIN RHEPQ.CIP_TIPO_EMPRESA t ON p.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
	                WHERE (pCipPuestoDescripcion IS NULL
	                       OR pCipPuestoDescripcion = ''
	                       OR LOWER(p.CIP_PUESTO_DESCRIPCION) LIKE '%' || LOWER(TRIM(pCipPuestoDescripcion)) || '%')
	                ORDER BY p.CIP_PUESTO_CODIGO, p.CIP_EMP_CODIGO, p.CIP_TIP_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize -- Límite superior para la paginación
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT
                CIP_PUESTO_CODIGO AS value,
                CIP_PUESTO_DESCRIPCION AS label
            FROM RHEPQ.CIP_PUESTO;
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
    END SP_CIP_PUESTO;

------------------------------------------------

   --// Empresas

    CREATE OR REPLACE PROCEDURE RHEPQ.SP_CIP_EMPRESAS (
    pOpcion IN NUMBER,
    pCipEmpCodigo IN OUT NUMBER,
    pCipTipCodigo IN NUMBER,
    pCipEmpNombre IN VARCHAR2,
    pCipEmpSiglas IN VARCHAR2,
    pCipEmpContacto IN VARCHAR2,
    pCipEmpPueContacto IN VARCHAR2,
    pCipEmpDireccion IN VARCHAR2,
    pCipEmpTelefono IN VARCHAR2,
    pCipEmpEmail IN VARCHAR2,
    pCipEmpObservaciones IN VARCHAR2,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;
    IF pOpcion = 1 THEN -- Inserción
        INSERT INTO RHEPQ.CIP_EMPRESAS (
            CIP_EMP_CODIGO,
            CIP_TIP_CODIGO,
            CIP_EMP_NOMBRE,
            CIP_EMP_SIGLAS,
            CIP_EMP_CONTACTO,
            CIP_EMP_PUE_CONTACTO,
            CIP_EMP_DIRECCION,
            CIP_EMP_TELEFONO,
            CIP_EMP_EMAIL,
            CIP_EMP_OBSERVACIONES
        ) VALUES (
            pCipEmpCodigo,
            pCipTipCodigo,
            pCipEmpNombre,
            pCipEmpSiglas,
            pCipEmpContacto,
            pCipEmpPueContacto,
            pCipEmpDireccion,
            pCipEmpTelefono,
            pCipEmpEmail,
            pCipEmpObservaciones
        )
        RETURNING CIP_EMP_CODIGO INTO pCipEmpCodigo;
       
    ELSIF pOpcion = 2 THEN -- Actualización
        UPDATE RHEPQ.CIP_EMPRESAS SET
            CIP_EMP_NOMBRE = pCipEmpNombre,
            CIP_EMP_SIGLAS = pCipEmpSiglas,
            CIP_EMP_CONTACTO = pCipEmpContacto,
            CIP_EMP_PUE_CONTACTO = pCipEmpPueContacto,
            CIP_EMP_DIRECCION = pCipEmpDireccion,
            CIP_EMP_TELEFONO = pCipEmpTelefono,
            CIP_EMP_EMAIL = pCipEmpEmail,
            CIP_EMP_OBSERVACIONES = pCipEmpObservaciones
        WHERE CIP_EMP_CODIGO = pCipEmpCodigo AND CIP_TIP_CODIGO = pCipTipCodigo;
       
   COMMIT;
  
   END IF; -- Cierra el primer bloque IF  
   
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                e.CIP_EMP_CODIGO,
                e.CIP_TIP_CODIGO,
                t.CIP_TIP_DESCRIPCION,
                e.CIP_EMP_NOMBRE,
                e.CIP_EMP_SIGLAS,
                e.CIP_EMP_CONTACTO,
                e.CIP_EMP_PUE_CONTACTO,
                e.CIP_EMP_DIRECCION,
                e.CIP_EMP_TELEFONO,
                e.CIP_EMP_EMAIL,
                e.CIP_EMP_OBSERVACIONES
            FROM RHEPQ.CIP_EMPRESAS e
            JOIN RHEPQ.CIP_TIPO_EMPRESA t ON e.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
            WHERE e.CIP_EMP_CODIGO = pCipEmpCodigo AND e.CIP_TIP_CODIGO = pCipTipCodigo;
           
    ELSIF pOpcion = 5 THEN -- Paginación
            SELECT COUNT(*) INTO vContador
		    FROM RHEPQ.CIP_EMPRESAS e
		    JOIN RHEPQ.CIP_TIPO_EMPRESA t ON e.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
		    WHERE (pCipEmpNombre IS NULL
		           OR pCipEmpNombre = ''
		           OR LOWER(e.CIP_EMP_NOMBRE) LIKE '%' || LOWER(TRIM(pCipEmpNombre)) || '%');
		
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		
		    -- Abrir el cursor para obtener los resultados paginados y filtrados
		    OPEN pCursor FOR
		        SELECT * FROM (
		            SELECT a.*, ROWNUM rnum
		            FROM (
		                SELECT
		                    e.CIP_EMP_CODIGO,
		                    e.CIP_TIP_CODIGO,
		                    t.CIP_TIP_DESCRIPCION,
		                    e.CIP_EMP_NOMBRE,
		                    e.CIP_EMP_SIGLAS,
		                    e.CIP_EMP_CONTACTO,
		                    e.CIP_EMP_PUE_CONTACTO,
		                    e.CIP_EMP_DIRECCION,
		                    e.CIP_EMP_TELEFONO,
		                    e.CIP_EMP_EMAIL,
		                    e.CIP_EMP_OBSERVACIONES
		                FROM RHEPQ.CIP_EMPRESAS e
		                JOIN RHEPQ.CIP_TIPO_EMPRESA t ON e.CIP_TIP_CODIGO = t.CIP_TIP_CODIGO
		                WHERE (pCipEmpNombre IS NULL
		                       OR pCipEmpNombre = ''
		                       OR LOWER(e.CIP_EMP_NOMBRE) LIKE '%' || LOWER(TRIM(pCipEmpNombre)) || '%')
		                ORDER BY e.CIP_EMP_CODIGO, e.CIP_TIP_CODIGO
		            ) a
		            WHERE ROWNUM <= pPageNumber * pPageSize -- Límite superior para la paginación
		        )
		        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    ELSIF pOpcion = 6 THEN -- Lista simple
        OPEN pCursor FOR
            SELECT
                CIP_EMP_CODIGO AS value,
                CIP_EMP_NOMBRE AS label
            FROM RHEPQ.CIP_EMPRESAS;
           
    END IF;
   
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO transact;
            RAISE;
    END SP_CIP_EMPRESAS;

------------------------------------------------

   --// Persona que Autoriza
    
------------------------------------------------

   --// Personas

--- ############ SUBMODULO DE MANTENIMIENTOS

------------------------------------------------

   --// Datos Gafetes

------------------------------------------------

   --// Detalle de Personas

------------------------------------------------

   --// Autorizaciones

------------------------------------------------

   --// Marbetes

------------------------------------------------

   --// Ingreso de Vehiculos

------------------------------------------------

   --// Impresion Gafetes

-----------------------------------------------------------

--######################## AQUI TERMINA MODULO DE PERSONAL AJENO ########################


--######################## MODULO ADMINISTRACION DE SALARIOS ########################

--- ############ SUBMODULO DE MANTENIMIENTOS


SELECT ROWID,TDC_CODCIA,TDC_CODIGO,TDC_DESCRIPCION,TDC_CTA_CONTABLE,TDC_CTA_CONTABLE2,TDC_CTA_CONTABLE3,TDC_CTA_PPTO1,TDC_PRIORIDAD,TDC_PRIORIDAD_REPORTE,TDC_NOMBRECORTO,TDC_AFP,TDC_RENTA,TDC_SALARIO_PROM FROM PLA_TDC_TIPO_DESCUENTO WHERE (TDC_CODCIA=:1) and (fasdfas)
 
   --// Tablas ISR

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_ISR_ISR(
    pOpcion IN NUMBER,
    pIsrDesde IN OUT NUMBER,
    pIsrHasta IN NUMBER DEFAULT NULL,
    pIsrValor IN NUMBER DEFAULT NULL,
    pIsrPct IN NUMBER DEFAULT NULL,
    pIsrExcedente IN NUMBER DEFAULT NULL,
    pIsrTipo IN VARCHAR2 DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    -- Inserción o actualización basada en pOpcion
    IF pOpcion = 1 THEN
        INSERT INTO PLA_ISR_ISR (
            ISR_DESDE,
            ISR_HASTA,
            ISR_VALOR,
            ISR_PCT,
            ISR_EXCEDENTE,
            ISR_TIPO
        ) VALUES (
            pIsrDesde,
            pIsrHasta,
            pIsrValor,
            pIsrPct,
            pIsrExcedente,
            pIsrTipo
        )
        RETURNING ISR_DESDE INTO pIsrDesde;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_ISR_ISR SET
            ISR_HASTA = pIsrHasta,
            ISR_VALOR = pIsrValor,
            ISR_PCT = pIsrPct,
            ISR_EXCEDENTE = pIsrExcedente
        WHERE ISR_DESDE = pIsrDesde AND ISR_TIPO = pIsrTipo;
    
       COMMIT;
       
       END IF;

    -- Lógica general para opciones 1, 2, 3, 4
	IF pOpcion IN (1, 2, 3, 4) THEN
	    OPEN pCursor FOR
	        SELECT
	            ISR_DESDE,
	            ISR_HASTA,
	            ISR_VALOR,
	            ISR_PCT,
	            ISR_EXCEDENTE,
	            ISR_TIPO
	        FROM PLA_ISR_ISR
	        WHERE ISR_DESDE = pIsrDesde AND ISR_TIPO = pIsrTipo;
           
    -- Filtrado específico para la opción 5
    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_ISR_ISR
        WHERE 
        (
            pIsrTipo IS NULL
            OR pIsrTipo = ''
            OR LOWER(ISR_TIPO) LIKE '%' || LOWER(TRIM(pIsrTipo)) || '%'
        );
        
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
        
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        ISR_DESDE,
                        ISR_HASTA,
                        ISR_VALOR,
                        ISR_PCT,
                        ISR_EXCEDENTE,
                        ISR_TIPO
                    FROM PLA_ISR_ISR
                    WHERE 
                    (
                        pIsrTipo IS NULL
                        OR pIsrTipo = ''
                        OR LOWER(ISR_TIPO) LIKE '%' || LOWER(TRIM(pIsrTipo)) || '%'
                    )
                    ORDER BY ISR_DESDE, ISR_TIPO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_ISR_ISR;

    --// Tablas Seguro Social

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_PSS_ISSS(
    pOpcion IN NUMBER,
    pPssDesde IN OUT NUMBER,
    pPssHasta IN NUMBER DEFAULT NULL,
    pPssValor IN NUMBER DEFAULT NULL,
    pPssPct IN NUMBER DEFAULT NULL,
    pPssExcedente IN NUMBER DEFAULT NULL,
    pPssValorP IN NUMBER DEFAULT NULL,
    pPssPctP IN NUMBER DEFAULT NULL,
    pPssExcedenteP IN NUMBER DEFAULT NULL,
    pPssTipo IN VARCHAR2 DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    -- Inserción o actualización basada en pOpcion
    IF pOpcion = 1 THEN
        INSERT INTO PLA_PSS_ISSS (
            PSS_DESDE,
            PSS_HASTA,
            PSS_VALOR,
            PSS_PCT,
            PSS_EXCEDENTE,
            PSS_VALOR_P,
            PSS_PCT_P,
            PSS_EXCEDENTE_P,
            PSS_TIPO
        ) VALUES (
            pPssDesde,
            pPssHasta,
            pPssValor,
            pPssPct,
            pPssExcedente,
            pPssValorP,
            pPssPctP,
            pPssExcedenteP,
            pPssTipo
        )
        RETURNING PSS_DESDE INTO pPssDesde;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_PSS_ISSS SET
            PSS_HASTA = pPssHasta,
            PSS_VALOR = pPssValor,
            PSS_PCT = pPssPct,
            PSS_EXCEDENTE = pPssExcedente,
            PSS_VALOR_P = pPssValorP,
            PSS_PCT_P = pPssPctP,
            PSS_EXCEDENTE_P = pPssExcedenteP
        WHERE PSS_DESDE = pPssDesde AND PSS_TIPO = pPssTipo;
    
   COMMIT;
       
    END IF;

    -- Lógica general para opciones 1, 2, 3, 4
	IF pOpcion IN (1, 2, 3, 4) THEN
	    OPEN pCursor FOR
	        SELECT
	            PSS_DESDE,
	            PSS_HASTA,
	            PSS_VALOR,
	            PSS_PCT,
	            PSS_EXCEDENTE,
	            PSS_VALOR_P,
	            PSS_PCT_P,
	            PSS_EXCEDENTE_P,
	            PSS_TIPO
	        FROM PLA_PSS_ISSS
	        WHERE PSS_DESDE = pPssDesde AND PSS_TIPO = pPssTipo;

    -- Filtrado específico para la opción 5
    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_PSS_ISSS
        WHERE 
        (
            pPssTipo IS NULL
            OR pPssTipo = ''
            OR LOWER(PSS_TIPO) LIKE '%' || LOWER(TRIM(pPssTipo)) || '%'
        );
        
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
        
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        PSS_DESDE,
                        PSS_HASTA,
                        PSS_VALOR,
                        PSS_PCT,
                        PSS_EXCEDENTE,
                        PSS_VALOR_P,
                        PSS_PCT_P,
                        PSS_EXCEDENTE_P,
                        PSS_TIPO
                    FROM PLA_PSS_ISSS
                    WHERE 
                    (
                        pPssTipo IS NULL
                        OR pPssTipo = ''
                        OR LOWER(PSS_TIPO) LIKE '%' || LOWER(TRIM(pPssTipo)) || '%'
                    )
                    ORDER BY PSS_DESDE, PSS_TIPO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_PSS_ISSS;

    --// Tablas Montepio

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_MON_MONTEPIO(
    pOpcion IN NUMBER,
    pMonCodCia IN VARCHAR2 DEFAULT NULL,
    pMonValorDel IN NUMBER DEFAULT NULL,
    pMonValorAl IN NUMBER DEFAULT NULL,
    pMonPorcentaje IN NUMBER DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_MON_MONTEPIO (
            MON_CODCIA,
            MON_VALOR_DEL,
            MON_VALOR_AL,
            MON_PORCENTAJE
        ) VALUES (
            pMonCodCia,
            pMonValorDel,
            pMonValorAl,
            pMonPorcentaje
        );

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_MON_MONTEPIO SET
            MON_PORCENTAJE = pMonPorcentaje
        WHERE MON_CODCIA = pMonCodCia AND MON_VALOR_DEL = pMonValorDel AND MON_VALOR_AL = pMonValorAl;

    COMMIT;

    END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                MON_CODCIA,
                MON_VALOR_DEL,
                MON_VALOR_AL,
                MON_PORCENTAJE
            FROM PLA_MON_MONTEPIO
            WHERE MON_CODCIA = pMonCodCia AND MON_VALOR_DEL = pMonValorDel AND MON_VALOR_AL = pMonValorAl;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_MON_MONTEPIO;
        
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
        
        -- Abrir el cursor para obtener los resultados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        MON_CODCIA,
                        MON_VALOR_DEL,
                        MON_VALOR_AL,
                        MON_PORCENTAJE
                    FROM PLA_MON_MONTEPIO
                    ORDER BY MON_CODCIA, MON_VALOR_DEL, MON_VALOR_AL
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_MON_MONTEPIO;

    --// Tabla descuentos AFP
   
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_AFP_AFPS(
    pOpcion IN NUMBER,
    pAfpCodigo IN OUT VARCHAR2,
    pAfpEmpleado IN NUMBER DEFAULT NULL,
    pAfpPatrono IN NUMBER DEFAULT NULL,
    pAfpComision IN NUMBER DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_AFP_AFPS (
            AFP_CODIGO,
            AFP_EMPLEADO,
            AFP_PATRONO,
            AFP_COMISION
        ) VALUES (
            pAfpCodigo,
            pAfpEmpleado,
            pAfpPatrono,
            pAfpComision
        )
       	RETURNING AFP_CODIGO INTO pAfpCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_AFP_AFPS SET
            AFP_EMPLEADO = pAfpEmpleado,
            AFP_PATRONO = pAfpPatrono,
            AFP_COMISION = pAfpComision
        WHERE AFP_CODIGO = pAfpCodigo;

    COMMIT;

    END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                AFP_CODIGO,
                AFP_EMPLEADO,
                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(AFP_EMPLEADO) AS NOMBRE_EMPLEADO,
                AFP_PATRONO,
                AFP_COMISION
            FROM PLA_AFP_AFPS
            WHERE AFP_CODIGO = pAfpCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_AFP_AFPS;
        
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
        
        -- Abrir el cursor para obtener los resultados
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        AFP_CODIGO,
                        AFP_EMPLEADO,
                        ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(AFP_EMPLEADO) AS NOMBRE_EMPLEADO,
                        AFP_PATRONO,
                        AFP_COMISION
                    FROM PLA_AFP_AFPS
                    ORDER BY AFP_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_AFP_AFPS;

    --// Jornadas de Trabajo
    
CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_JOR_JORNADA(
    pOpcion IN NUMBER,
    pJorCodCia IN OUT VARCHAR2,
    pJorCodigo IN OUT VARCHAR2,
    pJorHoraDel IN DATE DEFAULT NULL,
    pJorHoraAl IN DATE DEFAULT NULL,
    pJorHoraDelS IN DATE DEFAULT NULL,
    pJorHoraAlS IN DATE DEFAULT NULL,
    pJorDescripcion IN VARCHAR2 DEFAULT NULL,
    pJorValorBono IN NUMBER DEFAULT NULL,
    pJorHorario IN VARCHAR2 DEFAULT NULL,
    pJorHoras IN NUMBER DEFAULT NULL,
    pJorHorasS IN NUMBER DEFAULT NULL,
    pJorAlmuerzo IN NUMBER DEFAULT NULL,
    pJorNumHoraAnterior IN NUMBER DEFAULT NULL,
    pJorNumHoraPosterior IN NUMBER DEFAULT NULL,
    pJorNombre IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_JOR_JORNADA (
            JOR_CODCIA,
            JOR_CODIGO,
            JOR_HORA_DEL,
            JOR_HORA_AL,
            JOR_HORA_DEL_S,
            JOR_HORA_AL_S,
            JOR_DESCRIPCION,
            JOR_VALOR_BONO,
            JOR_HORARIO,
            JOR_HORAS,
            JOR_HORAS_S,
            JOR_ALMUERZO,
            JOR_NUMHORA_ANTERIOR,
            JOR_NUMHORA_POSTERIOR,
            JOR_NOMBRE
        ) VALUES (
            pJorCodCia,
            pJorCodigo,
            pJorHoraDel,
            pJorHoraAl,
            pJorHoraDelS,
            pJorHoraAlS,
            pJorDescripcion,
            pJorValorBono,
            pJorHorario,
            pJorHoras,
            pJorHorasS,
            pJorAlmuerzo,
            pJorNumHoraAnterior,
            pJorNumHoraPosterior,
            pJorNombre
        )
        RETURNING JOR_CODCIA, JOR_CODIGO INTO pJorCodCia, pJorCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_JOR_JORNADA SET
            JOR_HORA_DEL = pJorHoraDel,
            JOR_HORA_AL = pJorHoraAl,
            JOR_HORA_DEL_S = pJorHoraDelS,
            JOR_HORA_AL_S = pJorHoraAlS,
            JOR_DESCRIPCION = pJorDescripcion,
            JOR_VALOR_BONO = pJorValorBono,
            JOR_HORARIO = pJorHorario,
            JOR_HORAS = pJorHoras,
            JOR_HORAS_S = pJorHorasS,
            JOR_ALMUERZO = pJorAlmuerzo,
            JOR_NUMHORA_ANTERIOR = pJorNumHoraAnterior,
            JOR_NUMHORA_POSTERIOR = pJorNumHoraPosterior,
            JOR_NOMBRE = pJorNombre
        WHERE JOR_CODCIA = pJorCodCia AND JOR_CODIGO = pJorCodigo;
       
    END IF; -- Cierra el primer bloque IF

    COMMIT;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                JOR_CODCIA,
                JOR_CODIGO,
                JOR_HORA_DEL,
                JOR_HORA_AL,
                JOR_HORA_DEL_S,
                JOR_HORA_AL_S,
                JOR_DESCRIPCION,
                JOR_VALOR_BONO,
                JOR_HORARIO,
                JOR_HORAS,
                JOR_HORAS_S,
                JOR_ALMUERZO,
                JOR_NUMHORA_ANTERIOR,
                JOR_NUMHORA_POSTERIOR,
                JOR_NOMBRE
            FROM PLA_JOR_JORNADA
            WHERE JOR_CODCIA = pJorCodCia AND JOR_CODIGO = pJorCodigo;

	ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM PLA_JOR_JORNADA
	    WHERE 
	    (
	        pJorNombre IS NULL
	        OR pJorNombre = ''
	        OR LOWER(JOR_NOMBRE) LIKE '%' || LOWER(TRIM(pJorNombre)) || '%'
	    );
	    
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    ROWID AS id,
	                    JOR_CODCIA,
		                JOR_CODIGO,
		                JOR_HORA_DEL,
		                JOR_HORA_AL,
		                JOR_HORA_DEL_S,
		                JOR_HORA_AL_S,
		                JOR_DESCRIPCION,
		                JOR_VALOR_BONO,
		                JOR_HORARIO,
		                JOR_HORAS,
		                JOR_HORAS_S,
		                JOR_ALMUERZO,
		                JOR_NUMHORA_ANTERIOR,
		                JOR_NUMHORA_POSTERIOR,
		                JOR_NOMBRE
	                FROM PLA_JOR_JORNADA 
	                WHERE 
	                (
	                    pJorNombre IS NULL
	                    OR pJorNombre = ''
	                    OR LOWER(JOR_NOMBRE) LIKE '%' || LOWER(TRIM(pJorNombre)) || '%'
	                )
	                ORDER BY JOR_CODCIA, JOR_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT JOR_CODIGO AS value, JOR_NOMBRE AS label
            FROM PLA_JOR_JORNADA
            WHERE JOR_CODCIA = pJorCodCia AND JOR_NOMBRE IS NOT NULL;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_JOR_JORNADA;

--  detalle

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_DET_JORNADA(
    pOpcion IN NUMBER,
    pDetCodCia IN VARCHAR2,
    pDetCodJor IN VARCHAR2,
    pDetTurno IN NUMBER,
    pDetDescripcionTurno IN VARCHAR2 DEFAULT NULL,
    pDetHoraDel IN DATE DEFAULT NULL,
    pDetHoraAl IN DATE DEFAULT NULL,
    pDetHoraDelSimple IN DATE DEFAULT NULL,
    pDetHoraAlSimple IN DATE DEFAULT NULL,
    pDetTipoHextraSimple IN NUMBER DEFAULT NULL,
    pDetHoraDelDoble IN DATE DEFAULT NULL,
    pDetHoraAlDoble IN DATE DEFAULT NULL,
    pDetTipoHextraDoble IN NUMBER DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN

    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_DET_JORNADA (
            DET_CODCIA,
            DET_CODJOR,
            DET_TURNO,
            DET_DESCRIPCION_TURNO,
            DET_HORA_DEL,
            DET_HORA_AL,
            DET_HORA_DEL_SIMPLE,
            DET_HORA_AL_SIMPLE,
            DET_TIPO_HEXTRA_SIMPLE,
            DET_HORA_DEL_DOBLE,
            DET_HORA_AL_DOBLE,
            DET_TIPO_HEXTRA_DOBLE
        ) VALUES (
            pDetCodCia,
            pDetCodJor,
            pDetTurno,
            pDetDescripcionTurno,
            pDetHoraDel,
            pDetHoraAl,
            pDetHoraDelSimple,
            pDetHoraAlSimple,
            pDetTipoHextraSimple,
            pDetHoraDelDoble,
            pDetHoraAlDoble,
            pDetTipoHextraDoble
        );

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_DET_JORNADA SET
            DET_DESCRIPCION_TURNO = pDetDescripcionTurno,
            DET_HORA_DEL = pDetHoraDel,
            DET_HORA_AL = pDetHoraAl,
            DET_HORA_DEL_SIMPLE = pDetHoraDelSimple,
            DET_HORA_AL_SIMPLE = pDetHoraAlSimple,
            DET_TIPO_HEXTRA_SIMPLE = pDetTipoHextraSimple,
            DET_HORA_DEL_DOBLE = pDetHoraDelDoble,
            DET_HORA_AL_DOBLE = pDetHoraAlDoble,
            DET_TIPO_HEXTRA_DOBLE = pDetTipoHextraDoble
        WHERE DET_CODCIA = pDetCodCia AND DET_CODJOR = pDetCodJor AND DET_TURNO = pDetTurno;

    COMMIT;

    END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                DET_CODCIA,
                DET_CODJOR,
                DET_TURNO,
                DET_DESCRIPCION_TURNO,
                DET_HORA_DEL,
                DET_HORA_AL,
                DET_HORA_DEL_SIMPLE,
                DET_HORA_AL_SIMPLE,
                DET_TIPO_HEXTRA_SIMPLE,
                DET_HORA_DEL_DOBLE,
                DET_HORA_AL_DOBLE,
                DET_TIPO_HEXTRA_DOBLE
            FROM PLA_DET_JORNADA
            WHERE DET_CODCIA = pDetCodCia AND DET_CODJOR = pDetCodJor AND DET_TURNO = pDetTurno;

	ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM PLA_DET_JORNADA DET
	    INNER JOIN RHEPQ.PLA_JOR_JORNADA JOR ON JOR.JOR_CODIGO = DET.DET_CODJOR AND JOR.JOR_CODCIA = DET.DET_CODCIA
	    WHERE DET_CODCIA = pDetCodCia AND
	    (
	        pDetDescripcionTurno IS NULL
	        OR pDetDescripcionTurno = ''
	        OR LOWER(DET.DET_DESCRIPCION_TURNO) LIKE '%' || LOWER(TRIM(pDetDescripcionTurno)) || '%'
	    )
	    AND DET.DET_CODJOR = pDetCodJor;
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados con paginación
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                 SELECT 
	                    JOR.JOR_CODIGO,
	                    DET.DET_CODCIA,
	                    DET.DET_CODJOR,
	                    DET.DET_TURNO,
	                    DET.DET_DESCRIPCION_TURNO,
	                    DET.DET_HORA_DEL,
	                    DET.DET_HORA_AL,
	                    DET.DET_HORA_DEL_SIMPLE,
	                    DET.DET_HORA_AL_SIMPLE,
	                    DET.DET_TIPO_HEXTRA_SIMPLE,
	                    DET.DET_HORA_DEL_DOBLE,
	                    DET.DET_HORA_AL_DOBLE,
	                    DET.DET_TIPO_HEXTRA_DOBLE
	                FROM PLA_DET_JORNADA DET
	                INNER JOIN RHEPQ.PLA_JOR_JORNADA JOR ON JOR.JOR_CODIGO = DET.DET_CODJOR AND JOR.JOR_CODCIA = DET.DET_CODCIA
	                WHERE DET_CODCIA = pDetCodCia AND
	                (
	                    pDetDescripcionTurno IS NULL
	                    OR pDetDescripcionTurno = ''
	                    OR LOWER(DET.DET_DESCRIPCION_TURNO) LIKE '%' || LOWER(TRIM(pDetDescripcionTurno)) || '%'
	                )
	                AND DET.DET_CODJOR = pDetCodJor
	                ORDER BY DET.DET_CODCIA, DET.DET_CODJOR, DET.DET_TURNO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_DET_JORNADA;

    --// Tipos de descuentos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TDC_TIPO_DESCUENTO(
    pOpcion IN NUMBER,
    pTdcCodcia IN VARCHAR2,
    pTdcCodigo IN OUT VARCHAR2,
    pTdcDescripcion IN VARCHAR2 DEFAULT NULL,
    pTdcCtaContable IN VARCHAR2 DEFAULT NULL,
    pTdcNombreCorto IN VARCHAR2 DEFAULT NULL,
    pTdcPrioridad IN NUMBER DEFAULT NULL,
    pTdcRenta IN VARCHAR2 DEFAULT NULL,
    pTdcAfp IN VARCHAR2 DEFAULT NULL,
    pTdcSalarioProm IN VARCHAR2 DEFAULT NULL,
    pTdcContableCat IN VARCHAR2 DEFAULT NULL,
    pTdcPrioridadReporte IN NUMBER DEFAULT NULL,
    pTdcCtaPpto1 IN VARCHAR2 DEFAULT NULL,
    pTdcCtaPpto2 IN VARCHAR2 DEFAULT NULL,
    pTdcCtaContable2 IN VARCHAR2 DEFAULT NULL,
    pTdcContableCat2 IN VARCHAR2 DEFAULT NULL,
    pTdcCtaContable3 IN VARCHAR2 DEFAULT NULL,
    pTdcContableCat3 IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_TDC_TIPO_DESCUENTO (
            TDC_CODCIA,
            TDC_CODIGO,
            TDC_DESCRIPCION,
            TDC_CTA_CONTABLE,
            TDC_NOMBRECORTO,
            TDC_PRIORIDAD,
            TDC_RENTA,
            TDC_AFP,
            TDC_SALARIO_PROM,
            TDC_CONTABLE_CAT,
            TDC_PRIORIDAD_REPORTE,
            TDC_CTA_PPTO1,
            TDC_CTA_PPTO2,
            TDC_CTA_CONTABLE2,
            TDC_CONTABLE_CAT2,
            TDC_CTA_CONTABLE3,
            TDC_CONTABLE_CAT3
        ) VALUES (
            pTdcCodcia,
            pTdcCodigo,
            pTdcDescripcion,
            pTdcCtaContable,
            pTdcNombreCorto,
            pTdcPrioridad,
            pTdcRenta,
            pTdcAfp,
            pTdcSalarioProm,
            pTdcContableCat,
            pTdcPrioridadReporte,
            pTdcCtaPpto1,
            pTdcCtaPpto2,
            pTdcCtaContable2,
            pTdcContableCat2,
            pTdcCtaContable3,
            pTdcContableCat3
        )
        RETURNING TDC_CODIGO INTO pTdcCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_TDC_TIPO_DESCUENTO SET
            TDC_DESCRIPCION = pTdcDescripcion,
            TDC_CTA_CONTABLE = pTdcCtaContable,
            TDC_NOMBRECORTO = pTdcNombreCorto,
            TDC_PRIORIDAD = pTdcPrioridad,
            TDC_RENTA = pTdcRenta,
            TDC_AFP = pTdcAfp,
            TDC_SALARIO_PROM = pTdcSalarioProm,
            TDC_CONTABLE_CAT = pTdcContableCat,
            TDC_PRIORIDAD_REPORTE = pTdcPrioridadReporte,
            TDC_CTA_PPTO1 = pTdcCtaPpto1,
            TDC_CTA_PPTO2 = pTdcCtaPpto2,
            TDC_CTA_CONTABLE2 = pTdcCtaContable2,
            TDC_CONTABLE_CAT2 = pTdcContableCat2,
            TDC_CTA_CONTABLE3 = pTdcCtaContable3,
            TDC_CONTABLE_CAT3 = pTdcContableCat3
        WHERE TDC_CODCIA = pTdcCodcia AND TDC_CODIGO = pTdcCodigo;

    COMMIT;

    END IF;

    -- Validación para opciones 1, 2, 3, 4
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT
                TDC_CODCIA,
                TDC_CODIGO,
                TDC_DESCRIPCION,
                TDC_CTA_CONTABLE,
                TDC_NOMBRECORTO,
                TDC_PRIORIDAD,
                TDC_RENTA,
                TDC_AFP,
                TDC_SALARIO_PROM,
                TDC_CONTABLE_CAT,
                TDC_PRIORIDAD_REPORTE,
                TDC_CTA_PPTO1,
                TDC_CTA_PPTO2,
                TDC_CTA_CONTABLE2,
                TDC_CONTABLE_CAT2,
                TDC_CTA_CONTABLE3,
                TDC_CONTABLE_CAT3
            FROM PLA_TDC_TIPO_DESCUENTO
            WHERE TDC_CODCIA = pTdcCodcia AND TDC_CODIGO = pTdcCodigo;
    
    -- Opción 5 para buscar por descripción con paginación
ELSIF pOpcion = 5 THEN
    SELECT COUNT(*) INTO vContador
    FROM PLA_TDC_TIPO_DESCUENTO
    WHERE TDC_CODCIA = pTdcCodcia AND 
    (
        pTdcDescripcion IS NULL
        OR pTdcDescripcion = ''
        OR LOWER(TDC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTdcDescripcion)) || '%'
    );
    
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
    
    -- Abrir el cursor para obtener los resultados con paginación
    OPEN pCursor FOR
        SELECT * FROM (
            SELECT a.*, ROWNUM rnum
            FROM (
                SELECT 
                    TDC_CODCIA,
                    TDC_CODIGO,
                    TDC_DESCRIPCION,
                    TDC_CTA_CONTABLE,
                    TDC_NOMBRECORTO,
                    TDC_PRIORIDAD,
                    TDC_RENTA,
                    TDC_AFP,
                    TDC_SALARIO_PROM,
                    TDC_CONTABLE_CAT,
                    TDC_PRIORIDAD_REPORTE,
                    TDC_CTA_PPTO1,
                    TDC_CTA_PPTO2,
                    TDC_CTA_CONTABLE2,
                    TDC_CONTABLE_CAT2,
                    TDC_CTA_CONTABLE3,
                    TDC_CONTABLE_CAT3
                FROM PLA_TDC_TIPO_DESCUENTO
                WHERE TDC_CODCIA = pTdcCodcia AND
                (
                    pTdcDescripcion IS NULL
                    OR pTdcDescripcion = ''
                    OR LOWER(TDC_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTdcDescripcion)) || '%'
                )
                ORDER BY TDC_CODIGO
            ) a
            WHERE ROWNUM <= pPageNumber * pPageSize
        )
        WHERE rnum > (pPageNumber - 1) * pPageSize;

    
    -- Opción 6 para listar todos los tipos de descuento
    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT
                TDC_CODIGO AS value, 
                TDC_DESCRIPCION AS label
            FROM PLA_TDC_TIPO_DESCUENTO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TDC_TIPO_DESCUENTO;

    --// Tipos de Ingresos
    
    CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TIG_TIPO_INGRESO(
    pOpcion IN NUMBER,
    pTigCodCia IN OUT VARCHAR2,
    pTigCodigo IN OUT VARCHAR2,
    pTigDescripcion IN VARCHAR2 DEFAULT NULL,
    pTigCtaContable IN VARCHAR2 DEFAULT NULL,
    pTigNombreCorto IN VARCHAR2 DEFAULT NULL,
    pTigIsss IN VARCHAR2 DEFAULT NULL,
    pTigRenta IN VARCHAR2 DEFAULT NULL,
    pTigAfp IN VARCHAR2 DEFAULT NULL,
    pTigInpep IN VARCHAR2 DEFAULT NULL,
    pTigContableCat IN VARCHAR2 DEFAULT NULL,
    pTigSalarioProm IN VARCHAR2 DEFAULT NULL,
    pTigFondoVac IN VARCHAR2 DEFAULT NULL,
    pTigAtconsa IN VARCHAR2 DEFAULT NULL,
    pTigCtaPpto1 IN VARCHAR2 DEFAULT NULL,
    pTigCtaPpto2 IN VARCHAR2 DEFAULT NULL,
    pTigCtaContable2 IN VARCHAR2 DEFAULT NULL,
    pTigContableCat2 IN VARCHAR2 DEFAULT NULL,
    pTigDevengado IN VARCHAR2 DEFAULT NULL,
    pTigCodsiaf IN NUMBER DEFAULT NULL,
    pTigDescripPresup IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_TIG_TIPO_INGRESO (
            TIG_CODCIA,
            TIG_CODIGO,
            TIG_DESCRIPCION,
            TIG_CTA_CONTABLE,
            TIG_NOMBRECORTO,
            TIG_ISSS,
            TIG_RENTA,
            TIG_AFP,
            TIG_INPEP,
            TIG_CONTABLE_CAT,
            TIG_SALARIO_PROM,
            TIG_FONDO_VAC,
            TIG_ATCONSA,
            TIG_CTA_PPTO1,
            TIG_CTA_PPTO2,
            TIG_CTA_CONTABLE2,
            TIG_CONTABLE_CAT2,
            TIG_DEVENGADO,
            TIG_CODSIAF,
            TIG_DESCRIP_PRESUP
        ) VALUES (
            pTigCodCia,
            pTigCodigo,
            pTigDescripcion,
            pTigCtaContable,
            pTigNombreCorto,
            pTigIsss,
            pTigRenta,
            pTigAfp,
            pTigInpep,
            pTigContableCat,
            pTigSalarioProm,
            pTigFondoVac,
            pTigAtconsa,
            pTigCtaPpto1,
            pTigCtaPpto2,
            pTigCtaContable2,
            pTigContableCat2,
            pTigDevengado,
            pTigCodsiaf,
            pTigDescripPresup
        )
        RETURNING TIG_CODCIA, TIG_CODIGO INTO pTigCodCia, pTigCodigo;

	ELSIF pOpcion = 2 THEN
	    UPDATE PLA_TIG_TIPO_INGRESO SET
	        TIG_DESCRIPCION = pTigDescripcion,
	        TIG_CTA_CONTABLE = pTigCtaContable,
	        TIG_NOMBRECORTO = pTigNombreCorto,
	        TIG_ISSS = pTigIsss,
	        TIG_RENTA = pTigRenta,
	        TIG_AFP = pTigAfp,
	        TIG_INPEP = pTigInpep,
	        TIG_CONTABLE_CAT = pTigContableCat,
	        TIG_SALARIO_PROM = pTigSalarioProm,
	        TIG_FONDO_VAC = pTigFondoVac,
	        TIG_ATCONSA = pTigAtconsa,
	        TIG_CTA_PPTO1 = pTigCtaPpto1,
	        TIG_CTA_PPTO2 = pTigCtaPpto2,
	        TIG_CTA_CONTABLE2 = pTigCtaContable2,
	        TIG_CONTABLE_CAT2 = pTigContableCat2,
	        TIG_DEVENGADO = pTigDevengado,
	        TIG_CODSIAF = pTigCodsiaf,
	        TIG_DESCRIP_PRESUP = pTigDescripPresup
	    WHERE TIG_CODCIA = pTigCodCia AND TIG_CODIGO = pTigCodigo;
	   
   COMMIT;
	   
    END IF;    

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
	        SELECT 
	            TIG_CODCIA,
	            TIG_CODIGO,
	            TIG_DESCRIPCION,
	            TIG_CTA_CONTABLE,
	            TIG_NOMBRECORTO,
	            TIG_ISSS,
	            TIG_RENTA,
	            TIG_AFP,
	            TIG_INPEP,
	            TIG_CONTABLE_CAT,
	            TIG_SALARIO_PROM,
	            TIG_FONDO_VAC,
	            TIG_ATCONSA,
	            TIG_CTA_PPTO1,
	            TIG_CTA_PPTO2,
	            TIG_CTA_CONTABLE2,
	            TIG_CONTABLE_CAT2,
	            TIG_DEVENGADO,
	            TIG_CODSIAF,
	            TIG_DESCRIP_PRESUP
	        FROM PLA_TIG_TIPO_INGRESO
	        WHERE TIG_CODCIA = pTigCodCia AND TIG_CODIGO = pTigCodigo;

	ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM PLA_TIG_TIPO_INGRESO
	    WHERE TIG_CODCIA = pTigCodCia AND 
	    (
	        pTigDescripcion IS NULL
	        OR pTigDescripcion = ''
	        OR LOWER(TIG_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTigDescripcion)) || '%'
	    );
	    
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados con paginación
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT temp.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    TIG_CODCIA,
	                    TIG_CODIGO,
	                    TIG_DESCRIPCION,
	                    TIG_CTA_CONTABLE,
	                    TIG_NOMBRECORTO,
	                    TIG_ISSS,
	                    TIG_RENTA,
	                    TIG_AFP,
	                    TIG_INPEP,
	                    TIG_CONTABLE_CAT,
	                    TIG_SALARIO_PROM,
	                    TIG_FONDO_VAC,
	                    TIG_ATCONSA,
	                    TIG_CTA_PPTO1,
	                    TIG_CTA_PPTO2,
	                    TIG_CTA_CONTABLE2,
	                    TIG_CONTABLE_CAT2,
	                    TIG_DEVENGADO,
	                    TIG_CODSIAF,
	                    TIG_DESCRIP_PRESUP
	                FROM PLA_TIG_TIPO_INGRESO
	                WHERE TIG_CODCIA = pTigCodCia AND 
	                (
	                    pTigDescripcion IS NULL
	                    OR pTigDescripcion = ''
	                    OR LOWER(TIG_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTigDescripcion)) || '%'
	                )
	                ORDER BY TIG_CODCIA, TIG_CODIGO
	            ) temp
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        -- Ajustar esta lógica según la necesidad
        OPEN pCursor FOR
            SELECT TIG_CODIGO AS value, TIG_DESCRIPCION AS label
            FROM PLA_TIG_TIPO_INGRESO
           	WHERE TIG_CODCIA = pTigCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TIG_TIPO_INGRESO;

    --// Movimientos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_MOV_MOVIMIENTO(
    pOpcion IN NUMBER,
    pMovCodCia IN OUT VARCHAR2,
    pMovCodigo IN OUT NUMBER,
    pMovTipo IN VARCHAR2 DEFAULT NULL,
    pMovAccion IN VARCHAR2 DEFAULT NULL,
    pMovDescrip IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_MOV_MOVIMIENTO (
            MOV_CODCIA,
            MOV_CODIGO,
            MOV_TIPO,
            MOV_ACCION,
            MOV_DESCRIP
        ) VALUES (
            pMovCodCia,
            pMovCodigo,
            pMovTipo,
            pMovAccion,
            pMovDescrip
        )
        RETURNING MOV_CODIGO INTO pMovCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_MOV_MOVIMIENTO SET
            MOV_TIPO = pMovTipo,
            MOV_ACCION = pMovAccion,
            MOV_DESCRIP = pMovDescrip
        WHERE MOV_CODCIA = pMovCodCia AND MOV_CODIGO = pMovCodigo;

    COMMIT;
   
   END IF;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                MOV_CODCIA,
                MOV_CODIGO,
                MOV_TIPO,
                MOV_ACCION,
                MOV_DESCRIP
            FROM PLA_MOV_MOVIMIENTO
            WHERE MOV_CODCIA = pMovCodCia AND MOV_CODIGO = pMovCodigo;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_MOV_MOVIMIENTO
        WHERE MOV_CODCIA = pMovCodCia AND
        (
            pMovDescrip IS NULL
            OR pMovDescrip = ''
            OR LOWER(MOV_DESCRIP) LIKE '%' || LOWER(TRIM(pMovDescrip)) || '%'
        );

		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

        -- Abrir el cursor para obtener los resultados con paginación
        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        MOV_CODCIA,
                        MOV_CODIGO,
                        MOV_TIPO,
                        MOV_ACCION,
                        MOV_DESCRIP
                    FROM PLA_MOV_MOVIMIENTO
                    WHERE MOV_CODCIA = pMovCodCia AND
                    (
                        pMovDescrip IS NULL
                        OR pMovDescrip = ''
                        OR LOWER(MOV_DESCRIP) LIKE '%' || LOWER(TRIM(pMovDescrip)) || '%'
                    )
                    ORDER BY MOV_CODCIA, MOV_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
    	 OPEN pCursor FOR
	          SELECT         
		        MOV_CODIGO,
		        MOV_DESCRIP
		    FROM PLA_MOV_MOVIMIENTO
		    WHERE MOV_CODCIA = pMovCodCia;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_MOV_MOVIMIENTO;

    --// Tipos de Horas Extras

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_THE_TIPOHORAEX(
    pOpcion IN NUMBER,
    pTheCodCia IN OUT VARCHAR2,
    pTheCodigo IN OUT NUMBER,
    pTheTipoDia IN VARCHAR2 DEFAULT NULL,
    pTheHoraInicial IN DATE DEFAULT NULL,
    pTheHoraFinal IN DATE DEFAULT NULL,
    pTheNombre IN VARCHAR2 DEFAULT NULL,
    pTheValor IN NUMBER DEFAULT NULL,
    pTheValorExtra IN NUMBER DEFAULT NULL,
    pTheNocturnidad IN NUMBER DEFAULT NULL,
    pTheCodTig IN VARCHAR2 DEFAULT NULL,
    pTheCoeficiente IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_THE_TIPOHORAEX (
            THE_CODCIA,
            THE_CODIGO,
            THE_TIPO_DIA,
            THE_HORA_INICIAL,
            THE_HORA_FINAL,
            THE_NOMBRE,
            THE_VALOR,
            THE_VALOR_EXTRA,
            THE_NOCTURNIDAD,
            THE_CODTIG,
            THE_COEFICIENTE
        ) VALUES (
            pTheCodCia,
            pTheCodigo,
            pTheTipoDia,
            pTheHoraInicial,
            pTheHoraFinal,
            pTheNombre,
            pTheValor,
            pTheValorExtra,
            pTheNocturnidad,
            pTheCodTig,
            pTheCoeficiente
        )
        RETURNING THE_CODIGO INTO pTheCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_THE_TIPOHORAEX SET
            THE_TIPO_DIA = pTheTipoDia,
            THE_HORA_INICIAL = pTheHoraInicial,
            THE_HORA_FINAL = pTheHoraFinal,
            THE_NOMBRE = pTheNombre,
            THE_VALOR = pTheValor,
            THE_VALOR_EXTRA = pTheValorExtra,
            THE_NOCTURNIDAD = pTheNocturnidad,
            THE_CODTIG = pTheCodTig,
            THE_COEFICIENTE = pTheCoeficiente
        WHERE THE_CODCIA = pTheCodCia AND THE_CODIGO = pTheCodigo;

    COMMIT;
   
   END IF;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                THE_CODCIA,
                THE_CODIGO,
                THE_TIPO_DIA,
                THE_HORA_INICIAL,
                THE_HORA_FINAL,
                THE_NOMBRE,
                THE_VALOR,
                THE_VALOR_EXTRA,
                THE_NOCTURNIDAD,
                THE_CODTIG,
                THE_COEFICIENTE
            FROM PLA_THE_TIPOHORAEX
            WHERE THE_CODCIA = pTheCodCia AND THE_CODIGO = pTheCodigo;

	ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM PLA_THE_TIPOHORAEX
	    WHERE THE_CODCIA = pTheCodCia AND
	    (
	        THE_NOMBRE IS NULL
	        OR THE_NOMBRE = ''
	        OR LOWER(THE_NOMBRE) LIKE '%' || LOWER(TRIM(pTheNombre)) || '%'
	    );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    THE_CODCIA,
	                    THE_CODIGO,
	                    THE_TIPO_DIA,
	                    THE_HORA_INICIAL,
	                    THE_HORA_FINAL,
	                    THE_NOMBRE,
	                    THE_VALOR,
	                    THE_VALOR_EXTRA,
	                    THE_NOCTURNIDAD,
	                    THE_CODTIG,
	                    THE_COEFICIENTE
	                FROM PLA_THE_TIPOHORAEX
	                WHERE THE_CODCIA = pTheCodCia AND
	                (
	                    THE_NOMBRE IS NULL
	                    OR THE_NOMBRE = ''
	                    OR LOWER(THE_NOMBRE) LIKE '%' || LOWER(TRIM(pTheNombre)) || '%'
	                )
	                ORDER BY THE_CODCIA, THE_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

	ELSIF pOpcion = 6 THEN
	    OPEN pCursor FOR
	        SELECT 
	            THE_CODIGO AS value, 
	            THE_NOMBRE AS label
	        FROM PLA_THE_TIPOHORAEX
	        WHERE THE_CODCIA = pTheCodCia
	        ORDER BY THE_CODIGO;
	       
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_THE_TIPOHORAEX;

    --// Tipos de Tiempo

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_TNT_TPO_TIEMPO(
    pOpcion IN NUMBER,    
    pTntCodigo IN OUT VARCHAR2,
    pTntCodCia IN VARCHAR2,
    pTntDescripcion IN VARCHAR2 DEFAULT NULL,
    pTntGoceSueldo IN VARCHAR2 DEFAULT NULL,
    pTntCodTdc IN VARCHAR2 DEFAULT NULL,
    pTntPctDescuento IN NUMBER DEFAULT NULL,
    pTntPagoEnfermedad IN VARCHAR2 DEFAULT NULL,
    pTntDiasLey IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
   vUsername VARCHAR2(255);
BEGIN
	
    SAVEPOINT transact;

    -- Lógica para insertar o actualizar un registro en base a pOpcion
    IF pOpcion = 1 THEN
    
    	vUsername := obtenerUsername(pUsuario);
    
        INSERT INTO PLA_TNT_TPO_TIEMPO (
            TNT_CODCIA,
            TNT_CODIGO,
            TNT_DESCRIPCION,
            TNT_GOCE_SUELDO,
            TNT_CODTDC,
            TNT_PCT_DESCUENTO,
            TNT_PAGO_ENFERMEDAD,
            TNT_DIAS_LEY,
            CREADO_POR
        ) VALUES (
            pTntCodCia,
            pTntCodigo,
            pTntDescripcion,
            pTntGoceSueldo,
            pTntCodTdc,
            pTntPctDescuento,
            pTntPagoEnfermedad,
            pTntDiasLey,
            vUsername
        )
        RETURNING TNT_CODIGO INTO pTntCodigo;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_TNT_TPO_TIEMPO SET
            TNT_DESCRIPCION = pTntDescripcion,
            TNT_GOCE_SUELDO = pTntGoceSueldo,
            TNT_CODTDC = pTntCodTdc,
            TNT_PCT_DESCUENTO = pTntPctDescuento,
            TNT_PAGO_ENFERMEDAD = pTntPagoEnfermedad,
            TNT_DIAS_LEY = pTntDiasLey
        WHERE TNT_CODCIA = pTntCodCia AND TNT_CODIGO = pTntCodigo;

    COMMIT;
   
   END IF;

    -- Lógica para devolver información de un registro específico
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			  SELECT         
				TNT_CODCIA,
				TNT_CODIGO,
				TNT_DESCRIPCION,
				TNT_GOCE_SUELDO,
				TNT_CODTDC,
				TDC.TDC_NOMBRECORTO,
				TDC.TDC_DESCRIPCION,
				TNT_PCT_DESCUENTO,
				TNT_PAGO_ENFERMEDAD,
				TNT_DIAS_LEY
			FROM PLA_TNT_TPO_TIEMPO TNT
			LEFT JOIN RHEPQ.PLA_TDC_TIPO_DESCUENTO TDC ON TDC.TDC_CODIGO = TNT.TNT_CODTDC AND TDC.TDC_CODCIA = TNT.TNT_CODCIA 
            WHERE TNT.TNT_CODCIA = pTntCodCia AND TNT.TNT_CODIGO = pTntCodigo;

    -- Búsqueda con TNT_DESCRIPCION y paginación
    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_TNT_TPO_TIEMPO TNT
		LEFT JOIN RHEPQ.PLA_TDC_TIPO_DESCUENTO TDC ON TDC.TDC_CODIGO = TNT.TNT_CODTDC AND TDC.TDC_CODCIA = TNT.TNT_CODCIA
        WHERE TNT_CODCIA = pTntCodCia AND
        (
            pTntDescripcion IS NULL
            OR pTntDescripcion = ''
            OR LOWER(TNT.TNT_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTntDescripcion)) || '%'
        );

		-- Asignar la cantidad total de páginas
       
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
		

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
        			  SELECT         
						TNT_CODCIA,
						TNT_CODIGO,
						TNT_DESCRIPCION,
						TNT_GOCE_SUELDO,
						TNT_CODTDC,
						TDC.TDC_NOMBRECORTO,
						TDC.TDC_DESCRIPCION,
						TNT_PCT_DESCUENTO,
						TNT_PAGO_ENFERMEDAD,
						TNT_DIAS_LEY
					FROM PLA_TNT_TPO_TIEMPO TNT
					LEFT JOIN RHEPQ.PLA_TDC_TIPO_DESCUENTO TDC ON TDC.TDC_CODIGO = TNT.TNT_CODTDC AND TDC.TDC_CODCIA = TNT.TNT_CODCIA 
                    WHERE TNT_CODCIA = pTntCodCia AND
                    (
                        pTntDescripcion IS NULL
                        OR pTntDescripcion = ''
                        OR LOWER(TNT.TNT_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTntDescripcion)) || '%'
                    )
                    ORDER BY TNT.TNT_CODCIA, TNT.TNT_CODIGO
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    -- Opción 6: Devuelve un listado de registros como valor y etiqueta
    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT TNT_CODIGO AS value, TNT_DESCRIPCION AS label
            FROM PLA_TNT_TPO_TIEMPO
            WHERE TNT_CODTDC = pTntCodTdc AND TNT_CODCIA = pTntCodCia 
            ORDER BY TNT_CODCIA, TNT_CODIGO;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_TNT_TPO_TIEMPO;

ALTER TABLE RHEPQ.PLA_TNT_TPO_TIEMPO ADD (CREADO_POR VARCHAR2(150));

CREATE OR REPLACE TRIGGER "RHEPQ"."T_DI_HR_TPO_TIEMPO" AFTER INSERT ON "RHEPQ"."PLA_TNT_TPO_TIEMPO" REFERENCING OLD AS OLD NEW AS NEW FOR EACH ROW 
begin
  sp_hr_tnt_tpo_tiempo(:new.tnt_codcia, :new.tnt_codigo,:new.tnt_descripcion,
  :new.tnt_goce_sueldo,:new.tnt_codtdc,:new.tnt_pct_descuento,
  :new.tnt_pago_enfermedad,:new.tnt_dias_ley,SYSDATE,'I', :new.CREADO_POR, :new.CREADO_POR);

CREATE OR REPLACE PROCEDURE RHEPQ."SP_HR_TNT_TPO_TIEMPO"   (tnt_codcia in varchar2,
  tnt_codigo in integer,
  tnt_descripcion in varchar2,
  tnt_goce_sueldo in varchar2,
  tnt_codtdc in varchar2,
  tnt_pct_descuento in number, 
  tnt_pago_enfermedad in varchar2,
  tnt_dias_ley in integer,
  tnt_fechaalta in date,
  tnt_statusbita in varchar2,
  tnt_maquina in varchar2,
  tnt_usuario in varchar2 
  )
  
is 

maquinas varchar2(30);

begin 

--select machine
--into maquinas
--from v$session
--where audsid=userenv('sessionid');

 INSERT INTO rhepq.bb_pla_tnt_tpo_tiempo VALUES
( tnt_codcia,
  tnt_codigo,
  tnt_descripcion,
  tnt_goce_sueldo,
  tnt_codtdc,
  tnt_pct_descuento,
  tnt_pago_enfermedad,
  tnt_dias_ley,
  tnt_fechaalta,
  tnt_statusbita,
  tnt_maquina,
  tnt_usuario 
  );

end sp_hr_tnt_tpo_tiempo;
 
    --------------------------------
    --// Tipos de Prestamos

CREATE OR REPLACE procedure RHEPQ.sp_pla_tpr_tipo_prestamo(
    pOpcion IN number,
    pRowId IN OUT VARCHAR2,
    pTprCodcia IN VARCHAR2,
    pTprCodigo IN OUT VARCHAR2,
    pTprDescripcion IN VARCHAR2,
    pTprCodtdc IN VARCHAR2,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    IF pOpcion IN (1,2,3) THEN
        SAVEPOINT transact;
        BEGIN
            IF pOpcion = 1 THEN
                INSERT INTO PLA_TPR_TIPO_PRESTAMO (
                    TPR_CODCIA,
                    TPR_CODIGO,
                    TPR_DESCRIPCION,
                    TPR_CODTDC
                ) VALUES (
                    pTprCodcia,
                    pTprCodigo,
                    pTprDescripcion,
                    pTprCodtdc                    
                )
                RETURNING TPR_CODIGO INTO pTprCodigo;
               
            ELSIF pOpcion = 2 THEN
                UPDATE PLA_TPR_TIPO_PRESTAMO
                SET TPR_CODCIA = pTprCodcia,                    
                    TPR_DESCRIPCION = pTprDescripcion,
                    TPR_CODTDC = pTprCodtdc
                WHERE TPR_CODIGO = pTprCodigo AND TPR_CODCIA = pTprCodcia;
               
            END IF;
           
            COMMIT;
           
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK TO transact;
                RAISE;
        END;
       
    END IF;

    IF pOpcion IN (1,2,3,4,5,6,7) THEN
    
        IF pOpcion IN (1,2,3,4) THEN
            OPEN pCursor FOR
            SELECT
                ROWID as id,
                TPR_CODCIA,
                TPR_CODIGO,
                TPR_DESCRIPCION,
                TPR_CODTDC
            FROM PLA_TPR_TIPO_PRESTAMO
            WHERE TPR_CODIGO = pTprCodigo AND TPR_CODCIA = pTprCodcia;
           
	ELSIF pOpcion = 5 THEN
	    SELECT COUNT(*) INTO vContador
	    FROM PLA_TPR_TIPO_PRESTAMO
	    WHERE TPR_CODCIA = pTprCodcia AND
	    (
	        pTprDescripcion IS NULL
	        OR pTprDescripcion = ''
	        OR LOWER(TPR_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTprDescripcion)) || '%'
	    );
	    
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
	
	    OPEN pCursor FOR
	        SELECT * FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT
	                    ROWID as id,
	                    TPR_CODCIA,
	                    TPR_CODIGO,
	                    TPR_DESCRIPCION,
	                    TPR_CODTDC
	                FROM PLA_TPR_TIPO_PRESTAMO
	                WHERE TPR_CODCIA = pTprCodcia AND
	                (
	                    pTprDescripcion IS NULL
	                    OR pTprDescripcion = ''
	                    OR LOWER(TPR_DESCRIPCION) LIKE '%' || LOWER(TRIM(pTprDescripcion)) || '%'
	                )
	                ORDER BY TPR_CODIGO
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
               
        ELSIF pOpcion = 6 THEN
            OPEN pCursor FOR
            SELECT
                TPR_CODIGO as value,
                TPR_DESCRIPCION as label
            FROM PLA_TPR_TIPO_PRESTAMO;
           
       ELSIF pOpcion = 7 THEN
            OPEN pCursor FOR
            SELECT
                TPR_CODIGO as value,
                TPR_DESCRIPCION as label
            FROM PLA_TPR_TIPO_PRESTAMO
           WHERE TPR_CODTDC = pTprCodtdc AND TPR_CODCIA = pTprCodcia;
           
        END IF;
       
    END IF;
   
END sp_pla_tpr_tipo_prestamo;
    
    --// Intereses para Prestamos

CREATE OR REPLACE PROCEDURE RHEPQ.SP_PLA_IPR_INTERES_PRESTAMO(
    pOpcion IN NUMBER,
    pIprCodCia IN OUT VARCHAR2,
    pIprPlazoIni IN OUT NUMBER,
    pIprPlazoFin IN NUMBER DEFAULT NULL,
    pIprInteres IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
    
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO PLA_IPR_INTERES_PRESTAMOS (
            IPR_CODCIA,
            IPR_PLAZO_INI,
            IPR_PLAZO_FIN,
            IPR_INTERES
        ) VALUES (
            pIprCodCia,
            pIprPlazoIni,
            pIprPlazoFin,
            pIprInteres
        )
        RETURNING IPR_CODCIA, IPR_PLAZO_INI INTO pIprCodCia, pIprPlazoIni;

    ELSIF pOpcion = 2 THEN
        UPDATE PLA_IPR_INTERES_PRESTAMOS SET
            IPR_PLAZO_FIN = pIprPlazoFin,
            IPR_INTERES = pIprInteres
        WHERE IPR_CODCIA = pIprCodCia AND IPR_PLAZO_INI = pIprPlazoIni;

    COMMIT;
   
   END IF;

    -- Lógica adicional para otras opciones
    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                IPR_CODCIA,
                IPR_PLAZO_INI,
                IPR_PLAZO_FIN,
                IPR_INTERES
            FROM PLA_IPR_INTERES_PRESTAMOS
            WHERE IPR_CODCIA = pIprCodCia AND IPR_PLAZO_INI = pIprPlazoIni;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador
        FROM PLA_IPR_INTERES_PRESTAMOS;

		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                        IPR_CODCIA,
                        IPR_PLAZO_INI,
                        IPR_PLAZO_FIN,
                        IPR_INTERES
                    FROM PLA_IPR_INTERES_PRESTAMOS
                    ORDER BY IPR_CODCIA, IPR_PLAZO_INI
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT IPR_PLAZO_INI AS value, TO_CHAR(IPR_INTERES) AS label
            FROM PLA_IPR_INTERES_PRESTAMOS
            WHERE IPR_CODCIA = pIprCodCia
            ORDER BY IPR_CODCIA, IPR_PLAZO_INI;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SP_PLA_IPR_INTERES_PRESTAMO;

----------------------------------------

   ---------------------------- ### TABLAS #### -----------------------------------------


CREATE TABLE RHEPQ.ADMUSUARIO (
    ID NUMBER(10,0),
    USERNAME VARCHAR2(30),
    REMEMBERTOKEN VARCHAR2(250),
    SESSIONTIME NUMBER(10,0),
    EMAIL VARCHAR2(255),
    ESTADO NUMBER(10,0) DEFAULT 1,
    CREADO DATE DEFAULT sysdate,
    CREADOPOR NUMBER(10,0),
    ACTUALIZADO DATE,
    ACTUALIZADOPOR NUMBER(10,0),
    EMP_CODCIA VARCHAR2(3),
    EMP_CODIGO NUMBER(22),
    CONSTRAINT SYS_C009190 CHECK ("USERNAME" IS NOT NULL),    
    CONSTRAINT SYS_C009192 CHECK ("ESTADO" IS NOT NULL),
    CONSTRAINT SYS_C009193 CHECK ("CREADO" IS NOT NULL),
    CONSTRAINT SYS_C009194 PRIMARY KEY (ID),
    CONSTRAINT SYS_C009195 UNIQUE (USERNAME),
    CONSTRAINT FK_EMPLEADO FOREIGN KEY (EMP_CODCIA, EMP_CODIGO) REFERENCES RHEPQ.PLA_EMP_EMPLEADO(EMP_CODCIA, EMP_CODIGO),
    CONSTRAINT FK_USUARIOS_REST FOREIGN KEY (USERNAME) REFERENCES EPQOP.USUARIOS_REST(USUARIO)
);

CREATE SEQUENCE RHEPQ.ADMUSUARIOSEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999 NOCYCLE CACHE 20 NOORDER

 INSERT INTO RHEPQ.ADMUSUARIO (
    ID,
    USERNAME,    
    REMEMBERTOKEN,
    SESSIONTIME,
    ESTADO,
    CREADO,
    CREADOPOR,
    ACTUALIZADO,
    ACTUALIZADOPOR,
    EMP_CODCIA,
    EMP_CODIGO
) VALUES (
    RHEPQ.ADMUSUARIOSEQ.NEXTVAL, -- Utiliza la secuencia para el ID
    'AdminMaster01', -- USERNAME    
    NULL, -- REMEMBERTOKEN
    86400, -- SESSIONTIME
    1, -- ESTADO
    TO_DATE('2023-07-20 00:10:59', 'YYYY-MM-DD HH24:MI:SS'), -- CREADO
    1, -- CREADOPOR
    NULL, -- ACTUALIZADO
    NULL, -- ACTUALIZADOPOR
    '001', -- EMP_CODCIA (ajusta según sea necesario)
    2193  -- EMP_CODIGO (ajusta según sea necesario)
);

-- GENERO

CREATE OR REPLACE procedure RHEPQ.spAdmGenero(
    pOpcion IN number,
    pId IN OUT number,
    pNombre IN varchar2 default null,
    pEstado IN number default 1,
    pUsuario IN number,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER  DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT number
) as
    vId NUMBER;
    vContador NUMBER;
BEGIN
    --start transaction
    SAVEPOINT transact;

    IF pOpcion = 1 then
        insert into RHEPQ.ADMGENERO 
        values(null, pNombre, pEstado, SYSDATE ,pUsuario, NULL, null)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.ADMGENERO set nombre = pNombre, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.ADMGENERO set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select id, nombre, estado
                from RHEPQ.ADMGENERO where id = pId;
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador FROM RHEPQ.ADMGENERO;
            pTotalPage := CEIL(vContador/pPageSize);

            open pCursor for 
            SELECT id, nombre, estado
                FROM (
                    SELECT a.*, ROWNUM rnum
                    FROM (
                        SELECT id, nombre, estado
                        FROM RHEPQ.ADMGENERO 
                        ORDER BY nombre
                    ) a
                    WHERE ROWNUM <= pPageNumber * pPageSize
                )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombre as label
            from RHEPQ.ADMGENEROADMGENERO;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spAdmGenero;

-- SISTEMA

CREATE TABLE RHEPQ.ADMSISTEMA (
	ID NUMBER(10,0),
	NOMBRE VARCHAR2(45),	
	ESTADO NUMBER(10,0) DEFAULT 1 ,
	CREADO DATE DEFAULT sysdate ,
	CREADOPOR NUMBER(10,0),
	ACTUALIZADO DATE,
	ACTUALIZADOPOR NUMBER(10,0),
	CONSTRAINT SYS_C00922 PRIMARY KEY (ID)
);

CREATE SEQUENCE RHEPQ.ADMSISTEMASEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999 NOCYCLE CACHE 20 NOORDER

   
   INSERT INTO RHEPQ.ADMSISTEMA (ID, NOMBRE, ESTADO, CREADO, CREADOPOR, ACTUALIZADO, ACTUALIZADOPOR)
VALUES (RHEPQ.ADMSISTEMASEQ.NEXTVAL, 'RRHH', 1, SYSDATE, 1, NULL, NULL);


-- ROL

CREATE TABLE RHEPQ.ADMROL (
	ID NUMBER(10,0),
	NOMBRE VARCHAR2(45),
	CODIGO VARCHAR2(45),
	ESTADO NUMBER(10,0) DEFAULT 1 ,
	CREADO DATE DEFAULT sysdate ,
	CREADOPOR NUMBER(10,0),
	ACTUALIZADO DATE,
	ACTUALIZADOPOR NUMBER(10,0),
	CONSTRAINT SYS_C009196 CHECK ("NOMBRE" IS NOT NULL),
	CONSTRAINT SYS_C009197 CHECK ("CODIGO" IS NOT NULL),
	CONSTRAINT SYS_C009198 CHECK ("ESTADO" IS NOT NULL),
	CONSTRAINT SYS_C009199 CHECK ("CREADO" IS NOT NULL),
	CONSTRAINT SYS_C009200 PRIMARY KEY (ID)
);

-- Llave externa a la tabla sistema

ALTER TABLE RHEPQ.ADMROL
ADD IDSISTEMA NUMBER(10,0) DEFAULT 1;

ALTER TABLE RHEPQ.ADMROL
ADD CONSTRAINT fk_admrol_admsistema
FOREIGN KEY (IDSISTEMA)
REFERENCES RHEPQ.ADMSISTEMA (ID);

CREATE SEQUENCE RHEPQ.ADMROLSEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999 NOCYCLE CACHE 20 NOORDER

INSERT INTO RHEPQ.ADMROL (
    ID,
    NOMBRE,
    CODIGO,
    ESTADO,
    CREADO,
    CREADOPOR,
    IDSISTEMA
) VALUES (
    RHEPQ.ADMROLSEQ.NEXTVAL, -- Genera el ID automáticamente
    'Administrador',         -- NOMBRE
    'admin',                 -- CODIGO
    1,                       -- ESTADO
    TO_DATE('2023-07-19 16:46:24', 'YYYY-MM-DD HH24:MI:SS'), -- CREADO
    1,                        -- CREADOPOR
    1
);
      

-- ROL USUARIO

CREATE TABLE RHEPQ.ADMROLUSUARIO (
	ID NUMBER(10,0),
	IDROL NUMBER(10,0),
	IDUSUARIO NUMBER(10,0),
	ESTADO NUMBER(10,0) DEFAULT 1 ,
	CREADO DATE DEFAULT sysdate ,
	CREADOPOR NUMBER(10,0),
	ACTUALIZADO DATE,
	ACTUALIZADOPOR NUMBER(10,0),
	CONSTRAINT SYS_C009201 CHECK ("ESTADO" IS NOT NULL),
	CONSTRAINT SYS_C009202 CHECK ("CREADO" IS NOT NULL),
	CONSTRAINT SYS_C009203 PRIMARY KEY (ID)
);

-- RHEPQ.ADMROLUSUARIO foreign keys

ALTER TABLE RHEPQ.ADMROLUSUARIO ADD CONSTRAINT FKROLUSUARIO FOREIGN KEY (IDROL) REFERENCES RHEPQ.ADMROL(ID);
ALTER TABLE RHEPQ.ADMROLUSUARIO ADD CONSTRAINT FKROLUSUARIO2 FOREIGN KEY (IDUSUARIO) REFERENCES RHEPQ.ADMUSUARIO(ID);
 

 CREATE SEQUENCE RHEPQ.ADMROLUSUARIOSEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999 NOCYCLE CACHE 20 NOORDER

 INSERT INTO RHEPQ.ADMROLUSUARIO (
    ID,
    IDROL,
    IDUSUARIO,
    ESTADO,
    CREADO,
    CREADOPOR
) VALUES (
    RHEPQ.ADMROLUSUARIOSEQ.NEXTVAL, -- Genera el ID automáticamente
    1,                             -- IDROL
    1,                             -- IDUSUARIO
    1,                             -- ESTADO
    TO_DATE('2023-07-19 18:15:39', 'YYYY-MM-DD HH24:MI:SS'), -- CREADO
    NULL                           -- CREADOPOR (no se proporcionó valor)
);

-- FN OBTENER ROLES:

CREATE OR REPLACE FUNCTION RHEPQ.obtenerRoles(pUsuario INT)
RETURN VARCHAR2 IS
    vResult VARCHAR2(4000) := '';
    vCodigo VARCHAR2(45);
    CURSOR cRoles IS
        SELECT r.codigo
        FROM RHEPQ.ADMROLUSUARIO ru
        JOIN RHEPQ.ADMROL r ON r.ID = ru.IDROL 
        WHERE ru.IDUSUARIO = pUsuario AND ru.estado = 1 AND r.estado = 1
        ORDER BY r.codigo;
BEGIN
    OPEN cRoles;
    LOOP
        FETCH cRoles INTO vCodigo;
        EXIT WHEN cRoles%NOTFOUND;
        IF vResult IS NOT NULL THEN
            vResult := vResult || '","';
        END IF;
        vResult := vResult || vCodigo;
    END LOOP;
    CLOSE cRoles;

    IF vResult IS NOT NULL THEN
        RETURN '["' || vResult || '"]';
    ELSE
        RETURN NULL;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        IF cRoles%ISOPEN THEN
            CLOSE cRoles;
        END IF;
        RAISE;
END obtenerRoles;

-- SP SPADMUSUARIO:

CREATE OR REPLACE PROCEDURE RHEPQ.SPADMUSUARIO(
    pOpcion IN NUMBER,
    pId IN OUT NUMBER,
    pUsername IN VARCHAR2 DEFAULT NULL,
    pPassword IN VARCHAR2 DEFAULT NULL,
    pPalabraSecreta IN VARCHAR2 DEFAULT NULL,
    pRememberToken IN VARCHAR2 DEFAULT NULL,
    pSessionTime IN NUMBER DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pEmpCodcia IN VARCHAR2 DEFAULT NULL,
    pEmpCodigo IN NUMBER DEFAULT NULL,        
    pIdRol IN NUMBER DEFAULT NULL,
    pCorreo IN VARCHAR2 DEFAULT NULL,
    pUsuario IN NUMBER,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pValidador OUT NUMBER,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vIdUsuario NUMBER;
    USERV VARCHAR2(100);
    vCodigo NUMBER;
    vCod VARCHAR2(5);
    vContador NUMBER;	
	vPalabraSecreta VARCHAR2(20);
	vUsername VARCHAR2(100);
	vNuevoId NUMBER;
    PASS VARCHAR2(100);
   	vFilasAfectadas NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
		    
		BEGIN
		    SELECT ID, USERNAME INTO vIdUsuario, vUsername FROM RHEPQ.ADMUSUARIO WHERE EMP_CODIGO = pEmpCodigo;
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN
		        vIdUsuario := NULL;
		        vUsername := NULL;
		END;


    IF vUsername IS NULL THEN
    
      	BEGIN
            SELECT LOWER(TO_CHAR(TRIM(EMP_PRIMER_NOM) || SUBSTR(TRIM(EMP_PRIMER_APE), 1, 1) || TRIM(EMP_CODIGO)))
            INTO vUsername
            FROM RHEPQ.PLA_EMP_EMPLEADO WHERE EMP_CODIGO = pEmpCodigo;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vUsername := NULL;
        END;

        BEGIN
            SELECT USUARIO INTO USERV FROM EPQOP.USUARIOS_REST WHERE USUARIO = vUsername;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                USERV := NULL;
        END;

        IF USERV IS NULL THEN
        
         	BEGIN
                SELECT PALABRASECRETA, PASSWORD1 INTO vPalabraSecreta, PASS FROM EPQOP.USERS_CONTROLSPWD WHERE NAME = vUsername;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    vPalabraSecreta := NULL;
                    PASS := NULL;
            END;
        

            INSERT INTO EPQOP.USUARIOS_REST (USUARIO, DPI, PASSWORD, PALABRASECRETA, RESETEOPWD)
            VALUES (vUsername, NULL, pPassword, 'dev', '0');

            INSERT INTO RHEPQ.ADMUSUARIO (ID, USERNAME, REMEMBERTOKEN, SESSIONTIME, ESTADO, CREADO, CREADOPOR, EMP_CODCIA, EMP_CODIGO, EMAIL)
            VALUES (RHEPQ.ADMUSUARIOSEQ.NEXTVAL, vUsername, pRememberToken, pSessionTime, CASE WHEN pCorreo IS NULL THEN 2 ELSE 1 END, SYSDATE, pUsuario, pEmpCodcia, pEmpCodigo, pCorreo)
            RETURNING ID INTO pId;

            -- SELECT PASSWORD1 INTO PASS FROM EPQOP.USERS_CONTROLSPWD WHERE NAME = vUsername;

            IF PASS IS NULL THEN
                INSERT INTO EPQOP.USERS_CONTROLSPWD (CODIGO_EMP, FECHA_VENCIMIENTO, CLAVE_SOP, NAME, DESCRIPTION, STATUS, PASSWORD1, PASSWORD2, CONTROL1, CONTROL2, FECHA_ALTA, USUARIOCREA, PALABRASECRETA)
                VALUES (pEmpCodigo, SYSDATE + NUMTODSINTERVAL(30, 'DAY'), NULL, vUsername, 'informatica', 'C', pPassword, NULL, 'CambioClave', 'ControlBASC2015', SYSDATE, pUsuario, 'dev');
               
               pValidador := 1; -- nueva contrasenia
            ELSE
                UPDATE EPQOP.USUARIOS_REST SET PASSWORD = PASS WHERE USUARIO = vUsername;
               
               	pValidador := 2; -- contrasenia de sistema de operaciones
            END IF;
        ELSE
            INSERT INTO RHEPQ.ADMUSUARIO (ID, USERNAME, REMEMBERTOKEN, SESSIONTIME, ESTADO, CREADO, CREADOPOR, EMP_CODCIA, EMP_CODIGO, EMAIL)
            VALUES (RHEPQ.ADMUSUARIOSEQ.NEXTVAL, vUsername, pRememberToken, pSessionTime, CASE WHEN pCorreo IS NULL THEN 2 ELSE 1 END, SYSDATE, pUsuario, pEmpCodcia, pEmpCodigo, pCorreo)
            RETURNING ID INTO pId;
           pValidador := 2; -- contrasenia de sistema de operaciones
        END IF;

        SELECT RHEPQ.ADMROLUSUARIOSEQ.NEXTVAL INTO vNuevoId FROM DUAL;
        
        INSERT INTO ADMROLUSUARIO (ID, IDROL, IDUSUARIO, ESTADO, CREADO, CREADOPOR)
        VALUES (vNuevoId, pIdRol, pId, 1, SYSDATE, pUsuario);

        
       	vUsername := NULL;
       
    END IF;

    IF vUsername IS NOT NULL THEN
    
        -- Verificar si el rol ya está asignado al usuario
            BEGIN
                SELECT ID INTO vContador FROM ADMROLUSUARIO 
                WHERE IDUSUARIO = vIdUsuario AND IDROL = pIdRol AND ROWNUM = 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    vContador := NULL;
            END;
    
            -- Asignar o actualizar el rol
            IF vContador IS NULL THEN
                -- Asignar rol al usuario existente si no tiene ese rol
            SELECT RHEPQ.ADMROLUSUARIOSEQ.NEXTVAL INTO vNuevoId FROM DUAL;
                    
                INSERT INTO ADMROLUSUARIO 
                (ID, IDROL, IDUSUARIO, ESTADO, CREADO, CREADOPOR) 
                VALUES                 
                (vNuevoId, pIdRol, vIdUsuario, pEstado, SYSDATE, pUsuario); -- Corregido: Añadido punto y coma
            
                pValidador := 3;
            ELSE
                -- Actualizar rol existente
                UPDATE ADMROLUSUARIO SET
                    ESTADO = pEstado,
                    ACTUALIZADO = SYSDATE,
                    ACTUALIZADOPOR = pUsuario
                WHERE IDUSUARIO = vIdUsuario AND IDROL = pIdRol; -- Corregido: Añadido punto y coma
            
                pValidador := 3;
            END IF;
        END IF;
        
    END IF;
   
    IF pOpcion = 2 THEN
        UPDATE ADMUSUARIO SET
            USERNAME = pUsername,
            REMEMBERTOKEN = pRememberToken,
            SESSIONTIME = pSessionTime,
            ESTADO = pEstado,
            ACTUALIZADO = SYSDATE,
            ACTUALIZADOPOR = pUsuario,
            EMP_CODCIA = pEmpCodcia,
            EMP_CODIGO = pEmpCodigo
        WHERE ID = pId;
    END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			SELECT DISTINCT
                U.ID,
                U.USERNAME,
                --UR.PASSWORD,
                U.REMEMBERTOKEN,
                U.SESSIONTIME,
                U.CREADO,
                U.CREADOPOR,
                U.ACTUALIZADO,
                U.ACTUALIZADOPOR,
                U.EMP_CODCIA,
                U.EMP_CODIGO,
                E.EMP_INTERNET,
                U.EMAIL
            FROM RHEPQ.ADMUSUARIO U
            INNER JOIN EPQOP.USUARIOS_REST UR ON UR.USUARIO = U.USERNAME
            INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = U.EMP_CODIGO 
            WHERE U.EMP_CODIGO = pEmpCodigo;
           
    -- obtener roles
    ELSIF pOpcion = 5 THEN
        OPEN pCursor FOR
			SELECT
			    U.ID,
			    U.USERNAME,            
			    U.EMP_CODCIA,
			    E.EMP_INTERNET AS correo,
			    RHEPQ.obtenerRoles(U.ID) AS roles,
			    U.email
			FROM RHEPQ.ADMUSUARIO U
			--INNER JOIN RHEPQ.ADMROLUSUARIO R ON R.IDUSUARIO = U.ID
			INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = U.EMP_CODIGO
			WHERE U.EMP_CODIGO = pEmpCodigo AND ROWNUM = 1;
           
   -- Validar datos de seguridad del usuario
    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
	       SELECT  
	        uc.NAME, 
	        uc.PALABRASECRETA, 
	        lu.USU_DPI,
	        uc.STATUS  
	        FROM EPQOP.USERS_CONTROLSPWD uc
	        LEFT JOIN EPQOP.LC_USUARIOS lu 
	        ON UC.NAME = lu.USU_USUARIO
	        WHERE RTRIM(uc.PALABRASECRETA) = pPalabraSecreta AND RTRIM(uc.NAME) = pUsername;
	       
   -- Opcion para validar datos del usuario e iniciar el cambio de  por email
   	ELSIF pOpcion = 7 THEN
       	OPEN pCursor FOR
           	SELECT
           		U.ID,
           		U.EMP_CODIGO,
           		PWD.PALABRASECRETA,
           		UR.PASSWORD,
           		PWD.PASSWORD1,
           		PWD.PASSWORD2,
           		U.EMAIL
			FROM RHEPQ.ADMUSUARIO U
			LEFT JOIN EPQOP.users_controlspwd PWD ON PWD.NAME = U.USERNAME
			LEFT JOIN EPQOP.USUARIOS_REST UR ON UR.USUARIO = U.USERNAME    
			WHERE U.USERNAME = pUsername AND U.EMAIL = pCorreo;
			
   -- Opcion para validar datos del usuario e iniciar el reinicio de contrasenia por palabra clave
   	ELSIF pOpcion = 8 THEN
       	OPEN pCursor FOR
           	SELECT
           		U.ID,
           		U.EMP_CODIGO,
           		PWD.PALABRASECRETA,
           		PWD.PASSWORD1,
           		PWD.PASSWORD2,
           		U.EMAIL
			FROM RHEPQ.ADMUSUARIO U
			LEFT JOIN EPQOP.users_controlspwd PWD ON PWD.NAME = U.USERNAME
			LEFT JOIN EPQOP.USUARIOS_REST UR ON UR.USUARIO = U.USERNAME    
			WHERE U.USERNAME = pUsername AND PWD.PALABRASECRETA = pPalabraSecreta;
           
	-- Actualizar contraseña y otros campos por username
  	ELSIF pOpcion = 9 THEN        
        UPDATE EPQOP.users_controlspwd 
        SET STATUS = 'A',
            FECHA_VENCIMIENTO = TRUNC(SYSDATE) + INTERVAL '30' DAY,
            PASSWORD1 = pPassword,
            PASSWORD2 = pPalabraSecreta,
            USUARIOCREA = pUsername,
            FECHA_ALTA = SYSDATE
        WHERE NAME = pUsername;
       
       UPDATE EPQOP.USUARIOS_REST 
        SET PASSWORD = pPassword,
            RESETEOPWD = '0' 
        WHERE USUARIO = pUsername;
       
      vFilasAfectadas := SQL%ROWCOUNT;
    
	    OPEN pCursor FOR
	    SELECT vFilasAfectadas AS filasAfectadas FROM DUAL;
       
   -- Actualizar palabra secreta  por username
  	ELSIF pOpcion = 10 THEN        
        UPDATE EPQOP.users_controlspwd 
        SET STATUS = 'C',
            palabraSecreta = pPalabraSecreta
        WHERE NAME = pUsername;
       
       UPDATE EPQOP.USUARIOS_REST 
        SET palabraSecreta = pPalabraSecreta
        WHERE USUARIO = pUsername;
       
       vFilasAfectadas := SQL%ROWCOUNT;
    
	    OPEN pCursor FOR
	    SELECT vFilasAfectadas AS filasAfectadas FROM DUAL;
	       
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SPADMUSUARIO;

-- SP LOGIN:

CREATE OR REPLACE PROCEDURE RHEPQ.spLogin (
    pOpcion IN NUMBER,
    pUsername IN VARCHAR2,
    pPassword IN VARCHAR2 DEFAULT NULL,
    pPalabraSecreta IN VARCHAR2 DEFAULT NULL,
    pCorreo IN VARCHAR2 DEFAULT NULL,
    pSessionTime IN NUMBER DEFAULT NULL,
    pCursor OUT SYS_REFCURSOR
) AS
	vId NUMBER;
BEGIN
	
	  SAVEPOINT transact;

	 -- Opcion para registrar primer login
    IF pOpcion = 1 THEN
        -- Primero, actualizar contrasenia
        UPDATE EPQOP.USUARIOS_REST SET
		PASSWORD = pPassword
		WHERE USUARIO = pUsername;
        
	    -- SEGUNDO, se ca actualiza el estado para evitar volver a solicitar primer login
        UPDATE RHEPQ.ADMUSUARIO SET
		ESTADO = 1,
		ACTUALIZADO = SYSDATE,
		ACTUALIZADOPOR = 1
		WHERE USERNAME = pUsername;	    	   
	   
	   -- como se esta reseteando una password nueva, se deja el estado activo del usuario, solo si el usuario no esta bloqueado
        UPDATE EPQOP.users_controlspwd
        SET STATUS = 'A',
            FECHA_VENCIMIENTO = TRUNC(SYSDATE) + INTERVAL '30' DAY,
            PASSWORD1 = pPassword 
        WHERE NAME = pUsername AND STATUS != 'D';

        OPEN pCursor FOR 
            SELECT 'Actualización realizada con éxito' AS RESULTADO FROM DUAL;
    
   END IF;

    COMMIT;   

	-- Ultima ejecucion de login
    IF pOpcion = 5 THEN
        OPEN pCursor FOR 
			SELECT 
				U.ID AS idUsuario,
				U.USERNAME,
				UR.PASSWORD,	
				PWD.STATUS AS ESTADO,
				U.SESSIONTIME,
				R.ID AS idRol,
				R.NOMBRE AS nombreRol,
				R.CODIGO AS codRol,
				RHEPQ.obtenerRoles(u.id) as roles,
				RHEPQ.CONTARROLES(u.id) as cantidadRoles,
				U.emp_codcia AS cia,
				E.EMP_CODIGO AS cod,
				ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(E.EMP_CODIGO) AS nombreCompleto,			
			    E.EMP_CODUNI_UBI AS codUniUbic,
			    Rhepq.area_ubicacion(E.EMP_CODUNI_UBI) AS areaUbicacion,
				S.NOMBRE AS sistema,
				U.EMAIL,
				CASE 
			        WHEN PWD.PALABRASECRETA IS NULL THEN 0
			        ELSE 1
			    END AS PalabraClaveValida
			FROM RHEPQ.ADMUSUARIO U
			LEFT JOIN EPQOP.USUARIOS_REST UR ON UR.USUARIO = U.USERNAME
			LEFT JOIN EPQOP.USERS_CONTROLSPWD PWD ON PWD.NAME = UR.USUARIO
			LEFT JOIN RHEPQ.ADMROLUSUARIO RU ON ru.IDUSUARIO = u.ID
			LEFT JOIN RHEPQ.ADMROL R ON r.ID = ru.IDROL
			INNER JOIN RHEPQ.ADMSISTEMA S ON S.ID = R.IDSISTEMA 
			INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = U.EMP_CODIGO
			WHERE u.USERNAME = pUsername AND PWD.STATUS = 'A';

	ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR 
            SELECT 
                u.USERNAME AS username,
                u.ESTADO AS estado
            FROM RHEPQ.ADMUSUARIO u
            WHERE u.USERNAME = pUsername AND u.ESTADO = 1;

    -- Dias restantes de contrasenia y validacion en biometrico | primer ejecucion de login
   	ELSIF pOpcion = 7 THEN	
   		 OPEN pCursor FOR
             SELECT 
                pwd.STATUS, 
                pwd.CODIGO_EMP,
                --acc.BIO_TIPO_MARCA,
                2 AS BIO_TIPO_MARCA,
                TRUNC(pwd.FECHA_VENCIMIENTO) - TRUNC(SYSDATE) AS DIAS_RESTANTES 
            FROM EPQOP.USERS_CONTROLSPWD pwd 
            LEFT JOIN RHEPQ.ACCESOS acc ON acc.BIO_ID = pwd.CODIGO_EMP
            WHERE pwd.NAME = pUsername AND ROWNUM = 1
            -- TRUNC(acc.BIO_FECHA) = TRUNC(SYSDATE)
            ORDER BY acc.BIO_CORRELATIVO DESC;
           
    -- Validar si es primer login | segunda ejecucion de login
   	ELSIF pOpcion = 8 THEN
		OPEN pCursor FOR 
		SELECT 
		    UR.USUARIO, 
		    UR.DPI, 
		    UR.PASSWORD, 
		    UR.RESETEOPWD  
		FROM EPQOP.USUARIOS_REST UR
		INNER JOIN RHEPQ.ADMUSUARIO U ON U.USERNAME = UR.USUARIO
		WHERE RTRIM(UR.USUARIO) = RTRIM(pUsername) AND U.ESTADO = 1;

	-- Opciones para primer login
	
	    -- INICIO: validar datos de seguridad del usuario
   	ELSIF pOpcion = 9 THEN
		 IF pPalabraSecreta IS NOT NULL THEN
		        -- Validación con palabra secreta
		        OPEN pCursor FOR
		            SELECT uc.NAME, uc.PALABRASECRETA, lu.USU_DPI, uc.STATUS
		            FROM EPQOP.USERS_CONTROLSPWD uc
		            LEFT JOIN EPQOP.LC_USUARIOS lu ON UC.NAME = lu.USU_USUARIO
		            WHERE TRIM(uc.PALABRASECRETA) = TRIM(pPalabraSecreta) AND TRIM(uc.NAME) = TRIM(pUsername);
		    ELSE
		        -- Validación con correo electrónico de empleado
		        OPEN pCursor FOR
		            SELECT uc.NAME, uc.PALABRASECRETA, lu.USU_DPI, uc.STATUS
		            FROM RHEPQ.ADMUSUARIO u
		            JOIN EPQOP.USERS_CONTROLSPWD uc ON u.USERNAME = uc.NAME
		            LEFT JOIN EPQOP.LC_USUARIOS lu ON UC.NAME = lu.USU_USUARIO
		            LEFT JOIN RHEPQ.PLA_EMP_EMPLEADO pee ON u.EMP_CODIGO = pee.EMP_CODIGO
		            WHERE TRIM(pee.EMP_INTERNET) = TRIM(pCorreo) AND TRIM(u.USERNAME) = TRIM(pUsername);
        END IF;
       
	
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END spLogin;


------------------------------ SP ROLES

CREATE OR REPLACE PROCEDURE RHEPQ.SPADMROL(
    pOpcion IN NUMBER,
    pId IN OUT NUMBER,
    pNombre IN VARCHAR2 DEFAULT NULL,
    pCodigo IN VARCHAR2 DEFAULT NULL,
    pEstado IN NUMBER DEFAULT 1,
    pUsuario IN NUMBER DEFAULT NULL,
    pIdSistema IN NUMBER DEFAULT NULL,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT NUMBER
) AS
    vContador NUMBER;
BEGIN
	
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO ADMROL (
            ID,
            NOMBRE,
            CODIGO,
            ESTADO,
            CREADO,
            CREADOPOR,
            IDSISTEMA
        ) VALUES (
            RHEPQ.ADMROLSEQ.NEXTVAL,
            pNombre,
            pCodigo,
            pEstado,
            SYSDATE,
            pUsuario,
            pIdSistema
        )
        RETURNING ID INTO pId;

    ELSIF pOpcion = 2 THEN
        UPDATE ADMROL SET
            NOMBRE = pNombre,
            CODIGO = pCodigo,
            ESTADO = pEstado,
            ACTUALIZADO = SYSDATE,
            ACTUALIZADOPOR = pUsuario,
            IDSISTEMA = pIdSistema
        WHERE ID = pId;
    END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
            SELECT 
                ID,
                NOMBRE,
                CODIGO,
                ESTADO,
                CREADO,
                CREADOPOR,
                ACTUALIZADO,
                ACTUALIZADOPOR,
                IDSISTEMA
            FROM ADMROL
            WHERE ID = pId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador FROM ADMROL;
        pTotalPage := CEIL(vContador / pPageSize);

        OPEN pCursor FOR
            SELECT * FROM (
                SELECT a.*, ROWNUM rnum
                FROM (
                    SELECT 
                    	ID,
                        NOMBRE,
                        CODIGO,
                        ESTADO,
                        CREADO,
                        CREADOPOR,
                        ACTUALIZADO,
                        ACTUALIZADOPOR,
                        IDSISTEMA
                    FROM ADMROL
                    ORDER BY ID
                ) a
                WHERE ROWNUM <= pPageNumber * pPageSize
            )
            WHERE rnum > (pPageNumber - 1) * pPageSize;

    ELSIF pOpcion = 6 THEN
        OPEN pCursor FOR
            SELECT ID AS value, NOMBRE AS label
            FROM ADMROL;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END SPADMROL;


-- FN OBTENER NOMBRE COMPLETO

CREATE OR REPLACE FUNCTION ISYSEPQ.GetNombreCompletoEmpleado(
    pCodigoEmp IN NUMBER
) RETURN VARCHAR2 IS
    vResultado VARCHAR2(500);
BEGIN
    BEGIN
        SELECT EMP_NOMBRE_CIP
        INTO vResultado
        FROM RHEPQ.PLA_EMP_EMPLEADO
        WHERE EMP_CODIGO = pCodigoEmp;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            vResultado := NULL;
    END;

    IF vResultado IS NULL THEN
        SELECT 
            E.EMP_PRIMER_NOM || ' ' || 
            NVL(E.EMP_SEGUNDO_NOM, '') || ' ' || 
            NVL(E.EMP_TERCER_NOM, '') || ' ' || 
            E.EMP_PRIMER_APE || ' ' || 
            NVL(E.EMP_SEGUNDO_APE, '') || ' ' || 
            NVL(E.EMP_APELLIDO_CAS, '')
        INTO vResultado
        FROM RHEPQ.PLA_EMP_EMPLEADO E
        WHERE E.EMP_CODIGO = pCodigoEmp;
    END IF;

    -- Aplicar REGEXP_REPLACE solo si vResultado no es NULL
    IF vResultado IS NOT NULL THEN
        vResultado := REGEXP_REPLACE(vResultado, '\s{2,}', ' ');
    END IF;

    RETURN TRIM(vResultado);
END GetNombreCompletoEmpleado;

------------------------------ FN FORMATEAR FECHAS

CREATE OR REPLACE FUNCTION RHEPQ.FORMAT_DATE(
    pDate IN DATE,
    pFormat IN VARCHAR2 DEFAULT 'DD/MM/YYYY'
) RETURN VARCHAR2
IS
    vFormattedDate VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(pDate, pFormat) INTO vFormattedDate FROM DUAL;
    RETURN vFormattedDate;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END FORMAT_DATE;


------------------------------- FN OBTENER USUARIO

CREATE OR REPLACE FUNCTION obtenerUsername(pUsuario IN NUMBER) RETURN VARCHAR2 IS
  vUsername RHEPQ.ADMUSUARIO.USERNAME%TYPE;
BEGIN
  SELECT USERNAME INTO vUsername FROM RHEPQ.ADMUSUARIO WHERE ID = pUsuario;
  RETURN vUsername;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END obtenerUsername;