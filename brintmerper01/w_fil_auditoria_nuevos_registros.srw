HA$PBExportHeader$w_fil_auditoria_nuevos_registros.srw
forward
global type w_fil_auditoria_nuevos_registros from w_fil_std
end type
end forward

global type w_fil_auditoria_nuevos_registros from w_fil_std
integer width = 2053
integer height = 412
string title = "Par$$HEX1$$e100$$ENDHEX$$metros de B$$HEX1$$fa00$$ENDHEX$$squeda"
end type
global w_fil_auditoria_nuevos_registros w_fil_auditoria_nuevos_registros

type variables
int ii_acceso
end variables

event ue_grabar;call super::ue_grabar;// Ejemplo de codigo que puede ir en esta evento
dw.AcceptText()

ist_par.parboolean1 = wf_flag('f_fecha')
ist_par.parboolean2 = wf_flag('f_tipper')

ist_par.pardate1 = dw.getitemdate(1,'fecini')
ist_par.pardate2 = dw.getitemdate(1,'fecfin')
ist_par.parstring1 = dw.getitemstring(1,'tipper')

ist_par.valido = true

if ist_par.parboolean1 then
	if isnull(ist_par.pardate1) then
		messagebox('Aviso','No ha ingresado la fecha de inicio.')
		return
	end if
	if isnull(ist_par.pardate2) then
		messagebox('Aviso','No ha ingresado la fecha de fin.')
		return
	end if
	if ist_par.pardate1 > ist_par.pardate2 then
		messagebox('Aviso','Fecha de Inicio no puede ser mayor a la fecha de Fin.')
		return
	end if
end if

end event

on w_fil_auditoria_nuevos_registros.create
call super::create
end on

on w_fil_auditoria_nuevos_registros.destroy
call super::destroy
end on

event open;call super::open;dw.setitem(1,'f_fecha',0)
dw.setitem(1,'f_tipper',0)
dw.setitem(1,'fecini',today())
dw.setitem(1,'fecfin',today())
ist_par.valido = false
end event

type cb_2 from w_fil_std`cb_2 within w_fil_auditoria_nuevos_registros
integer x = 1682
integer y = 160
end type

type cb_1 from w_fil_std`cb_1 within w_fil_auditoria_nuevos_registros
integer x = 1682
integer y = 48
end type

type dw from w_fil_std`dw within w_fil_auditoria_nuevos_registros
integer x = 27
integer y = 48
integer width = 1595
integer height = 212
string dataobject = "d_fil_auditoria_nuevos_registros"
end type

