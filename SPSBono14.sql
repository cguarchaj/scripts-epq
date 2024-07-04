CREATE OR REPLACE PROCEDURE RHEPQ.INSERTA_DESCUENTO_BONO_14(
   pCOMPANIA    IN VARCHAR2,
   pCODTPL      IN VARCHAR2,
   pCODPLA      IN NUMBER,
   pCODEMP      IN NUMBER,
   pCODTDC      IN VARCHAR2,
   pVALOR       IN NUMBER,
   pVALOR_PAT   IN VARCHAR2 DEFAULT NULL,
   pPPR_N1      IN NUMBER,
   pPPR_N2      IN NUMBER,
   pPPR_N3      IN NUMBER,
   pPPR_N4      IN NUMBER,
   pPPR_N5      IN NUMBER,
   pPPR_N6      IN NUMBER,
   pPPR_N7      IN NUMBER,
   pPPR_N8      IN NUMBER,
   pCODTPP      IN CHAR,
   pCODPUE      IN NUMBER,
   pFORMA_PAGO  IN CHAR,
   pCODGER      IN NUMBER,
   pCODUNI      IN NUMBER,
   pCODPLZ      IN NUMBER,
   pNOMPLZ      IN VARCHAR2,
   pNOMUNI      IN VARCHAR2,
   pCOD2003     IN VARCHAR2 DEFAULT NULL,
   pRowsAffected OUT NUMBER
) IS
BEGIN
   IF NVL(pVALOR, 0) <> 0 OR NVL(pVALOR_PAT, 0) <> 0 THEN
      INSERT INTO RHEPQ.PLA_DSS_DESCUENTOS (
         DSS_CODCIA,
         DSS_CODTPL,
         DSS_CODPLA,
         DSS_CODEMP,
         DSS_CODTDC,
         DSS_VALOR,
         DSS_VALOR_PAT,
         DSS_PPR_N1,
         DSS_PPR_N2,
         DSS_PPR_N3,
         DSS_PPR_N4,
         DSS_PPR_N5,
         DSS_PPR_N6,
         DSS_PPR_N7,
         DSS_PPR_N8,
         DSS_CODTPP,
         DSS_CODPUE,
         DSS_FORMA_PAGO,
         DSS_CODGER,
         DSS_CODUNI,
         DSS_CODPLZ,
         DSS_NOMPLZ,
         DSS_NOMUNI,
         DSS_CODIGO_2003
      ) VALUES (
         pCOMPANIA,
         pCODTPL,
         pCODPLA,
         pCODEMP,
         pCODTDC,
         pVALOR,
         pVALOR_PAT,
         pPPR_N1,
         pPPR_N2,
         pPPR_N3,
         pPPR_N4,
         pPPR_N5,
         pPPR_N6,
         pPPR_N7,
         pPPR_N8,
         pCODTPP,
         pCODPUE,
         pFORMA_PAGO,
         pCODGER,
         pCODUNI,
         pCODPLZ,
         pNOMPLZ,
         pNOMUNI,
         pCOD2003
      );
   END IF;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      UPDATE RHEPQ.PLA_DSS_DESCUENTOS SET
         DSS_VALOR = NVL(DSS_VALOR, 0) + NVL(pVALOR, 0),
         DSS_VALOR_PAT = NVL(DSS_VALOR_PAT, 0) + NVL(pVALOR_PAT, 0)
      WHERE
         DSS_CODCIA = pCOMPANIA AND
         DSS_CODTPL = pCODTPL AND
         DSS_CODPLA = pCODPLA AND
         DSS_CODEMP = pCODEMP AND
         DSS_CODTDC = pCODTDC AND
         DSS_PPR_N1 = pPPR_N1 AND
         DSS_PPR_N2 = pPPR_N2 AND
         DSS_PPR_N3 = pPPR_N3 AND
         DSS_PPR_N4 = pPPR_N4 AND
         DSS_PPR_N5 = pPPR_N5 AND
         DSS_PPR_N6 = pPPR_N6 AND
         DSS_PPR_N7 = pPPR_N7 AND
         DSS_PPR_N8 = pPPR_N8 AND
         DSS_CODIGO_2003 = pCOD2003;

   WHEN OTHERS THEN
      RHEPQ.log_error('Inserta Descuento Bono 14', 'Error inesperado: ' || SQLERRM);
