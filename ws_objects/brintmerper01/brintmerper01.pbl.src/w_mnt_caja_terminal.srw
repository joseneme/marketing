$PBExportHeader$w_mnt_caja_terminal.srw
$PBExportComments$Mantenimiento de Cuentas
forward
global type w_mnt_caja_terminal from window
end type
type cb_10 from commandbutton within w_mnt_caja_terminal
end type
type st_9 from statictext within w_mnt_caja_terminal
end type
type st_8 from statictext within w_mnt_caja_terminal
end type
type cb_3 from commandbutton within w_mnt_caja_terminal
end type
type tab_1 from tab within w_mnt_caja_terminal
end type
type tabpage_bus from userobject within tab_1
end type
type dw_unificacion from datawindow within tabpage_bus
end type
type cb_19 from commandbutton within tabpage_bus
end type
type dw_datos_cliente from datawindow within tabpage_bus
end type
type cb_exportar from commandbutton within tabpage_bus
end type
type sle_cliente from singlelineedit within tabpage_bus
end type
type st_19 from statictext within tabpage_bus
end type
type ddlb_tipo_persona from dropdownlistbox within tabpage_bus
end type
type st_14 from statictext within tabpage_bus
end type
type dw_consultor from datawindow within tabpage_bus
end type
type ddlb_zona from dropdownlistbox within tabpage_bus
end type
type st_13 from statictext within tabpage_bus
end type
type cb_7 from commandbutton within tabpage_bus
end type
type st_12 from statictext within tabpage_bus
end type
type cb_sel from commandbutton within tabpage_bus
end type
type dw_16 from datawindow within tabpage_bus
end type
type tabpage_bus from userobject within tab_1
dw_unificacion dw_unificacion
cb_19 cb_19
dw_datos_cliente dw_datos_cliente
cb_exportar cb_exportar
sle_cliente sle_cliente
st_19 st_19
ddlb_tipo_persona ddlb_tipo_persona
st_14 st_14
dw_consultor dw_consultor
ddlb_zona ddlb_zona
st_13 st_13
cb_7 cb_7
st_12 st_12
cb_sel cb_sel
dw_16 dw_16
end type
type tabpage_cli from userobject within tab_1
end type
type cb_12 from commandbutton within tabpage_cli
end type
type st_7 from statictext within tabpage_cli
end type
type dw_1 from datawindow within tabpage_cli
end type
type st_4 from statictext within tabpage_cli
end type
type dw_14 from datawindow within tabpage_cli
end type
type dw_13 from datawindow within tabpage_cli
end type
type tabpage_cli from userobject within tab_1
cb_12 cb_12
st_7 st_7
dw_1 dw_1
st_4 st_4
dw_14 dw_14
dw_13 dw_13
end type
type tabpage_vst from userobject within tab_1
end type
type dw_44 from datawindow within tabpage_vst
end type
type st_26 from statictext within tabpage_vst
end type
type st_25 from statictext within tabpage_vst
end type
type dw_20 from datawindow within tabpage_vst
end type
type tabpage_vst from userobject within tab_1
dw_44 dw_44
st_26 st_26
st_25 st_25
dw_20 dw_20
end type
type tabpage_caja_terminal from userobject within tab_1
end type
type cb_exportar_cajas from commandbutton within tabpage_caja_terminal
end type
type dw_36 from datawindow within tabpage_caja_terminal
end type
type tabpage_caja_terminal from userobject within tab_1
cb_exportar_cajas cb_exportar_cajas
dw_36 dw_36
end type
type tabpage_fac from userobject within tab_1
end type
type dw_57 from datawindow within tabpage_fac
end type
type cbx_dup from checkbox within tabpage_fac
end type
type cb_20 from commandbutton within tabpage_fac
end type
type cb_4 from commandbutton within tabpage_fac
end type
type cb_2 from commandbutton within tabpage_fac
end type
type cb_16 from commandbutton within tabpage_fac
end type
type cb_cob from commandbutton within tabpage_fac
end type
type st_doc from statictext within tabpage_fac
end type
type st_6 from statictext within tabpage_fac
end type
type dw_10 from datawindow within tabpage_fac
end type
type dw_9 from datawindow within tabpage_fac
end type
type tabpage_fac from userobject within tab_1
dw_57 dw_57
cbx_dup cbx_dup
cb_20 cb_20
cb_4 cb_4
cb_2 cb_2
cb_16 cb_16
cb_cob cb_cob
st_doc st_doc
st_6 st_6
dw_10 dw_10
dw_9 dw_9
end type
type tab_1 from tab within w_mnt_caja_terminal
tabpage_bus tabpage_bus
tabpage_cli tabpage_cli
tabpage_vst tabpage_vst
tabpage_caja_terminal tabpage_caja_terminal
tabpage_fac tabpage_fac
end type
type gb_1 from groupbox within w_mnt_caja_terminal
end type
end forward

global type w_mnt_caja_terminal from window
integer width = 3145
integer height = 2276
boolean titlebar = true
string title = "Consulta de cajas terminales por cliente"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
event ue_recupera ( string acodcli )
event ue_reset ( string atipo )
cb_10 cb_10
st_9 st_9
st_8 st_8
cb_3 cb_3
tab_1 tab_1
gb_1 gb_1
end type
global w_mnt_caja_terminal w_mnt_caja_terminal

