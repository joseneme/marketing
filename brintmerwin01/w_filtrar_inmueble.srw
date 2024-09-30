HA$PBExportHeader$w_filtrar_inmueble.srw
$PBExportComments$Filtro de Consulta~r~nInmueble~r~nCriterios: inmueble, nombre de inmueble, nombre de via, tipo via, pais, estado, distrito
forward
global type w_filtrar_inmueble from window
end type
type dw_tipo_via from uo_dw_std within w_filtrar_inmueble
end type
type cbx_estado from checkbox within w_filtrar_inmueble
end type
type cbx_pais from checkbox within w_filtrar_inmueble
end type
type dw_estado from uo_dw_std within w_filtrar_inmueble
end type
type dw_pais from uo_dw_std within w_filtrar_inmueble
end type
type cbx_nombre_inmueble from checkbox within w_filtrar_inmueble
end type
type sle_nombre_inmueble from singlelineedit within w_filtrar_inmueble
end type
type cbx_distrito from checkbox within w_filtrar_inmueble
end type
type sle_distrito from singlelineedit within w_filtrar_inmueble
end type
type cbx_nombre_via from checkbox within w_filtrar_inmueble
end type
type sle_nombre_via from singlelineedit within w_filtrar_inmueble
end type
type cbx_tipo_via from checkbox within w_filtrar_inmueble
end type
type cbx_inmueble from checkbox within w_filtrar_inmueble
end type
type cb_2 from commandbutton within w_filtrar_inmueble
end type
type cb_1 from commandbutton within w_filtrar_inmueble
end type
type em_inmueble from editmask within w_filtrar_inmueble
end type
end forward

global type w_filtrar_inmueble from window
integer width = 1874
integer height = 1168
boolean titlebar = true
string title = "Buscar por"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
dw_tipo_via dw_tipo_via
cbx_estado cbx_estado
cbx_pais cbx_pais
dw_estado dw_estado
dw_pais dw_pais
cbx_nombre_inmueble cbx_nombre_inmueble
sle_nombre_inmueble sle_nombre_inmueble
cbx_distrito cbx_distrito
sle_distrito sle_distrito
cbx_nombre_via cbx_nombre_via
sle_nombre_via sle_nombre_via
cbx_tipo_via cbx_tipo_via
cbx_inmueble cbx_inmueble
cb_2 cb_2
cb_1 cb_1
em_inmueble em_inmueble
end type
global w_filtrar_inmueble w_filtrar_inmueble

type variables
datawindowchild idwc_pais, idwc_tipo_via, idwc_estado
end variables

on w_filtrar_inmueble.create
this.dw_tipo_via=create dw_tipo_via
this.cbx_estado=create cbx_estado
this.cbx_pais=create cbx_pais
this.dw_estado=create dw_estado
this.dw_pais=create dw_pais
this.cbx_nombre_inmueble=create cbx_nombre_inmueble
this.sle_nombre_inmueble=create sle_nombre_inmueble
this.cbx_distrito=create cbx_distrito
this.sle_distrito=create sle_distrito
this.cbx_nombre_via=create cbx_nombre_via
this.sle_nombre_via=create sle_nombre_via
this.cbx_tipo_via=create cbx_tipo_via
this.cbx_inmueble=create cbx_inmueble
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_inmueble=create em_inmueble
this.Control[]={this.dw_tipo_via,&
this.cbx_estado,&
this.cbx_pais,&
this.dw_estado,&
this.dw_pais,&
this.cbx_nombre_inmueble,&
this.sle_nombre_inmueble,&
this.cbx_distrito,&
this.sle_distrito,&
this.cbx_nombre_via,&
this.sle_nombre_via,&
this.cbx_tipo_via,&
this.cbx_inmueble,&
this.cb_2,&
this.cb_1,&
this.em_inmueble}
end on

on w_filtrar_inmueble.destroy
destroy(this.dw_tipo_via)
destroy(this.cbx_estado)
destroy(this.cbx_pais)
destroy(this.dw_estado)
destroy(this.dw_pais)
destroy(this.cbx_nombre_inmueble)
destroy(this.sle_nombre_inmueble)
destroy(this.cbx_distrito)
destroy(this.sle_distrito)
destroy(this.cbx_nombre_via)
destroy(this.sle_nombre_via)
destroy(this.cbx_tipo_via)
destroy(this.cbx_inmueble)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_inmueble)
end on

event open;dw_pais.insertrow(1)
dw_pais.getchild('codpai',idwc_pais)
idwc_pais.SetTransObject(SQLCA)
idwc_pais.retrieve()
dw_pais.Object.codpai.Background.Color = RGB(255, 0, 128)

dw_estado.insertrow(1)
dw_estado.getchild('codest',idwc_estado)
idwc_estado.SetTransObject(SQLCA)
idwc_estado.retrieve('%')
dw_estado.Object.codest.Background.Color = RGB(255, 0, 128)

dw_tipo_via.insertrow(1)
dw_tipo_via.getchild('tipo_via',idwc_tipo_via)
idwc_tipo_via.SetTransObject(SQLCA)
idwc_tipo_via.retrieve()
dw_tipo_via.Object.tipo_via.Background.Color = RGB(255, 0, 128)


end event

type dw_tipo_via from uo_dw_std within w_filtrar_inmueble
integer x = 549
integer y = 396
integer width = 535
integer height = 80
integer taborder = 90
boolean enabled = false
string dataobject = "dw_ex_tipo_via"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
end type

type cbx_estado from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 636
integer width = 507
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
string text = "Estado"
end type

event clicked;dw_estado.enabled=cbx_estado.checked
end event

