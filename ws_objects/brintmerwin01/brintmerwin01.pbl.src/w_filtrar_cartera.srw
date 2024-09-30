$PBExportHeader$w_filtrar_cartera.srw
$PBExportComments$Filtro de Consulta~r~nContacto~r~nCriterios: codigo del cliente, nombre del cliente, codigo del contacto, nombre del contacto
forward
global type w_filtrar_cartera from window
end type
type dw_ejec_ventmovil from datawindow within w_filtrar_cartera
end type
type dw_ejec_comfijo from datawindow within w_filtrar_cartera
end type
type dw_gestor from datawindow within w_filtrar_cartera
end type
type cbx_ejec_ventmovil from checkbox within w_filtrar_cartera
end type
type cbx_ejec_comfijo from checkbox within w_filtrar_cartera
end type
type cbx_gestor from checkbox within w_filtrar_cartera
end type
type cbx_rut_cliente from checkbox within w_filtrar_cartera
end type
type sle_rut_cliente from singlelineedit within w_filtrar_cartera
end type
type sle_rut_padre from singlelineedit within w_filtrar_cartera
end type
type sle_codigo_cliente from singlelineedit within w_filtrar_cartera
end type
type cbx_rut_padre from checkbox within w_filtrar_cartera
end type
type cbx_codigo_cliente from checkbox within w_filtrar_cartera
end type
type cb_2 from commandbutton within w_filtrar_cartera
end type
type cb_1 from commandbutton within w_filtrar_cartera
end type
end forward

global type w_filtrar_cartera from window
integer width = 1545
integer height = 1024
boolean titlebar = true
string title = "Filtro de Cartera"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
dw_ejec_ventmovil dw_ejec_ventmovil
dw_ejec_comfijo dw_ejec_comfijo
dw_gestor dw_gestor
cbx_ejec_ventmovil cbx_ejec_ventmovil
cbx_ejec_comfijo cbx_ejec_comfijo
cbx_gestor cbx_gestor
cbx_rut_cliente cbx_rut_cliente
sle_rut_cliente sle_rut_cliente
sle_rut_padre sle_rut_padre
sle_codigo_cliente sle_codigo_cliente
cbx_rut_padre cbx_rut_padre
cbx_codigo_cliente cbx_codigo_cliente
cb_2 cb_2
cb_1 cb_1
end type
global w_filtrar_cartera w_filtrar_cartera

type variables
datawindowchild idwc_gestor_comfijo, idwc_ejecutivo_comfijo, idwc_ejecutivo_ventmovil
end variables

on w_filtrar_cartera.create
this.dw_ejec_ventmovil=create dw_ejec_ventmovil
this.dw_ejec_comfijo=create dw_ejec_comfijo
this.dw_gestor=create dw_gestor
this.cbx_ejec_ventmovil=create cbx_ejec_ventmovil
this.cbx_ejec_comfijo=create cbx_ejec_comfijo
this.cbx_gestor=create cbx_gestor
this.cbx_rut_cliente=create cbx_rut_cliente
this.sle_rut_cliente=create sle_rut_cliente
this.sle_rut_padre=create sle_rut_padre
this.sle_codigo_cliente=create sle_codigo_cliente
this.cbx_rut_padre=create cbx_rut_padre
this.cbx_codigo_cliente=create cbx_codigo_cliente
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_ejec_ventmovil,&
this.dw_ejec_comfijo,&
this.dw_gestor,&
this.cbx_ejec_ventmovil,&
this.cbx_ejec_comfijo,&
this.cbx_gestor,&
this.cbx_rut_cliente,&
this.sle_rut_cliente,&
this.sle_rut_padre,&
this.sle_codigo_cliente,&
this.cbx_rut_padre,&
this.cbx_codigo_cliente,&
this.cb_2,&
this.cb_1}
end on