type prototypes
Function Long ShellExecuteA (Long hwnd, string lpOperation, String lpFile, String lpParameters, String lpDirectory , Long nShowCmd) Library "shell32.dll" alias for "ShellExecuteA;Ansi"

end prototypes

type variables
datawindow dw_1, dw_2, dw_3, dw_4, dw_5, dw_6, dw_7,  dw_8, dw_9, dw_10, dw_11, dw_12, dw_13, dw_14, dw_15, dw_16
datawindow dw_17, dw_18, dw_19, dw_20, dw_21, dw_22, dw_23, dw_24,dw_25,dw_26,dw_27, dw_28, dw_29, dw_30, dw_31,dw_32, dw_33
datawindow dw_34, dw_35,dw_36,dw_37, dw_38, dw_39,dw_40, dw_41,dw_42,dw_43,dw_44,dw_45,dw_46
datawindowchild dw_concnt, dw_concli

long il_dummy

string iscodcli, is_sql

long ii_idcarsel
end variables

forward prototypes
public subroutine wf_recupera (string acodcli, integer atab)
public subroutine wf_reset (string atipo)
end prototypes

event ue_recupera;iscodcli = message.stringparm
wf_recupera (iscodcli ,2)
wf_recupera (iscodcli ,3)
tab_1.selecttab (2)
end event

public subroutine wf_recupera (string acodcli, integer atab);string ls_nomcli

CHOOSE CASE aTab

	CASE 2
		dw_1.retrieve(aCodCli)
		dw_13.retrieve(aCodCli)
		dw_14.retrieve(aCodCli)
		
		select nomcli into :ls_nomcli from vtatabcli
		where codcli=:aCodCli;

		st_8.text = ls_nomcli

	CASE 3
		dw_20.retrieve(aCodCli)
 		dw_44.retrieve(aCodCli)

	CASE 4
		dw_36.retrieve(aCodCli)

	CASE 5
		dw_9.retrieve(aCodCli)
		
END CHOOSE
end subroutine

public subroutine wf_reset (string atipo);If aTipo='TODO' then
	dw_16.reset()
End if

dw_1.reset()
dw_9.reset()
dw_10.reset()
dw_13.reset()
dw_14.reset()
dw_20.reset()
//dw_34.reset()
//dw_35.reset()
dw_36.reset()
//dw_37.reset()
dw_44.reset()

st_8.text=''

end subroutine

on w_mnt_caja_terminal.create
this.cb_10=create cb_10
this.st_9=create st_9
this.st_8=create st_8
this.cb_3=create cb_3
this.tab_1=create tab_1
this.gb_1=create gb_1
this.Control[]={this.cb_10,&
this.st_9,&
this.st_8,&
this.cb_3,&
this.tab_1,&
this.gb_1}
end on

on w_mnt_caja_terminal.destroy
destroy(this.cb_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.cb_3)
destroy(this.tab_1)
destroy(this.gb_1)
end on

event open;string lsparm
setpointer (hourglass!)

dw_1 = tab_1.tabpage_cli.dw_1
dw_9 = tab_1.tabpage_fac.dw_9
dw_10 = tab_1.tabpage_fac.dw_10
//dw_2 = tab_1.tabpage_mant.dw_2
dw_13 = tab_1.tabpage_cli.dw_13
dw_14 = tab_1.tabpage_cli.dw_14
dw_16 = tab_1.tabpage_bus.dw_16
dw_20 = tab_1.tabpage_vst.dw_20
//dw_34 = tab_1.tabpage_rec.dw_34
//dw_35 = tab_1.tabpage_rec.dw_35
dw_36 = tab_1.tabpage_caja_terminal.dw_36
//dw_37 = tab_1.tabpage_caja_terminal.dw_37
dw_44 = tab_1.tabpage_vst.dw_44

dw_1.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)
//dw_2.settransobject(sqlca)
dw_13.settransobject(sqlca)
dw_14.settransobject(sqlca)
dw_16.settransobject(sqlca)
dw_20.settransobject(sqlca)
//dw_34.settransobject(sqlca)
//dw_35.settransobject(sqlca)
dw_36.settransobject(sqlca)
//dw_37.settransobject(sqlca)
dw_44.settransobject(sqlca)

//tab_1.tabpage_mant.dw_2.getchild('codcnt',dw_concnt)
dw_concnt.settransobject(sqlca)
dw_concnt.retrieve('00000000')

is_sql = dw_16.getsqlselect()

lsparm = message.stringparm 

If not isnull(lsparm ) and lsparm<>'' then
	trigger event ue_recupera(lsparm)
End if

tab_1.tabpage_bus.dw_consultor.SetTransObject(SQLCA)
tab_1.tabpage_bus.dw_consultor.insertrow(1)

//dw_2.getchild('codcnt',dw_concli)
//dw_concli.settransobject(sqlca)
//dw_concli.retrieve('00000000')
end event

type cb_10 from commandbutton within w_mnt_caja_terminal
integer x = 2194
integer y = 72
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;//tab_1.tabpage_bus.sle_ruccli.text=''
//tab_1.tabpage_bus.sle_nomcli.text=''
//tab_1.tabpage_bus.sle_nrotel.text=''
//tab_1.tabpage_bus.sle_codcli.text=''

