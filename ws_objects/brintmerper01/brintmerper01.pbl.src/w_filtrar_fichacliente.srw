$PBExportHeader$w_filtrar_fichacliente.srw
forward
global type w_filtrar_fichacliente from window
end type
type cb_2 from commandbutton within w_filtrar_fichacliente
end type
type cb_1 from commandbutton within w_filtrar_fichacliente
end type
type sle_documento from singlelineedit within w_filtrar_fichacliente
end type
type cbx_documento from checkbox within w_filtrar_fichacliente
end type
type sle_cliente_nombre from singlelineedit within w_filtrar_fichacliente
end type
type cbx_cliente_nombre from checkbox within w_filtrar_fichacliente
end type
type sle_cliente from singlelineedit within w_filtrar_fichacliente
end type
type cbx_cliente from checkbox within w_filtrar_fichacliente
end type
end forward

global type w_filtrar_fichacliente from window
integer width = 1984
integer height = 656
boolean titlebar = true
string title = "Filtro de Clientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
sle_documento sle_documento
cbx_documento cbx_documento
sle_cliente_nombre sle_cliente_nombre
cbx_cliente_nombre cbx_cliente_nombre
sle_cliente sle_cliente
cbx_cliente cbx_cliente
end type
global w_filtrar_fichacliente w_filtrar_fichacliente

on w_filtrar_fichacliente.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_documento=create sle_documento
this.cbx_documento=create cbx_documento
this.sle_cliente_nombre=create sle_cliente_nombre
this.cbx_cliente_nombre=create cbx_cliente_nombre
this.sle_cliente=create sle_cliente
this.cbx_cliente=create cbx_cliente
this.Control[]={this.cb_2,&
this.cb_1,&
this.sle_documento,&
this.cbx_documento,&
this.sle_cliente_nombre,&
this.cbx_cliente_nombre,&
this.sle_cliente,&
this.cbx_cliente}
end on

on w_filtrar_fichacliente.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_documento)
destroy(this.cbx_documento)
destroy(this.sle_cliente_nombre)
destroy(this.cbx_cliente_nombre)
destroy(this.sle_cliente)
destroy(this.cbx_cliente)
end on

type cb_2 from commandbutton within w_filtrar_fichacliente
integer x = 1010
integer y = 384
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;string ls_filtro = ""
if messagebox(parent.title, "Desea mostrar todos los registros?",question!,yesno!,2)=2 then
	ls_filtro= " AND (vtatabcli.codcli = '%%%') "
end if
closewithreturn(parent,ls_filtro)
end event

type cb_1 from commandbutton within w_filtrar_fichacliente
integer x = 448
integer y = 384
integer width = 402
integer height = 112
integer taborder = 70
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
if cbx_cliente.checked and sle_cliente.text<>'' then
	ls_filtro = " and vtatabcli.codcli LIKE '%"+ sle_cliente.text +"%'"
end if
if cbx_cliente_nombre.checked and sle_cliente_nombre.text<>'' then
	ls_filtro += " and (upper(nomabr) like '%" + sle_cliente_nombre.text + "%'" + &
					 " or upper(nomcli) like '%" + sle_cliente_nombre.text + "%')"
end if
if cbx_documento.checked and sle_documento.text<>'' then
	ls_filtro += " and idficha like  '%" + trim(sle_documento.text) + "%'"
end if
if len(trim(sle_cliente.text))<1 and len(trim(sle_cliente_nombre.text))<1 and &
	len(trim(sle_documento.text))<1 then
	integer li_resp
	li_resp = MessageBox ( parent.title, "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn(parent,ls_filtro)

end event

type sle_documento from singlelineedit within w_filtrar_fichacliente
integer x = 654
integer y = 248
integer width = 379
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

type cbx_documento from checkbox within w_filtrar_fichacliente
integer x = 46
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
string text = "Código de Ficha"
end type

event clicked;sle_documento.enabled=cbx_documento.checked
end event

type sle_cliente_nombre from singlelineedit within w_filtrar_fichacliente
integer x = 654
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

type cbx_cliente_nombre from checkbox within w_filtrar_fichacliente
integer x = 46
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
string text = "Nombre del Cliente"
boolean checked = true
end type

event clicked;sle_cliente_nombre.enabled=cbx_cliente_nombre.checked
end event

type sle_cliente from singlelineedit within w_filtrar_fichacliente
integer x = 654
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

type cbx_cliente from checkbox within w_filtrar_fichacliente
integer x = 46
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
string text = "Código del Cliente"
end type

event clicked;sle_cliente.enabled=cbx_cliente.checked

end event

