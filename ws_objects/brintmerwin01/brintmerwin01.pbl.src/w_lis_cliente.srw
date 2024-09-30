$PBExportHeader$w_lis_cliente.srw
$PBExportComments$Ventana de Consulta~r~nEdificios
forward
global type w_lis_cliente from w_mnt_std
end type
type dw_fil_bd_cliente from uo_dw_fil within w_lis_cliente
end type
end forward

global type w_lis_cliente from w_mnt_std
boolean center = true
boolean nuevo = true
boolean borrar = false
boolean suprimir = false
dw_fil_bd_cliente dw_fil_bd_cliente
end type
global w_lis_cliente w_lis_cliente

type variables

end variables

on w_lis_cliente.create
int iCurrent
call super::create
this.dw_fil_bd_cliente=create dw_fil_bd_cliente
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_fil_bd_cliente
end on

on w_lis_cliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_fil_bd_cliente)
end on

event open;call super::open;dw_maestro.enabled = true
//Creación de Clientes. MAH 31/08/2004
if gsPais = 'BRA' and ii_tipo <> 2 then
	this.nuevo = false
else
	this.nuevo = true
end if

dw_fil_bd_cliente.setfocus()
dw_fil_bd_cliente.uf_ini(sqlca)
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

//Creacion de Clientes. MAH 31/08/2004
if gsPais = 'BRA' then
	m_mnt_std.m_archivo.m_nuevo.enabled = false
else
	m_mnt_std.m_archivo.m_nuevo.enabled = true
end if

m_mnt_std.m_funciones.enabled = false

m_mnt_std.m_funciones.m_filtrar.enabled = true
m_mnt_std.m_funciones.m_ordenar.enabled = true

m_mnt_std.m_funciones.m_insertar_detalle.enabled = false
m_mnt_std.m_funciones.m_suprimir_detalle.enabled = false

end event

event ue_menu_nuevo;window w_ventana
if not this.nuevo then
	f_msg('No se puede insertar en la ventana.')
else
	w_mnt_cliente_marketing iw_mnt_cliente
	st_par lst_par
	lst_par.updwprop = false
	lst_par.guardar = false
	lst_par.nuevo = true
	lst_par.borrar = false	
	lst_par.insertar = false	
	lst_par.suprimir = false
	lst_par.titulo = "Creación de Clientes"
	lst_par.dw_maestro = 'dw_ff_cliente_marketing'
	lst_par.dw_detalle = 'dw_gr_cliente_ingreso_anual'
	lst_par.tipo = ii_tipo
	
	OpenSheetWithparm (w_ventana, lst_par, "w_mnt_cliente_marketing", Parentwindow(), 1, Layered!)
	//openwithparm(iw_mnt_cliente, lst_par)
end if

end event

event close;call super::close;dw_fil_bd_cliente.uf_save()
end event

type dw_maestro from w_mnt_std`dw_maestro within w_lis_cliente
integer width = 3109
string dataobject = "dw_buscar_cliente_marketing"
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
//w_mnt_cliente_marketing iw_mnt_cliente
st_par lst_par
if row < 1 then return
lst_par.updwprop = false
lst_par.guardar = false
/*if gsPais <> 'BRA' and ii_tipo = 2 then
	lst_par.nuevo = true
else
	lst_par.nuevo = false
end if*/
lst_par.borrar = false	
lst_par.insertar = false	
lst_par.suprimir = false
lst_par.titulo = "Base de Datos de Clientes"
lst_par.dw_maestro = 'dw_ff_cliente_marketing'
lst_par.parstring1 = this.getitemstring(row,'codcli')
lst_par.parstring2 = this.getitemstring(row,'codclipadre')
lst_par.parinteger1 = this.getitemnumber(row,'tipo_entidad')
lst_par.dw_detalle = 'dw_gr_cliente_ingreso_anual'
lst_par.tipo = ii_tipo

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_cliente_marketing", Parentwindow(), 1, Layered!)
//openwithparm(w_mnt_cliente_marketing, lst_par) 

end event

event dw_maestro::ue_retrieve;//long ll_filas
//if ii_tipo<>1 then
//	open(w_filtrar_cliente)
//	SQL_FILTRO = message.stringparm
//end if	
//ll_filas = this.retrieve()
//return ll_filas
//

SQL_FILTRO = dw_fil_bd_cliente.uf_getsql()

return retrieve()


end event

type dw_fil_bd_cliente from uo_dw_fil within w_lis_cliente
event ue_keydown pbm_dwnkey
integer x = 146
integer y = 224
integer width = 1902
integer height = 480
integer taborder = 70
boolean bringtotop = true
boolean titlebar = true
string title = "Filtros"
string dataobject = "d_fil_bd_cliente"
boolean controlmenu = true
end type

event ue_keydown;if keydown(keyenter!) then
	event ue_menu_buscar()
end if
end event

event ue_getsql;accepttext()
is_sql = ""
if uf_flag('f_codcli') then
	is_sql = is_sql + " and vtatabcli.codcli like '%" + string(this.getitemstring(1,'codcli'))  + "%'"
end if

if uf_flag('f_nomcli') then
	is_sql = is_sql + " and vtatabcli.nomcli like '%" + string(this.getitemstring(1,'nomcli'))  + "%'"
end if

if uf_flag('f_documento') then
	is_sql = is_sql + " and vtatabcli.ntdide like '%" + string(this.getitemstring(1,'ntdide'))  + "%'"
end if

if uf_flag('f_codect') then
	is_sql = is_sql + " and vtatabcli.codect = '" + string(this.getitemstring(1,'codect')) + "'"
end if

return is_sql

end event

event buttonclicked;call super::buttonclicked;if dwo.name = "b_aceptar" then
	event ue_menu_buscar()
end if

if dwo.name = "b_cancelar" then
	this.visible = false
end if
end event

