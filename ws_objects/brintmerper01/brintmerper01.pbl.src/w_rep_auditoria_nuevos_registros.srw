$PBExportHeader$w_rep_auditoria_nuevos_registros.srw
forward
global type w_rep_auditoria_nuevos_registros from w_mnt_std
end type
end forward

global type w_rep_auditoria_nuevos_registros from w_mnt_std
boolean center = true
end type
global w_rep_auditoria_nuevos_registros w_rep_auditoria_nuevos_registros

type variables
st_par ist_par_out
end variables

on w_rep_auditoria_nuevos_registros.create
call super::create
end on

on w_rep_auditoria_nuevos_registros.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_mnt_std`dw_maestro within w_rep_auditoria_nuevos_registros
boolean seleccionar = false
end type

event dw_maestro::ue_retrieve;long ll_filas
date ld_fecini, ld_fecfin
string ls_tipper


if ib_menu_buscar then
	open(w_fil_auditoria_nuevos_registros)
	
	ist_par_out = message.PowerObjectParm
	
	if isvalid(ist_par_out) then
		if ist_par_out.parboolean1 then ld_fecini = ist_par_out.pardate1
		if ist_par_out.parboolean1 then ld_fecfin = ist_par_out.pardate2
		if ist_par_out.parboolean2 then ls_tipper = ist_par_out.parstring1
		this.modify("t_2.text='"+string(ld_fecini)+"'")
		this.modify("t_4.text='"+string(ld_fecfin)+"'")
		ll_filas = this.retrieve(ld_fecini,ld_fecfin,ls_tipper)
		return ll_filas
	else
		return 0
	end if

end if


end event