gs_cliente=''
iscodcli=''
tab_1.tabpage_bus.sle_cliente.text=''
wf_reset ('TODO')

//tab_1.tabpage_bus.cbx_ruccli.checked = true
//tab_1.tabpage_bus.cbx_codcli.checked = true
//tab_1.tabpage_bus.cbx_nomcli.checked = true

tab_1.selecttab (1)


end event

type st_9 from statictext within w_mnt_caja_terminal
integer x = 50
integer y = 96
integer width = 187
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Cliente:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_mnt_caja_terminal
integer x = 247
integer y = 88
integer width = 1838
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_mnt_caja_terminal
integer x = 2610
integer y = 72
integer width = 347
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
boolean cancel = true
end type

event clicked;close(parent)
end event

type tab_1 from tab within w_mnt_caja_terminal
integer x = 14
integer y = 232
integer width = 3058
integer height = 1876
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean multiline = true
boolean raggedright = true
boolean powertips = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_bus tabpage_bus
tabpage_cli tabpage_cli
tabpage_vst tabpage_vst
tabpage_caja_terminal tabpage_caja_terminal
tabpage_fac tabpage_fac
end type

on tab_1.create
this.tabpage_bus=create tabpage_bus
this.tabpage_cli=create tabpage_cli
this.tabpage_vst=create tabpage_vst
this.tabpage_caja_terminal=create tabpage_caja_terminal
this.tabpage_fac=create tabpage_fac
this.Control[]={this.tabpage_bus,&
this.tabpage_cli,&
this.tabpage_vst,&
this.tabpage_caja_terminal,&
this.tabpage_fac}
end on

on tab_1.destroy
destroy(this.tabpage_bus)
destroy(this.tabpage_cli)
destroy(this.tabpage_vst)
destroy(this.tabpage_caja_terminal)
destroy(this.tabpage_fac)
end on

event selectionchanged;If isnull(iscodcli) or iscodcli='' then
	return;
End if

CHOOSE CASE newindex

	CASE 2
		If dw_13.Rowcount()>0 then
			return;
		End if

	CASE 3
		If dw_20.Rowcount()>0 then
			return;
		End if

	CASE 4
		If dw_36.Rowcount()>0 then
			return;
		End if

	CASE 5
		If dw_9.Rowcount()>0 then
			return;
		End if

END CHOOSE
		
wf_recupera (isCodCli,newindex)
end event

type tabpage_bus from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3022
integer height = 1756
long backcolor = 79741120
string text = "Búsqueda Clientes"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_unificacion dw_unificacion
cb_19 cb_19
dw_datos_cliente dw_datos_cliente
cb_exportar cb_exportar
sle_cliente sle_cliente
st_19 st_19
ddlb_tipo_persona ddlb_tipo_persona
st_14 st_14
dw_consultor dw_consultor
ddlb_zona ddlb_zona
st_13 st_13
cb_7 cb_7
st_12 st_12
cb_sel cb_sel
dw_16 dw_16
end type

on tabpage_bus.create
this.dw_unificacion=create dw_unificacion
this.cb_19=create cb_19
this.dw_datos_cliente=create dw_datos_cliente
this.cb_exportar=create cb_exportar
this.sle_cliente=create sle_cliente
this.st_19=create st_19
this.ddlb_tipo_persona=create ddlb_tipo_persona
this.st_14=create st_14
this.dw_consultor=create dw_consultor
this.ddlb_zona=create ddlb_zona
this.st_13=create st_13
this.cb_7=create cb_7
this.st_12=create st_12
this.cb_sel=create cb_sel
this.dw_16=create dw_16
this.Control[]={this.dw_unificacion,&
this.cb_19,&
this.dw_datos_cliente,&
this.cb_exportar,&
this.sle_cliente,&
this.st_19,&
this.ddlb_tipo_persona,&
this.st_14,&
this.dw_consultor,&
this.ddlb_zona,&
this.st_13,&
this.cb_7,&
this.st_12,&
this.cb_sel,&
this.dw_16}
end on

on tabpage_bus.destroy
destroy(this.dw_unificacion)
destroy(this.cb_19)
destroy(this.dw_datos_cliente)
destroy(this.cb_exportar)
destroy(this.sle_cliente)
destroy(this.st_19)
destroy(this.ddlb_tipo_persona)
destroy(this.st_14)
destroy(this.dw_consultor)
destroy(this.ddlb_zona)
destroy(this.st_13)
destroy(this.cb_7)
destroy(this.st_12)
destroy(this.cb_sel)
destroy(this.dw_16)
end on

type dw_unificacion from datawindow within tabpage_bus
boolean visible = false
integer x = 160
integer y = 1072
integer width = 1307
integer height = 600
integer taborder = 70
string title = "none"
string dataobject = "dw_buscli_conhis"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_19 from commandbutton within tabpage_bus
integer x = 2647
integer y = 1352
integer width = 343
integer height = 100
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Unificación"
end type

event clicked;string ls_sql_select, ls_where, ls_codcli
integer i

SetPointer(HourGlass!)