END INSERTA_DESCUENTO_BONO_14;

---------------------------------- #####

CREATE OR REPLACE PROCEDURE RHEPQ.CALCULA_DESC_JUDICIALES_BONO14 (
	pCODCIA IN VARCHAR2,
	pCODEMP IN NUMBER,
	pCODTDC IN CHAR,
	pPPR_N1 IN NUMBER,
	pPPR_N2 IN NUMBER,
	pPPR_N3 IN NUMBER,
	pPPR_N4 IN NUMBER,
	pPPR_N5 IN NUMBER,
	pPPR_N6 IN NUMBER,
	pPPR_N7 IN NUMBER,
	pPPR_N8 IN NUMBER,
	pCODTPP IN CHAR,
	pCODPUE IN NUMBER,
	pFORMA_PAGO IN CHAR,
	pCODGER IN VARCHAR2,
	pCODUNI IN NUMBER,
	pCODPLZ IN NUMBER,
	pNOMPLZ IN VARCHAR2,
	pNOMUNI IN VARCHAR2,
	pCOD2003 IN NUMBER,
	pCodTpl IN VARCHAR2,
	pCodPla IN VARCHAR2
) IS
	V_VALOR NUMBER(9, 2);
BEGIN
	V_VALOR := RHEPQ.DESCUENTO_JUDICIAL_BONO_14(pCODCIA, pCODEMP, pCodTpl, pCodPla, pPPR_N1, pPPR_N2,
									pPPR_N3, pPPR_N4, pPPR_N5, pPPR_N6, pPPR_N7, pPPR_N8);

	RHEPQ.INSERTA_DESCUENTO_BONO_14(pCODCIA, pCodTpl, pCodPla, pCODEMP, pCODTDC, V_VALOR, NULL,
	pPPR_N1, pPPR_N2, pPPR_N3, pPPR_N4, pPPR_N5, pPPR_N6, pPPR_N7, pPPR_N8,
	pCODTPP, pCODPUE, pFORMA_PAGO, pCODGER, pCODUNI, pCODPLZ, pNOMPLZ, pNOMUNI, pCOD2003);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RHEPQ.log_error('Calcula descuento judical bono 14', 'No data');
		NULL;
END CALCULA_DESC_JUDICIALES_BONO14;


--------------------------- ////////\

PROCEDURE GENERA_BONO14 IS
  --*****************************************************************
  --** Cursor para ir a traer los empleados para generar la nómina **
  --*****************************************************************
   		Cursor c_emp is
			Select Distinct bon_codcia, bon_codemp, bon_ppr_n2, bon_ppr_n3, bon_ppr_n4,
			       bon_ppr_n5, bon_ppr_n6, bon_ppr_n7, bon_ppr_n8, bon_forma_pago, bon_codger,
			       bon_coduni, bon_codplz, plz_nombre, uni_nombre,uni_codigo_2003
			  From Pla_Bon_Bono14 a,
			       Pla_Plz_Plaza b,
			       Pla_Uni_Unidad c
			 Where a.bon_codcia = b.plz_codcia
			   And a.bon_codplz = b.plz_codigo
			   And a.bon_codcia = c.uni_codcia
			   And a.bon_coduni = c.uni_codigo
			   And a.bon_codcia = :header.compania
			   And a.bon_codtpl = :b1.pla_codtpl
			   And a.bon_codpla = :b1.codigo
	   	 Group by bon_codcia, bon_codemp, bon_ppr_n2, bon_ppr_n3, bon_ppr_n4,
			          bon_ppr_n5, bon_ppr_n6, bon_ppr_n7, bon_ppr_n8, bon_forma_pago, bon_codger,
			          bon_coduni, bon_codplz, plz_nombre, uni_nombre,uni_codigo_2003
			  Order by bon_codcia, bon_codemp;

