$PBExportHeader$w_lis_lead.srw
forward
global type w_lis_lead from w_mnt_comun
end type
end forward

global type w_lis_lead from w_mnt_comun
end type
global w_lis_lead w_lis_lead

on w_lis_lead.create
call super::create
end on

on w_lis_lead.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_seleccion;call super::ue_seleccion;window w_ventana
st_par lst_par
dec ld_clave, ld_aprob,ld_estado
w_lead w_lead1

ld_clave = dw_maestro.getitemnumber(dw_maestro.getrow(),'codlead')

ld_estado= dw_maestro.getitemnumber(dw_maestro.getrow(),'estlead')

if isnull(ld_clave) then return
lst_par.pardec1 = ld_clave

if ii_tipo = 5 then  //consulta
   lst_par.updwprop = true
	lst_par.guardar = false
	lst_par.nuevo = false
	lst_par.borrar = false	
	lst_par.insertar = false	
	lst_par.suprimir = false
	lst_par.tipo=ii_tipo
	OpenSheetWithparm (w_ventana, lst_par, "w_lead", Parentwindow(), 1, Original!)
	//openwithparm(w_lead1,lst_par)
elseif ii_tipo=6 or ii_tipo = 2 or ii_tipo = 3 or ii_tipo = 4 then  // Mantenimiento
	
	ld_clave = dw_maestro.getitemnumber(dw_maestro.getrow(),'estlead')

	if ii_tipo=6 then
   	lst_par.updwprop = true
		lst_par.guardar = true
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = true
		lst_par.suprimir = true
		lst_par.tipo=ii_tipo
		
	else
		lst_par.updwprop = true
		lst_par.guardar = true
		lst_par.nuevo = false
		lst_par.borrar = false
		lst_par.insertar = false
		lst_par.suprimir = false
		lst_par.tipo=ii_tipo
	end if
	
	if ii_tipo = 2 then
		lst_par.suprimir = true
	end if
	
	if ii_tipo=6 then
		if ld_estado=1 then
			ld_estado=6
		end if 
	end if
	if ld_estado<>ii_tipo then

			
		messagebox('Inteligencia de Mercado','No puede modificar un lead que no está en su área',exclamation!)
		return
	else
		OpenSheetWithparm (w_ventana, lst_par, "w_lead", Parentwindow(), 1, Original!)
		//openwithparm(w_lead1,lst_par)
	end if	


end if
end event

type dw_maestro from w_mnt_comun`dw_maestro within w_lis_lead
integer width = 3003
string dataobject = "d_lis_lead"
end type

event dw_maestro::ue_retrieve;call super::ue_retrieve;return(this.retrieve())
end event

