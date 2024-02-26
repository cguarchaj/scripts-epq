--CAPACITACIONES----------------------------------------------
-- TABLA
	create table RHEPQ.capaCurso(
		id 							number(10,0) primary key,
		nombre  					VARCHAR2(150),
		descripcion 				varchar2(150),
		duracion 					TIMESTAMP,
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaCursoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCurso
	before insert on RHEPQ.capaCurso
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaCursoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaTipoDocumento(
		id 							number(10,0) primary key,
		nombre  					VARCHAR2(150),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaTipoDocumentoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCapaTipoDocumento
	before insert on RHEPQ.capaTipoDocumento
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaTipoDocumentoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaDocumento(
		id 							number(10,0) primary key,
		idTipoDocumento 			number(10,0),
		nombre  					VARCHAR2(150),
		archivo 					VARCHAR2(255),
		descripcion 				VARCHAR2(255),
		extension 					VARCHAR2(255),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),
		
		CONSTRAINT fkDocumento FOREIGN KEY (idTipoDocumento) references RHEPQ.capaTipoDocumento(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaDocumentoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCapaDocumento
	before insert on RHEPQ.capaDocumento
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaDocumentoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaFirma(
		id 							number(10,0) primary key,
		descripcion 				VARCHAR2(200),
		archivo  					VARCHAR2(150),
		extension 					VARCHAR2(10),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaFirmaSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCapaFirma
	before insert on RHEPQ.capaFirma
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaFirmaSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaFirmaDocumento(
		id 							number(10,0) primary key,
		idDocumento  				number(10,0),
		idFirma  					number(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkFirm FOREIGN KEY (idDocumento) references RHEPQ.capaDocumento(id),
		constraint fkFirm2 FOREIGN KEY (idFirma) references RHEPQ.capaFirma(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaFirmaDocumentoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCapaFirmaDocumento
	before insert on RHEPQ.capaFirmaDocumento
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaFirmaDocumentoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaCursoDocumento(
		id 							number(10,0) primary key,
		idCurso   					NUMBER(10,0),
		idDocumento 				NUMBER(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkCursoDoc FOREIGN KEY (idCurso) references RHEPQ.capaCurso(id),
		constraint fkCursoDoc2 FOREIGN KEY (idDocumento) references RHEPQ.capaDocumento(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaCursoDocumentoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCursoDocumento
	before insert on RHEPQ.capaCursoDocumento
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaCursoDocumentoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaCursoProfesor(
		id 							number(10,0) primary key,
		idPersona 					number(10,0),
		codCia						VARCHAR2(50),
		idCurso 					number(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkCurProf FOREIGN KEY (idPersona, codCia) references RHEPQ.PLA_EMP_EMPLEADO(EMP_CODIGO, EMP_CODCIA),
		constraint fkCurProf2 FOREIGN KEY (idCurso) references RHEPQ.capaCurso(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaCursoProfesorSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCursoProfesor
	before insert on RHEPQ.capaCursoProfesor
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaCursoProfesorSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- 	TABLA

CREATE TABLE RHEPQ.ADMGENERO (
	ID NUMBER(10,0),
	NOMBRE VARCHAR2(45),	
	ESTADO NUMBER(10,0) DEFAULT 1 ,
	CREADO DATE DEFAULT sysdate ,
	CREADOPOR NUMBER(10,0),
	ACTUALIZADO DATE,
	ACTUALIZADOPOR NUMBER(10,0),
	CONSTRAINT SYS_C009225 PRIMARY KEY (ID)
);

-- SECUENCIA
CREATE SEQUENCE RHEPQ.ADMGENEROSEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999 NOCYCLE CACHE 20 NOORDER

-- TABLA
	create table RHEPQ.capaProfesorExterno(
		id 							number(10,0) primary key,
		idGenero 					number(10,0),
		nombreCompleto				VARCHAR2(150),
		email 						VARCHAR2(220),
		edad 						NUMBER(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkProfExt FOREIGN KEY (idGenero) references RHEPQ.ADMGENERO(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaProfesorExternoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trProfesorExterno
	before insert on RHEPQ.capaProfesorExterno
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaProfesorExternoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaCursoProfesorExterno(
		id 							number(10,0) primary key,
		idProfesorExterno			number(10,0),
		idCurso 					number(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkCurExt FOREIGN KEY (idProfesorExterno) references RHEPQ.capaProfesorExterno(id),
		constraint fkCurExt2 FOREIGN KEY (idCurso) references RHEPQ.capaCurso(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaCursoProfesorExternoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCursoProfesorExterno
	before insert on RHEPQ.capaCursoProfesorExterno
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaCursoProfesorExternoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaTipoCapacitacion(
		id 							number(10,0) primary key,
		nombre  					VARCHAR2(150),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaTipoCapacitacionSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trTipoCapacitacion
	before insert on RHEPQ.capaTipoCapacitacion
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaTipoCapacitacionSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaCapacitacion(
		id 							number(10,0) primary key,
		idCurso 					number(10,0),
		idTipoCapacitacion 			number(10,0),
		descripcion  				VARCHAR2(150),
		fechaHoraInicial 			DATE,
		fechaHoraFinal 				DATE,
		url 						varchar2(250),
		ubicacion 					varchar2(250),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),
		
		constraint fkCapa FOREIGN key (idCurso) references RHEPQ.capaCurso(id),
		constraint fkCapa2 FOREIGN key (idTipoCapacitacion) references RHEPQ.capaTipoCapacitacion(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaCapacitacionSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trCapacitacion
	before insert on RHEPQ.capaCapacitacion
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaCapacitacionSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaSalon(
		id 							number(10,0) primary key,
		nombre  					VARCHAR2(150),
		numero 						NUMBER(10,2),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaSalonSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trSalon
	before insert on RHEPQ.capaSalon
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaSalonSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaSalonCapacitacion(
		id 							number(10,0) primary key,
		idSalon 					NUMBER(10,0),
		idCapacitacion 				NUMBER(10,0),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		constraint fkSalonCap FOREIGN KEY (idSalon) references RHEPQ.capaSalon(id),
		constraint fkSalonCap2 FOREIGN KEY (idCapacitacion) references RHEPQ.capaCapacitacion(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaSalonCapacitacionSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trSalonCapacitacion
	before insert on RHEPQ.capaSalonCapacitacion
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaSalonCapacitacionSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaDetalleCapacitacionExterno(
		id 							number(10,0) primary key,
		idCapacitacion 				number(10,0),
		idGenero 					NUMBER(10,0),
		nombreCompleto 				varchar2(150),
		email 						VARCHAR2(100),
		edad 						number(10,0),
		dpi 						VARCHAr2(13),
		empresa 					VARCHAR2(150),
		alergico 					VARCHAR2(100),
		telefono 					VARCHAR2(50),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),

		CONSTRAINT fkCapDetalle FOREIGN KEY (idCapacitacion) references RHEPQ.capaCapacitacion(id),
		CONSTRAINT fkCapDetalle2 FOREIGN KEY (idGenero) REFERENCES RHEPQ.admgenero(id)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaDetalleCapaExternoSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trDetalleCapacitacionExterno
	before insert on RHEPQ.capaDetalleCapacitacionExterno
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaDetalleCapaExternoSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--

-- TABLA
	create table RHEPQ.capaDetalleCapacitacion(
		id 							number(10,0) primary key,
		idCapacitacion 				number(10,0),
		idPersona 					number(10,0),
		codCia						VARCHAR2(50),
		estado 						number(10,0) default 1 not null,
		creado 						date default sysdate not null,
		creadoPor 					number(10,0),
		actualizado 				date,
		actualizadoPor 				number(10,0),
		
		constraint fkDetalle FOREIGN key (idCapacitacion) references RHEPQ.capaCapacitacion(id),
		constraint fkDetalle2 FOREIGN KEY (idPersona, codCia) references RHEPQ.PLA_EMP_EMPLEADO(EMP_CODIGO, EMP_CODCIA)
	);

--secuencia
	CREATE SEQUENCE RHEPQ.capaDetalleCapacitacionSeq
	    START WITH 1
	    INCREMENT BY 1
	    MINVALUE 1
	    MAXVALUE 9999999999
	    CACHE 20
	    NOCYCLE
	    NOORDER;

--trigger
	create or replace trigger RHEPQ.trDetalleCapacitacion
	before insert on RHEPQ.capaDetalleCapacitacion
	for each row 
	begin
		if :new.id is null then
			select RHEPQ.capaDetalleCapacitacionSeq.NEXTVAL
			into :new.id
			from dual;
		end if;
	end;
--


-- TABLA

