--------------------------------------------------------
-- Archivo creado  - martes-octubre-22-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type DIRECCION
--------------------------------------------------------

  CREATE OR REPLACE TYPE "HR"."DIRECCION" AS OBJECT(
calle VARCHAR2(50),
ciudad VARCHAR2(50),
cp VARCHAR2(50)
);

/
--------------------------------------------------------
--  DDL for Type LIBRO
--------------------------------------------------------

  CREATE OR REPLACE TYPE "HR"."LIBRO" AS OBJECT(
signatura NUMBER,
autor VARCHAR2(35),
titulo VARCHAR2(50),
editor VARCHAR2(50),
estado NUMBER,
clase NUMBER
);

/
--------------------------------------------------------
--  DDL for Type USUARIO
--------------------------------------------------------

  CREATE OR REPLACE TYPE "HR"."USUARIO" AS OBJECT(
n_carnet NUMBER,
nombre VARCHAR2(50),
direccion hr.DIRECCION,
penalizado NUMBER
);

/
--------------------------------------------------------
--  DDL for Sequence AUTO_INC_LIBRO
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."AUTO_INC_LIBRO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_INC_PRESTAMOS
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."AUTO_INC_PRESTAMOS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_INC_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."AUTO_INC_USUARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CLASE
--------------------------------------------------------

  CREATE TABLE "HR"."CLASE" 
   (	"CLAVE" NUMBER, 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"TIEMPO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LIBROS
--------------------------------------------------------

  CREATE TABLE "HR"."LIBROS" OF "HR"."LIBRO" 
 OIDINDEX  ( PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ) 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRESTAMOS
--------------------------------------------------------

  CREATE TABLE "HR"."PRESTAMOS" 
   (	"N_PRESTAMO" NUMBER, 
	"USUARIO" REF "HR"."USUARIO" , 
	"LIBRO" REF "HR"."LIBRO" , 
	"FECHA_INICIO" DATE, 
	"FECHA_DEVOLUCION" DATE, 
	"FECHA_FIN" DATE, 
	SCOPE FOR ("USUARIO") IS "HR"."USUARIOS" , 
	SCOPE FOR ("LIBRO") IS "HR"."LIBROS" 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USUARIOS
--------------------------------------------------------

  CREATE TABLE "HR"."USUARIOS" OF "HR"."USUARIO" 
 OIDINDEX  ( PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ) 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
REM INSERTING into HR.CLASE
SET DEFINE OFF;
REM INSERTING into HR.LIBROS
SET DEFINE OFF;
Insert into HR.LIBROS (SIGNATURA,AUTOR,TITULO,EDITOR,ESTADO,CLASE) values ('22','Autor','Titulo ','Editor','0','12');
Insert into HR.LIBROS (SIGNATURA,AUTOR,TITULO,EDITOR,ESTADO,CLASE) values ('24','Autor','Titulo ','Editor','0','1');
Insert into HR.LIBROS (SIGNATURA,AUTOR,TITULO,EDITOR,ESTADO,CLASE) values ('25','Autor3','Titulo 3','Editor3','0','5');
Insert into HR.LIBROS (SIGNATURA,AUTOR,TITULO,EDITOR,ESTADO,CLASE) values ('21','Autor','Titulo ','Editor','0','0');
Insert into HR.LIBROS (SIGNATURA,AUTOR,TITULO,EDITOR,ESTADO,CLASE) values ('23','Coelho','Libro nuevo','Su editor','0','0');
REM INSERTING into HR.PRESTAMOS
SET DEFINE OFF;
Insert into HR.PRESTAMOS (N_PRESTAMO,USUARIO,LIBRO,FECHA_INICIO,FECHA_DEVOLUCION,FECHA_FIN) values ('12','HR.USUARIO(26,''Nombre edir'',HR.DIRECCION(''Calleedit'',''Ciudadedir'',''15''),0)','HR.LIBRO(22,''Autor'',''Titulo '',''Editor'',0,12)',to_date('22/10/19','DD/MM/RR'),to_date('25/10/19','DD/MM/RR'),to_date('22/10/19','DD/MM/RR'));
Insert into HR.PRESTAMOS (N_PRESTAMO,USUARIO,LIBRO,FECHA_INICIO,FECHA_DEVOLUCION,FECHA_FIN) values ('6','HR.USUARIO(21,''Nombre '',HR.DIRECCION(''Calle'',''seasd'',''1''),0)','HR.LIBRO(21,''Autor'',''Titulo '',''Editor'',0,0)',to_date('22/10/19','DD/MM/RR'),to_date('25/10/19','DD/MM/RR'),to_date('22/10/19','DD/MM/RR'));
Insert into HR.PRESTAMOS (N_PRESTAMO,USUARIO,LIBRO,FECHA_INICIO,FECHA_DEVOLUCION,FECHA_FIN) values ('7','HR.USUARIO(21,''Nombre '',HR.DIRECCION(''Calle'',''seasd'',''1''),0)','HR.LIBRO(25,''Autor3'',''Titulo 3'',''Editor3'',0,5)',to_date('22/10/19','DD/MM/RR'),to_date('22/10/19','DD/MM/RR'),to_date('11/12/19','DD/MM/RR'));
Insert into HR.PRESTAMOS (N_PRESTAMO,USUARIO,LIBRO,FECHA_INICIO,FECHA_DEVOLUCION,FECHA_FIN) values ('8','HR.USUARIO(21,''Nombre '',HR.DIRECCION(''Calle'',''seasd'',''1''),0)','HR.LIBRO(25,''Autor3'',''Titulo 3'',''Editor3'',0,5)',to_date('22/10/19','DD/MM/RR'),null,to_date('11/12/19','DD/MM/RR'));
Insert into HR.PRESTAMOS (N_PRESTAMO,USUARIO,LIBRO,FECHA_INICIO,FECHA_DEVOLUCION,FECHA_FIN) values ('3','HR.USUARIO(1,''Pepelu'',HR.DIRECCION(''cipote'',''sev'',''as''),0)','HR.LIBRO(21,''Autor'',''Titulo '',''Editor'',0,0)',to_date('22/10/19','DD/MM/RR'),null,to_date('22/10/19','DD/MM/RR'));
REM INSERTING into HR.USUARIOS
SET DEFINE OFF;
Insert into HR.USUARIOS (N_CARNET,NOMBRE,DIRECCION,PENALIZADO) values ('21','Nombre ',HR.DIRECCION('Calle','seasd','1'),'0');
Insert into HR.USUARIOS (N_CARNET,NOMBRE,DIRECCION,PENALIZADO) values ('26','Nombre edir',HR.DIRECCION('Calleedit','Ciudadedir','15'),'0');
Insert into HR.USUARIOS (N_CARNET,NOMBRE,DIRECCION,PENALIZADO) values ('1','Pepelu',HR.DIRECCION('cipote','sev','as'),'0');
--------------------------------------------------------
--  Constraints for Table PRESTAMOS
--------------------------------------------------------

  ALTER TABLE "HR"."PRESTAMOS" ADD PRIMARY KEY ("N_PRESTAMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIBROS
--------------------------------------------------------

  ALTER TABLE "HR"."LIBROS" ADD UNIQUE ("SYS_NC_OID$")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."LIBROS" ADD PRIMARY KEY ("SIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIOS
--------------------------------------------------------

  ALTER TABLE "HR"."USUARIOS" ADD UNIQUE ("SYS_NC_OID$")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."USUARIOS" ADD PRIMARY KEY ("N_CARNET")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  DDL for Function GET_EMPLOYEE_SALARY
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HR"."GET_EMPLOYEE_SALARY" ( p_emp_id IN employees.employee_id%TYPE )
    RETURN employees.salary%TYPE
  AS
    v_monthly_salary employees.salary%TYPE;
  BEGIN
    --Ejecuta un select para obtener el salario actual para 
    --el id_empleado proporcionado
    SELECT NVL(salary, -999)
    INTO v_monthly_salary
    FROM employees
    WHERE
      employee_id = p_emp_id;
      
    RETURN v_monthly_salary;
  END;

/
--------------------------------------------------------
--  DDL for Package FETCH_LIBROS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."FETCH_LIBROS" 
AS
  TYPE cursor_ssgb_libro IS REF CURSOR;
  PROCEDURE get_libros(lista_libros OUT cursor_ssgb_libro);
END;

/
--------------------------------------------------------
--  DDL for Package FETCH_PRESTAMOS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."FETCH_PRESTAMOS" 
AS
  TYPE cursor_ssgb_prestamo IS REF CURSOR;
  PROCEDURE get_prestamos(lista_prestamos OUT cursor_ssgb_prestamo);
END;

/
--------------------------------------------------------
--  DDL for Package FETCH_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."FETCH_USUARIOS" 
AS
  TYPE cursor_ssgb IS REF CURSOR;
  PROCEDURE get_usuarios(lista_usuarios OUT cursor_ssgb);
END;

/
--------------------------------------------------------
--  DDL for Package REF_CURSOR_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."REF_CURSOR_PACKAGE" 
AS

    TYPE t_ref_cursor IS REF CURSOR;
    FUNCTION get_dept_ref_cursor(p_dept_id INTEGER) RETURN t_ref_cursor;

END;

/
--------------------------------------------------------
--  DDL for Package Body FETCH_LIBROS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."FETCH_LIBROS" 
IS
 PROCEDURE get_libros(lista_libros OUT cursor_ssgb_libro) IS
 BEGIN
  OPEN lista_libros FOR
  SELECT signatura, autor, titulo, editor, estado,clase FROM LIBROS l;
  END;
END;

/
--------------------------------------------------------
--  DDL for Package Body FETCH_PRESTAMOS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."FETCH_PRESTAMOS" 
IS
 PROCEDURE get_prestamos(lista_prestamos OUT cursor_ssgb_prestamo) IS
 BEGIN
  OPEN lista_prestamos FOR
  SELECT n_prestamo, p.usuario.nombre,p.usuario.n_carnet, p.libro.titulo,p.libro.signatura, fecha_inicio, fecha_devolucion,fecha_fin FROM prestamos p;
  END;
END;

/
--------------------------------------------------------
--  DDL for Package Body FETCH_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."FETCH_USUARIOS" 
IS
 PROCEDURE get_usuarios(lista_usuarios OUT cursor_ssgb) IS
 BEGIN
  OPEN lista_usuarios FOR
  SELECT n_carnet, nombre, u.direccion.calle, u.direccion.ciudad, u.direccion.cp, penalizado FROM USUARIOS u;
  END;
END;

/
--------------------------------------------------------
--  DDL for Package Body RED_CURSOR_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."RED_CURSOR_PACKAGE" 
AS
    FUNCTION get_dept_ref_cursor (p_dept_id INTEGER)
        RETURN t_ref_cursor IS

        dept_ref_cursor t_ref_cursor;

    BEGIN      
        OPEN dept_ref_cursor FOR
            SELECT department_id, department_name, location_id
            FROM   departments
            WHERE  department_id > p_dept_id
            ORDER BY department_id;

        RETURN dept_ref_cursor;

    END get_dept_ref_cursor;

END ref_cursor_package;

/
--------------------------------------------------------
--  DDL for Package Body REF_CURSOR_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."REF_CURSOR_PACKAGE" 
AS
    FUNCTION get_dept_ref_cursor (p_dept_id INTEGER)
        RETURN t_ref_cursor IS

        dept_ref_cursor t_ref_cursor;

    BEGIN      
        OPEN dept_ref_cursor FOR
            SELECT department_id, department_name, location_id
            FROM   departments
            WHERE  department_id > p_dept_id
            ORDER BY department_id;

        RETURN dept_ref_cursor;

    END get_dept_ref_cursor;

END ref_cursor_package;

/
--------------------------------------------------------
--  DDL for Procedure CASTIGAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."CASTIGAR_USUARIO" (
      n_carnet1  IN USUARIOS.N_CARNET%TYPE) IS
BEGIN
    UPDATE USUARIOS u SET u.penalizado=1 WHERE u.n_carnet=n_carnet1;
END;

/
--------------------------------------------------------
--  DDL for Procedure DEVOLVER_LIBRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."DEVOLVER_LIBRO" (
          n_prestamo1 IN LIBROS.SIGNATURA%TYPE,
          f_devol IN PRESTAMOS.FECHA_DEVOLUCION%TYPE
) IS
f_fin DATE;
BEGIN
SELECT p.FECHA_FIN INTO f_fin FROM PRESTAMOS p WHERE n_prestamo=n_prestamo1;
    UPDATE LIBROS l SET l.estado=0 WHERE l.signatura=(SELECT DEREF(LIBRO).SIGNATURA FROM PRESTAMOS WHERE N_PRESTAMO=n_prestamo1);
    UPDATE PRESTAMOS p SET p.FECHA_DEVOLUCION = f_devol WHERE n_prestamo=n_prestamo1;
    IF f_devol> f_fin
    THEN
    UPDATE USUARIOS u SET u.penalizado=1 WHERE u.n_carnet=(select DEREF(USUARIO).N_CARNET from PRESTAMOS p WHERE n_prestamo=n_prestamo1);
    END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDITAR_LIBRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."EDITAR_LIBRO" (
      signatura1 IN LIBROS.SIGNATURA%TYPE,
      autor1 IN LIBROS.AUTOR%TYPE,
      titulo1 IN LIBROS.TITULO%TYPE,
      editor1 IN LIBROS.EDITOR%TYPE,
      clase1 IN LIBROS.CLASE%TYPE
) IS
BEGIN
    UPDATE LIBROS l SET l.autor = autor1, l.titulo=titulo1,l.editor =editor1, l.clase=clase1 WHERE l.signatura=signatura1;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDITAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."EDITAR_USUARIO" (
      n_carnet1  IN USUARIOS.N_CARNET%TYPE,
      nombre1 IN USUARIOS.NOMBRE%TYPE,
      calle1 IN USUARIOS.DIRECCION.calle%TYPE,
      ciudad1 IN USUARIOS.DIRECCION.ciudad%TYPE,
      cp1 IN USUARIOS.DIRECCION.cp%TYPE,
      penalizado1 IN USUARIOS.PENALIZADO%TYPE
) IS
BEGIN
    UPDATE USUARIOS u SET u.nombre = nombre1, u.direccion.calle = calle1, u.direccion.ciudad=ciudad1, u.direccion.cp=cp1,u.penalizado=penalizado1 WHERE u.n_carnet=n_carnet1;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_LIBRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ELIMINAR_LIBRO" (
      signatura1  IN LIBROS.SIGNATURA%TYPE) IS
BEGIN
DELETE PRESTAMOS p WHERE DEREF(LIBRO).signatura =signatura1;
    DELETE LIBROS l WHERE l.signatura=signatura1;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ELIMINAR_USUARIO" (
      n_carnet1  IN USUARIOS.N_CARNET%TYPE) IS
BEGIN
DELETE PRESTAMOS p WHERE DEREF(USUARIO).n_carnet = n_carnet1;
    DELETE USUARIOS u WHERE u.n_carnet=n_carnet1;
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTAR_LIBRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTAR_LIBRO" (
      autor IN LIBROS.AUTOR%TYPE,
      titulo IN LIBROS.TITULO%TYPE,
      editor IN LIBROS.EDITOR%TYPE,
      estado IN LIBROS.ESTADO%TYPE,
      clase IN LIBROS.CLASE%TYPE
) IS
BEGIN
    INSERT INTO LIBROS VALUES(auto_inc_libro.nextval,autor,titulo,editor,estado, clase);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTAR_PRESTAMO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTAR_PRESTAMO" (
      n_carnet1 IN USUARIOS.N_CARNET%TYPE,
      signatura1 IN LIBROS.SIGNATURA%TYPE,
      f_inicio IN DATE,
      puede_prestar OUT NUMBER
) IS
disponible NUMBER;
penalizado1 NUMBER;
BEGIN
    SELECT l.estado into disponible FROM LIBROS l WHERE signatura=signatura1;
    SELECT u.penalizado into penalizado1 FROM USUARIOS u WHERE n_carnet=n_carnet1;