ls_sql_select = dw_unificacion.GetSQLSelect()

For i=1 to dw_16.RowCount()

	If i=1 then
		If i=dw_16.RowCount() then
			ls_codcli = dw_16.GetItemString(i,'codcli')			
			ls_where = ' WHERE ( "A"."CODCLI" = ' + "'" + ls_codcli + "'"
		else
			ls_codcli = dw_16.GetItemString(i,'codcli')			
			ls_where = ' WHERE ( "A"."CODCLI" = ' + "'" + ls_codcli + "' OR"
		End if
	else
		If i=dw_16.RowCount() then
			ls_codcli = dw_16.GetItemString(i,'codcli')
			ls_where = ls_where + ' "A"."CODCLI" ='+ "'" + ls_codcli + "'"
		else
			ls_codcli = dw_16.GetItemString(i,'codcli')
			ls_where = ls_where + ' "A"."CODCLI" ='+ "'" + ls_codcli + "' OR"
		End if
		
	End if
	
End for

ls_sql_select = ls_sql_select + ls_where + ')'

//messagebox('Aviso',ls_sql_select)

Openwithparm(w_ch_unificacion_cliente,ls_sql_select)
end event

type dw_datos_cliente from datawindow within tabpage_bus
boolean visible = false
integer x = 146
integer y = 408
integer width = 1307
integer height = 600
integer taborder = 70
string title = "none"
string dataobject = "dw_buscli_caja_terminal_rep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exportar from commandbutton within tabpage_bus
integer x = 2647
integer y = 1088
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;window w_ventana
st_par lst_par
w_rpt_cajaterminal w_visor1
string ls_sql, ls_where,ls_codcli
integer i

setpointer(HourGlass!)

ls_sql = dw_datos_cliente.GetSQLSelect()

For i=1 to dw_16.RowCount()

	If i=1 then
		If i=dw_16.RowCount() then
			ls_codcli = dw_16.GetItemString(i,'codcli')
			ls_where = ls_where + ' AND ( "A"."CODCLI" ='+ "'" + ls_codcli + "'"
		else
			ls_codcli = dw_16.GetItemString(i,'codcli')			
			ls_where = ' AND ( "A"."CODCLI" = ' + "'" + ls_codcli + "' OR"
		End if
	else
		If i=dw_16.RowCount() then
			ls_codcli = dw_16.GetItemString(i,'codcli')
			ls_where = ls_where + ' "A"."CODCLI" ='+ "'" + ls_codcli + "'"
		else
			ls_codcli = dw_16.GetItemString(i,'codcli')
			ls_where = ls_where + ' "A"."CODCLI" ='+ "'" + ls_codcli + "' OR"
		End if
	End if
	
End for

ls_sql = ls_sql + ls_where + ')'

//messagebox('Aviso',ls_sql)

//Ventana de Reporte

lst_par.dw_maestro = 'dw_buscli_caja_terminal_rep'
lst_par.tipo = 1
lst_par.parstring6 = ls_sql 
lst_par.titulo = 'Clientes por cajas terminales'

