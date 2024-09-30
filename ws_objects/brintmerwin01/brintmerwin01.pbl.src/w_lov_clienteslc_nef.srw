$PBExportHeader$w_lov_clienteslc_nef.srw
$PBExportComments$filtro de clientes-edwin
forward
global type w_lov_clienteslc_nef from w_lov_buscar
end type
type sle_buscar3 from singlelineedit within w_lov_clienteslc_nef
end type
type st_2 from statictext within w_lov_clienteslc_nef
end type
type st_1 from statictext within w_lov_clienteslc_nef
end type
type st_3 from statictext within w_lov_clienteslc_nef
end type
type sle_buscar2 from singlelineedit within w_lov_clienteslc_nef
end type
type sle_buscar4 from singlelineedit within w_lov_clienteslc_nef
end type
type st_4 from statictext within w_lov_clienteslc_nef
end type
end forward

global type w_lov_clienteslc_nef from w_lov_buscar
integer width = 4338
integer height = 1800
string title = "Buscar Cliente"
boolean center = true
sle_buscar3 sle_buscar3
st_2 st_2
st_1 st_1
st_3 st_3
sle_buscar2 sle_buscar2
sle_buscar4 sle_buscar4
st_4 st_4
end type
global w_lov_clienteslc_nef w_lov_clienteslc_nef

type variables

end variables

on w_lov_clienteslc_nef.create
int iCurrent
call super::create
this.sle_buscar3=create sle_buscar3
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.sle_buscar2=create sle_buscar2
this.sle_buscar4=create sle_buscar4
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_buscar3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.sle_buscar2
this.Control[iCurrent+6]=this.sle_buscar4
this.Control[iCurrent+7]=this.st_4
end on

on w_lov_clienteslc_nef.destroy
call super::destroy
destroy(this.sle_buscar3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.sle_buscar2)
destroy(this.sle_buscar4)
destroy(this.st_4)
end on

event ue_seleccion;call super::ue_seleccion;string ls_proyecto, ls_codect
long ll_permiso, ll_fila

ll_fila = dw_maestro.getrow()
if ll_fila <1 then return
ls_codect = dw_maestro.getitemstring(ll_fila,'codect')


select count(*) into :ll_permiso from vtatabusuect where codect = :ls_codect and upper(trim(usuario)) = upper(trim(user));

if ll_permiso > 0 then
	ist_par.parstring1 = dw_maestro.getitemstring(ll_fila,'codcli')
	ist_par.parstring2 = dw_maestro.getitemstring(ll_fila,'nomcli')
	ist_par.parstring3 = dw_maestro.getitemstring(ll_fila,'tipdide')
	ist_par.parstring4 = dw_maestro.getitemstring(ll_fila,'ntdide')
	ist_par.parstring5 = ls_codect
	ist_par.parstring6 = dw_maestro.getitemstring(ll_fila,'login')
	ist_par.valido		 = true
	closewithreturn(this,ist_par)
else 
	messagebox('Aviso','Usted no tiene acceso a este cliente')
	return
end if
end event

event open;call super::open;// usado en registro actividades
//if ii_tipo = 1 then
//	dw_maestro.dataobject = 'd_bus_clientes_ruc'
//	dw_maestro.SetTransObject(SQLCA)
//end if

this.title = 'Clientes'

dw_maestro.dataobject = 'd_lov_clienteslc_nef'
dw_maestro.SetTransObject(SQLCA)
end event

event close;call super::close;closewithreturn(this,ist_par)
end event

type cb_buscar from w_lov_buscar`cb_buscar within w_lov_clienteslc_nef
integer x = 3781
integer y = 116
integer width = 357
end type

event cb_buscar::clicked;
//
//dw_maestro.dataobject = 'd_lov_clienteslc_nef'
//dw_maestro.SetTransObject(SQLCA)

if sle_buscar.text = '' and sle_buscar2.text = '' and sle_buscar3.text = '' and sle_buscar4.text = '' then
	if messagebox('Confirme','Desea listar todos los clientes',question!,yesno!,2) = 2 then
		sle_buscar.setfocus()
		return
	end if
end if
sle_buscar.setfocus()
sle_buscar.SelectText(1, Len(sle_buscar.Text))
parent.post event ue_cargar()
end event

type sle_buscar from w_lov_buscar`sle_buscar within w_lov_clienteslc_nef
integer x = 256
integer y = 124
integer width = 1509
end type

type cb_4 from w_lov_buscar`cb_4 within w_lov_clienteslc_nef
boolean visible = false
integer x = 1879
integer y = 0
end type

type cb_3 from w_lov_buscar`cb_3 within w_lov_clienteslc_nef
boolean visible = false
integer x = 1888
integer y = 8
end type

type cb_2 from w_lov_buscar`cb_2 within w_lov_clienteslc_nef
boolean visible = false
integer x = 1961
integer y = 0
end type

type cb_1 from w_lov_buscar`cb_1 within w_lov_clienteslc_nef
integer x = 3781
integer y = 8
integer width = 357
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_lov_clienteslc_nef
integer x = 0
integer y = 236
integer width = 4297
integer height = 1464
string dataobject = "d_lov_clienteslc_nef"
end type

event dw_maestro::ue_retrieve;long ln_flag = 1

// Filtro Nro de Servicio
// 1 filtrar por Nro servicio
// 0 no filtrar

this.dataobject = 'd_lov_clienteslc_nef'
this.settransobject(sqlca)
this.retrieve('%'+trim(upper(sle_buscar2.text))+'%', '%'+trim(upper(sle_buscar3.text))+'%','%'+trim(upper(sle_buscar.text))+'%','%'+trim(upper(sle_buscar3.text))+'%',0)	

return 1 

end event

type sle_buscar3 from singlelineedit within w_lov_clienteslc_nef
integer x = 2231
integer y = 124
integer width = 507
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_lov_clienteslc_nef
integer x = 78
integer y = 36
integer width = 160
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Codigo"
boolean focusrectangle = false
end type

type st_1 from statictext within w_lov_clienteslc_nef
integer x = 82
integer y = 140
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Cliente"
boolean focusrectangle = false
end type

type st_3 from statictext within w_lov_clienteslc_nef
integer x = 1879
integer y = 140
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Documento.:"
boolean focusrectangle = false
end type

type sle_buscar2 from singlelineedit within w_lov_clienteslc_nef
integer x = 256
integer y = 24
integer width = 361
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_buscar4 from singlelineedit within w_lov_clienteslc_nef
integer x = 2231
integer y = 24
integer width = 507
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_lov_clienteslc_nef
integer x = 1879
integer y = 36
integer width = 329
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Nro Servicio.:"
boolean focusrectangle = false
end type

