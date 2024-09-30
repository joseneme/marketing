$PBExportHeader$w_filtro_zona.srw
$PBExportComments$Filtro de Reporte~r~nZona de Venta~r~nCriterios: Tipo de Cliente, zona
forward
global type w_filtro_zona from window
end type
type cbx_potenciales from checkbox within w_filtro_zona
end type
type cbx_actuales from checkbox within w_filtro_zona
end type
type cb_2 from commandbutton within w_filtro_zona
end type
type p_1 from picture within w_filtro_zona
end type
type cb_1 from commandbutton within w_filtro_zona
end type
type dw_1 from datawindow within w_filtro_zona
end type
type gb_1 from groupbox within w_filtro_zona
end type
end forward

global type w_filtro_zona from window
integer width = 1605
integer height = 1620
boolean titlebar = true
string title = "Filtro Clientes por Zona de Venta"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
cbx_potenciales cbx_potenciales
cbx_actuales cbx_actuales
cb_2 cb_2
p_1 p_1
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_filtro_zona w_filtro_zona

type variables
long zona
end variables

on w_filtro_zona.create
this.cbx_potenciales=create cbx_potenciales
this.cbx_actuales=create cbx_actuales
this.cb_2=create cb_2
this.p_1=create p_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cbx_potenciales,&
this.cbx_actuales,&
this.cb_2,&
this.p_1,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_filtro_zona.destroy
destroy(this.cbx_potenciales)
destroy(this.cbx_actuales)
destroy(this.cb_2)
destroy(this.p_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()


end event

type cbx_potenciales from checkbox within w_filtro_zona
integer x = 1042
integer y = 160
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Potenciales"
end type

type cbx_actuales from checkbox within w_filtro_zona
integer x = 654
integer y = 160
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actuales"
end type

type cb_2 from commandbutton within w_filtro_zona
integer x = 850
integer y = 1296
integer width = 421
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;close(w_filtro_zona)
end event

type p_1 from picture within w_filtro_zona
integer x = 41
integer y = 28
integer width = 453
integer height = 320
string picturename = "I:\atttranspa.jpg"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_filtro_zona
integer x = 288
integer y = 1296
integer width = 421
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;window w_ventana
st_par lst_par
w_visor_comun_in w_visor1

lst_par.tipo = 4

if cbx_actuales.checked = true and cbx_potenciales.checked = false then
	lst_par.dw_maestro = 'dw_reporte_zona_actuales'
	lst_par.parinteger1 = zona
   lst_par.titulo = 'Reporte de Clientes Actuales por Zona de Venta'
elseif cbx_actuales.checked = false and cbx_potenciales.checked = true then
   lst_par.dw_maestro = 'dw_reporte_zona_potenciales'
	lst_par.parinteger1 = zona
   lst_par.titulo = 'Reporte de Clientes Potenciales por Zona de Venta'
elseif cbx_actuales.checked = true and cbx_potenciales.checked = true then
   lst_par.dw_maestro = 'dw_reporte_zona'
	lst_par.parinteger1 = zona
   lst_par.titulo = 'Reporte de Clientes por Zona de Venta'
else
	messagebox('Aviso','Seleccione tipo de Cliente')
	return
end if

OpenSheetWithparm (w_ventana, lst_par, "w_visor_comun_in", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

type dw_1 from datawindow within w_filtro_zona
integer x = 37
integer y = 392
integer width = 1486
integer height = 808
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_zona"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;f_select_current_row(this)


end event

event rowfocuschanged;integer li_fila

li_fila = f_select_current_row(this)

dw_1.SetRow(li_fila)

zona = dw_1.getitemnumber(li_fila,'codzona')

end event

type gb_1 from groupbox within w_filtro_zona
integer x = 567
integer y = 44
integer width = 919
integer height = 276
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Cliente"
end type