OpenSheetWithparm (w_ventana, lst_par, "w_rpt_cajaterminal", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

type sle_cliente from singlelineedit within tabpage_bus
integer x = 297
integer y = 52
integer width = 2697
integer height = 88
integer taborder = 90
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

type st_19 from statictext within tabpage_bus
integer y = 68
integer width = 283
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Cliente:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tipo_persona from dropdownlistbox within tabpage_bus
integer x = 2514
integer y = 172
integer width = 485
integer height = 352
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
string item[] = {"Residencial","Corporativo"}
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within tabpage_bus
integer x = 2176
integer y = 180
integer width = 311
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Persona:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_consultor from datawindow within tabpage_bus
integer x = 297
integer y = 180
integer width = 1056
integer height = 112
integer taborder = 40
string title = "none"
string dataobject = "d_consultor"
boolean border = false
boolean livescroll = true
end type

type ddlb_zona from dropdownlistbox within tabpage_bus
integer x = 1513
integer y = 180
integer width = 617
integer height = 352
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
string item[] = {"Ambar","Rojo","Verde","Todas"}
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within tabpage_bus
integer x = 1307
integer y = 180
integer width = 187
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Zona:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_7 from commandbutton within tabpage_bus
integer x = 2647
integer y = 328
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
boolean default = true
end type

event clicked;string ls_sqlquery="", ls_sql="", ls_where1="", ls_where2="", ls_where=""
string ls_codect,ls_zona,ls_tipper,ls_cliente

tab_1.selecttab (1)
wf_reset ('TODO')

ls_codect = trim(dw_consultor.GetItemString(1,'codect'))
ls_zona = trim(upper(ddlb_zona.text))
ls_tipper= trim(upper(ddlb_tipo_persona.text))

If ls_zona='NONE' then ls_zona=''
If ls_tipper='NONE' then ls_tipper=''


choose case ls_tipper
	case 'RESIDENCIAL'
		ls_tipper='N'
	case 'CORPORATIVO'
		ls_tipper='J'	
	case else
		ls_tipper=''			
End choose

IF (isnull(ls_codect) or ls_codect='') or (isnull(ls_zona) or ls_zona='') or (isnull(ls_tipper) or ls_tipper='') THEN
	Messagebox('Aviso','Debe de ingresar todos los criterios de busqueda')
	Return;	
END IF

ls_cliente=trim(sle_cliente.text)

ls_sql = 'SELECT "A"."CODCLI","A"."NOMCLI","A"."TIPDIDE","A"."NTDIDE","A"."NOMABR","B"."NOMECT","C"."COLORZONA",MIN("C"."METROS")' + char(13)
ls_sql = ls_sql + 'FROM "VTATABCLI" "A","VTATABECT" "B","MKTCAJAXCLIENTE" "C"' + char(13)
ls_sql = ls_sql + 'WHERE ( "A"."CODECT" = "B"."CODECT" (+)) AND ("C"."CODCLI" = "A"."CODCLI")'+ char(13)

ls_where1 = "AND A.CODECT= '"+ ls_codect +"'"+CHAR(13)

If ls_zona='TODAS' then
else
	ls_where1 = ls_where1 + "AND C.COLORZONA='"+ ls_zona +"'"+CHAR(13)
End if

ls_where1 = ls_where1 + "AND A.TIPPER='"+ ls_tipper +"'"+char(13)

If ls_cliente='' then
	ls_where1 = ls_where1 + 'GROUP BY "A"."CODCLI","A"."NOMCLI","A"."TIPDIDE","A"."NTDIDE","A"."NOMABR","B"."NOMECT","C"."COLORZONA"'	
else
	ls_where1 = ls_where1 + "AND UPPER(A.NOMCLI) LIKE '%"+ ls_cliente +"%'"+char(13)	
	ls_where1 = ls_where1 + 'GROUP BY "A"."CODCLI","A"."NOMCLI","A"."TIPDIDE","A"."NTDIDE","A"."NOMABR","B"."NOMECT","C"."COLORZONA"'
End if

 
ls_sqlquery = ls_sql + ls_where1 +char(13)

//messagebox('Aviso',ls_sqlquery)

dw_16.reset()
dw_16.setsqlselect(ls_sqlquery)

If dw_16.retrieve()=0 then
	messagebox('Aviso','No existen clientes asociados a los parámetros de busqueda')
	return;
End If

end event

type st_12 from statictext within tabpage_bus
integer y = 180
integer width = 283
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Consultor:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_sel from commandbutton within tabpage_bus
integer x = 2647
integer y = 480
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Seleccionar"
end type

event clicked;dw_16.Accepttext()

If dw_16.getrow() <=0 then
	messagebox('Aviso','Debe de Seleccionar un cliente')
	return;
End if

isCodCli=dw_16.getitemstring(dw_16.getrow(),'codcli')

gs_cliente=iscodcli

wf_reset('CLIENTE')

wf_recupera(isCodCli,2)

tab_1.selecttab (2)
end event

type dw_16 from datawindow within tabpage_bus
integer x = 23
integer y = 300
integer width = 2592
integer height = 1412
integer taborder = 55
string dataobject = "dw_buscli_caja_terminal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	this.setrow(row)
end if

end event

event rowfocuschanged;if currentrow>0 then
	this.selectrow(0,false)
	this.selectrow(currentrow,True)
end if

end event

event doubleclicked;cb_sel.triggerevent(clicked!)
end event

type tabpage_cli from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3022
integer height = 1756
long backcolor = 79741120
string text = "Datos Cliente"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_12 cb_12
st_7 st_7
dw_1 dw_1
st_4 st_4
dw_14 dw_14
dw_13 dw_13
end type

on tabpage_cli.create
this.cb_12=create cb_12
this.st_7=create st_7
this.dw_1=create dw_1
this.st_4=create st_4
this.dw_14=create dw_14
this.dw_13=create dw_13
this.Control[]={this.cb_12,&
this.st_7,&
this.dw_1,&
this.st_4,&
this.dw_14,&
this.dw_13}
end on

on tabpage_cli.destroy
destroy(this.cb_12)
destroy(this.st_7)
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.dw_14)
destroy(this.dw_13)
end on

type cb_12 from commandbutton within tabpage_cli
integer x = 2615
integer y = 1000
integer width = 361
integer height = 100
integer taborder = 100
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Servicios"
end type

event clicked;If isnull(gs_cliente) or gs_cliente='' then
	messagebox('Aviso','Primero debe de seleccionar un cliente')
	return;
else
	SetPointer(HourGlass!)
	Open(w_ch_servicioxcliente)
End if
end event

type st_7 from statictext within tabpage_cli
integer x = 9
integer y = 1044
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "CONTACTOS"
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_cli
integer x = 5
integer y = 1116
integer width = 1673
integer height = 628
integer taborder = 90
string title = "none"
string dataobject = "dw_cnscli_cliente_contactos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within tabpage_cli
integer x = 1710
integer y = 1044
integer width = 718
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "MEDIOS DE COMUNICACION"
boolean focusrectangle = false
end type

type dw_14 from datawindow within tabpage_cli
integer x = 1701
integer y = 1116
integer width = 1307
integer height = 628
integer taborder = 80
string dataobject = "dw_cnscli_cliente_medcom"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_13 from datawindow within tabpage_cli
integer x = 78
integer y = 12
integer width = 2798
integer height = 964
integer taborder = 50
string dataobject = "dw_cnscli_cliente_new"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_vst from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3022
integer height = 1756
long backcolor = 79741120
string text = "Visitas a Clientes"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_44 dw_44
st_26 st_26
st_25 st_25
dw_20 dw_20
end type

