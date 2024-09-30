HA$PBExportHeader$uo_comun_campanhas.sru
forward
global type uo_comun_campanhas from userobject
end type
type cb_2 from picturebutton within uo_comun_campanhas
end type
type cb_1 from picturebutton within uo_comun_campanhas
end type
type dw_2 from uo_dw_std within uo_comun_campanhas
end type
type dw_1 from uo_dw_std within uo_comun_campanhas
end type
end forward

global type uo_comun_campanhas from userobject
integer width = 2377
integer height = 1788
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global uo_comun_campanhas uo_comun_campanhas

on uo_comun_campanhas.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on uo_comun_campanhas.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type cb_2 from picturebutton within uo_comun_campanhas
integer x = 681
integer y = 28
integer width = 599
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "I:\picbtn_nuevo.bmp"
alignment htextalign = left!
end type

type cb_1 from picturebutton within uo_comun_campanhas
integer x = 27
integer y = 28
integer width = 599
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "I:\picbtn_grabar.bmp"
alignment htextalign = left!
end type

type dw_2 from uo_dw_std within uo_comun_campanhas
integer x = 37
integer y = 908
integer width = 2277
integer height = 824
integer taborder = 20
end type

type dw_1 from uo_dw_std within uo_comun_campanhas
integer x = 32
integer y = 168
integer width = 2286
integer height = 712
integer taborder = 10
end type

