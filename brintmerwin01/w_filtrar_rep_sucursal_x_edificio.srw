HA$PBExportHeader$w_filtrar_rep_sucursal_x_edificio.srw
$PBExportComments$Filtro de Consulta~r~nSolicitud de Creaci$$HEX1$$f300$$ENDHEX$$n de Sucursal~r~nCriterios: solicitud, cliente, estado de solicitud
forward
global type w_filtrar_rep_sucursal_x_edificio from window
end type
type sle_numero from singlelineedit within w_filtrar_rep_sucursal_x_edificio
end type
type dw_estado from uo_dw_std within w_filtrar_rep_sucursal_x_edificio
end type
type cbx_ciudad from checkbox within w_filtrar_rep_sucursal_x_edificio
end type
type sle_ciudad from singlelineedit within w_filtrar_rep_sucursal_x_edificio
end type
type sle_via from singlelineedit within w_filtrar_rep_sucursal_x_edificio
end type
type cbx_estado_activacion from checkbox within w_filtrar_rep_sucursal_x_edificio
end type
type cbx_via from checkbox within w_filtrar_rep_sucursal_x_edificio
end type
type cb_2 from commandbutton within w_filtrar_rep_sucursal_x_edificio
end type
type cb_1 from commandbutton within w_filtrar_rep_sucursal_x_edificio
end type
end forward

global type w_filtrar_rep_sucursal_x_edificio from window
integer width = 1906
integer height = 748
boolean titlebar = true
string title = "Buscar por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
sle_numero sle_numero
dw_estado dw_estado
cbx_ciudad cbx_ciudad
sle_ciudad sle_ciudad
sle_via sle_via
cbx_estado_activacion cbx_estado_activacion
cbx_via cbx_via
cb_2 cb_2
cb_1 cb_1
end type
global w_filtrar_rep_sucursal_x_edificio w_filtrar_rep_sucursal_x_edificio

type variables
datawindowchild idwc_estado
end variables

on w_filtrar_rep_sucursal_x_edificio.create
this.sle_numero=create sle_numero
this.dw_estado=create dw_estado
this.cbx_ciudad=create cbx_ciudad
this.sle_ciudad=create sle_ciudad
this.sle_via=create sle_via
this.cbx_estado_activacion=create cbx_estado_activacion
this.cbx_via=create cbx_via
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.sle_numero,&
this.dw_estado,&
this.cbx_ciudad,&
this.sle_ciudad,&
this.sle_via,&
this.cbx_estado_activacion,&
this.cbx_via,&
this.cb_2,&
this.cb_1}
end on

on w_filtrar_rep_sucursal_x_edificio.destroy
destroy(this.sle_numero)
destroy(this.dw_estado)
destroy(this.cbx_ciudad)
destroy(this.sle_ciudad)
destroy(this.sle_via)
destroy(this.cbx_estado_activacion)
destroy(this.cbx_via)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_estado.insertrow(1)
dw_estado.getchild('estatus',idwc_estado)
idwc_estado.SetTransObject(SQLCA)
idwc_estado.retrieve()


end event

type sle_numero from singlelineedit within w_filtrar_rep_sucursal_x_edificio
integer x = 1490
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

type dw_estado from uo_dw_std within w_filtrar_rep_sucursal_x_edificio
integer x = 512
integer y = 256
integer width = 878
integer height = 84
integer taborder = 40
string dataobject = "dw_ex_estatus_activacion"
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

type cbx_ciudad from checkbox within w_filtrar_rep_sucursal_x_edificio
integer x = 18
integer y = 144
integer width = 494
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
string text = "Ciudad"
end type

event clicked;sle_ciudad.enabled=this.checked
end event

type sle_ciudad from singlelineedit within w_filtrar_rep_sucursal_x_edificio
integer x = 512
integer y = 144
integer width = 951
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

type sle_via from singlelineedit within w_filtrar_rep_sucursal_x_edificio
integer x = 512
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

type cbx_estado_activacion from checkbox within w_filtrar_rep_sucursal_x_edificio
integer x = 18
integer y = 256
integer width = 494
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
string text = "Estado Activaci$$HEX1$$f300$$ENDHEX$$n"
boolean checked = true
end type

event clicked;dw_estado.enabled=this.checked
end event

type cbx_via from checkbox within w_filtrar_rep_sucursal_x_edificio
integer x = 18
integer y = 32
integer width = 494
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

type cb_2 from commandbutton within w_filtrar_rep_sucursal_x_edificio
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
if messagebox('Confirme','Desea listar todos.',question!,yesno!,2)=2 then
	lst_par.parstring1 = '*/*'
	lst_par.parstring3 = '*/*'
	lst_par.parstring2 = '*/*'
	lst_par.parinteger1 = -2
else
	lst_par.parstring1 = '*'
	lst_par.parstring3 = '*'
	lst_par.parstring2 = '*'
	lst_par.parinteger1 = -1
end if
closewithreturn (parent,lst_par)

end event

type cb_1 from commandbutton within w_filtrar_rep_sucursal_x_edificio
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
	lst_par.parstring3 = sle_numero.text + "%"
else
	lst_par.parstring3 = '*'
end if
if cbx_ciudad.checked and sle_ciudad.text<>'' then
	lst_par.parstring2 = sle_ciudad.text + "%"
else
	lst_par.parstring2 = '*'
end if
if cbx_estado_activacion.checked and dw_estado.getrow()>0 then
	lst_par.parinteger1 = dw_estado.getitemnumber(1,'estatus')
else
	lst_par.parinteger1 = -1
end if
if len(trim(sle_via.text))<1 and len(trim(sle_numero.text))<1 and len(trim(sle_ciudad.text))<1 and &
	lst_par.parinteger1 = -1 then
	integer li_resp
	li_resp = MessageBox ( "Filtro de Edificios", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if
closewithreturn (parent,lst_par)
end event