on tabpage_vst.create
this.dw_44=create dw_44
this.st_26=create st_26
this.st_25=create st_25
this.dw_20=create dw_20
this.Control[]={this.dw_44,&
this.st_26,&
this.st_25,&
this.dw_20}
end on

on tabpage_vst.destroy
destroy(this.dw_44)
destroy(this.st_26)
destroy(this.st_25)
destroy(this.dw_20)
end on

type dw_44 from datawindow within tabpage_vst
integer x = 9
integer y = 964
integer width = 2990
integer height = 696
integer taborder = 90
string title = "none"
string dataobject = "dw_consulta_mantenimiento_cta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF ROW < 1 THEN RETURN
this.scrolltorow(row)
this.setfocus()
f_select_current_row (this)

end event

event itemfocuschanged;f_select_current_row(this)
end event

type st_26 from statictext within tabpage_vst
integer x = 5
integer y = 28
integer width = 421
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Visitas - Comercial"
boolean focusrectangle = false
end type

type st_25 from statictext within tabpage_vst
integer x = 5
integer y = 872
integer width = 585
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mantenimiento de Cuentas"
boolean focusrectangle = false
end type

type dw_20 from datawindow within tabpage_vst
integer x = 5
integer y = 108
integer width = 2990
integer height = 700
integer taborder = 60
string title = "none"
string dataobject = "dw_consulta_visita_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_caja_terminal from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3022
integer height = 1756
long backcolor = 80269524
string text = "Cajas Terminales"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_exportar_cajas cb_exportar_cajas
dw_36 dw_36
end type

on tabpage_caja_terminal.create
this.cb_exportar_cajas=create cb_exportar_cajas
this.dw_36=create dw_36
this.Control[]={this.cb_exportar_cajas,&
this.dw_36}
end on

on tabpage_caja_terminal.destroy
destroy(this.cb_exportar_cajas)
destroy(this.dw_36)
end on

type cb_exportar_cajas from commandbutton within tabpage_caja_terminal
integer x = 2679
integer y = 40
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;window w_ventana
st_par lst_par
w_visor_comun_in w_visor1

setpointer(HourGlass!)

lst_par.dw_maestro = 'd_caja_terminalxcliente_rep'
lst_par.tipo = 22
lst_par.parstring6 = iscodcli
lst_par.titulo = 'Cajas terminales por cliente'

OpenSheetWithparm (w_ventana, lst_par, "w_visor_comun_in", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

type dw_36 from datawindow within tabpage_caja_terminal
integer x = 5
integer y = 28
integer width = 2642
integer height = 1688
integer taborder = 80
string title = "none"
string dataobject = "d_caja_terminalxcliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long ll_recosi

IF ROW < 1 THEN RETURN
this.scrolltorow(row)
this.setfocus()
f_select_current_row (this)

/*
if this.getrow()>0 then
	ll_recosi = this.getitemnumber(this.getrow(),'recosi')
	dw_37.retrieve ( ll_recosi)
end if
*/
end event

event itemfocuschanged;f_select_current_row(this)
end event

event rowfocuschanged;long ll_recosi

IF CURRENTROW < 1 THEN RETURN
this.scrolltorow(currentrow)
this.setfocus()
f_select_current_row (this)

/*
if this.getrow()>0 then
	ll_recosi = this.getitemnumber(this.getrow(),'recosi')
	dw_37.retrieve ( ll_recosi)
end if
*/
end event

type tabpage_fac from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3022
integer height = 1756
long backcolor = 80269524
string text = "Facturación"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_57 dw_57
cbx_dup cbx_dup
cb_20 cb_20
cb_4 cb_4
cb_2 cb_2
cb_16 cb_16
cb_cob cb_cob
st_doc st_doc
st_6 st_6
dw_10 dw_10
dw_9 dw_9
end type

on tabpage_fac.create
this.dw_57=create dw_57
this.cbx_dup=create cbx_dup
this.cb_20=create cb_20
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_16=create cb_16
this.cb_cob=create cb_cob
this.st_doc=create st_doc
this.st_6=create st_6
this.dw_10=create dw_10
this.dw_9=create dw_9
this.Control[]={this.dw_57,&
this.cbx_dup,&
this.cb_20,&
this.cb_4,&
this.cb_2,&
this.cb_16,&
this.cb_cob,&
this.st_doc,&
this.st_6,&
this.dw_10,&
this.dw_9}
end on

on tabpage_fac.destroy
destroy(this.dw_57)
destroy(this.cbx_dup)
destroy(this.cb_20)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_16)
destroy(this.cb_cob)
destroy(this.st_doc)
destroy(this.st_6)
destroy(this.dw_10)
destroy(this.dw_9)
end on

type dw_57 from datawindow within tabpage_fac
boolean visible = false
integer x = 169
integer y = 120
integer width = 2752
integer height = 432
integer taborder = 65
string title = "none"
string dataobject = "d_detalledefacturacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_dup from checkbox within tabpage_fac
integer x = 2693
integer y = 640
integer width = 352
integer height = 96
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DUPLICADO"
boolean checked = true
end type

