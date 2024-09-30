$PBExportHeader$w_rep_auditoria.srw
forward
global type w_rep_auditoria from w_mnt_std
end type
end forward

global type w_rep_auditoria from w_mnt_std
boolean center = true
end type
global w_rep_auditoria w_rep_auditoria

type variables
st_par ist_par_out
end variables

on w_rep_auditoria.create
call super::create
end on

on w_rep_auditoria.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;//long ln_tipo_rep
//ln_tipo_rep = ii_tipo
//
//// Resumen tipo = 1
//if ln_tipo_rep = 1 then
//	dw_maestro.dataobject = 'd_rep_funel_summery'	
//else // Detalle tipo = 2
//	dw_maestro.dataobject = 'd_rep_funnel_detalle'  	
//end if


end event

type dw_maestro from w_mnt_std`dw_maestro within w_rep_auditoria
boolean seleccionar = false
end type

event dw_maestro::ue_retrieve;long ll_filas
st_par lst_par

openwithparm(w_fil_auditoria,lst_par)
ist_par = message.PowerObjectParm
	
if isvalid(ist_par) then
	if ist_par.valido then
			if ist_par.parboolean1 then			
			   dataobject = ist_par.parstring1
			   settransobject(sqlca)
		   end if
		   if ist_par.parboolean2 then			
			   dataobject = ist_par.parstring2
			   settransobject(sqlca)
		   end if
		   if ist_par.parboolean3 then			
			   dataobject = ist_par.parstring3
			   settransobject(sqlca)
		   end if
			if ist_par.parboolean4 then			
			   dataobject = ist_par.parstring4
			   settransobject(sqlca)
		   end if
	end if
else
	return 0
end if
ll_filas = this.retrieve()
return ll_filas


end event