on w_filtrar_cartera.destroy
destroy(this.dw_ejec_ventmovil)
destroy(this.dw_ejec_comfijo)
destroy(this.dw_gestor)
destroy(this.cbx_ejec_ventmovil)
destroy(this.cbx_ejec_comfijo)
destroy(this.cbx_gestor)
destroy(this.cbx_rut_cliente)
destroy(this.sle_rut_cliente)
destroy(this.sle_rut_padre)
destroy(this.sle_codigo_cliente)
destroy(this.cbx_rut_padre)
destroy(this.cbx_codigo_cliente)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_gestor.insertrow(1)
dw_gestor.getchild('nomect',idwc_gestor_comfijo)
idwc_gestor_comfijo.SetTransObject(SQLCA)
idwc_gestor_comfijo.retrieve()
if(dw_gestor.rowcount()>0) then
   dw_gestor.setitem(1,'nomect','')
end if
dw_gestor.Object.nomect.Background.Color = RGB(240, 240, 240)


dw_ejec_comfijo.insertrow(1)
dw_ejec_comfijo.getchild('nomect',idwc_ejecutivo_comfijo)
idwc_ejecutivo_comfijo.SetTransObject(SQLCA)
idwc_ejecutivo_comfijo.retrieve()
if(dw_ejec_comfijo.rowcount()>0) then
   dw_ejec_comfijo.setitem(1,'nomect','')
end if
dw_ejec_comfijo.Object.nomect.Background.Color = RGB(240, 240, 240)


dw_ejec_ventmovil.insertrow(1)
dw_ejec_ventmovil.getchild('nomect',idwc_ejecutivo_ventmovil)
idwc_ejecutivo_ventmovil.SetTransObject(SQLCA)
idwc_ejecutivo_ventmovil.retrieve()
if(dw_ejec_ventmovil.rowcount()>0) then
   dw_ejec_ventmovil.setitem(1,'nomect','')
end if
dw_ejec_ventmovil.Object.nomect.Background.Color = RGB(240, 240, 240)
end event

type dw_ejec_ventmovil from datawindow within w_filtrar_cartera
integer x = 626
integer y = 568
integer width = 800
integer height = 92
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_ejecutivo_ventmovil_todos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_ejec_comfijo from datawindow within w_filtrar_cartera
integer x = 626
integer y = 456
integer width = 800
integer height = 92
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_ejecutivo_comfijo_todos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_gestor from datawindow within w_filtrar_cartera
integer x = 626
integer y = 352
integer width = 800
integer height = 92
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_gestor_comfijo_todos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_ejec_ventmovil from checkbox within w_filtrar_cartera
integer x = 18
integer y = 572
integer width = 585
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
string text = "Ejecutivo Venta Movil"
end type

event clicked;//dw_ejec_ventmovil.enabled=cbx_ejec_ventmovil.checked

if cbx_ejec_ventmovil.checked then
	dw_ejec_ventmovil.enabled=true
	if(dw_ejec_ventmovil.rowcount()>0) then
	     dw_ejec_ventmovil.Object.nomect.Background.Color = RGB(255, 255, 255)
	end if
else
	dw_ejec_ventmovil.enabled=false
	if(dw_ejec_ventmovil.rowcount()>0) then
		dw_ejec_ventmovil.Object.nomect.Background.Color = RGB(240, 240, 240)
	end if
end if
end event

type cbx_ejec_comfijo from checkbox within w_filtrar_cartera
integer x = 18
integer y = 464
integer width = 585
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
string text = "Ejecutivo Comercial Fijo"
end type

event clicked;//dw_ejec_comfijo.enabled=cbx_ejec_comfijo.checked

if cbx_ejec_comfijo.checked then
	dw_ejec_comfijo.enabled=true
	if(dw_ejec_comfijo.rowcount()>0) then
	     dw_ejec_comfijo.Object.nomect.Background.Color = RGB(255, 255, 255)
	end if
else
	dw_ejec_comfijo.enabled=false
	if(dw_ejec_comfijo.rowcount()>0) then
		dw_ejec_comfijo.Object.nomect.Background.Color = RGB(240, 240, 240)
	end if
end if
end event

type cbx_gestor from checkbox within w_filtrar_cartera
integer x = 18
integer y = 356
integer width = 585
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
string text = "Gestor"
end type