type cb_20 from commandbutton within tabpage_fac
boolean visible = false
integer x = 2295
integer y = 644
integer width = 375
integer height = 84
integer taborder = 80
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Desc. por Volumen"
end type

event clicked;string lsTipDoc,ls_idfac
long ll_idcon,ll_valor,ll_idbilfac

setPointer(HourGlass!)

dw_9.AcceptText()

if dw_9.getrow()> 0 then
	
	ls_idfac=dw_9.getitemString(dw_9.getrow(),'idfac')
	lsTipdoc=dw_9.getitemstring(dw_9.getrow(),'tipdoc')

	str_atecli_his.l_tipfac=1
	str_atecli_his.s_codcli=dw_9.getitemstring(dw_9.getrow(),'codcli')

	if lstipdoc = 'REC' then

		select idcon,idbilfac into :ll_idcon, :ll_idbilfac from bilfac where idfaccxc=:ls_idfac;

		select count(idbilfac) into :ll_valor from cptoxfac
		where idcon = :ll_idcon	and idcpto in (31,32,33,34,35) and idbilfac=:ll_idbilfac;
		
		str_atecli_his.l_idcon=ll_idcon
				
		if ll_idcon>0 and ll_valor>0 then
			openwithparm(w_reportes_cliente,42)
		else
			messagebox('Aviso','No hay Descuento por Volumen')
			return;
		end if
	end if
end if
end event

type cb_4 from commandbutton within tabpage_fac
integer x = 1920
integer y = 644
integer width = 366
integer height = 84
integer taborder = 70
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contratapa Recibo"
end type

event clicked;string lsTipDoc,lsidfac
long l_idbilfac

SetPointer(HourGlass!)

If dw_9.getrow()> 0 then
	gsNumSut=dw_9.getitemstring(dw_9.getrow(),'numsut')
	gsSerSut=dw_9.getitemstring(dw_9.getrow(),'sersut')
	lsTipdoc=dw_9.getitemstring(dw_9.getrow(),'tipdoc')
	
	If lstipdoc = 'REC' then
		
		lsidfac=dw_9.getitemstring(dw_9.getrow(),'idfac')
		
		select idbilfac into :l_idbilfac from bilfac a, cxctabfac b
		where a.idfaccxc=b.idfac and b.idfac=:lsidfac;
		
		str_atecli_his.l_idbilfac=l_idbilfac
		str_atecli_his.l_idcon=dw_9.getitemNumber(dw_9.getrow(),'idcon')
	
		openwithparm(w_reportes_cliente,33)
	End if
End if
end event

type cb_2 from commandbutton within tabpage_fac
integer x = 1541
integer y = 644
integer width = 366
integer height = 84
integer taborder = 110
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Doc."
end type

event clicked;string lsTipDoc, lsTmp
string lsidfac
long l_idbilfac

SetPointer(HourGlass!)

dw_9.AcceptText()

if dw_9.getrow()> 0 then
	
	lsTipdoc=dw_9.getitemstring(dw_9.getrow(),'tipdoc')
	
	gsSerSut=dw_9.getitemstring(dw_9.getrow(),'sersut')
	gsNumSut=dw_9.getitemstring(dw_9.getrow(),'numsut')

	CHOOSE CASE lstipdoc
		CASE 'REC'
			if gsSerSut='050' or gsSerSut='060' then
				lsidfac=dw_9.getitemstring(dw_9.getrow(),'idfac')
				
				select idbilfac into :l_idbilfac from bilfac a, cxctabfac b
				where a.idfaccxc=b.idfac and b.idfac=:lsidfac;
		
				str_atecli_his.l_idbilfac=l_idbilfac
				str_atecli_his.l_idcon=dw_9.getitemNumber(dw_9.getrow(),'idcon')
	
				IF NOT cbx_dup.checked THEN
					openwithparm(w_reportes_cliente,40)
				ELSE	
					openwithparm(w_reportes_cliente,41)
				END IF;	
			else
				openwithparm(w_reportes_cliente,49)
			End if
		CASE 'FAC'
			openwithparm(w_reportes_cliente,29)
		CASE 'B/V'
			openwithparm(w_reportes_cliente,30)
		CASE 'N/C'
			openwithparm(w_reportes_cliente,31)
		CASE 'N/D'
			openwithparm(w_reportes_cliente,32)
	END CHOOSE

end if
end event

type cb_16 from commandbutton within tabpage_fac
boolean visible = false
integer x = 1102
integer y = 644
integer width = 366
integer height = 84
integer taborder = 90
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Archivo de Detalle"
end type

event clicked;string lsTipDoc, lsTmp
string lsidfac
long l_idbilfac

SetPointer(HourGlass!)

dw_9.AcceptText()

