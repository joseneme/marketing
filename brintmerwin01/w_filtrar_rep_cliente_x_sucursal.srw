HA$PBExportHeader$w_filtrar_rep_cliente_x_sucursal.srw
$PBExportComments$Filtro de Consulta~r~nSolicitud de Creaci$$HEX1$$f300$$ENDHEX$$n de Sucursal~r~nCriterios: solicitud, cliente, estado de solicitud
forward
global type w_filtrar_rep_cliente_x_sucursal from window
end type
type dw_situacion from uo_dw_std within w_filtrar_rep_cliente_x_sucursal
end type
type sle_numero from singlelineedit within w_filtrar_rep_cliente_x_sucursal
end type
type dw_segmark from uo_dw_std within w_filtrar_rep_cliente_x_sucursal
end type
type cbx_situacion from checkbox within w_filtrar_rep_cliente_x_sucursal
end type
type sle_via from singlelineedit within w_filtrar_rep_cliente_x_sucursal
end type
type cbx_segmark from checkbox within w_filtrar_rep_cliente_x_sucursal
end type
type cbx_via from checkbox within w_filtrar_rep_cliente_x_sucursal
end type
type cb_2 from commandbutton within w_filtrar_rep_cliente_x_sucursal
end type
type cb_1 from commandbutton within w_filtrar_rep_cliente_x_sucursal
end type
end forward

global type w_filtrar_rep_cliente_x_sucursal from window
integer width = 1906
integer height = 748
boolean titlebar = true
string title = "Buscar por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
dw_situacion dw_situacion
sle_numero sle_numero
dw_segmark dw_segmark
cbx_situacion cbx_situacion
sle_via sle_via
cbx_segmark cbx_segmark
cbx_via cbx_via
cb_2 cb_2
cb_1 cb_1
end type
global w_filtrar_rep_cliente_x_sucursal w_filtrar_rep_cliente_x_sucursal

type variables
datawindowchild idwc_estado, idwc_situacion
end variables

on w_filtrar_rep_cliente_x_sucursal.create
this.dw_situacion=create dw_situacion
this.sle_numero=create sle_numero
this.dw_segmark=create dw_segmark
this.cbx_situacion=create cbx_situacion
this.sle_via=create sle_via
this.cbx_segmark=create cbx_segmark
this.cbx_via=create cbx_via
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_situacion,&
this.sle_numero,&
this.dw_segmark,&
this.cbx_situacion,&
this.sle_via,&
this.cbx_segmark,&
this.cbx_via,&
this.cb_2,&
this.cb_1}
end on

on w_filtrar_rep_cliente_x_sucursal.destroy
destroy(this.dw_situacion)
destroy(this.sle_numero)
destroy(this.dw_segmark)
destroy(this.cbx_situacion)
destroy(this.sle_via)
destroy(this.cbx_segmark)
destroy(this.cbx_via)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_segmark.insertrow(1)
dw_segmark.getchild('segmark',idwc_estado)
idwc_estado.SetTransObject(SQLCA)
idwc_estado.retrieve()

dw_situacion.insertrow(1)
dw_situacion.setitem(dw_situacion.getrow(),'id',1)//para que salga primero consultores

end event

type dw_situacion from uo_dw_std within w_filtrar_rep_cliente_x_sucursal
integer x = 544
integer y = 148
integer width = 699
integer height = 76
integer taborder = 50
boolean enabled = false
string dataobject = "d_fil_sit_cliente"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
boolean auto_ordenar = false
boolean resize_x = false
boolean resize_y = false
end type

type sle_numero from singlelineedit within w_filtrar_rep_cliente_x_sucursal
integer x = 1504
integer y = 32
integer width = 379
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_segmark from uo_dw_std within w_filtrar_rep_cliente_x_sucursal
integer x = 544
integer y = 256
integer width = 878
integer height = 84
integer taborder = 40
string dataobject = "dw_ex_segmark"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
boolean auto_ordenar = false
boolean resize_x = false
boolean resize_y = false
end type

type cbx_situacion from checkbox within w_filtrar_rep_cliente_x_sucursal
integer x = 18
integer y = 144
integer width = 517
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
string text = "Situaci$$HEX1$$f300$$ENDHEX$$n Cliente"
end type

event clicked;dw_situacion.enabled=this.checked
end event

type sle_via from singlelineedit within w_filtrar_rep_cliente_x_sucursal
integer x = 544
integer y = 32
integer width = 951
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
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_segmark from checkbox within w_filtrar_rep_cliente_x_sucursal
integer x = 18
integer y = 256
integer width = 517
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
string text = "Segmento de Venta"
boolean checked = true
end type

event clicked;dw_segmark.enabled=this.checked
end event

type cbx_via from checkbox within w_filtrar_rep_cliente_x_sucursal
integer x = 18
integer y = 32
integer width = 517
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
string text = "V$$HEX1$$ed00$$ENDHEX$$a/ N$$HEX1$$fa00$$ENDHEX$$mero"
end type

event clicked;sle_via.enabled=this.checked
sle_numero.enabled=this.checked

end event

type cb_2 from commandbutton within w_filtrar_rep_cliente_x_sucursal
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
lst_par.parstring1 = '*/*'
lst_par.parstring2 = '*/*'
lst_par.parinteger2 = -1
dw_situacion.setitem(dw_situacion.getrow(),'id',1)
lst_par.parinteger1 = -1

closewithreturn (parent,lst_par)
end event

type cb_1 from commandbutton within w_filtrar_rep_cliente_x_sucursal
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
if cbx_via.checked and sle_via.text<>'' then
	lst_par.parstring1 = sle_via.text + "%"
else
	lst_par.parstring1 = '*'
end if
if cbx_via.checked and sle_numero.text<>'' then
	lst_par.parstring2 = sle_numero.text + "%"
else
	lst_par.parstring2 = '*'
end if
if cbx_situacion.checked and dw_situacion.getrow()>0 then
	lst_par.parinteger2 = dw_situacion.getitemnumber(1,'id')
else
	lst_par.parinteger2 = 1
	dw_situacion.setitem(dw_situacion.getrow(),'id',1)
end if
if cbx_segmark.checked and dw_segmark.getrow()>0 then
	lst_par.parinteger1 = dw_segmark.getitemnumber(1,'segmark')
else
	lst_par.parinteger1 = -1
end if
if len(trim(sle_via.text))<1 and len(trim(sle_numero.text))<1 and &
	( isnull(lst_par.parinteger1) or &
	len(trim(string(lst_par.parinteger1)))<1 ) and &
	( isnull(lst_par.parinteger2) or &
	len(trim(string(lst_par.parinteger2)))<1 ) then
	integer li_resp
	li_resp = MessageBox ( "Filtro de Clientes", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn (parent,lst_par)
end event

