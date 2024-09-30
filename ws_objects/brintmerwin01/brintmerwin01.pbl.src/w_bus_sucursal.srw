$PBExportHeader$w_bus_sucursal.srw
forward
global type w_bus_sucursal from w_lov_buscar
end type
type st_1 from statictext within w_bus_sucursal
end type
type st_2 from statictext within w_bus_sucursal
end type
type sle_codigo from singlelineedit within w_bus_sucursal
end type
type cb_5 from commandbutton within w_bus_sucursal
end type
end forward

global type w_bus_sucursal from w_lov_buscar
integer width = 2615
integer height = 1800
string title = "Busqueda de Sucursal"
boolean center = true
st_1 st_1
st_2 st_2
sle_codigo sle_codigo
cb_5 cb_5
end type
global w_bus_sucursal w_bus_sucursal

event ue_postopen;call super::ue_postopen;
sle_buscar.text = ist_par.parstring2
sle_codigo.text = ist_par.parstring1

dw_maestro.retrieve(ist_par.parstring1,'*')
end event

event ue_seleccion;call super::ue_seleccion;if dw_maestro.getrow() < 1 then return
//Ahora se filtrara los tipo Cobranza desde el DW. MAH 31/05/2005
/*if dw_maestro.object.tipsuc[dw_maestro.getrow()] = '0005' and ii_tipo = 1 then
	messagebox(gsNomApl, 'No se puede asociar una sucursal ~n tipo Cobranza al Proyecto', stopsign!)
	return
end if*/

ist_par.valido = true
ist_par.parstring4 = dw_maestro.getitemstring(dw_maestro.getrow(),'CODSUC')
ist_par.parstring5 = dw_maestro.getitemstring(dw_maestro.getrow(),'NOMSUC')
ist_par.parstring6 = dw_maestro.getitemstring(dw_maestro.getrow(),'DIRSUC')
ist_par.parstring7 = dw_maestro.getitemstring(dw_maestro.getrow(),'UBISUC')
ist_par.parstring8 = dw_maestro.getitemstring(dw_maestro.getrow(),'DISTRITO_DESC')
// Datos del cliente. MAH 10/02/2006
ist_par.parstring9 = dw_maestro.getitemstring(dw_maestro.getrow(),'CODCLI')
ist_par.parstring10 = dw_maestro.getitemstring(dw_maestro.getrow(),'NOMCLI')

CloseWithReturn(w_bus_sucursal , ist_par)
end event

on w_bus_sucursal.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.sle_codigo=create sle_codigo
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_codigo
this.Control[iCurrent+4]=this.cb_5
end on

on w_bus_sucursal.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_codigo)
destroy(this.cb_5)
end on

event open;call super::open;sle_codigo.text = ist_par.parstring1
sle_buscar.text = ist_par.parstring2

this.title = 'Sucursales'

dw_maestro.dataobject = 'd_bus_sucursal'

dw_maestro.settransobject(sqlca)
dw_maestro.retrieve(ist_par.parstring1, ist_par.parstring2)

if ii_tipo = 0 then
	sle_codigo.enabled = false
	sle_buscar.enabled = false
	cb_buscar.visible = false
	cb_5.visible = false
end if
end event

event close;call super::close;CloseWithReturn(w_bus_sucursal , ist_par)
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_bus_sucursal
integer x = 2240
integer y = 44
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_bus_sucursal
integer x = 187
integer y = 164
integer width = 1719
integer taborder = 80
end type

type cb_4 from w_lov_buscar`cb_4 within w_bus_sucursal
boolean visible = false
integer taborder = 70
end type

type cb_3 from w_lov_buscar`cb_3 within w_bus_sucursal
boolean visible = false
integer taborder = 60
end type

type cb_2 from w_lov_buscar`cb_2 within w_bus_sucursal
boolean visible = false
integer taborder = 30
end type

type cb_1 from w_lov_buscar`cb_1 within w_bus_sucursal
integer x = 2240
integer y = 152
integer taborder = 20
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_bus_sucursal
integer x = 27
integer y = 280
integer width = 2551
integer height = 1416
integer taborder = 40
string dataobject = "d_bus_sucursal"
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_maestro::ue_retrieve;string ls_codcli  , ls_descli 

ls_codcli = sle_codigo.text
ls_descli = '%'+sle_buscar.text+'%'

if IsNull(ls_codcli) or ls_codcli = '' then ls_codcli = '*'


return dw_maestro.retrieve(ls_codcli,ls_descli)
end event

event dw_maestro::ue_reset;//
end event

type st_1 from statictext within w_bus_sucursal
integer x = 32
integer y = 176
integer width = 160
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
string text = "Cliente"
boolean focusrectangle = false
end type

type st_2 from statictext within w_bus_sucursal
integer x = 32
integer y = 76
integer width = 160
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
string text = "Codigo"
boolean focusrectangle = false
end type

type sle_codigo from singlelineedit within w_bus_sucursal
integer x = 187
integer y = 68
integer width = 361
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_bus_sucursal
integer x = 1920
integer y = 152
integer width = 302
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;
sle_buscar.text = ''
sle_codigo.text = ''
dw_maestro.Reset()
sle_buscar.SetFocus()
end event

