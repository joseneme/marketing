HA$PBExportHeader$w_filtro_fechas_persona.srw
forward
global type w_filtro_fechas_persona from w_fil_fechas
end type
type st_3 from statictext within w_filtro_fechas_persona
end type
type dw_1 from uo_dw_std within w_filtro_fechas_persona
end type
end forward

global type w_filtro_fechas_persona from w_fil_fechas
integer width = 1577
integer height = 496
st_3 st_3
dw_1 dw_1
end type
global w_filtro_fechas_persona w_filtro_fechas_persona

on w_filtro_fechas_persona.create
int iCurrent
call super::create
this.st_3=create st_3
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.dw_1
end on

on w_filtro_fechas_persona.destroy
call super::destroy
destroy(this.st_3)
destroy(this.dw_1)
end on

event open;call super::open;dw_1.triggerevent("ue_ini_dw")
dw_1.insertrow(1)
dw_1.setitem(1,'tipper','*')
end event

type st_2 from w_fil_fechas`st_2 within w_filtro_fechas_persona
integer width = 315
end type

type st_1 from w_fil_fechas`st_1 within w_filtro_fechas_persona
end type

type fecfin from w_fil_fechas`fecfin within w_filtro_fechas_persona
end type

type fecini from w_fil_fechas`fecini within w_filtro_fechas_persona
end type

type cb_2 from w_fil_fechas`cb_2 within w_filtro_fechas_persona
integer x = 1065
integer y = 208
end type

type cb_1 from w_fil_fechas`cb_1 within w_filtro_fechas_persona
integer x = 1065
integer y = 92
end type

event cb_1::clicked;st_par lst_par
datetime ldt_fecini,ldt_fecfin
//****
string ls_fecha
long k
//****
fecini.getdata(ldt_fecini)
fecfin.getdata(ldt_fecfin)

if isnull(lst_par.pardatetime1) or fecini.text = '' then
	messagebox('Aviso','No ha ingresado la fecha de inicio.')
	return
end if
if isnull(lst_par.pardatetime2)  or fecfin.text = '' then
	messagebox('Aviso','No ha ingresado la fecha de fin.')
	return
end if

ldt_fecini = datetime(date(ldt_fecini),time(0,0,0))
ldt_fecfin = datetime(date(ldt_fecfin),time(23,59,59))

lst_par.pardatetime1 = ldt_fecini
lst_par.pardatetime2 = ldt_fecfin

if ldt_fecfin < ldt_fecini then
	messagebox('Aviso','Fecha de Inicio no puede ser mayor a la fecha de Fin.')
	return
end if
//****************
ls_fecha = string(ldt_fecini,'dd/mm/yyyy')
k = RegistrySet( gsRutaReg, "fil_fechaini", RegString!,ls_fecha)
ls_fecha = string(ldt_fecfin,'dd/mm/yyyy')
k = RegistrySet( gsRutaReg, "fil_fechafin", RegString!,ls_fecha)
//****************
lst_par.parboolean1 = true

lst_par.parstring1 = dw_1.getitemstring(1,'tipper')
closewithreturn(parent,lst_par)
end event

type st_3 from statictext within w_filtro_fechas_persona
integer x = 123
integer y = 284
integer width = 315
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Persona"
boolean focusrectangle = false
end type

type dw_1 from uo_dw_std within w_filtro_fechas_persona
integer x = 489
integer y = 276
integer width = 530
integer height = 88
integer taborder = 30
boolean bringtotop = true
string dataobject = "dddw_tipper_todos"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
boolean resize_x = false
boolean resize_y = false
end type

