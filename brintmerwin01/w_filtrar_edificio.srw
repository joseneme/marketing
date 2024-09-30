HA$PBExportHeader$w_filtrar_edificio.srw
$PBExportComments$Filtro de Consulta~r~nEdificio~r~nCriterios: codigo edificio, nombre del edificio, distrito
forward
global type w_filtrar_edificio from window
end type
type cbx_edificio_nombre from checkbox within w_filtrar_edificio
end type
type sle_edificio_nombre from singlelineedit within w_filtrar_edificio
end type
type sle_distrito from singlelineedit within w_filtrar_edificio
end type
type sle_codigo from singlelineedit within w_filtrar_edificio
end type
type cbx_distrito from checkbox within w_filtrar_edificio
end type
type cbx_codigo from checkbox within w_filtrar_edificio
end type
type cb_2 from commandbutton within w_filtrar_edificio
end type
type cb_1 from commandbutton within w_filtrar_edificio
end type
end forward

global type w_filtrar_edificio from window
integer width = 1906
integer height = 748
boolean titlebar = true
string title = "Buscar por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cbx_edificio_nombre cbx_edificio_nombre
sle_edificio_nombre sle_edificio_nombre
sle_distrito sle_distrito
sle_codigo sle_codigo
cbx_distrito cbx_distrito
cbx_codigo cbx_codigo
cb_2 cb_2
cb_1 cb_1
end type
global w_filtrar_edificio w_filtrar_edificio

on w_filtrar_edificio.create
this.cbx_edificio_nombre=create cbx_edificio_nombre
this.sle_edificio_nombre=create sle_edificio_nombre
this.sle_distrito=create sle_distrito
this.sle_codigo=create sle_codigo
this.cbx_distrito=create cbx_distrito
this.cbx_codigo=create cbx_codigo
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cbx_edificio_nombre,&
this.sle_edificio_nombre,&
this.sle_distrito,&
this.sle_codigo,&
this.cbx_distrito,&
this.cbx_codigo,&
this.cb_2,&
this.cb_1}
end on

on w_filtrar_edificio.destroy
destroy(this.cbx_edificio_nombre)
destroy(this.sle_edificio_nombre)
destroy(this.sle_distrito)
destroy(this.sle_codigo)
destroy(this.cbx_distrito)
destroy(this.cbx_codigo)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cbx_edificio_nombre from checkbox within w_filtrar_edificio
integer x = 18
integer y = 140
integer width = 585
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Nombre del Edificio"
boolean checked = true
end type

event clicked;sle_edificio_nombre.enabled=cbx_edificio_nombre.checked
end event

type sle_edificio_nombre from singlelineedit within w_filtrar_edificio
integer x = 626
integer y = 140
integer width = 1248
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_distrito from singlelineedit within w_filtrar_edificio
integer x = 626
integer y = 248
integer width = 635
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_codigo from singlelineedit within w_filtrar_edificio
integer x = 626
integer y = 32
integer width = 379
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_distrito from checkbox within w_filtrar_edificio
integer x = 18
integer y = 248
integer width = 585
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Distrito"
end type

event clicked;sle_distrito.enabled=cbx_distrito.checked
end event

type cbx_codigo from checkbox within w_filtrar_edificio
integer x = 18
integer y = 32
integer width = 585
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "C$$HEX1$$f300$$ENDHEX$$digo del Edificio"
end type

event clicked;sle_codigo.enabled=cbx_codigo.checked

end event

type cb_2 from commandbutton within w_filtrar_edificio
integer x = 983
integer y = 496
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;string ls_filtro = ""
if messagebox( "B$$HEX1$$fa00$$ENDHEX$$squeda de Edificio", "Desea mostrar todos los registros?",question!,yesno!,2)=2 then
	ls_filtro= " AND (edificio.codigo = -199) "
end if
closewithreturn(parent,ls_filtro)
end event

type cb_1 from commandbutton within w_filtrar_edificio
integer x = 421
integer y = 496
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string ls_filtro = ""
boolean lb_where = false
if cbx_codigo.checked and sle_codigo.text<>'' then
	ls_filtro = " and edificio.codigo = '"+sle_codigo.text +"'"
end if
if cbx_edificio_nombre.checked and sle_edificio_nombre.text<>'' then
	ls_filtro += " and upper(nombre) like '%" + sle_edificio_nombre.text + "%'"
end if
if cbx_distrito.checked and sle_distrito.text<>'' then
	ls_filtro += " and nomdst like '%" + sle_distrito.text + "%'"
end if
if len(trim(sle_codigo.text))<1 and len(trim(sle_edificio_nombre.text))<1 and &
	len(trim(sle_distrito.text))<1 then
	integer li_resp
	li_resp = MessageBox ( "B$$HEX1$$fa00$$ENDHEX$$squeda de Edificio", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if
closewithreturn (parent,ls_filtro)

end event

