$PBExportHeader$w_filtro_mes_anyo.srw
forward
global type w_filtro_mes_anyo from window
end type
type cb_2 from commandbutton within w_filtro_mes_anyo
end type
type em_anyo from editmask within w_filtro_mes_anyo
end type
type st_2 from statictext within w_filtro_mes_anyo
end type
type ddlb_mes from dropdownlistbox within w_filtro_mes_anyo
end type
type st_1 from statictext within w_filtro_mes_anyo
end type
type cb_1 from commandbutton within w_filtro_mes_anyo
end type
end forward

global type w_filtro_mes_anyo from window
integer width = 960
integer height = 672
boolean titlebar = true
string title = "Período"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cb_2 cb_2
em_anyo em_anyo
st_2 st_2
ddlb_mes ddlb_mes
st_1 st_1
cb_1 cb_1
end type
global w_filtro_mes_anyo w_filtro_mes_anyo

on w_filtro_mes_anyo.create
this.cb_2=create cb_2
this.em_anyo=create em_anyo
this.st_2=create st_2
this.ddlb_mes=create ddlb_mes
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.em_anyo,&
this.st_2,&
this.ddlb_mes,&
this.st_1,&
this.cb_1}
end on

on w_filtro_mes_anyo.destroy
destroy(this.cb_2)
destroy(this.em_anyo)
destroy(this.st_2)
destroy(this.ddlb_mes)
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;ddlb_mes.text = 'Enero'
end event

type cb_2 from commandbutton within w_filtro_mes_anyo
integer x = 517
integer y = 384
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type em_anyo from editmask within w_filtro_mes_anyo
integer x = 352
integer y = 224
integer width = 283
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2000"
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "1900~~9999"
end type

type st_2 from statictext within w_filtro_mes_anyo
integer x = 114
integer y = 236
integer width = 174
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año:"
boolean focusrectangle = false
end type

type ddlb_mes from dropdownlistbox within w_filtro_mes_anyo
integer x = 352
integer y = 60
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Setiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_filtro_mes_anyo
integer x = 114
integer y = 84
integer width = 174
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_filtro_mes_anyo
integer x = 37
integer y = 384
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;st_par lst_par

CHOOSE CASE ddlb_mes.text
CASE 'Enero'
		lst_par.parinteger1 = 1
CASE 'Febrero'
		lst_par.parinteger1 = 2
CASE 'Marzo'
		lst_par.parinteger1 = 3
CASE 'Abril'
		lst_par.parinteger1 = 4
CASE 'Mayo'
		lst_par.parinteger1 = 5
CASE 'Junio'
		lst_par.parinteger1 = 6
CASE 'Julio'
		lst_par.parinteger1 = 7
CASE 'Agosto'
		lst_par.parinteger1 = 8
CASE 'Setiembre'
		lst_par.parinteger1 = 9
CASE 'Octubre'
		lst_par.parinteger1 = 10
CASE 'Noviembre'
		lst_par.parinteger1 = 11
CASE 'Diciembre'
		lst_par.parinteger1 = 12
CASE ELSE
		messagebox('Error','Elija un mes')
		return 0
END CHOOSE

if em_anyo.text='' then
		messagebox('Error','Ingrese un año válido')
		return 0
else
	lst_par.parinteger2 = integer(em_anyo.text)
end if
lst_par.pardatetime1 = datetime('01/' + right('0'+string(lst_par.parinteger1),2) + '/' + em_anyo.text)
lst_par.parstring1 = '01/' + right('0'+string(lst_par.parinteger1),2) + '/' + em_anyo.text

closewithreturn (parent,lst_par)
end event