if dw_9.getrow()> 0 then
	
	lsTipdoc=dw_9.getitemstring(dw_9.getrow(),'tipdoc')
	
	gsSerSut=dw_9.getitemstring(dw_9.getrow(),'sersut')
	gsNumSut=dw_9.getitemstring(dw_9.getrow(),'numsut')

	CHOOSE CASE lstipdoc
		CASE 'REC'
			if gsSerSut='050' then
				lsidfac=dw_9.getitemstring(dw_9.getrow(),'idfac')
				
				select idbilfac into :l_idbilfac from bilfac a, cxctabfac b
				where a.idfaccxc=b.idfac and b.idfac=:lsidfac;
		
				str_atecli_his.l_idbilfac=l_idbilfac
				str_atecli_his.l_idcon=dw_9.getitemNumber(dw_9.getrow(),'idcon')
			dw_57.retrieve(str_atecli_his.l_idbilfac)
			dw_57.saveas()
			End If
	END CHOOSE
End if
end event

type cb_cob from commandbutton within tabpage_fac
integer x = 773
integer y = 644
integer width = 320
integer height = 84
integer taborder = 100
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Verifica Courier"
end type

event clicked;long ll_handle, ll_app, ll_idcon
string ls_operacion, ls_directorio,ls_nomarch
string ls_archivo, ls_sersut, ls_numsut,ls_archivo1,ls_archivo2,ls_archivo3
string ls_dirfin

SetPointer(HourGlass!)
dw_9.Accepttext()

ls_sersut = dw_9.GetItemString(dw_9.GetRow(),'sersut')
ls_numsut = dw_9.GetItemString(dw_9.GetRow(),'numsut')
ll_idcon = dw_9.GetItemNumber(dw_9.GetRow(),'idcon')

if ll_idcon >= 144 then
   ls_dirfin = "R0" + string(ll_idcon) + "\"
else
	ls_dirfin = "recibos\"
end if

ll_handle = Handle(this)
ls_operacion = 'open'
//ls_directorio  = "\\PELIMPROD01\elveloz\recibos\"
//ls_archivo = "|\elveloz\recibos\"+mid(ls_sersut,2,2)+"-"+ls_numsut+".TIF"
//ls_archivo1 = "\\PELIMPROD01\elveloz\recibos\"+mid(ls_sersut,1,3)+"-"+ls_numsut+".TIF"
//ls_archivo2 = "\\PELIMPROD01\elveloz\recibos\"+mid(ls_sersut,2,2)+"-"+ls_numsut+".JPG"
//ls_archivo3 =  "\\PELIMPROD01\elveloz\recibos\"+mid(ls_sersut,1,3)+"-"+ls_numsut+".JPG"

ls_directorio  = "\\PELIMPROD01\elveloz\"+ls_dirfin
ls_archivo = "\\PELIMPROD01\elveloz\"+ls_dirfin+mid(ls_sersut,2,2)+"-"+ls_numsut+".TIF"
ls_archivo1 = "\\PELIMPROD01\elveloz\"+ls_dirfin+mid(ls_sersut,1,3)+"-"+ls_numsut+".TIF"
ls_archivo2 = "\\PELIMPROD01\elveloz\"+ls_dirfin+mid(ls_sersut,2,2)+"-"+ls_numsut+".JPG"
ls_archivo3 =  "\\PELIMPROD01\elveloz\"+ls_dirfin+mid(ls_sersut,1,3)+"-"+ls_numsut+".JPG"

If fileexists(trim(ls_archivo)) then
	ls_archivo = mid(ls_sersut,2,2)+"-"+ls_numsut+".TIF"
//	Openwithparm(w_ver_voucher,ls_archivo)
else
	If fileexists(trim(ls_archivo1)) then
		ls_archivo = mid(ls_sersut,1,3)+"-"+ls_numsut+".TIF"
//		Openwithparm(w_ver_voucher,ls_archivo1)
	else
		If fileexists(trim(ls_archivo2)) then
			ls_archivo = mid(ls_sersut,2,2)+"-"+ls_numsut+".JPG"
//			Openwithparm(w_ver_voucher,ls_archivo2)
		else
			If fileexists(trim(ls_archivo3)) then
				ls_archivo = mid(ls_sersut,1,3)+"-"+ls_numsut+".JPG"
//				Openwithparm(w_ver_voucher,ls_archivo3)
			else
				messagebox('Aviso','Archivo no Existe')                 
         End if
		End if
	End if
End if

ll_app = ShellExecuteA (ll_handle, ls_operacion, ls_archivo, "", ls_directorio , 1)

end event

type st_doc from statictext within tabpage_fac
integer x = 283
integer y = 652
integer width = 471
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_fac
integer x = 5
integer y = 656
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Documento :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_10 from datawindow within tabpage_fac
integer y = 748
integer width = 3008
integer height = 844
integer taborder = 90
string dataobject = "dw_cnscli_factura_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_9 from datawindow within tabpage_fac
integer x = 9
integer y = 12
integer width = 3008
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_cnscli_factura_cab"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	this.setrow(row)
end if
end event

event rowfocuschanged;string lsidFac

If currentrow>0 then
	lsIdFac = this.getitemstring(currentrow,'idFac')
	dw_10.retrieve (lsIdFac)
	st_doc.text = this.getitemstring(currentrow,'tipdoc')  + '  ' +this.getitemstring(currentrow,'sersut') + '-' + this.getitemstring(currentrow,'numsut') 
End if
end event

type gb_1 from groupbox within w_mnt_caja_terminal
integer x = 14
integer width = 2999
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