/* 		Select distinct bon_codcia, bon_codemp, /*bon_ppr_n1, bon_ppr_n2, bon_ppr_n3, bon_ppr_n4,
             bon_ppr_n5, bon_ppr_n6, bon_ppr_n7, bon_ppr_n8, bon_forma_pago, bon_codger,
             bon_coduni, bon_codplz, plz_nombre, uni_nombre,uni_codigo_2003
 			  From pla_bon_bono14,
 			     pla_plz_plaza,
 			     pla_uni_unidad
 			Where bon_codcia = :header.compania
     		and bon_codtpl = :b1.pla_codtpl
     		and bon_codpla = :b1.codigo
     		and plz_codcia = uni_codcia
     		and plz_coduni = uni_codigo
     		and bon_codcia = plz_codcia
     		and bon_codplz = plz_codigo
     		and bon_coduni = uni_codigo
     		and bon_codemp In (2429,2105,2193,2402)
 			Group by bon_codcia, bon_codemp, /*bon_ppr_n1, bon_ppr_n2, bon_ppr_n3, bon_ppr_n4,
               bon_ppr_n5, bon_ppr_n6, bon_ppr_n7, bon_ppr_n8, bon_forma_pago, bon_codger,
               bon_coduni, bon_codplz, plz_nombre, uni_nombre,uni_codigo_2003
 			Order by bon_codcia, bon_codemp;*/

   v_emp      c_emp%ROWTYPE;

   mov_bono    			VARCHAR2(2);  --* Codigo de Ingreso para Bono 14
   mov_descju       varchar2(2);  --* Codigo de Movimiento DESCUENTO JUDICIAL

   suma_devengado 	number;
   solo1de250       number;
   menos250         number;
   ttbon            number;
   conreg250        number;
   bono14           number;

Begin

		--*****************************
		--** Verificando Movimientos **
		--*****************************

  					trae_mov (:header.compania,  84, 'Ingreso por Bono 14',  mov_bono);
  					trae_mov (:header.compania, 21, 'Descuento Judic.', 		 mov_descju);

  	--**************************************
  	--** Genera el Maestro de la Planilla **
  	--**************************************

  						Insert into pla_pla_planilla
         						(pla_codcia, pla_codtpl, pla_codigo, pla_fecha_del,
          					pla_fecha_al, pla_estado, pla_autoriza, pla_usuario_crea,
          					pla_fecha_crea, pla_usuario_mod, pla_fecha_mod, pla_fecha_pago)
  						Values (:header.compania, :pla_codtpl, :codigo, :fecha_del, :fecha_al,
          						'G', null, substr(user,1,10), sysdate, null, null,
          					 :fecha_pago);

  --***************************************************************
  --** Loop para insertar los Ingresos y Descuentos por Empleado **
  --***************************************************************

  For v_emp in c_emp Loop

	      		:b1.mensaje := 'Procesando el empleado '||to_char(v_emp.bon_codemp,'00000');
  	    		SYNCHRONIZE;

			--************************
  		--* Inicializo Variables *
  	  --************************
  	  			suma_devengado := 0;
  	  			bono14 :=0;
    --***********************************************
  	--** verifica que solo una plaza tenga los 250 ** Fecha de modificacon 18-06-09
  	--***********************************************
     /* Select nvl(count(1),0)
       Into  solo1de250
      From  Pla_inn_ingresos
      Where  inn_codcia = :header.compania
       and   inn_codtpl = :b1.pla_codtpl
       and   inn_codpla = :b1.codigo
       and   inn_codemp = v_emp.bon_codemp;*/
       --and   inn_codger = v_emp.bon_codger
     	 --and   inn_codemp = v_emp.bon_coduni
     	 --and   inn_codplz = v_emp.bon_codplz;

      --*********************************
      --* Obtiene la suma del devengado *
      --*********************************

      			Select nvl(Sum(bon_valor),0)
      			Into suma_devengado
      			From pla_bon_bono14
			 			Where bon_codcia = :header.compania
     							and bon_codtpl = :b1.pla_codtpl
     							and bon_codpla = :b1.codigo
     							and bon_codemp = v_emp.bon_codemp
     						--	and bon_ppr_n1 = v_emp.bon_ppr_n1
     							and bon_ppr_n2 = v_emp.bon_ppr_n2
     							and bon_ppr_n3 = v_emp.bon_ppr_n3
     							and bon_ppr_n4 = v_emp.bon_ppr_n4
     							and bon_ppr_n5 = v_emp.bon_ppr_n5
     							and bon_ppr_n6 = v_emp.bon_ppr_n6
     							and bon_ppr_n7 = v_emp.bon_ppr_n7
     							and bon_ppr_n8 = v_emp.bon_ppr_n8
     							--and bon_codger = v_emp.bon_codger
     							--and bon_coduni = v_emp.bon_coduni
     							--and bon_codplz = v_emp.bon_codplz
     							and bon_forma_pago = v_emp.bon_forma_pago;


              /***** ESTO FORMULA ES PARA LAS PERSONAS QUE TIENEN CAMBIO DE PLAZA Y LE REGISTRAN DOS VECES 250 *****/

         --If solo1de250>=1 then
           --	bono14 := (NVL((SUMA_DEVENGADO/12),0)*1.22083)*1.25;  --- verifica que tenga los 250 ** Fecha de Modificacion 18-06-09
       --Else
			      bono14 := NVL((SUMA_DEVENGADO/12),0);
			  --End if;


