HA$PBExportHeader$w_lov_provincia.srw
$PBExportComments$Busqueda de Provincia
forward
global type w_lov_provincia from w_lov_buscar
end type
type st_1 from statictext within w_lov_provincia
end type
type st_2 from statictext within w_lov_provincia
end type
type sle_codigo from singlelineedit within w_lov_provincia
end type
end forward

global type w_lov_provincia from w_lov_buscar
integer width = 1865
integer height = 1508
string title = "Buscar Pais"
boolean center = true
st_1 st_1
st_2 st_2
sle_codigo sle_codigo
end type
global w_lov_provincia w_lov_provincia

on w_lov_provincia.create
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

on w_lov_provincia.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_codigo)
end on

event ue_seleccion;call super::ue_seleccion;ist_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'codpvc')
ist_par.parstring2 = dw_maestro.getitemstring(dw_maestro.getrow(),'codest')
ist_par.parstring3 = dw_maestro.getitemstring(dw_maestro.getrow(),'codpai')
ist_par.parstring4 = dw_maestro.getitemstring(dw_maestro.getrow(),'desc_provincia')

CloseWithReturn(this , ist_par)
end event

event ue_postopen;call super::ue_postopen;dw_maestro.SetTransObject(SQLCA)
dw_maestro.retrieve(ist_par.parstring1, '%',	'%')
end event

event resize;//
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_lov_provincia
integer x = 1499
integer y = 112
integer height = 92
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_lov_provincia
integer x = 302
integer y = 120
integer width = 1138
end type

type cb_4 from w_lov_buscar`cb_4 within w_lov_provincia
boolean visible = false
end type

type cb_3 from w_lov_buscar`cb_3 within w_lov_provincia
boolean visible = false
end type

type cb_2 from w_lov_buscar`cb_2 within w_lov_provincia
boolean visible = false
end type

type cb_1 from w_lov_buscar`cb_1 within w_lov_provincia
boolean visible = false
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_lov_provincia
integer x = 27
integer y = 216
integer width = 1783
integer height = 1136
string dataobject = "d_lov_provincia"
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

type st_1 from statictext within w_lov_provincia
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

type st_2 from statictext within w_lov_provincia
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

type sle_codigo from singlelineedit within w_lov_provincia
integer x = 302
integer y = 28
integer width = 357
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

