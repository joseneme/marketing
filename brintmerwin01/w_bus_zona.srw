HA$PBExportHeader$w_bus_zona.srw
forward
global type w_bus_zona from w_lov_buscar
end type
type st_1 from statictext within w_bus_zona
end type
type st_2 from statictext within w_bus_zona
end type
type sle_codigo from singlelineedit within w_bus_zona
end type
end forward

global type w_bus_zona from w_lov_buscar
integer width = 2103
integer height = 1500
string title = "Buscar Zonas"
boolean center = true
st_1 st_1
st_2 st_2
sle_codigo sle_codigo
end type
global w_bus_zona w_bus_zona

on w_bus_zona.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.sle_codigo=create sle_codigo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_codigo
end on

on w_bus_zona.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_codigo)
end on

event ue_seleccion;call super::ue_seleccion;ist_par.parlong1 = dw_maestro.getitemnumber(dw_maestro.getrow(),'codzona')
ist_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'desc_zona')

CloseWithReturn(this , ist_par)
end event

event ue_postopen;call super::ue_postopen;dw_maestro.SetTransObject(SQLCA)
dw_maestro.retrieve(ist_par.parstring1, '%',	'%')
end event

event resize;//
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_bus_zona
integer x = 1714
integer y = 112
integer height = 92
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_bus_zona
integer x = 302
integer y = 120
integer width = 1353
end type

type cb_4 from w_lov_buscar`cb_4 within w_bus_zona
boolean visible = false
end type

type cb_3 from w_lov_buscar`cb_3 within w_bus_zona
boolean visible = false
end type

type cb_2 from w_lov_buscar`cb_2 within w_bus_zona
boolean visible = false
end type

type cb_1 from w_lov_buscar`cb_1 within w_bus_zona
boolean visible = false
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_bus_zona
integer x = 27
integer y = 216
integer width = 2007
integer height = 1136
string dataobject = "d_bus_zona"
boolean hscrollbar = false
end type

event dw_maestro::ue_retrieve;string ls_codigo, ls_descripcion

ls_codigo = trim(sle_codigo.text)
ls_descripcion = trim(sle_buscar.text)

return this.retrieve('%'+ls_codigo+'%', '%'+ls_descripcion+'%')
end event

event dw_maestro::ue_reset;//
end event

event dw_maestro::ue_resize;//
end event

type st_1 from statictext within w_bus_zona
integer x = 27
integer y = 128
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
string text = "Descripci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_2 from statictext within w_bus_zona
integer x = 27
integer y = 36
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
string text = "Codigo"
boolean focusrectangle = false
end type

type sle_codigo from singlelineedit within w_bus_zona
integer x = 302
integer y = 28
integer width = 466
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

