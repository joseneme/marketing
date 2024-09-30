$PBExportHeader$w_act_cliente.srw
forward
global type w_act_cliente from window
end type
type cb_1 from commandbutton within w_act_cliente
end type
type dw_1 from datawindow within w_act_cliente
end type
end forward

global type w_act_cliente from window
integer width = 1353
integer height = 520
boolean titlebar = true
string title = "Tipo de Actualización"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_act_cliente w_act_cliente

on w_act_cliente.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_act_cliente.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_1.setitem(dw_1.getrow(),'idtipact',3)//para que salga primero consultores
end event

type cb_1 from commandbutton within w_act_cliente
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


ll_tipoact=dw_1.getitemnumber(dw_1.getrow(),'idtipact')
if isnull(ll_tipoact) then
	messagebox('Aviso','Debe seleccionarse un tipo de actualización primero')
	return
end if

closewithreturn(parent,string(ll_tipoact))


end event

type dw_1 from datawindow within w_act_cliente
integer x = 283
integer y = 96
integer width = 795
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dw_ex_tipo_actualizacion"
boolean border = false
boolean livescroll = true
end type

