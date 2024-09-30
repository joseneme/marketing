$PBExportHeader$w_filtro_edificio.srw
$PBExportComments$Filtro de Reporte~r~nEdificios~r~nLista de edificios
forward
global type w_filtro_edificio from window
end type
type cb_2 from commandbutton within w_filtro_edificio
end type
type cb_1 from commandbutton within w_filtro_edificio
end type
type dw_1 from datawindow within w_filtro_edificio
end type
end forward

global type w_filtro_edificio from window
integer width = 2967
integer height = 1780
boolean titlebar = true
string title = "Edificios Verticales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_filtro_edificio w_filtro_edificio

type variables
long ll_codedi
end variables

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

end event

on w_filtro_edificio.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_filtro_edificio.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_filtro_edificio
integer x = 1531
integer y = 1500
integer width = 402
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;close(w_filtro_edificio)
end event

type cb_1 from commandbutton within w_filtro_edificio
integer x = 1019
integer y = 1500
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Seleccionar"
end type

event clicked;window w_ventana
st_par lst_par
w_visor_comun_in w_visor1

lst_par.tipo = 4
lst_par.dw_maestro = 'dw_reporte_sucursales_x_edificio'
lst_par.parinteger1 = ll_codedi
lst_par.titulo = 'Reporte de Empresas y Sucursales por Edificio'

OpenSheetWithparm (w_ventana, lst_par, "w_visor_comun_in", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

type dw_1 from datawindow within w_filtro_edificio
integer x = 32
integer y = 32
integer width = 2871
integer height = 1408
integer taborder = 10
string title = "none"
string dataobject = "dw_rep_edificio_verticales"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;integer li_fila

li_fila = f_select_current_row(this)

dw_1.SetRow(li_fila)

ll_codedi = dw_1.getitemnumber(li_fila,'codigo')

end event

event itemfocuschanged;f_select_current_row(this)
end event

event doubleclicked;cb_1.triggerevent(clicked!)
end event