type cbx_pais from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 516
integer width = 507
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
string text = "Pa$$HEX1$$ed00$$ENDHEX$$s"
end type

event clicked;dw_pais.enabled=cbx_pais.checked
if cbx_pais.checked then
	dw_pais.Object.codpai.Background.Color = RGB(255, 0, 0)
else
	dw_pais.Object.codpai.Background.Color = RGB(0, 255, 0)
end if
end event

type dw_estado from uo_dw_std within w_filtrar_inmueble
integer x = 549
integer y = 636
integer width = 622
integer height = 80
integer taborder = 80
boolean enabled = false
string dataobject = "dw_ex_estado"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
end type

event getfocus;call super::getfocus;string ls_filtro
if dw_pais.getrow()>0 and cbx_pais.checked then
	ls_filtro = dw_pais.getitemstring(1,'codpai')
	idwc_estado.retrieve(ls_filtro+'%')
	messagebox("filtro de pais"," ")
else
	idwc_estado.retrieve('%')
	messagebox("sin filtro"," ")
end if

end event

type dw_pais from uo_dw_std within w_filtrar_inmueble
integer x = 549
integer y = 520
integer width = 878
integer height = 76
integer taborder = 30
boolean enabled = false
string dataobject = "dw_ex_pais"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
boolean guardar = false
boolean borrar = false
boolean seleccionar = false
end type

type cbx_nombre_inmueble from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 156
integer width = 507
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Nombre Inmueble"
end type

event clicked;sle_nombre_inmueble.enabled = cbx_nombre_inmueble.checked

end event

type sle_nombre_inmueble from singlelineedit within w_filtrar_inmueble
integer x = 549
integer y = 156
integer width = 1285
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 1090519039
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_distrito from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 756
integer width = 507
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Distrito"
boolean checked = true
end type

event clicked;sle_distrito.enabled=cbx_distrito.checked
end event

type sle_distrito from singlelineedit within w_filtrar_inmueble
integer x = 549
integer y = 756
integer width = 965
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_nombre_via from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 276
integer width = 507
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
string text = "Nombre V$$HEX1$$ed00$$ENDHEX$$a"
end type

event clicked;sle_nombre_via.enabled = cbx_nombre_via.checked
end event

type sle_nombre_via from singlelineedit within w_filtrar_inmueble
integer x = 549
integer y = 276
integer width = 1285
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cbx_tipo_via from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 396
integer width = 507
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
string text = "Tipo V$$HEX1$$ed00$$ENDHEX$$a"
end type

event clicked;dw_tipo_via.enabled = cbx_tipo_via.checked
end event

type cbx_inmueble from checkbox within w_filtrar_inmueble
integer x = 18
integer y = 36
integer width = 507
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Inmueble"
end type

event clicked;em_inmueble.enabled=cbx_inmueble.checked

end event

type cb_2 from commandbutton within w_filtrar_inmueble
integer x = 983
integer y = 948
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

event clicked;string ls_filtro = ""
if messagebox("Filtro de Inmuebles", "Desea mostrar todos los registros?",question!,yesno!,2)=2 then
	ls_filtro= " AND (idinmueble = -1) "
end if
closewithreturn(parent,ls_filtro)
end event

type cb_1 from commandbutton within w_filtrar_inmueble
integer x = 421
integer y = 948
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

event clicked;string ls_filtro = ""
boolean lb_where = false
if cbx_inmueble.checked and em_inmueble.text<>'' then
	ls_filtro = " and idinmueble = "+ em_inmueble.text
end if
if cbx_nombre_inmueble.checked and sle_nombre_inmueble.text<>'' then
	ls_filtro += " and upper(nombre) like '%" + sle_nombre_inmueble.text + "%'"
end if
if cbx_nombre_via.checked and sle_nombre_via.text<>'' then
	ls_filtro += " and tipviap =  '" + sle_nombre_via.text + "'"
end if
if cbx_tipo_via.checked and dw_tipo_via.getrow()>0 then
	ls_filtro += " and upper(nomvia) = '" + dw_tipo_via.getitemstring(1,'tipo_via') + "'"
end if
if cbx_pais.checked and dw_pais.getrow()>0 then
	ls_filtro += " and upper(codpai) = '" + dw_pais.getitemstring(1,'codpai') + "'"
end if
if cbx_estado.checked and dw_estado.getrow()>0 then
	ls_filtro += " and upper(codest) = '" + dw_estado.getitemstring(1,'codest') + "'"
end if
if cbx_distrito.checked and trim(sle_distrito.text)<>'' then
	ls_filtro += " and upper(nomdst) like '%" + sle_distrito.text + "%'"
end if
if len(trim(em_inmueble.text))<1 and len(trim(sle_nombre_inmueble.text))<1 and &
	len(trim(sle_nombre_via.text))<1 and len(trim(sle_distrito.text))<1 and &
	( isnull(dw_tipo_via.getitemstring(1,'tipo_via')) or &
	len(trim(dw_tipo_via.getitemstring(1,'tipo_via')))<1 ) and &
	( isnull(dw_pais.getitemstring(1,'codpai')) or &
	len(trim(dw_pais.getitemstring(1,'codpai')))<1 ) and &
	( isnull(dw_estado.getitemstring(1,'codest')) or &
	len(trim(dw_estado.getitemstring(1,'codest')))<1 ) then
	integer li_resp
	li_resp = MessageBox ( "Filtro de Inmuebles", "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn (parent,ls_filtro)

end event

type em_inmueble from editmask within w_filtrar_inmueble
integer x = 544
integer y = 28
integer width = 471
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
boolean enabled = false
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

