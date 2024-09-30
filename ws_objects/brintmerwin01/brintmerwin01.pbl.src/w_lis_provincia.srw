$PBExportHeader$w_lis_provincia.srw
forward
global type w_lis_provincia from w_mnt_std
end type
end forward

global type w_lis_provincia from w_mnt_std
boolean center = true
boolean nuevo = true
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean suprimir = false
end type
global w_lis_provincia w_lis_provincia

on w_lis_provincia.create
call super::create
end on

on w_lis_provincia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_menu_nuevo;window w_ventana
w_mnt_provincia iw_mnt_provincia
st_par lst_par
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = false	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.titulo = "Mantenimiento de Provincias"
lst_par.dw_maestro = 'dw_ff_provincia'
lst_par.dw_detalle = 'dw_gr_distrito'
lst_par.tipo = 1

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_provincia", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_provincia, lst_par)
end event

type dw_maestro from w_mnt_std`dw_maestro within w_lis_provincia
integer width = 3104
string dataobject = "dw_gr_provincia"
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean auto_ordenar = false
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
w_mnt_provincia iw_mnt_provincia
st_par lst_par
if row < 1 then return
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = false	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.titulo = "Mantenimiento de Provincias"
lst_par.dw_maestro = 'dw_ff_provincia'
lst_par.parstring1 = this.getitemstring(row,'codpvc')
lst_par.parstring2 = this.getitemstring(row,'codest')
lst_par.parstring3 = this.getitemstring(row,'codpai')
lst_par.dw_detalle = 'dw_gr_distrito'
lst_par.tipo = 2

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_provincia", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_provincia, lst_par)
end event

event dw_maestro::ue_retrieve;long ll_filas
st_par lst_par
open(w_filtro_pais_estado_provincia)
lst_par = message.PowerObjectParm
if isvalid(lst_par) then
	string ls_pais, ls_estado, ls_provincia
	ls_pais = lst_par.parstring1
	ls_estado = lst_par.parstring2
	ls_provincia = lst_par.parstring3
	if IsNull(ls_pais) or trim(ls_pais)='' 	 or not lst_par.parboolean1 then ls_pais = '*'
	if IsNull(ls_estado)	or trim(ls_estado)='' or not lst_par.parboolean2 then ls_estado = '*'
	if IsNull(ls_provincia)							 or not lst_par.parboolean3 then ls_provincia = '*'
	ll_filas = this.retrieve(ls_pais, ls_estado, ls_provincia)
end if
return ll_filas
end event

