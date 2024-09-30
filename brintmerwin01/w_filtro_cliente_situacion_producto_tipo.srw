HA$PBExportHeader$w_filtro_cliente_situacion_producto_tipo.srw
$PBExportComments$Filtro de Consulta~r~nSolicitud de Creaci$$HEX1$$f300$$ENDHEX$$n de Sucursal~r~nCriterios: solicitud, cliente, estado de solicitud
forward
global type w_filtro_cliente_situacion_producto_tipo from window
end type
type cbx_persona from checkbox within w_filtro_cliente_situacion_producto_tipo
end type
type dw_persona from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
end type
type dw_situacion from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
end type
type dw_producto from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
end type
type cbx_situacion from checkbox within w_filtro_cliente_situacion_producto_tipo
end type
type cbx_producto from checkbox within w_filtro_cliente_situacion_producto_tipo
end type
type cb_2 from commandbutton within w_filtro_cliente_situacion_producto_tipo
end type
type cb_1 from commandbutton within w_filtro_cliente_situacion_producto_tipo
end type
end forward

global type w_filtro_cliente_situacion_producto_tipo from window
integer width = 1550
integer height = 688
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
cbx_persona cbx_persona
dw_persona dw_persona
dw_situacion dw_situacion
dw_producto dw_producto
cbx_situacion cbx_situacion
cbx_producto cbx_producto
cb_2 cb_2
cb_1 cb_1
end type
global w_filtro_cliente_situacion_producto_tipo w_filtro_cliente_situacion_producto_tipo

type variables
datawindowchild idwc_estado, idwc_situacion
end variables

on w_filtro_cliente_situacion_producto_tipo.create
this.cbx_persona=create cbx_persona
this.dw_persona=create dw_persona
this.dw_situacion=create dw_situacion
this.dw_producto=create dw_producto
this.cbx_situacion=create cbx_situacion
this.cbx_producto=create cbx_producto
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cbx_persona,&
this.dw_persona,&
this.dw_situacion,&
this.dw_producto,&
this.cbx_situacion,&
this.cbx_producto,&
this.cb_2,&
this.cb_1}
end on

on w_filtro_cliente_situacion_producto_tipo.destroy
destroy(this.cbx_persona)
destroy(this.dw_persona)
destroy(this.dw_situacion)
destroy(this.dw_producto)
destroy(this.cbx_situacion)
destroy(this.cbx_producto)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_producto.insertrow(1)
dw_producto.getchild('tipsrv',idwc_estado)
idwc_estado.SetTransObject(SQLCA)
idwc_estado.retrieve()

dw_situacion.insertrow(1)
dw_situacion.setitem(dw_situacion.getrow(),'id',1)

dw_persona.insertrow(1)
dw_persona.setitem(dw_persona.getrow(),'tipper',1)

end event

type cbx_persona from checkbox within w_filtro_cliente_situacion_producto_tipo
integer x = 73
integer y = 156
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
string text = "Persona"
end type

event clicked;dw_persona.enabled=this.checked
end event

type dw_persona from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
integer x = 599
integer y = 152
integer width = 699
integer height = 88
integer taborder = 50
boolean enabled = false
string dataobject = "dw_ex_tipo_cliente"
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

type dw_situacion from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
integer x = 599
integer y = 28
integer width = 699
integer height = 84
integer taborder = 50
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

event itemchanged;call super::itemchanged;if data='3' then
	cbx_producto.enabled = false 
	dw_producto.enabled = false 
	dw_producto.object.tipsrv.background.mode = 1
else
	cbx_producto.enabled = true
	dw_producto.enabled = true
	dw_producto.object.tipsrv.background.mode = 0
end if
	
end event

type dw_producto from uo_dw_std within w_filtro_cliente_situacion_producto_tipo
integer x = 599
integer y = 280
integer width = 878
integer height = 88
integer taborder = 40
boolean enabled = false
string dataobject = "dw_ex_tystipsrv"
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

type cbx_situacion from checkbox within w_filtro_cliente_situacion_producto_tipo
integer x = 73
integer y = 28
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
boolean checked = true
end type

event clicked;dw_situacion.enabled=this.checked
end event

type cbx_producto from checkbox within w_filtro_cliente_situacion_producto_tipo
integer x = 73
integer y = 284
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
string text = "Tipo Servicio"
end type

event clicked;dw_producto.enabled=this.checked
end event

type cb_2 from commandbutton within w_filtro_cliente_situacion_producto_tipo
integer x = 782
integer y = 432
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

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_filtro_cliente_situacion_producto_tipo
integer x = 219
integer y = 432
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

event clicked;window w_ventana
st_par lst_par
w_visor_comun_in w_visor1
setpointer(hourglass!)

if cbx_situacion.checked and dw_situacion.getrow()>0 then
	lst_par.parinteger1 = dw_situacion.getitemnumber(1,'id')
elseif not cbx_situacion.checked then
	lst_par.parinteger1 = 4
end if
if cbx_producto.checked and dw_producto.getrow()>0 then
	lst_par.parstring1 = dw_producto.getitemstring(1,'tipsrv')
	lst_par.parstring2 = dw_producto.Describe( "Evaluate('LookUpDisplay(tipsrv) ', 1 )")
elseif not cbx_producto.checked then
	lst_par.parstring1 = '*'
	lst_par.parstring2 = ''
end if
if cbx_persona.checked and dw_persona.getrow()>0 then
	lst_par.parstring3 = dw_persona.getitemstring(1,'tipper')
elseif not cbx_persona.checked then
	lst_par.parstring3 = '*'
end if

if ( isnull(lst_par.parinteger1) or len(trim(string(lst_par.parinteger1)))<1 ) and &
	( isnull(lst_par.parstring1) or len(trim(lst_par.parstring1))<1 ) and & 
	( isnull(lst_par.parstring3) or len(trim(lst_par.parstring3))<1 ) then
	integer li_resp
	li_resp = MessageBox ( "Filtro de Clientes", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

if cbx_producto.enabled then
	if gsPais='BRA' then 
		lst_par.dw_maestro = 'dw_rep_servicio_x_contacto_x_cliente_br1'
	elseif  gsPais='PER' then 
		lst_par.dw_maestro = 'dw_rep_servicio_x_contacto_x_cliente_pe1'
	end if
else
	if gsPais='BRA' then 
		lst_par.dw_maestro = 'dw_rep_servicio_x_contacto_x_cliente_br2'
	elseif gsPais='PER' then 
		lst_par.dw_maestro = 'dw_rep_servicio_x_contacto_x_cliente_pe2'
	end if
end if
lst_par.tipo = 31
lst_par.titulo = 'Clientes por Servicio'

OpenSheetWithparm (w_ventana, lst_par, "w_visor_comun_in", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

