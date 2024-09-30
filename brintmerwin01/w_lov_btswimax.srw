HA$PBExportHeader$w_lov_btswimax.srw
forward
global type w_lov_btswimax from w_lov_cliente
end type
type st_2 from statictext within w_lov_btswimax
end type
type sle_nrobts from singlelineedit within w_lov_btswimax
end type
end forward

global type w_lov_btswimax from w_lov_cliente
integer width = 1623
integer height = 1276
st_2 st_2
sle_nrobts sle_nrobts
end type
global w_lov_btswimax w_lov_btswimax

type variables
string is_codcliente
string is_descliente
end variables

on w_lov_btswimax.create
int iCurrent
call super::create
this.st_2=create st_2
this.sle_nrobts=create sle_nrobts
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.sle_nrobts
end on

on w_lov_btswimax.destroy
call super::destroy
destroy(this.st_2)
destroy(this.sle_nrobts)
end on

event open;call super::open;SetNull(is_codcliente)
SetNull(is_descliente)

sle_nrobts.setfocus()

dw_maestro.dataobject='d_lov_btswimax'
end event

event ue_seleccion;// se valida  si se tiene acceso al ejecutivo


if dw_maestro.getrow() < 1 then return

ist_par.valido = true
ist_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'ubicacion')
ist_par.parstring2 = dw_maestro.getitemstring(dw_maestro.getrow(),'cobertura')
ist_par.parlong1 = dw_maestro.getitemnumber(dw_maestro.getrow(),'mnnacional')


//lst_par.parstring3 = ls_codigo
closewithreturn(this,ist_par)






end event

event close;call super::close;closewithreturn(this,ist_par)
end event

type cb_buscar from w_lov_cliente`cb_buscar within w_lov_btswimax
integer x = 1266
integer y = 28
integer taborder = 30
end type

event cb_buscar::clicked;

parent.post event ue_cargar()
sle_buscar.setfocus()
sle_buscar.SelectText(1, Len(sle_buscar.Text))	
	
return 1	




end event

type sle_buscar from w_lov_cliente`sle_buscar within w_lov_btswimax
integer y = 36
integer width = 896
integer taborder = 20
end type

type cb_4 from w_lov_cliente`cb_4 within w_lov_btswimax
integer x = 2130
integer y = 8
integer taborder = 0
end type

type cb_3 from w_lov_cliente`cb_3 within w_lov_btswimax
integer x = 1902
integer y = 8
integer taborder = 0
end type

type cb_2 from w_lov_cliente`cb_2 within w_lov_btswimax
boolean visible = false
integer x = 2373
integer y = 0
integer width = 265
integer taborder = 0
end type

type cb_1 from w_lov_cliente`cb_1 within w_lov_btswimax
boolean visible = false
integer x = 1746
integer y = 0
integer taborder = 0
end type

type dw_maestro from w_lov_cliente`dw_maestro within w_lov_btswimax
integer x = 18
integer y = 148
integer width = 1563
integer taborder = 50
string dataobject = "d_lov_btswimax"
end type

event dw_maestro::ue_retrieve;
//this.dataobject = 'd_lov_clienteslc_nef'
this.settransobject(sqlca)

//this.retrieve('%'+trim(upper(sle_buscar.text))+'%')	
//MI20070522 comentar retrieve anterior, se agrega filtro por codsuc.
this.retrieve('%'+trim(upper(sle_buscar.text))+'%', ist_par.parstring3)	

//this.settransobject(sqlca)
//this.retrieve(is_codcliente,is_descliente)
return 1 
end event

type cb_5 from w_lov_cliente`cb_5 within w_lov_btswimax
boolean visible = false
integer x = 1618
integer y = 28
integer taborder = 0
end type

type dw_int from w_lov_cliente`dw_int within w_lov_btswimax
integer x = 14
integer y = 272
integer taborder = 40
string dataobject = ""
end type

type st_1 from w_lov_cliente`st_1 within w_lov_btswimax
integer y = 48
string text = "BTS"
end type

type st_2 from statictext within w_lov_btswimax
integer x = 2784
integer y = 944
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
string text = "Nro. BTS"
boolean focusrectangle = false
end type

type sle_nrobts from singlelineedit within w_lov_btswimax
integer x = 3058
integer y = 924
integer width = 384
integer height = 80
integer taborder = 10
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