/*      Select nvl(count(1),0)
       Into  conreg250
      From  Pla_inn_ingresos
      Where  inn_codcia = :header.compania
       and   inn_codtpl = :b1.pla_codtpl
       and   inn_codpla = :b1.codigo
       and   inn_codemp = v_emp.bon_codemp;

		Select count(bon_coduni) total, sum(count(bon_coduni))
		  Into menos250, ttbon
		  From pla_bon_bono14
		 Where bon_codcia = :header.compania
		   And bon_codtpl = :b1.pla_codtpl
		   And bon_codpla = :b1.codigo
		   And bon_codemp = v_emp.bon_codemp
		 group by bon_coduni;


				If menos250 = 2  and
					 conreg250 >=1 Then

							bono14  := Round(bono14+250,2);

			  End If;
*/

 	    --*********************************
	    --** Insertando Ingreso en Tabla **
	    --*********************************

      								inserta_ingreso (:header.compania, :b1.pla_codtpl, :b1.codigo,
                      							  v_emp.bon_codemp, mov_bono, round(bono14,2),
                       								to_number(to_char(sysdate,'YYYY')) /*v_emp.bon_ppr_n1*/,
                       								v_emp.bon_ppr_n2, v_emp.bon_ppr_n3,
                       								v_emp.bon_ppr_n4,v_emp.bon_ppr_n5, v_emp.bon_ppr_n6,
                       								v_emp.bon_ppr_n7, v_emp.bon_ppr_n8, Null, Null,
                       								v_emp.bon_forma_pago, v_emp.bon_codger,
                       								v_emp.bon_coduni, v_emp.bon_codplz,
                       								v_emp.plz_nombre, v_emp.uni_nombre, v_emp.uni_codigo_2003);

 	    --**********************************************       */\*
	    --** Calculo de Descuentos Judiciales **********			*/--\*
	    --**********************************************     */----\*

	    								CALCULA_DESC_JUDICIALES(:header.compania, v_emp.bon_codemp, mov_descju,
	    																		 	to_number(to_char(sysdate,'YYYY')) /*v_emp.bon_ppr_n1*/,
	    																			 v_emp.bon_ppr_n2,
	    																				v_emp.bon_ppr_n3, v_emp.bon_ppr_n4,
  	  																				v_emp.bon_ppr_n5, v_emp.bon_ppr_n6,
  	  																				v_emp.bon_ppr_n7, v_emp.bon_ppr_n8,
  	       																		Null, Null, v_emp.bon_forma_pago,
  	       																		v_emp.bon_codger,
  	       																		v_emp.bon_coduni, v_emp.bon_codplz,
                       												v_emp.plz_nombre, v_emp.uni_nombre, v_emp.uni_codigo_2003);

 End Loop;

End;