event clicked;//dw_gestor.enabled=cbx_gestor.checked

if cbx_gestor.checked then
	dw_gestor.enabled=true
	if(dw_gestor.rowcount()>0) then
	     dw_gestor.Object.nomect.Background.Color = RGB(255, 255, 255)
	end if
else
	dw_gestor.enabled=false
	if(dw_gestor.rowcount()>0) then
		dw_gestor.Object.nomect.Background.Color = RGB(240, 240, 240)
	end if
end if
end event

type cbx_rut_cliente from checkbox within w_filtrar_cartera
integer x = 18
integer y = 140
integer width = 585
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
string text = "Rut Cliente"
end type

event clicked;sle_rut_cliente.enabled=cbx_rut_cliente.checked
end event

type sle_rut_cliente from singlelineedit within w_filtrar_cartera
integer x = 626
integer y = 140
integer width = 800
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_rut_padre from singlelineedit within w_filtrar_cartera
integer x = 626
integer y = 248
integer width = 800
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_codigo_cliente from singlelineedit within w_filtrar_cartera
integer x = 626
integer y = 32
integer width = 800
integer height = 80
integer taborder = 20
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

type cbx_rut_padre from checkbox within w_filtrar_cartera
integer x = 18
integer y = 248
integer width = 585
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
string text = "Rut Padre"
end type

event clicked;sle_rut_padre.enabled=cbx_rut_padre.checked
end event

type cbx_codigo_cliente from checkbox within w_filtrar_cartera
integer x = 18
integer y = 32
integer width = 585
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
string text = "Código del Cliente"
boolean checked = true
end type

event clicked;sle_codigo_cliente.enabled=cbx_codigo_cliente.checked

end event

type cb_2 from commandbutton within w_filtrar_cartera
integer x = 827
integer y = 756
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;st_par lst_par

if messagebox(parent.title, "Desea mostrar todos los registros?",question!,yesno!,2)=1 then
	lst_par.parstring1 = ''
	lst_par.parstring2 = ''
	lst_par.parstring3 = ''
	lst_par.parstring4 = ''
	lst_par.parstring5 = ''
else
	lst_par.parstring1 = '-1'
	lst_par.parstring2 = '-1'
	lst_par.parstring3 = '-1'
	lst_par.parstring4 = '-1'
	lst_par.parstring5 = '-1'
end if
closewithreturn(parent,lst_par)
end event

type cb_1 from commandbutton within w_filtrar_cartera
integer x = 265
integer y = 756
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;st_par lst_par

if cbx_codigo_cliente.checked and sle_codigo_cliente.text<>''       then lst_par.parstring1 = sle_codigo_cliente.text 		 else	lst_par.parstring1 = ''
if cbx_rut_cliente.checked and sle_rut_cliente.text<>''    then lst_par.parstring2 = sle_rut_cliente.text else	lst_par.parstring2 = ''
if cbx_rut_padre.checked and sle_rut_padre.text<>''      then lst_par.parstring3 = sle_rut_padre.text		 else	lst_par.parstring3 = ''
if cbx_gestor.checked and dw_gestor.getrow()>0 	  then lst_par.parstring5 =dw_gestor.getitemstring(1,'nomect')		 else	lst_par.parstring5 = ''
if cbx_ejec_comfijo.checked and dw_ejec_comfijo.getrow()>0 	    then lst_par.parstring4 = dw_ejec_comfijo.getitemstring(1,'nomect')		 else	lst_par.parstring4 = ''
if cbx_ejec_ventmovil.checked and dw_ejec_ventmovil.getrow()>0  then lst_par.parstring6 = dw_ejec_ventmovil.getitemstring(1,'nomect')	 else	lst_par.parstring6 = ''
if (lst_par.parstring1 + lst_par.parstring2 + lst_par.parstring3+lst_par.parstring4 + lst_par.parstring5 + lst_par.parstring6) = '' then
	integer li_resp
	li_resp = MessageBox ( parent.title, "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn (parent,lst_par)
end event

