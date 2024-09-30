HA$PBExportHeader$w_filtrar_rep_contacto_x_sucursal.srw
$PBExportComments$Filtro de Consulta~r~nSolicitud de Creaci$$HEX1$$f300$$ENDHEX$$n de Sucursal~r~nCriterios: solicitud, cliente, estado de solicitud
forward
global type w_filtrar_rep_contacto_x_sucursal from window
end type
type sle_codsuc from singlelineedit within w_filtrar_rep_contacto_x_sucursal
end type
type cbx_nomsuc from checkbox within w_filtrar_rep_contacto_x_sucursal
end type
type sle_nomsuc from singlelineedit within w_filtrar_rep_contacto_x_sucursal
end type
type sle_nomcli from singlelineedit within w_filtrar_rep_contacto_x_sucursal
end type
type cbx_codsuc from checkbox within w_filtrar_rep_contacto_x_sucursal
end type
type cbx_nomcli from checkbox within w_filtrar_rep_contacto_x_sucursal
end type
type cb_2 from commandbutton within w_filtrar_rep_contacto_x_sucursal
end type
type cb_1 from commandbutton within w_filtrar_rep_contacto_x_sucursal
end type
end forward

global type w_filtrar_rep_contacto_x_sucursal from window
integer width = 1906
integer height = 748
boolean titlebar = true
string title = "Buscar por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
sle_codsuc sle_codsuc
cbx_nomsuc cbx_nomsuc
sle_nomsuc sle_nomsuc
sle_nomcli sle_nomcli
cbx_codsuc cbx_codsuc
cbx_nomcli cbx_nomcli
cb_2 cb_2
cb_1 cb_1
end type
global w_filtrar_rep_contacto_x_sucursal w_filtrar_rep_contacto_x_sucursal

type variables
datawindowchild idwc_estado
end variables

on w_filtrar_rep_contacto_x_sucursal.create
this.sle_codsuc=create sle_codsuc
this.cbx_nomsuc=create cbx_nomsuc
this.sle_nomsuc=create sle_nomsuc
this.sle_nomcli=create sle_nomcli
this.cbx_codsuc=create cbx_codsuc
this.cbx_nomcli=create cbx_nomcli
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.sle_codsuc,&
this.cbx_nomsuc,&
this.sle_nomsuc,&
this.sle_nomcli,&
this.cbx_codsuc,&
this.cbx_nomcli,&
this.cb_2,&
this.cb_1}
end on

on w_filtrar_rep_contacto_x_sucursal.destroy
destroy(this.sle_codsuc)
destroy(this.cbx_nomsuc)
destroy(this.sle_nomsuc)
destroy(this.sle_nomcli)
destroy(this.cbx_codsuc)
destroy(this.cbx_nomcli)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type sle_codsuc from singlelineedit within w_filtrar_rep_contacto_x_sucursal
integer x = 626
integer y = 256
integer width = 402
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_nomsuc from checkbox within w_filtrar_rep_contacto_x_sucursal
integer x = 18
integer y = 144
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
string text = "Nombre de Sucursal"
end type

event clicked;sle_nomsuc.enabled=this.checked
end event

type sle_nomsuc from singlelineedit within w_filtrar_rep_contacto_x_sucursal
integer x = 626
integer y = 144
integer width = 1243
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_nomcli from singlelineedit within w_filtrar_rep_contacto_x_sucursal
integer x = 626
integer y = 32
integer width = 1243
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_codsuc from checkbox within w_filtrar_rep_contacto_x_sucursal
integer x = 18
integer y = 256
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
string text = "C$$HEX1$$f300$$ENDHEX$$digo de Sucursal"
end type

event clicked;sle_codsuc.enabled=this.checked
end event

type cbx_nomcli from checkbox within w_filtrar_rep_contacto_x_sucursal
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
string text = "Nombre de Cliente"
boolean checked = true
end type

event clicked;sle_nomcli.enabled=this.checked

end event

type cb_2 from commandbutton within w_filtrar_rep_contacto_x_sucursal
integer x = 983
integer y = 452
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

event clicked;st_par lst_par
if messagebox( "Filtro de Contactos", "Desea mostrar todos los registros?" ,question!,yesno!,2)=2 then
	lst_par.parstring1 = '*/*'
	lst_par.parstring2 = '*/*'
	lst_par.parstring3 = '*/*'
else
	lst_par.parstring1 = '*'
	lst_par.parstring2 = '*'
	lst_par.parstring3 = '*'
end if
closewithreturn (parent,lst_par)

end event

type cb_1 from commandbutton within w_filtrar_rep_contacto_x_sucursal
integer x = 421
integer y = 452
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

event clicked;st_par lst_par
if cbx_nomcli.checked and sle_nomcli.text<>'' then
	lst_par.parstring1 = sle_nomcli.text + "%"
else
	lst_par.parstring1 = '*'
end if
if cbx_nomsuc.checked and sle_nomsuc.text<>'' then
	lst_par.parstring2 = sle_nomsuc.text + "%"
else
	lst_par.parstring2 = '*'
end if
if cbx_codsuc.checked and sle_codsuc.text<>'' then
	lst_par.parstring3 = '%' + sle_codsuc.text + '%'
else
	lst_par.parstring3 = '*'
end if
if (len(trim(sle_nomcli.text))<1 and len(trim(sle_nomsuc.text))<1 and &
	len(trim(sle_codsuc.text))<1 ) or (lst_par.parstring1 = '*' and lst_par.parstring2 = '*' and &
	lst_par.parstring3 = '*') then
	integer li_resp
	li_resp = MessageBox ( "Filtro de Contactos", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn (parent,lst_par)
end event

