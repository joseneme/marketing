$PBExportHeader$w_bus_direcciones.srw
$PBExportComments$Objeto Comun Comercial
forward
global type w_bus_direcciones from w_lov_buscar
end type
type st_1 from statictext within w_bus_direcciones
end type
end forward

global type w_bus_direcciones from w_lov_buscar
integer width = 3067
integer height = 1420
string title = "Buscar cliente"
st_1 st_1
end type
global w_bus_direcciones w_bus_direcciones

type variables

end variables

on w_bus_direcciones.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_bus_direcciones.destroy
call super::destroy
destroy(this.st_1)
end on

event ue_seleccion;call super::ue_seleccion;st_par lst_par

	lst_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'usuario')
	lst_par.parstring2 = dw_maestro.getitemstring(dw_maestro.getrow(),'email')
	lst_par.valido = true

	closewithreturn(this,lst_par)

end event

type cb_buscar from w_lov_buscar`cb_buscar within w_bus_direcciones
integer x = 2002
integer y = 152
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_bus_direcciones
integer x = 315
integer y = 160
end type

type cb_4 from w_lov_buscar`cb_4 within w_bus_direcciones
boolean visible = false
integer x = 3150
integer y = 352
end type

type cb_3 from w_lov_buscar`cb_3 within w_bus_direcciones
boolean visible = false
integer x = 2624
integer y = 72
end type

type cb_2 from w_lov_buscar`cb_2 within w_bus_direcciones
integer x = 407
integer y = 36
integer width = 357
end type

type cb_1 from w_lov_buscar`cb_1 within w_bus_direcciones
integer y = 36
integer width = 357
end type

event cb_1::clicked;if dw_maestro.getrow() > 0 then
		parent.trigger event ue_seleccion()
end if

end event

type dw_maestro from w_lov_buscar`dw_maestro within w_bus_direcciones
integer x = 37
integer y = 268
integer width = 2944
integer height = 1008
string dataobject = "d_bus_direcciones"
end type

event dw_maestro::ue_retrieve;return this.retrieve('%'+sle_buscar.text+'%')

end event

type st_1 from statictext within w_bus_direcciones
integer x = 46
integer y = 172
integer width = 238
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
string text = "Nombre"
boolean focusrectangle = false
end type

