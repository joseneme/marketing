HA$PBExportHeader$w_fil_auditoria.srw
forward
global type w_fil_auditoria from w_fil_std
end type
end forward

global type w_fil_auditoria from w_fil_std
integer width = 1486
integer height = 464
string title = "Par$$HEX1$$e100$$ENDHEX$$metros de B$$HEX1$$fa00$$ENDHEX$$squeda"
end type
global w_fil_auditoria w_fil_auditoria

type variables
int ii_acceso
end variables

event ue_grabar;call super::ue_grabar;dw.AcceptText()

ist_par.parboolean1 = wf_flag('f_generales')
ist_par.parboolean2 = wf_flag('f_marketing')
ist_par.parboolean3 = wf_flag('f_sucursales')
ist_par.parboolean4 = wf_flag('f_medios')
if dw.object.f_generales[dw.getrow()] = 0 then
	ist_par.parstring1 = "d_rep_auditoria_generales"
end if
if dw.object.f_marketing[dw.getrow()] = 0 then
	ist_par.parstring2 = "d_rep_auditoria_marketing"
end if
if dw.object.f_sucursales[dw.getrow()] = 0 then
	ist_par.parstring3 = "d_rep_auditoria_sucursales"
end if
if dw.object.f_medios[dw.getrow()] = 0 then
	ist_par.parstring4 = "d_rep_auditoria_medios"
end if
ist_par.valido = true

ist_par.parinteger1 = ii_acceso


end event

on w_fil_auditoria.create
call super::create
end on

on w_fil_auditoria.destroy
call super::destroy
end on

type cb_2 from w_fil_std`cb_2 within w_fil_auditoria
integer x = 1047
integer y = 180
end type

type cb_1 from w_fil_std`cb_1 within w_fil_auditoria
integer x = 1047
integer y = 36
end type

type dw from w_fil_std`dw within w_fil_auditoria
integer x = 64
integer y = 32
integer width = 960
integer height = 316
string dataobject = "d_fil_auditoria"
end type

event dw::itemchanged;call super::itemchanged;object.f_generales[1] = 1
object.f_marketing[1] = 1
object.f_sucursales[1] = 1
object.f_medios[1] = 1
end event

