HA$PBExportHeader$w_bus_sede.srw
forward
global type w_bus_sede from w_lov_buscar
end type
type st_1 from statictext within w_bus_sede
end type
end forward

global type w_bus_sede from w_lov_buscar
integer width = 823
integer height = 936
string title = "Buscar Sede"
boolean center = true
st_1 st_1
end type
global w_bus_sede w_bus_sede

type variables

end variables

on w_bus_sede.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_bus_sede.destroy
call super::destroy
destroy(this.st_1)
end on

event open;call super::open;dw_maestro.SetTransObject(SQLCA)
dw_maestro.retrieve(ist_par.parstring1)

end event

event resize;//
end event

event close;call super::close;CloseWithReturn(this, ist_par)


end event

event ue_seleccion;call super::ue_seleccion;if dw_maestro.getrow() = 0 then return
ist_par.parlong1 = dw_maestro.object.idsede[dw_maestro.getrow()]
//ist_par.parstring1 = dw_maestro.object.descripcion[dw_maestro.getrow()]
ist_par.valido = true 
CloseWithReturn(this, ist_par)

end event

event ue_postopen;call super::ue_postopen;if dw_maestro.rowcount() = 0 then
	MessageBox(title, 'No se encontraron datos')
	trigger event close()
end if
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_bus_sede
boolean visible = false
integer x = 3017
integer y = 36
integer height = 88
boolean enabled = false
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_bus_sede
boolean visible = false
integer x = 105
integer y = 36
boolean enabled = false
end type

type cb_4 from w_lov_buscar`cb_4 within w_bus_sede
boolean visible = false
integer x = 1106
end type

type cb_3 from w_lov_buscar`cb_3 within w_bus_sede
boolean visible = false
integer x = 782
end type

type cb_2 from w_lov_buscar`cb_2 within w_bus_sede
boolean visible = false
integer x = 457
end type

type cb_1 from w_lov_buscar`cb_1 within w_bus_sede
boolean visible = false
integer x = 133
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_bus_sede
integer x = 23
integer y = 144
integer width = 731
integer height = 684
string dataobject = "dddw_tiposede"
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_maestro::ue_reset;//
end event

event dw_maestro::ue_retrieve;return dw_maestro.retrieve(ist_par.parstring1)

end event

type st_1 from statictext within w_bus_sede
integer x = 41
integer y = 52
integer width = 837
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
string text = "Seleccione Sede"
boolean focusrectangle = false
end type

