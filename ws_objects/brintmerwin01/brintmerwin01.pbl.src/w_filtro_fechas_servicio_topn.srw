$PBExportHeader$w_filtro_fechas_servicio_topn.srw
forward
global type w_filtro_fechas_servicio_topn from w_fil_fechas
end type
type dw_1 from uo_dw_std within w_filtro_fechas_servicio_topn
end type
type st_3 from statictext within w_filtro_fechas_servicio_topn
end type
type st_4 from statictext within w_filtro_fechas_servicio_topn
end type
type st_5 from statictext within w_filtro_fechas_servicio_topn
end type
type em_topn from editmask within w_filtro_fechas_servicio_topn
end type
end forward

global type w_filtro_fechas_servicio_topn from w_fil_fechas
integer width = 1733
integer height = 592
dw_1 dw_1
st_3 st_3
st_4 st_4
st_5 st_5
em_topn em_topn
end type
global w_filtro_fechas_servicio_topn w_filtro_fechas_servicio_topn

on w_filtro_fechas_servicio_topn.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.em_topn=create em_topn
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.em_topn
end on

on w_filtro_fechas_servicio_topn.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_topn)
end on

event open;call super::open;dw_1.triggerevent("ue_ini_dw")
dw_1.insertrow(1)
dw_1.setitem(1,'tipsrv','*')
end event

type st_2 from w_fil_fechas`st_2 within w_filtro_fechas_servicio_topn
integer x = 73
integer width = 274
integer height = 56
end type

type st_1 from w_fil_fechas`st_1 within w_filtro_fechas_servicio_topn
integer x = 73
integer width = 274
integer height = 56
end type

type fecfin from w_fil_fechas`fecfin within w_filtro_fechas_servicio_topn
integer x = 343
integer y = 152
integer width = 320
end type

type fecini from w_fil_fechas`fecini within w_filtro_fechas_servicio_topn
integer x = 343
integer y = 36
integer width = 320
end type

type cb_2 from w_fil_fechas`cb_2 within w_filtro_fechas_servicio_topn
integer x = 1248
integer y = 252
end type

type cb_1 from w_fil_fechas`cb_1 within w_filtro_fechas_servicio_topn
integer x = 1248
integer y = 136
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

lst_par.parstring1 = dw_1.getitemstring(1,'tipsrv')
if isnumber(em_topn.text) then
	lst_par.parlong1 = long(em_topn.text)
else
	messagebox('Aviso','Debe ingresar la cantidad de clientes a mostrar.')
	return
end if
closewithreturn(parent,lst_par)
end event

type dw_1 from uo_dw_std within w_filtro_fechas_servicio_topn
integer x = 343
integer y = 272
integer width = 873
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_ex_tystipsrv"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
end type

type st_3 from statictext within w_filtro_fechas_servicio_topn
integer x = 73
integer y = 388
integer width = 274
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar"
boolean focusrectangle = false
end type

type st_4 from statictext within w_filtro_fechas_servicio_topn
integer x = 576
integer y = 388
integer width = 261
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "primer(os)"
boolean focusrectangle = false
end type

type st_5 from statictext within w_filtro_fechas_servicio_topn
integer x = 73
integer y = 284
integer width = 274
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicio:"
boolean focusrectangle = false
end type

type em_topn from editmask within w_filtro_fechas_servicio_topn
integer x = 343
integer y = 372
integer width = 206
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "20"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
end type

