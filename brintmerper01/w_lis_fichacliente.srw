HA$PBExportHeader$w_lis_fichacliente.srw
$PBExportComments$Ventana de Consulta~r~nEdificios
forward
global type w_lis_fichacliente from w_mnt_std
end type
end forward

global type w_lis_fichacliente from w_mnt_std
boolean center = true
boolean borrar = false
boolean suprimir = false
end type
global w_lis_fichacliente w_lis_fichacliente

type variables

end variables

on w_lis_fichacliente.create
call super::create
end on

on w_lis_fichacliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;dw_maestro.enabled = true
end event

event ue_permisos;call super::ue_permisos;if ii_tipo<>1 then
	dw_maestro.seleccionar=true
end if

end event

event ue_permisos_menu;call super::ue_permisos_menu;m_mnt_std.m_archivo.m_abrir.enabled = false
m_mnt_std.m_archivo.m_grabar.enabled = false
m_mnt_std.m_archivo.m_buscar.enabled = true
m_mnt_std.m_archivo.m_refrescar.enabled = true
m_mnt_std.m_archivo.m_exportar.enabled = true
m_mnt_std.m_archivo.m_imprimir.enabled = true
m_mnt_std.m_archivo.m_borrar.enabled = false

m_mnt_std.m_funciones.enabled = false

m_mnt_std.m_funciones.m_filtrar.enabled = true
m_mnt_std.m_funciones.m_ordenar.enabled = true

m_mnt_std.m_funciones.m_insertar_detalle.enabled = false
m_mnt_std.m_funciones.m_suprimir_detalle.enabled = false

end event

type dw_maestro from w_mnt_std`dw_maestro within w_lis_fichacliente
integer x = 14
integer y = 28
integer width = 3109
string dataobject = "dw_buscar_ficha_cliente"
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
integer li_cantidad = 0
string ls_codect 
w_mnt_fichacliente lw_mnt_fichacliente
st_par lst_par
if row < 1 then return
// validaciones entre el usuario y el ejecutivo



CHOOSE CASE ii_tipo
	CASE 2
		lst_par.updwprop = true
		lst_par.guardar = true
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Mantenimiento de Fichas de Cliente"
		lst_par.tipo = 2
		lst_par.parstring1 = object.codcli[row]
		lst_par.parstring2 = object.nomcli[row]
		lst_par.parlong1 = object.idficha[row]
		ls_codect  = object.codect[row]
	CASE 3
		lst_par.updwprop = false
		lst_par.guardar = false
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Consulta de Fichas de Cliente"
		lst_par.tipo = 3
		lst_par.parstring1 = object.codcli[row]
		lst_par.parstring2 = object.nomcli[row]
		lst_par.parlong1 = object.idficha[row]
		ls_codect  = object.codect[row]
END CHOOSE


SELECT count(*) INTO :li_cantidad
FROM
VTATABECT, VTATABUSUECT
WHERE
( VTATABECT.CODECT = VTATABUSUECT.CODECT ) and
( VTATABUSUECT.USUARIO = user)  and
(VTATABECT.CODECT = :ls_codect);

if li_cantidad = 0 then
	messagebox("Aviso","Usuario no tiene permiso para el ejecutivo seleccionado")
	return
end if

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_fichacliente", Parentwindow(), 1, Original!)
//openwithparm(lw_mnt_fichacliente, lst_par)
end event

event dw_maestro::ue_retrieve;long ll_filas
if ii_tipo<>1 then
		// open(w_filtrar_cliente)
		open(w_filtrar_fichacliente)
	SQL_FILTRO = message.stringparm
end if	
ll_filas = this.retrieve()
return ll_filas

end event

