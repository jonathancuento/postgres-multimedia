--CODIGO REALIZADO DURANTE LA PRESENTACIÓN
-----------------------------------------------------------------------------------------------------------------------------
--MOSTRAR TABLA DE OBJETOS DE POSTGRES
select * from pg_largeobject


create table imagen(id serial, nombre varchar, archivo oid)

--INSERTAR ARCHIVO EN LA TABLA
insert into imagen values(default, 'imagen1.png', lo_import('C:/img/all/imagen1.png'))
insert into imagen values(default, 'imagen2.jpg', lo_import('C:/img/all/imagen2.jpg', 10))
select * from imagen
select * from pg_largeobject

--EXTRAER ARCHIVO
select lo_export(imagen.archivo, 'C:/img/imagen.png') from imagen;

--BORRAR OBJETO
select lo_unlink(oid) from pg_largeobject_metadata where oid = 10;
delete from imagen where archivo = 10	
				
--CREAR NUEVO OBJETO (NO SE MUESTRA EN pg_largeobject HASTA QUE SE INGRESE INFORMACIÓN EN ESE oid)
select lo_creat(0)
															
------------------------------------------------------------------------------------------------------------------------------
			
															

--ADICIONALMENTE, OTRA FORMA DE MANEJAR LOS OBJETOS EN LA TABLA CREADA ANTERIORMENTE
------------------------------------------------------------------------------------------------------------------------------

--FUNCION PARA EXTRAR EL NOMBRE DEL ARCHIVO SIN NECESITAR DE INGRESARLO (AL HACER UN INSERT)
create or replace function insert1(arch varchar) returns void as
$$
declare
var varchar;
begin
	select reverse(substring(reverse(arch),1,position('/' in reverse(arch))-1)) into var;
	insert into imagen values(default,var,lo_import(arch));
end;
$$ language plpgsql
select insert1('C:/img/all/imagen2.jpg') -- AHORA SOLO TENEMOS QUE INGRESAR LA DIRECCIÓN
													
													
--EXPORTAR ARCHIVO
select lo_export(imagen.archivo, 'C:/img/' || imagen.nombre) from imagen
-----------------------------------------------------------------------------------------------------------------------------