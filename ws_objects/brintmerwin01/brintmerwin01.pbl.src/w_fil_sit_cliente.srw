$PBExportHeader$w_fil_sit_cliente.srw
forward
global type w_fil_sit_cliente from window
end type
type st_1 from statictext within w_fil_sit_cliente
end type
type cb_1 from commandbutton within w_fil_sit_cliente
end type
type dw_1 from datawindow within w_fil_sit_cliente
end type
end forward

global type w_fil_sit_cliente from window
integer width = 1353
integer height = 520
boolean titlebar = true
string title = "Tipo de Situacion"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
st_1 st_1
cb_1 cb_1
dw_1 dw_1
end type
global w_fil_sit_cliente w_fil_sit_cliente

on w_fil_sit_cliente.create
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_1,&
this.dw_1}
end on

on w_fil_sit_cliente.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.insertrow(0)
dw_1.setitem(dw_1.getrow(),'id',1)//para que salga primero consultores
end event

type st_1 from statictext within w_fil_sit_cliente
integer x = 197
integer y = 108
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Situación"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_fil_sit_cliente
integer x = 462
integer y = 272
integer width = 402
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;long ll_tipoact


ll_tipoact=dw_1.getitemnumber(dw_1.getrow(),'id')
if isnull(ll_tipoact) then
	messagebox('Aviso','Debe seleccionarse un tipo de situacion primero')
	return
end if

closewithreturn(parent,ll_tipoact)


end event

type dw_1 from datawindow within w_fil_sit_cliente
integer x = 503
integer y = 104
integer width = 690
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "d_fil_sit_cliente"
boolean border = false
boolean livescroll = true
end type

