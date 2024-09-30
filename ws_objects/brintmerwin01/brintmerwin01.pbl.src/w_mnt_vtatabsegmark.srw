$PBExportHeader$w_mnt_vtatabsegmark.srw
forward
global type w_mnt_vtatabsegmark from w_mnt_std
end type
end forward

global type w_mnt_vtatabsegmark from w_mnt_std
integer width = 2939
integer height = 1540
end type
global w_mnt_vtatabsegmark w_mnt_vtatabsegmark

type variables
boolean ib_std_modificado
end variables

on w_mnt_vtatabsegmark.create
call super::create
end on

on w_mnt_vtatabsegmark.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_vtatabsegmark
integer width = 2871
integer height = 1116
string dataobject = "dw_segmentomark"
end type

event dw_maestro::buttonclicked;call super::buttonclicked;st_par lst_par
window w_ventana
accepttext()
choose case dwo.name
	case 'b_color'
		lst_par.parlong1	= tHIS.object.color[row]
		lst_par.updwprop 	= true
		lst_par.guardar 	= true
		lst_par.nuevo 		= true	
		lst_par.borrar 	= true
		lst_par.insertar 	= false	
		lst_par.suprimir 	= false
		
		OpenWithParm(w_bpm_color, lst_par)
		lst_par = message.powerobjectparm
		if isvalid(lst_par) and not IsNull(lst_par) then
			this.setitem(row, 'color', lst_par.parlong1)
			dw_maestro.update()
		end if
		dw_maestro.triggerevent('ue_retrieve')
end choose



end event

event dw_maestro::clicked;call super::clicked;st_par lst_par
window w_ventana
accepttext()
choose case dwo.name
	case 'rr_1'
		lst_par.parlong1	= tHIS.object.color[row]
		lst_par.updwprop 	= true
		lst_par.guardar 	= true
		lst_par.nuevo 		= true	
		lst_par.borrar 	= true
		lst_par.insertar 	= false	
		lst_par.suprimir 	= false
		
		OpenWithParm(w_bpm_color, lst_par)
		lst_par = message.powerobjectparm
		if isvalid(lst_par) and not IsNull(lst_par) then
			this.setitem(row, 'color', lst_par.parlong1)
			//dw_maestro.update()
		end if
		//dw_maestro.triggerevent('ue_retrieve')
end choose



end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;if al_row>0 then
	dw_maestro.setitem(al_row,'dscsegmark','')
end if
end event

event dw_maestro::ue_update_pre_row;call super::ue_update_pre_row;if row>0 then
	if isnull(dw_maestro.getitemstring(row,'dscsegmark')) or &
		trim(dw_maestro.getitemstring(row,'dscsegmark'))='' then
		Messagebox('Segmento de Venta', 'El Segmento de Venta no puede~r~n' + &
				'ser vacío o espacios en blanco.~r~nError en la fila: ' + string(row) )
		return false
	end if
	

end if
return true
end event

event dw_maestro::ue_guardar;call super::ue_guardar;	if isnull(dw_maestro.getitemstring(dw_maestro.getrow(),'ctadeudorsap')) or trim(dw_maestro.getitemstring(dw_maestro.getrow(),'ctadeudorsap')) = '' then
		Messagebox('Segmento de Venta', 'El campo ctaseudorsap es obligatorio')
		return false
	else
		return true
	end if
	
end event