IF disponible=1 AND penalizado1=0 THEN
    puede_prestar:=1;
    INSERT INTO PRESTAMOS (n_prestamo,USUARIO,LIBRO,fecha_inicio,fecha_devolucion,fecha_fin) SELECT auto_inc_prestamos.nextval, REF(u), REF(l), f_inicio, NULL,f_inicio+((SELECT l.clase FROM libros l WHERE l.signatura=signatura1)*10) FROM USUARIOS u, LIBROS l WHERE l.signatura=signatura1 AND u.n_carnet=n_carnet1;
UPDATE LIBROS l SET l.estado=0 WHERE l.signatura=signatura1;
ELSE
     puede_prestar:=0;
END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTAR_PRESTAMO_SIMPLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTAR_PRESTAMO_SIMPLE" (
      n_carnet1 IN USUARIOS.N_CARNET%TYPE,
      signatura1 IN LIBROS.SIGNATURA%TYPE
) IS
BEGIN
INSERT INTO PRESTAMOS (n_prestamo,USUARIO,LIBRO,fecha_inicio,fecha_devolucion,fecha_fin) SELECT auto_inc_prestamos.nextval, REF(u), REF(l),CURRENT_DATE, NULL,CURRENT_DATE+((SELECT l.clase FROM libros l WHERE l.signatura=signatura1)*10) FROM USUARIOS u, LIBROS l WHERE l.signatura=signatura1 AND u.n_carnet=n_carnet1;
UPDATE LIBROS l SET l.estado=1 WHERE l.signatura=signatura1;
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTAR_PRESTAMO_SIN_RETURN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTAR_PRESTAMO_SIN_RETURN" (
      n_carnet1 IN USUARIOS.N_CARNET%TYPE,
      signatura1 IN LIBROS.SIGNATURA%TYPE,
      f_inicio IN DATE
) IS
disponible NUMBER;
penalizado1 NUMBER;
BEGIN
    SELECT l.estado into disponible FROM LIBROS l WHERE signatura=signatura1;
    SELECT u.penalizado into penalizado1 FROM USUARIOS u WHERE n_carnet=n_carnet1;
