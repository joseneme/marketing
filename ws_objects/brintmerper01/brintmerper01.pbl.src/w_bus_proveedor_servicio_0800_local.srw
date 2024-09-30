$PBExportHeader$w_bus_proveedor_servicio_0800_local.srw
forward
global type w_bus_proveedor_servicio_0800_local from w_lov_buscar
end type
type st_1 from statictext within w_bus_proveedor_servicio_0800_local
end type
type cb_5 from commandbutton within w_bus_proveedor_servicio_0800_local
end type
end forward

global type w_bus_proveedor_servicio_0800_local from w_lov_buscar
integer width = 3081
integer height = 1060
string title = "Buscar Data"
boolean center = true
st_1 st_1
cb_5 cb_5
end type
global w_bus_proveedor_servicio_0800_local w_bus_proveedor_servicio_0800_local

type variables

end variables

on w_bus_proveedor_servicio_0800_local.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_5
end on

on w_bus_proveedor_servicio_0800_local.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_5)
end on

event open;call super::open;dw_maestro.SetTransObject(SQLCA)
dw_maestro.retrieve(ist_par.parstring1,13)

end event

event resize;//
end event

event close;call super::close;CloseWithReturn(this, ist_par)


end event

event ue_seleccion;call super::ue_seleccion;integer li_fila, i
datastore lds

if dw_maestro.getrow() > 0 then
 
	dw_maestro.AcceptText()
	
	lds = create datastore
	lds.dataobject = 'dw_retorno_proveedor_servicio'
	lds.SetTransObject(SQLCA)
	ist_par.pards1 = lds
	for i = 1 to dw_maestro.rowcount()
		if dw_maestro.object.flag[i] = '1' then
			li_fila = lds.InsertRow(0)
			ist_par.pards1.object.idsede[li_fila]    		= dw_maestro.object.idsede[i]
			ist_par.pards1.object.idproductomkt[li_fila] 		= dw_maestro.object.idproductomkt[i]
			ist_par.pards1.object.idoperador[li_fila] 	= dw_maestro.object.idoperador[i]
			ist_par.pards1.object.cr_moneda_ext[li_fila] 	= dw_maestro.object.cr_moneda_ext[i]
			ist_par.pards1.object.numlin[li_fila] 			= dw_maestro.object.numlin[i]
			ist_par.pards1.object.fechafin[li_fila]  		= dw_maestro.object.fechafin[i]
			ist_par.pards1.object.idprvsrv[li_fila]      = dw_maestro.object.idprvsrv[i]
		end if
	next
	ist_par.valido = true
	CloseWithReturn(w_bus_proveedor_servicio_0800_local, ist_par)
end if
end event

event ue_postopen;call super::ue_postopen;if dw_maestro.rowcount() = 0 then
	MessageBox(title, 'No se encontraron datos')
	trigger event close()
end if
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 3017
integer y = 36
integer height = 88
boolean enabled = false
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 105
integer y = 36
boolean enabled = false
end type

type cb_4 from w_lov_buscar`cb_4 within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 1106
end type

type cb_3 from w_lov_buscar`cb_3 within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 782
end type

type cb_2 from w_lov_buscar`cb_2 within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 457
end type

type cb_1 from w_lov_buscar`cb_1 within w_bus_proveedor_servicio_0800_local
boolean visible = false
integer x = 133
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_bus_proveedor_servicio_0800_local
integer x = 23
integer y = 144
integer width = 2949
integer height = 684
string dataobject = "d_lis_proveedor_servicio_0800_local"
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_maestro::ue_reset;//
end event

event dw_maestro::ue_retrieve;return dw_maestro.retrieve(ist_par.parstring1,13)

end event

type st_1 from statictext within w_bus_proveedor_servicio_0800_local
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
string text = "Seleccione Data"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_bus_proveedor_servicio_0800_local
integer x = 1216
integer y = 844
integer width = 498
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insertar"
end type

event clicked;Parent.TriggerEvent ('ue_seleccion')
end event

