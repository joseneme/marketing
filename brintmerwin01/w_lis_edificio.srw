HA$PBExportHeader$w_lis_edificio.srw
$PBExportComments$Ventana de Consulta~r~nEdificios
forward
global type w_lis_edificio from w_mnt_std
end type
end forward

global type w_lis_edificio from w_mnt_std
boolean center = true
end type
global w_lis_edificio w_lis_edificio

type variables

end variables

on w_lis_edificio.create
call super::create
end on

on w_lis_edificio.destroy
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

type dw_maestro from w_mnt_std`dw_maestro within w_lis_edificio
integer width = 3109
string dataobject = "dw_gr_edificio"
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
w_mnt_edificio iw_mnt_edificio
long ll_codigo
st_par lst_par
if row < 1 then return
ll_codigo=this.getitemnumber(row,'codigo')
CHOOSE CASE ii_tipo
	CASE 2
		lst_par.updwprop = true
		lst_par.guardar = true
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Mantenimiento de Edificios"
		lst_par.dw_maestro = 'dw_ff_edificio'
		lst_par.tipo = 2
		lst_par.parlong1 = ll_codigo
		lst_par.dw_detalle = 'dw_gr_direccion_alternativa_edificio'
		lst_par.dw_detalle2 = 'dw_gr_sucursal_x_edificio'
	CASE 3
		lst_par.updwprop = false
		lst_par.guardar = false
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Consulta de Edificios"
		lst_par.dw_maestro = 'dw_ff_edificio'
		lst_par.tipo = 3
		lst_par.parlong1 = ll_codigo
		lst_par.dw_detalle = 'dw_gr_direccion_alternativa_edificio'
		lst_par.dw_detalle2 = 'dw_gr_sucursal_x_edificio'
END CHOOSE

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_edificio", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_edificio, lst_par)

end event

event dw_maestro::ue_retrieve;long ll_filas
if ii_tipo<>1 then
	open(w_filtrar_edificio)
	SQL_FILTRO = message.stringparm
end if	
ll_filas = this.retrieve()
return ll_filas

end event