IF disponible=1 AND penalizado1=0 THEN
    INSERT INTO PRESTAMOS (n_prestamo,USUARIO,LIBRO,fecha_inicio,fecha_devolucion,fecha_fin) SELECT auto_inc_prestamos.nextval, REF(u), REF(l), f_inicio, NULL,f_inicio+((SELECT l.clase FROM libros l WHERE l.signatura=signatura1)*10) FROM USUARIOS u, LIBROS l WHERE l.signatura=signatura1 AND u.n_carnet=n_carnet1;
UPDATE LIBROS l SET l.estado=0 WHERE l.signatura=signatura1;
END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTAR_USUARIO" (
      nombre IN USUARIOS.NOMBRE%TYPE,
      calle IN USUARIOS.DIRECCION.calle%TYPE,
      ciudad IN USUARIOS.DIRECCION.ciudad%TYPE,
      cp IN USUARIOS.DIRECCION.cp%TYPE,
      penalizado IN USUARIOS.PENALIZADO%TYPE
) IS
BEGIN
    INSERT INTO USUARIOS VALUES(auto_inc_usuario.nextval,nombre,DIRECCION(calle,ciudad,cp),penalizado);
END;

/
--------------------------------------------------------
--  DDL for Procedure PERDONAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."PERDONAR_USUARIO" (
      n_carnet1  IN USUARIOS.N_CARNET%TYPE) IS
BEGIN
    UPDATE USUARIOS u SET u.penalizado=0 WHERE u.n_carnet=n_carnet1;
END;

/
--------------------------------------------------------
--  DDL for Procedure PRESTAR_LIBRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."PRESTAR_LIBRO" (
          signatura1 IN LIBROS.SIGNATURA%TYPE) IS
BEGIN
    UPDATE LIBROS l SET l.estado=0 WHERE l.signatura=signatura1;
END;

/
