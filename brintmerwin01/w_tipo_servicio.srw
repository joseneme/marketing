HA$PBExportHeader$w_tipo_servicio.srw
forward
global type w_tipo_servicio from window
end type
type st_2 from statictext within w_tipo_servicio
end type
type st_1 from statictext within w_tipo_servicio
end type
type sle_1 from singlelineedit within w_tipo_servicio
end type
type cb_2 from commandbutton within w_tipo_servicio
end type
type cb_1 from commandbutton within w_tipo_servicio
end type
type dw_1 from datawindow within w_tipo_servicio
end type
type dw_2 from uo_dw_std within w_tipo_servicio
end type
end forward

global type w_tipo_servicio from window
integer width = 1262
integer height = 1200
boolean titlebar = true
string title = "Intersecci$$HEX1$$f300$$ENDHEX$$n de Servicios"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
st_2 st_2
st_1 st_1
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
dw_2 dw_2
end type
global w_tipo_servicio w_tipo_servicio

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_2.uf_ini()
dw_2.insertrow(1)

end event

on w_tipo_servicio.create
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.Control[]={this.st_2,&
this.st_1,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.dw_2}
end on

on w_tipo_servicio.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.dw_2)
end on

type st_2 from statictext within w_tipo_servicio
integer x = 123
integer y = 228
integer width = 238
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes"
boolean focusrectangle = false
end type

type st_1 from statictext within w_tipo_servicio
integer x = 123
integer y = 92
integer width = 238
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A$$HEX1$$f100$$ENDHEX$$o"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_tipo_servicio
integer x = 411
integer y = 92
integer width = 535
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_tipo_servicio
integer x = 658
integer y = 964
integer width = 425
integer height = 88
integer taborder = 50
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

type cb_1 from commandbutton within w_tipo_servicio
integer x = 101
integer y = 964
integer width = 425
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;st_par st_parametro
integer i
integer j=0



if isnull(sle_1.text) or sle_1.text='' then
	messagebox('Error','Debe ingresar primero un a$$HEX1$$f100$$ENDHEX$$o')
	return
end if

if isnull(dw_2.getitemstring(1,"mes")) then
	messagebox('Error','Debe ingresar primero un mes')
	return
end if

FOR i=1 TO dw_1.rowcount()
	if dw_1.getitemnumber(i,"indicador") = 1 then
		j = j + 1
		st_parametro.pararraystring1[j]=dw_1.getitemstring(i,"tipsrv")
		
	end if
NEXT

if j=0 then
	messagebox('Error','Debe marcar al menos un servicio');
	return;
end if

st_parametro.parinteger1=j
st_parametro.parstring1=sle_1.text
st_parametro.parstring2=dw_2.getitemstring(1,"mes")

closewithreturn(parent,st_parametro)





end event

type dw_1 from datawindow within w_tipo_servicio
integer x = 37
integer y = 356
integer width = 1170
integer height = 548
integer taborder = 30
string title = "none"
string dataobject = "dw_gr_tipo_servicio"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from uo_dw_std within w_tipo_servicio
integer x = 411
integer y = 228
integer width = 535
integer height = 76
integer taborder = 20
string dataobject = "dw_ext_mes"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean resize_x = false
boolean resize_y = false
end type

