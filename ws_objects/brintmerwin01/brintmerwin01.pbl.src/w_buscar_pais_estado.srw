$PBExportHeader$w_buscar_pais_estado.srw
$PBExportComments$Ventana de Busqueda~r~nTabla de Clientes~r~nCriterios: Nombres, Codigo, Documento
forward
global type w_buscar_pais_estado from window
end type
type cb_2 from commandbutton within w_buscar_pais_estado
end type
type cb_1 from commandbutton within w_buscar_pais_estado
end type
type st_2 from statictext within w_buscar_pais_estado
end type
type st_1 from statictext within w_buscar_pais_estado
end type
type sle_2 from singlelineedit within w_buscar_pais_estado
end type
type sle_1 from singlelineedit within w_buscar_pais_estado
end type
type gb_1 from groupbox within w_buscar_pais_estado
end type
type dw_1 from datawindow within w_buscar_pais_estado
end type
end forward

global type w_buscar_pais_estado from window
integer width = 2459
integer height = 1544
boolean titlebar = true
string title = "Búsqueda de Cargos "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_2 sle_2
sle_1 sle_1
gb_1 gb_1
dw_1 dw_1
end type
global w_buscar_pais_estado w_buscar_pais_estado

type variables
integer ii_pos_x=30
integer ii_pos_y=30
string is_sql
st_par ist_par_busca
end variables

on w_buscar_pais_estado.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.sle_2,&
this.sle_1,&
this.gb_1,&
this.dw_1}
end on

on w_buscar_pais_estado.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
is_sql = dw_1.GetSQLSelect()

ist_par_busca = message.powerobjectparm
if isvalid(ist_par_busca) then
	sle_1.text = ist_par_busca.parstring3
	sle_2.text = ist_par_busca.parstring4
end if
end event

event resize;dw_1.x = ii_pos_x 
dw_1.width = newwidth - (2 *ii_pos_x) 
dw_1.height = NewHeight - dw_1.y - ii_pos_y

end event

type cb_2 from commandbutton within w_buscar_pais_estado
integer x = 1847
integer y = 60
integer width = 402
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
boolean default = true
end type

event clicked;string ls_sql1,ls_sql

If trim(sle_1.text)<>'' then
	ls_sql1 = char(13)+"and nompai like '%"+trim(sle_1.text)+"%'"
	ls_sql = is_sql + ls_sql1
	dw_1.SetSQLSelect(ls_sql)
End if
If sle_2.text<>'' then
	ls_sql1 = char(13)+"and nomest like '%"+trim(sle_2.text)+"%'"
	ls_sql = is_sql + ls_sql1
	dw_1.SetSQLSelect(ls_sql)
End if
if len(trim(sle_1.text))<1 and len(trim(sle_2.text))<1 then
	integer li_resp
	li_resp = MessageBox ( "Búsqueda de Paises y Estados", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if
dw_1.retrieve()
end event

type cb_1 from commandbutton within w_buscar_pais_estado
integer x = 1847
integer y = 204
integer width = 407
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Seleccionar"
end type

event clicked;st_par lst_par
long ll_fila

ll_fila = dw_1.getrow()
if ll_fila <1 then return
lst_par.parstring1 = dw_1.getitemstring(ll_fila,'vtatabpai_codpai')
lst_par.parstring2 = dw_1.getitemstring(ll_fila,'codest')
lst_par.parstring3 = dw_1.getitemstring(ll_fila,'nompai')
lst_par.parstring4 = dw_1.getitemstring(ll_fila,'nomest')

closewithreturn(parent,lst_par)


end event

type st_2 from statictext within w_buscar_pais_estado
integer x = 64
integer y = 220
integer width = 169
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Estado"
boolean focusrectangle = false
end type

type st_1 from statictext within w_buscar_pais_estado
integer x = 64
integer y = 96
integer width = 169
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "País"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_buscar_pais_estado
integer x = 242
integer y = 212
integer width = 1239
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_buscar_pais_estado
integer x = 242
integer y = 88
integer width = 1239
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_buscar_pais_estado
integer x = 9
integer width = 1531
integer height = 344
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_1 from datawindow within w_buscar_pais_estado
integer x = 9
integer y = 360
integer width = 2427
integer height = 1096
integer taborder = 70
string title = "none"
string dataobject = "dw_gr_pais_estado"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_1.selectrow(0,false)

if row > 0 then
	dw_1.selectrow(row,true)
	dw_1.setrow(row)
end if
end event

event doubleclicked;cb_1.triggerevent(clicked!)
end event

