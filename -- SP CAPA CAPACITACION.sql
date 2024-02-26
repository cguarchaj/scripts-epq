-- SP CAPA CAPACITACION


CREATE OR REPLACE procedure RHEPQ.spCapaCapacitacion(
    pOpcion IN number,
    pId IN OUT number,
    pIdCurso IN number,
    pIdTipoCapacitacion IN number,
    pDescripcion IN varchar2,
    pFechaHoraInicial IN DATE,
    pFechaHoraFinal IN DATE,
    pUrl IN varchar2,
    pUbicacion IN varchar2,
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
	    insert into RHEPQ.capaCapacitacion 
	    (id, idCurso, idTipoCapacitacion, descripcion, fechaHoraInicial, fechaHoraFinal, url, ubicacion, estado, creado, creadoPor)
	    values 
	    (CAPACAPACITACIONSEQ.NEXTVAL, pIdCurso, pIdTipoCapacitacion, pDescripcion, pFechaHoraInicial, pFechaHoraFinal, pUrl, pUbicacion, pEstado, SYSDATE, pUsuario)
		returning id into pId;
	
    elsif pOpcion = 2 THEN
    
        update RHEPQ.capaCapacitacion set 
	   		descripcion = pDescripcion, 
			fechaHoraInicial = pFechaHoraInicial,
		    fechaHoraFinal = pFechaHoraFinal, 
		    url = pUrl, 
			ubicacion = pUbicacion, 
		  	idCurso = pIdCurso, 
		 	idTipoCapacitacion = pIdTipoCapacitacion, 
			actualizado = SYSDATE, 
			actualizadoPor = pUsuario 
			where id = pId;
    
   elsif pOpcion = 3 then 
        update RHEPQ.capaCapacitacion set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
   commit;

   end if;
      

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select 
                	C.id, 
                	C.idCurso, 
                	CUR.NOMBRE AS curso,
                	C.idTipoCapacitacion,                 	
                	C.descripcion, 
                	TC.NOMBRE AS tipoCapacitacion,
                 	C.fechaHoraInicial, 
                	C.fechaHoraFinal, 
                	C.url, 
                	C.ubicacion, 
                	C.estado
                from RHEPQ.capaCapacitacion C
                INNER JOIN RHEPQ.CAPACURSO CUR ON CUR.ID = C.IDCURSO
                INNER JOIN RHEPQ.CAPATIPOCAPACITACION TC ON TC.ID = C.IDTIPOCAPACITACION 
	            where C.id = pId;
	           
	 elsif pOpcion = 5 then 
	-- Contar los registros filtrados por descripción, si se proporciona
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.capaCapacitacion C
	    INNER JOIN RHEPQ.CAPACURSO CUR ON CUR.ID = C.IDCURSO
	    INNER JOIN RHEPQ.CAPATIPOCAPACITACION TC ON TC.ID = C.IDTIPOCAPACITACION
	    WHERE 
	    (
	        pDescripcion IS NULL
	        OR pDescripcion = ''
	        OR LOWER(C.descripcion) LIKE '%' || LOWER(TRIM(pDescripcion)) || '%'
	    );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT id, idCurso, curso, idTipoCapacitacion, descripcion, tipoCapacitacion, fechaHoraInicial, fechaHoraFinal, url, ubicacion, estado
	        FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    C.id, 
	                    C.idCurso, 
	                    CUR.NOMBRE AS curso,
	                    C.idTipoCapacitacion,                 
	                    C.descripcion, 
	                    TC.NOMBRE AS tipoCapacitacion,
	                    C.fechaHoraInicial, 
	                    C.fechaHoraFinal, 
	                    C.url, 
	                    C.ubicacion, 
	                    C.estado
	                FROM RHEPQ.capaCapacitacion C
	                INNER JOIN RHEPQ.CAPACURSO CUR ON CUR.ID = C.IDCURSO
	                INNER JOIN RHEPQ.CAPATIPOCAPACITACION TC ON TC.ID = C.IDTIPOCAPACITACION
	                WHERE
	                (
	                    pDescripcion IS NULL
	                    OR pDescripcion = ''
	                    OR LOWER(C.descripcion) LIKE '%' || LOWER(TRIM(pDescripcion)) || '%'
	                )
	                ORDER BY C.id
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
		   
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaCapacitacion;

-- SP CURSO

CREATE OR REPLACE procedure RHEPQ.spCapaCurso(
    pOpcion IN number,
    pId IN OUT number,
    pNombre IN varchar2 default null,
    pDescripcion IN varchar2,
    pDuracion in timestamp,
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
	    insert into RHEPQ.capaCurso 
    	(id, nombre, duracion, descripcion, estado, creado, creadoPor)
	    values 
	    (CAPACURSOSEQ.NEXTVAL, pNombre, pDuracion, pDescripcion, pEstado, SYSDATE, pUsuario)
	    returning id into pId;
	   
    elsif pOpcion = 2 THEN
    
        update RHEPQ.capaCurso set nombre = pNombre, duracion = pDuracion, descripcion = pDescripcion, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
   elsif pOpcion = 3 then 
       
        update RHEPQ.capaCurso set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
     commit;
       
	 end if;
     

    IF pOpcion IN (1,2,3,4) then 
	    open pCursor for 
		        select id, nombre, descripcion, 
		               TO_CHAR(duracion, 'DD/MM/YYYY HH24:MI') as duracion, 
		               estado
		        from RHEPQ.capaCurso where id = pId;
		       
	ELSIF pOpcion = 5 THEN
	    -- Contar los registros filtrados por descripción, si se proporciona
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.capaCurso
	    WHERE 
	    (
	        pDescripcion IS NULL
	        OR pDescripcion = ''
	        OR LOWER(descripcion) LIKE '%' || LOWER(TRIM(pDescripcion)) || '%'
	    );
	
			-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT id, nombre, descripcion, duracion, estado
	        FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    id, 
	                    nombre, 
	                    descripcion, 
	                    TO_CHAR(duracion, 'DD/MM/YYYY HH24:MI') AS duracion, 
	                    estado
	                FROM RHEPQ.capaCurso
	                WHERE
	                (
	                    pDescripcion IS NULL
	                    OR pDescripcion = ''
	                    OR LOWER(descripcion) LIKE '%' || LOWER(TRIM(pDescripcion)) || '%'
	                )
	                ORDER BY nombre
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;

	   
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombre as label
            from RHEPQ.capaCurso;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaCurso;

-- Curso Documento

CREATE OR REPLACE procedure RHEPQ.spCapaCursoDocumento(
    pOpcion IN number,
    pId IN OUT number,
    pIdCurso IN number,
    pIdDocumento IN number,
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
        insert into RHEPQ.capaCursoDocumento 
        (id, idCurso, idDocumento, estado, creado, creadoPor)
        values 
        (CAPACURSODOCUMENTOSEQ.NEXTVAL, pIdCurso, pIdDocumento, pEstado, SYSDATE, pUsuario)
        returning id into pId;
       
    elsif pOpcion = 2 THEN
    
        update RHEPQ.capaCursoDocumento set idCurso = pIdCurso, idDocumento = pIdDocumento, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
   elsif pOpcion = 3 then 
        update RHEPQ.capaCursoDocumento set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
    end if;
  
	commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select 
					CD.id, 
					CD.idCurso, 
					C.NOMBRE,
					CD.idDocumento,
					D.NOMBRE,
					CD.estado,
					TD.NOMBRE AS tipoDocumento
				from RHEPQ.capaCursoDocumento CD
				INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CD.IDCURSO 
				INNER JOIN RHEPQ.CAPADOCUMENTO D ON D.ID = CD.IDDOCUMENTO 
				INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.ID = D.IDTIPODOCUMENTO 
				where CD.id = pId;
               
    elsif pOpcion = 5 then 
        SELECT COUNT(*) INTO vContador 
       	FROM RHEPQ.capaCursoDocumento CD
      	INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CD.IDCURSO 
        INNER JOIN RHEPQ.CAPADOCUMENTO D ON D.ID = CD.IDDOCUMENTO 
        INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.ID = D.IDTIPODOCUMENTO;
       
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

		OPEN pCursor FOR
		SELECT * FROM (
		    SELECT a.*, ROWNUM rnum
		    FROM (
		        SELECT
		            CD.id AS id, 
		            CD.idCurso AS idCurso, 
		            CD.idDocumento AS idDocumento,
		            C.NOMBRE AS nombreCurso,
		            D.NOMBRE AS nombreDocumento,
		            CD.estado AS estado,
		            TD.NOMBRE AS tipoDocumento
		        FROM RHEPQ.capaCursoDocumento CD
		        INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CD.IDCURSO 
		        INNER JOIN RHEPQ.CAPADOCUMENTO D ON D.ID = CD.IDDOCUMENTO 
		        INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.ID = D.IDTIPODOCUMENTO 
		        ORDER BY CD.id
		    ) a
		    WHERE ROWNUM <= pPageNumber * pPageSize
		)
		WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaCursoDocumento;

-- Curso Profesor

CREATE OR REPLACE procedure RHEPQ.spCapaCursoProfesor(
    pOpcion IN number,
    pId IN OUT number,
    pIdPersona IN number,
    pIdCurso IN number,
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
        insert into RHEPQ.capaCursoProfesor 
        (id, idPersona, idCurso, estado, creado, creadoPor)
        values 
        (CAPACURSOPROFESORSEQ.NEXTVAL, pIdPersona, pIdCurso, pEstado, SYSDATE, pUsuario)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update capaCursoProfesor set idPersona = pIdPersona, idCurso = pIdCurso, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
   elsif pOpcion = 3 then 
        update capaCursoProfesor set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
       end if;
    
      commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
				select 
					CP.id, 
					CP.idPersona, 
					ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(idPersona) AS nombreCompletoPersona,
					CP.idCurso, 
					c.NOMBRE AS curso,
					CP.estado
				from RHEPQ.capaCursoProfesor CP
				INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = CP.IDPERSONA AND CP.CODCIA = E.EMP_CODCIA
				INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CP.IDCURSO
				where CP.id = pId AND CP.CODCIA = '001';
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador 
          	FROM RHEPQ.capaCursoProfesor CP
          	INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = CP.IDPERSONA AND CP.CODCIA = E.EMP_CODCIA
	        INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CP.IDCURSO
           	WHERE CP.CODCIA = '001';
          
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

			OPEN pCursor FOR
			SELECT * FROM (
			    SELECT a.*, ROWNUM rnum
			    FROM (
			        SELECT 
			            CP.id AS id, 
			            CP.idPersona AS idPersona, 
			            ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(CP.idPersona) AS nombreCompletoEmpleado,
			            CP.idCurso AS idCurso, 
			            C.NOMBRE AS nombreCurso,
			            CP.estado AS estado
			        FROM RHEPQ.capaCursoProfesor CP
			        INNER JOIN RHEPQ.PLA_EMP_EMPLEADO E ON E.EMP_CODIGO = CP.IDPERSONA AND CP.CODCIA = E.EMP_CODCIA
			        INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CP.IDCURSO
			        WHERE CP.CODCIA = '001'
			        ORDER BY CP.idPersona
			    ) a
			    WHERE ROWNUM <= pPageNumber * pPageSize
			)
			WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaCursoProfesor;

-- Curso Profesor Externo

CREATE OR REPLACE procedure RHEPQ.spCapaCursoProfesorExterno(
    pOpcion IN number,
    pId IN OUT number,
    pIdProfesorExterno IN number,
    pIdCurso In number,
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
        insert into RHEPQ.capaCursoProfesorExterno 
        (id, idProfesorExterno, idCurso, estado, creado, creadoPor)
        values 
        (CAPACURSOPROFESOREXTERNOSEQ.NEXTVAL, pIdProfesorExterno, pIdCurso, pEstado, SYSDATE, pUsuario)
        returning id into pId;
       
    elsif pOpcion = 2 THEN
    
        update RHEPQ.capaCursoProfesorExterno set idProfesorExterno = pIdProfesorExterno, idCurso = pIdCurso, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    
   	elsif pOpcion = 3 then 
        update RHEPQ.capaCursoProfesorExterno set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
        open pCursor for
			select 
				CPE.id, 
				CPE.idProfesorExterno, 
				PE.NOMBRECOMPLETO,
				CPE.idCurso, 
				C.NOMBRE,
				CPE.estado
			from RHEPQ.capaCursoProfesorExterno CPE
			INNER JOIN RHEPQ.CAPAPROFESOREXTERNO PE ON PE.ID = CPE.IDPROFESOREXTERNO 
			INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CPE.IDCURSO
			where CPE.id = pId;
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador
           	FROM RHEPQ.capaCursoProfesorExterno CPE
            INNER JOIN RHEPQ.CAPAPROFESOREXTERNO PE ON PE.ID = CPE.IDPROFESOREXTERNO
            INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CPE.IDCURSO;
           
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);
			
			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                CPE.id, 
			                CPE.idProfesorExterno, 
			                PE.NOMBRECOMPLETO AS nombreCompletoProfesor,
			                CPE.idCurso, 
			                C.NOMBRE AS nombreCurso,
			                CPE.estado
			            FROM RHEPQ.capaCursoProfesorExterno CPE
			            INNER JOIN RHEPQ.CAPAPROFESOREXTERNO PE ON PE.ID = CPE.IDPROFESOREXTERNO 
			            INNER JOIN RHEPQ.CAPACURSO C ON C.ID = CPE.IDCURSO
			            ORDER BY CPE.id
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaCursoProfesorExterno;

-- Detalle Capacitacion

CREATE OR REPLACE procedure RHEPQ.spCapaDetalleCapacitacion(
    pOpcion IN number,
    pId IN OUT number,
    pIdPersona IN number,
    pIdCapacitacion IN number,    
    pNombreCompleto VARCHAR2,
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
        insert into RHEPQ.capaDetalleCapacitacion 
        (id, idCapacitacion, idPersona, codCia, estado, creado, creadoPor)
        values 
        (CAPADETALLECAPACITACIONSEQ.NEXTVAL, pIdCapacitacion, pIdPersona, '001', pEstado, SYSDATE, pUsuario)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaDetalleCapacitacion set idCapacitacion = pIdCapacitacion, idPersona = pIdPersona, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaDetalleCapacitacion set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;
   
    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
            	SELECT 
				    DC.id, 
				    DC.idCapacitacion, 
				    C.DESCRIPCION AS capacitacion,
				    DC.idPersona, 
				    ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(DC.idPersona) AS nombreCompleto,
				    DC.estado
				FROM RHEPQ.capaDetalleCapacitacion DC
				INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO  = DC.IDPERSONA AND P.EMP_CODCIA = DC.CODCIA 
				INNER JOIN RHEPQ.CAPACAPACITACION C ON C.ID = DC.IDCAPACITACION 
				where DC.id = pId;
			
	elsif pOpcion = 5 then 
	    SELECT COUNT(*) INTO vContador FROM RHEPQ.capaDetalleCapacitacion DC
		INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO  = DC.IDPERSONA AND P.EMP_CODCIA = DC.CODCIA 
		INNER JOIN RHEPQ.CAPACAPACITACION C ON C.ID = DC.IDCAPACITACION 
		WHERE DC.idCapacitacion = pIdCapacitacion AND DC.CODCIA = '001'
		AND (
            pNombreCompleto IS NULL 
            OR pNombreCompleto = '' 
            OR LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(DC.idPersona)) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
        );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                DC.id, 
		                DC.idCapacitacion, 
		                C.DESCRIPCION AS capacitacion,
		                DC.idPersona, 
		                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(DC.idPersona) AS nombreCompleto,
		                DC.estado
		            FROM RHEPQ.capaDetalleCapacitacion DC
		            INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO = DC.IDPERSONA AND P.EMP_CODCIA = DC.CODCIA 
		            INNER JOIN RHEPQ.CAPACAPACITACION C ON C.ID = DC.IDCAPACITACION
		            WHERE DC.idCapacitacion = pIdCapacitacion AND DC.CODCIA = '001'
		            AND (
		                pNombreCompleto IS NULL 
		                OR pNombreCompleto = '' 
		                OR LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(DC.idPersona)) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
		            )
		            ORDER BY DC.id
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;
	   
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaDetalleCapacitacion;

-- Detalle capacitacion externo

CREATE OR REPLACE procedure RHEPQ.spCapaDetalleCapaExterno(
    pOpcion IN number,
    pId IN OUT number,
    pIdCapacitacion IN number,
    pIdGenero IN number,
    pNombreCompleto IN varchar2 default null,
    pEmail IN varchar2 default null,
    pEdad IN number default null,
    pDpi IN varchar2 default null,
    pEmpresa IN varchar2 default null,
    pAlergico IN varchar2 default null,
    pTelefono IN varchar2 default null,
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
        insert into RHEPQ.capaDetalleCapacitacionExterno 
        (id, idCapacitacion, idGenero, nombreCompleto, email, edad, dpi, empresa, alergico, telefono, estado, creado, creadoPor)
        values 
        (capaDetalleCapaExternoSeq.NEXTVAL, pIdCapacitacion, pIdGenero, pNombreCompleto, pEmail, pEdad, pDpi, pEmpresa, pAlergico, pTelefono, pEstado, SYSDATE ,pUsuario)
    	returning id into pId;
    
    elsif pOpcion = 2 then
        update RHEPQ.capaDetalleCapacitacionExterno set nombreCompleto = pNombreCompleto, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaDetalleCapacitacionExterno set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
        open pCursor for 
            select 
            id, 
            nombreCompleto, 
            idCapacitacion, 
            email, 
            edad, 
            dpi, 
            empresa, 
            alergico, 
            telefono, 
            estado
        from RHEPQ.capaDetalleCapacitacionExterno 
       where id = pId;
               
    elsif pOpcion = 5 then 
	    -- Calcular el total de registros que coinciden con el criterio de búsqueda
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.capaDetalleCapacitacionExterno
	    WHERE idCapacitacion = pIdCapacitacion
	    AND (
	        pNombreCompleto IS NULL
	        OR pNombreCompleto = ''
	        OR LOWER(nombreCompleto) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
	    );
	
	    -- Asignar la cantidad total de páginas
	    pTotalPage := vContador;
	    --pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
		OPEN pCursor FOR
			SELECT * FROM (
			    SELECT a.*, ROWNUM rnum
			    FROM (
			        SELECT 
			            id, 
			            nombreCompleto, 
			            idCapacitacion, 
			            email, 
			            edad, 
			            dpi, 
			            empresa, 
			            alergico, 
			            telefono, 
			            estado
			        FROM RHEPQ.capaDetalleCapacitacionExterno
			        WHERE idCapacitacion = pIdCapacitacion
			        AND (
			            pNombreCompleto IS NULL
			            OR pNombreCompleto = ''
			            OR LOWER(nombreCompleto) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
			        )
			        ORDER BY nombreCompleto
			    ) a
			    WHERE ROWNUM <= pPageNumber * pPageSize
			) b
			WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombreCompleto as label
            from RHEPQ.capaDetalleCapacitacionExterno where id = pId;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaDetalleCapaExterno;

-- Documento

CREATE OR REPLACE procedure RHEPQ.spCapaDocumento(
    pOpcion IN number,
    pId IN OUT number,
    pIdTipoDocumento IN number,
    pNombre IN varchar2 default null,
    pArchivo IN varchar2 default null,
    pDescripcion IN varchar2 default null,
    pExtension IN varchar2 default null,
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
	    insert into RHEPQ.capaDocumento
	    (id, idTipoDocumento, nombre, archivo, descripcion, extension, estado, creado, creadoPor)
	    VALUES
	    (CAPADOCUMENTOSEQ.NEXTVAL, pIdTipoDocumento, pNombre, pArchivo, pDescripcion, pExtension, pEstado, SYSDATE, pUsuario)
	    returning id into pId;
	   
    elsif pOpcion = 2 then
        update RHEPQ.capaDocumento set nombre = pNombre, archivo = pArchivo, descripcion = pDescripcion, extension = pExtension, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaDocumento set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
            	select 
	            	D.id, 
	            	D.nombre, 
	            	D.archivo, 
	            	D.descripcion, 
	            	D.extension, 
	            	D.estado, 
	            	D.IDTIPODOCUMENTO,
	            	TD.NOMBRE AS tipoDocumento
        		from RHEPQ.capaDocumento D
               INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.id = D.IDTIPODOCUMENTO
                where D.id = pId;
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador 
            FROM RHEPQ.capaDocumento  D
            INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.id = D.IDTIPODOCUMENTO
            WHERE 
            (
                pNombre IS NULL
                OR pNombre = ''
                OR LOWER(D.nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%'
            );
           
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                D.id, 
			                D.idTipoDocumento,
			                TD.NOMBRE AS tipoDocumento,
			                D.nombre, 
			                D.descripcion, 
			                D.extension, 
			                D.estado
			            FROM RHEPQ.capaDocumento D
			            INNER JOIN RHEPQ.CAPATIPODOCUMENTO TD ON TD.id = D.IDTIPODOCUMENTO
			            WHERE 
			            (
			                pNombre IS NULL
			                OR pNombre = ''
			                OR LOWER(D.nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%'
			            )
			            ORDER BY D.nombre
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;

    END IF;
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaDocumento;

-- Firma

CREATE OR REPLACE procedure RHEPQ.spCapaFirma(
    pOpcion IN number,
    pId IN OUT number,
    pArchivo IN varchar2 default null,
    pExtension IN varchar2 default null,
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
       INSERT INTO RHEPQ.capaFirma (id, archivo, extension, estado, creado, creadoPor, actualizado, actualizadoPor)
        VALUES
        (RHEPQ.capaFirmaSeq.NEXTVAL, pArchivo, pExtension, pEstado, SYSDATE, pUsuario, NULL, NULL)
        RETURNING id INTO pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaFirma set archivo = pArchivo, extension = pExtension, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaFirma set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
   	commit;	
  
    end if;   

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select 
	                id, 
	                archivo, 
	                extension, 
	                estado
                from RHEPQ.capaFirma 
               where id = pId;
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador 
         	FROM RHEPQ.capaFirma;
           
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                id, 
			                archivo, 
			                extension, 
			                estado
			            FROM RHEPQ.capaFirma			       
			            ORDER BY id DESC
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaFirma;

-- Firma Documento

CREATE OR REPLACE procedure RHEPQ.spCapaFirmaDocumento(
    pOpcion IN number,
    pId IN OUT number,
    pIdDocumento IN number default null,
    pIdFirma IN number default null,
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
        INSERT INTO RHEPQ.capaFirmaDocumento 
        	(id, idDocumento, idFirma, estado, creado, creadoPor, actualizado, actualizadoPor)
    	VALUES
        	(RHEPQ.capaFirmaDocumentoSeq.NEXTVAL, pIdDocumento, pIdFirma, pEstado, SYSDATE, pUsuario, NULL, NULL)
        RETURNING id INTO pId;
       
    elsif pOpcion = 2 THEN
    
        update RHEPQ.capaFirmaDocumento set idDocumento = pIdDocumento, idFirma = pIdFirma, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaFirmaDocumento set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
    	
       commit;
   
       end if;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select cfd.id, cd.nombre, cd.archivo, cd.extension, cf.archivo, cf.extension,  cfd.estado
                from RHEPQ.capaFirmaDocumento cfd 
                inner join RHEPQ.capaFirma cf on cf.id = cfd.idFirma
                inner join RHEPQ.capaDocumento cd on cd.id = cfd.idDocumento
                where cfd.id = pId;
               
    elsif pOpcion = 5 then
            SELECT COUNT(*) INTO vContador FROM RHEPQ.capaFirmaDocumento cfd
            inner join RHEPQ.capaFirma cf on cf.id = cfd.idFirma
            inner join RHEPQ.capaDocumento cd on cd.id = cfd.idDocumento
            where cfd.idDocumento = pIdDocumento;
            
			-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

            open pCursor for
            SELECT *
                FROM (
                    SELECT a.*, ROWNUM rnum
                    FROM (
                        select cfd.id, cd.nombre AS nombreDocu, 
                        		cd.archivo AS archivoDocu, 
                        		cd.extension AS archivoExtension, 
                        		cf.archivo AS firmaArchivo, 
                        		cf.extension AS firmaExtension,  
                        		cfd.estado AS firmDocEstado
                        from RHEPQ.capaFirmaDocumento cfd
                        inner join RHEPQ.capaFirma cf on cf.id = cfd.idFirma
                        inner join RHEPQ.capaDocumento cd on cd.id = cfd.idDocumento
                        --where cfd.id = pId
                     	where cfd.idDocumento = pIdDocumento
                        ORDER BY cd.nombre
                    ) a
                    WHERE ROWNUM <= pPageNumber * pPageSize
                )
            WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaFirmaDocumento;

-- Profesor Externo

CREATE OR REPLACE procedure RHEPQ.spCapaProfesorExterno(
    pOpcion IN number,
    pId IN OUT number,
    pIdGenero IN number,
    pNombreCompleto IN varchar2 default null,
    pEmail IN varchar2 default null,
    pEdad IN number default null,
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
        insert into RHEPQ.capaProfesorExterno 
        	(id, idGenero, nombreCompleto, email, edad, estado, creado, creadoPor)
        values 
        	(CAPAPROFESOREXTERNOSEQ.NEXTVAL, pIdGenero, pNombreCompleto, pEmail, pEdad, pEstado, SYSDATE, pUsuario)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaProfesorExterno set idGenero = pIdGenero, nombreCompleto = pNombreCompleto, email = pEmail, edad = pEdad, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaProfesorExterno set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
				select 
					PE.id, 
					PE.idGenero, 
					G.NOMBRE AS genero,
					PE.nombreCompleto, 
					PE.email, 
					PE.edad, 
					PE.estado
				from RHEPQ.capaProfesorExterno PE
				INNER JOIN RHEPQ.ADMGENERO G ON G.ID = PE.IDGENERO
				where PE.id = pId;
               
    elsif pOpcion = 5 then 
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.capaProfesorExterno
	    WHERE 
	    (
	        pNombreCompleto IS NULL
	        OR pNombreCompleto = ''
	        OR LOWER(nombreCompleto) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
	    );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	    
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT 
		                id, 
		                idGenero, 
		                nombreCompleto, 
		                email, 
		                edad, 
		                estado
		            FROM RHEPQ.capaProfesorExterno
		            WHERE
		            (
		                pNombreCompleto IS NULL
		                OR pNombreCompleto = ''
		                OR LOWER(nombreCompleto) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
		            )
		            ORDER BY nombreCompleto
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;

           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaProfesorExterno;

-- Salon 

CREATE OR REPLACE procedure RHEPQ.spCapaSalon(
    pOpcion IN number,
    pId IN OUT number,
    pNombre IN varchar2 default null,
    pNumero IN number,
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
        insert into RHEPQ.capaSalon values(null, pNombre, pNumero, pEstado, SYSDATE ,pUsuario, NULL, null)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaSalon set nombre = pNombre, numero = pNumero, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaSalon set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select id, nombre, numero, estado
                from RHEPQ.capaSalon where id = pId;
               
    elsif pOpcion = 5 then 
            SELECT COUNT(*) INTO vContador FROM RHEPQ.capaSalon;
           
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                id, 
			                nombre, 
			                numero, 
			                estado
			            FROM RHEPQ.capaSalon
			            WHERE (pNombre IS NULL OR pNombre = '' OR LOWER(nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%')
			            ORDER BY nombre
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombre as label
            from RHEPQ.capaSalon;
    END IF;
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaSalon;

-- SALON CAPACITACION

CREATE OR REPLACE procedure RHEPQ.spCapaSalonCapacitacion(
    pOpcion IN number,
    pId IN OUT number,
    pIdSalon IN number,
    pIdCapacitacion IN number,
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
        insert into RHEPQ.capaSalonCapacitacion 
        (id, idSalon, idCapacitacion, estado, creado, creadoPor)
        values 
        (CAPASALONCAPACITACIONSEQ.NEXTVAL, pIdSalon, pIdCapacitacion, pEstado, SYSDATE, pUsuario)        
    returning id into pId;
   
    elsif pOpcion = 2 then
        update RHEPQ.capaSalonCapacitacion set idSalon = pIdSalon, idCapacitacion = pIdCapacitacion, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaSalonCapacitacion set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    commit;
   
    end if;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select 
                	id, 
                	idSalon, 
                	idCapacitacion, 
                	estado
                from RHEPQ.capaSalonCapacitacion where id = pId;
               
   elsif pOpcion = 5 then 
	    SELECT COUNT(*) INTO vContador 
	   	FROM RHEPQ.capaSalonCapacitacion SC
	    INNER JOIN RHEPQ.CAPACAPACITACION C ON C.ID = SC.IDCAPACITACION 
	    INNER JOIN RHEPQ.CAPASALON S ON S.ID = SC.IDSALON
	   	WHERE SC.idCapacitacion = pIdCapacitacion;
	   
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    open pCursor for 
	    SELECT id, idSalon, salon, numSalon, idCapacitacion, descripcionCapacitacion, estado
	        FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT 
	                    SC.id, 
	                    SC.idSalon, 
	                    S.NOMBRE AS salon, 
	                    S.NUMERO  AS numSalon, 
	                    SC.idCapacitacion, 
	                    C.DESCRIPCION AS descripcionCapacitacion, 
	                    SC.estado
	                FROM RHEPQ.capaSalonCapacitacion SC
	                INNER JOIN RHEPQ.CAPACAPACITACION C ON C.ID = SC.IDCAPACITACION 
	                INNER JOIN RHEPQ.CAPASALON S ON S.ID = SC.IDSALON 
	                WHERE SC.idCapacitacion = pIdCapacitacion
	                ORDER BY SC.id
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	    WHERE rnum > (pPageNumber - 1) * pPageSize;
	   
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaSalonCapacitacion;

-- Tipo Capacitacion

CREATE OR REPLACE procedure RHEPQ.spCapaTipoCapacitacion(
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
        insert into RHEPQ.capaTipoCapacitacion values(null, pNombre, pEstado, SYSDATE ,pUsuario, NULL, null)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaTipoCapacitacion set nombre = pNombre, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaTipoCapacitacion set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select id, nombre, estado
                from RHEPQ.capaTipoCapacitacion where id = pId;
               
    elsif pOpcion = 5 then 
	    -- Contar los registros filtrados por nombre, si se proporciona
	    SELECT COUNT(*) INTO vContador
	    FROM RHEPQ.capaTipoCapacitacion
	    WHERE 
	    (
	        pNombre IS NULL
	        OR pNombre = ''
	        OR LOWER(nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%'
	    );
	
		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);
	
	    -- Abrir el cursor para obtener los resultados paginados y filtrados
	    OPEN pCursor FOR
	        SELECT id, nombre, estado
	        FROM (
	            SELECT a.*, ROWNUM rnum
	            FROM (
	                SELECT id, nombre, estado
	                FROM RHEPQ.capaTipoCapacitacion
	                WHERE
	                (
	                    pNombre IS NULL
	                    OR pNombre = ''
	                    OR LOWER(nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%'
	                )
	                ORDER BY nombre
	            ) a
	            WHERE ROWNUM <= pPageNumber * pPageSize
	        )
	        WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombre as label
            from RHEPQ.capaTipoCapacitacion;
    END IF;
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaTipoCapacitacion;

-- Tipo Documento

CREATE OR REPLACE procedure RHEPQ.spCapaTipoDocumento(
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
        insert into RHEPQ.capaTipoDocumento 
        values(null, pNombre, pEstado, SYSDATE ,pUsuario, NULL, null)
        returning id into pId;
       
    elsif pOpcion = 2 then
        update RHEPQ.capaTipoDocumento set nombre = pNombre, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    elsif pOpcion = 3 then 
        update RHEPQ.capaTipoDocumento set estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario where id = pId;
       
    end if;
   
    commit;

    IF pOpcion IN (1,2,3,4) then 
            open pCursor for 
                select id, nombre, estado
                from RHEPQ.capaTipoDocumento where id = pId;
               
    elsif pOpcion = 5 then 
           SELECT COUNT(*) INTO vContador 
	       FROM RHEPQ.capaTipoDocumento
	       WHERE (pNombre IS NULL OR pNombre = '' OR LOWER(nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%');
           
    		-- Asignar la cantidad total de páginas
			pTotalPage := vContador;
			--pTotalPage := CEIL(vContador / pPageSize);

			OPEN pCursor FOR
			    SELECT * FROM (
			        SELECT a.*, ROWNUM rnum
			        FROM (
			            SELECT 
			                id, 
			                nombre, 
			                estado
			            FROM RHEPQ.capaTipoDocumento
			            WHERE (pNombre IS NULL OR pNombre = '' OR LOWER(nombre) LIKE '%' || LOWER(TRIM(pNombre)) || '%')
			            ORDER BY nombre
			        ) a
			        WHERE ROWNUM <= pPageNumber * pPageSize
			    )
			    WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    elsif pOpcion = 6 then
            open pCursor for 
            select id as value, nombre as label
            from RHEPQ.capaTipoDocumento;
           
    END IF;
   
    exception
        when others then 
            rollback to transact;
            raise;
END spCapaTipoDocumento;

-- Curso Profesor

CREATE OR REPLACE PROCEDURE RHEPQ.spCapaCursoProfesor(
    pOpcion IN number,
    pId IN OUT number,
    pIdPersona IN number,
    pIdCurso IN number,
    pNombreCompleto VARCHAR2,
    pEstado IN number DEFAULT 1,
    pUsuario IN number,
    pPageNumber IN NUMBER DEFAULT 1,
    pPageSize IN NUMBER DEFAULT 10,
    pCursor OUT SYS_REFCURSOR,
    pTotalPage OUT number
) AS
    vContador NUMBER;
BEGIN
    --start transaction
    SAVEPOINT transact;

    IF pOpcion = 1 THEN
        INSERT INTO RHEPQ.capaCursoProfesor
        (id, idPersona, codCia, idCurso, estado, creado, creadoPor)
        VALUES
        (RHEPQ.capaCursoProfesorSeq.NEXTVAL, pIdPersona, '001', pIdCurso, pEstado, SYSDATE, pUsuario)
        RETURNING id INTO pId;

    ELSIF pOpcion = 2 THEN
        UPDATE RHEPQ.capaCursoProfesor
        SET idCurso = pIdCurso, idPersona = pIdPersona, codCia = '001', actualizado = SYSDATE, actualizadoPor = pUsuario
        WHERE id = pId;

    ELSIF pOpcion = 3 THEN
        UPDATE RHEPQ.capaCursoProfesor
        SET estado = pEstado, actualizado = SYSDATE, actualizadoPor = pUsuario
        WHERE id = pId;

    END IF;

    COMMIT;

    IF pOpcion IN (1, 2, 3, 4) THEN
        OPEN pCursor FOR
			 SELECT
			    CP.id,
			    CP.idPersona,
			    ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(CP.idPersona) AS nombreCompleto,
			    CP.codCia,
			    CP.idCurso,
			    C.NOMBRE AS nombreCurso,
			    CP.estado
			FROM RHEPQ.capaCursoProfesor CP
			INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO = CP.idPersona AND P.EMP_CODCIA = CP.codCia
			INNER JOIN RHEPQ.capaCurso C ON C.ID = CP.idCurso
            WHERE CP.id = pId;

    ELSIF pOpcion = 5 THEN
        SELECT COUNT(*) INTO vContador 
        FROM RHEPQ.capaCursoProfesor CP
		INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO = CP.idPersona AND P.EMP_CODCIA = CP.codCia
		INNER JOIN RHEPQ.capaCurso C ON C.ID = CP.idCurso
		WHERE P.EMP_CODCIA = '001' AND CP.idCurso = pIdCurso            
		AND (
            pNombreCompleto IS NULL
            OR pNombreCompleto = ''
            OR LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(CP.idPersona)) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
        );

		-- Asignar la cantidad total de páginas
		pTotalPage := vContador;
		--pTotalPage := CEIL(vContador / pPageSize);

		OPEN pCursor FOR
		    SELECT * FROM (
		        SELECT a.*, ROWNUM rnum
		        FROM (
		            SELECT
		                CP.id,
		                CP.idPersona,
		                ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(CP.idPersona) AS nombreCompleto,
		                CP.codCia,
		                CP.idCurso,
		                C.NOMBRE AS nombreCurso,
		                CP.estado
		            FROM RHEPQ.capaCursoProfesor CP
		            INNER JOIN RHEPQ.PLA_EMP_EMPLEADO P ON P.EMP_CODIGO = CP.idPersona AND P.EMP_CODCIA = CP.codCia
		            INNER JOIN RHEPQ.capaCurso C ON C.ID = CP.idCurso
		            WHERE P.EMP_CODCIA = '001' AND CP.idCurso = pIdCurso
		            AND (
		                pNombreCompleto IS NULL
		                OR pNombreCompleto = ''
		                OR LOWER(ISYSEPQ.GETNOMBRECOMPLETOEMPLEADO(CP.idPersona)) LIKE '%' || LOWER(TRIM(pNombreCompleto)) || '%'
		            )
		            ORDER BY CP.id DESC
		        ) a
		        WHERE ROWNUM <= pPageNumber * pPageSize
		    )
		    WHERE rnum > (pPageNumber - 1) * pPageSize;
           
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO transact;
        RAISE;
END spCapaCursoProfesor;