HA$PBExportHeader$w_lis_pais.srw
forward
global type w_lis_pais from w_mnt_std
end type
end forward

global type w_lis_pais from w_mnt_std
boolean center = true
boolean nuevo = true
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean suprimir = false
end type
global w_lis_pais w_lis_pais

on w_lis_pais.create
call super::create
end on

on w_lis_pais.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_menu_nuevo;window w_ventana
w_mnt_pais iw_mnt_pais
st_par lst_par
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = false	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = true
lst_par.titulo = "Mantenimiento de Pa$$HEX1$$ed00$$ENDHEX$$ses"
lst_par.dw_maestro = 'dw_ff_pais'
lst_par.dw_detalle = 'dw_gr_estado'
lst_par.tipo = 1

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_pais", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_pais, lst_par)
end event

type dw_maestro from w_mnt_std`dw_maestro within w_lis_pais
integer width = 3104
string dataobject = "dw_gr_pais"
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean auto_ordenar = false
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
w_mnt_pais iw_mnt_pais
st_par lst_par
if row < 1 then return
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = false	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.titulo = "Mantenimiento de Pa$$HEX1$$ed00$$ENDHEX$$ses"
lst_par.dw_maestro = 'dw_ff_pais'
lst_par.parstring1 = this.getitemstring(row,'codpai')
lst_par.dw_detalle = 'dw_gr_estado'
lst_par.tipo = 2

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_pais", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_pais, lst_par)

end event

