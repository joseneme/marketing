HA$PBExportHeader$w_carga_lote.srw
forward
global type w_carga_lote from w_md_std
end type
type sle_1 from singlelineedit within w_carga_lote
end type
type cb_1 from commandbutton within w_carga_lote
end type
type cb_2 from commandbutton within w_carga_lote
end type
type dw_ext from uo_dw_std within w_carga_lote
end type
type cb_3 from commandbutton within w_carga_lote
end type
type cb_4 from commandbutton within w_carga_lote
end type
type gb_1 from groupbox within w_carga_lote
end type
end forward

global type w_carga_lote from w_md_std
integer width = 5280
integer height = 2352
sle_1 sle_1
cb_1 cb_1
cb_2 cb_2
dw_ext dw_ext
cb_3 cb_3
cb_4 cb_4
gb_1 gb_1
end type
global w_carga_lote w_carga_lote

forward prototypes
public subroutine wf_cargar_lote ()
public subroutine wf_procesar_lote ()
public subroutine wf_anular_lote ()
end prototypes

public subroutine wf_cargar_lote ();String ls_ruta
Integer li_rpta
Long ll_idlote, ll_i, ll_count

//Limpiamos
dw_ext.trigger event ue_ini_dw()
DECLARE P_INS_LOTE PROCEDURE FOR PQ_VTALOTE.P_INS_VTATABLOTE_MKT(:ii_tipo, :ls_ruta);

SetPointer(HourGlass!)
ls_ruta = sle_1.Text
if ls_ruta = '' Then
	Messagebox('Aviso','Debe de seleccionar un archivo.', Exclamation!)
	Return
End If

//Importamos al DW
li_rpta = dw_ext.ImportFile(ls_ruta,2)
if li_rpta < 0 Then
	Messagebox('Aviso','Error al cargar Archivo:' + char(10) + ls_ruta, Exclamation!)
	Return
End If

//Insertamos
EXECUTE P_INS_LOTE;
if SQLCA.SQLCode < 0 then
	GOTO Error_DB
End If

FETCH P_INS_LOTE INTO :ll_idlote;
if SQLCA.SQLCode < 0 then
	GOTO Error_DB
End If

//Seteamos el ID al Detalle
ll_i = dw_ext.RowCount()
DO WHILE ll_i > 0
//	If IsNull(dw_ext.GetItemString(ll_i,'codcli')) and IsNull(dw_ext.GetItemString(ll_i,'nomcli')) Then
//		dw_ext.DeleteRow(ll_i)
//	Else
		dw_ext.SetItem(ll_i, 'idlote', ll_idlote)
		dw_ext.SetItem(ll_i, 'estado', 1)
//	End If
	ll_i = ll_i - 1
LOOP

IF DW_EXT.TRIGGER EVENT UE_GUARDAR(FALSE) = FALSE THEN
	GOTO Error_DB
END IF

//Actualizamos el total del LOTE
ll_count = dw_ext.RowCount()
UPDATE VTATABLOTE
   SET CANTCAR = :ll_count
 WHERE IDLOTE = :ll_idlote;
//

COMMIT;
CLOSE P_INS_LOTE;
SetPointer(Arrow!)
sle_1.Text = ''
MessageBox('Aviso','Lote cargado correctamente: ID = ' + String(ll_idlote))
Trigger Event ue_cargar()
Return

ERROR_DB:
SetPointer(Arrow!)
f_msg_sqlerr(sqlca,true)
CLOSE P_INS_LOTE;
end subroutine

public subroutine wf_procesar_lote ();Long ll_idlote, ll_i
Integer li_sel
Boolean lb_switch

//
DECLARE P_PRO_LOTE PROCEDURE FOR PQ_VTALOTE.P_PRO_VTATABLOTE(:ll_idlote);

SetPointer(HourGlass!)
For ll_i = 1 to dw_maestro.Rowcount()
	li_sel = dw_maestro.GetItemNumber(ll_i, 'flg')
	If li_sel = 1 then 
		lb_switch = true
		exit
	end If
Next

If lb_switch = false Then
	Messagebox('Aviso','Debe de seleccionar al menos un Lote.', Exclamation!)
	Return	
End If

For ll_i = 1 to dw_maestro.Rowcount()
	li_sel = dw_maestro.GetItemNumber(ll_i, 'flg')
	If li_sel = 1 then 
		ll_idlote = dw_maestro.GetItemNumber(ll_i, 'idlote')
		
		//Procesamos
		EXECUTE P_PRO_LOTE;
		if SQLCA.SQLCode < 0 then
			GOTO Error_DB
		End If
		CLOSE P_PRO_LOTE;
	end If
Next

COMMIT;
SetPointer(Arrow!)
MessageBox('Aviso','Lotes PROCESADOS correctamente.')
Trigger Event ue_cargar()
Return

ERROR_DB:
SetPointer(Arrow!)
f_msg_sqlerr(sqlca,true)
CLOSE P_PRO_LOTE;
end subroutine

public subroutine wf_anular_lote ();Long ll_idlote, ll_i
Integer li_sel
Boolean lb_switch

//
DECLARE P_ANU_LOTE PROCEDURE FOR PQ_VTALOTE.P_ANU_VTATABLOTE(:ll_idlote);

SetPointer(HourGlass!)
For ll_i = 1 to dw_maestro.Rowcount()
	li_sel = dw_maestro.GetItemNumber(ll_i, 'flg')
	If li_sel = 1 then 
		lb_switch = true
		exit
	end If
Next

If lb_switch = false Then
	Messagebox('Aviso','Debe de seleccionar al menos un Lote.', Exclamation!)
	Return	
End If

For ll_i = 1 to dw_maestro.Rowcount()
	li_sel = dw_maestro.GetItemNumber(ll_i, 'flg')
	If li_sel = 1 then 
		ll_idlote = dw_maestro.GetItemNumber(ll_i, 'idlote')
		
		//ANULAMOS
		EXECUTE P_ANU_LOTE;
		if SQLCA.SQLCode < 0 then
			GOTO Error_DB
		End If
		CLOSE P_ANU_LOTE;
	end If
Next

SetPointer(Arrow!)
COMMIT;
MessageBox('Aviso','Lotes ANULADOS correctamente.')
Trigger Event ue_cargar()
Return

ERROR_DB:
SetPointer(Arrow!)
f_msg_sqlerr(sqlca,true)
CLOSE P_ANU_LOTE;
end subroutine

on w_carga_lote.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_ext=create dw_ext
this.cb_3=create cb_3
this.cb_4=create cb_4
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.dw_ext
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_4
this.Control[iCurrent+7]=this.gb_1
end on

on w_carga_lote.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_ext)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.gb_1)
end on

event open;call super::open;//Seteamos los DW Detalle

Choose Case ii_tipo
	Case 1 //Sucursales
		td.tp1.dw1.DataObject = 'dw_mnt_vtadetlote'
		dw_ext.DataObject = 'dw_cargar_vtadetlote'
	Case 2 //Actividades de Fidelizaci$$HEX1$$f300$$ENDHEX$$n
		td.tp1.dw1.DataObject = 'dw_mnt_vtadetlote_af'
		dw_ext.DataObject = 'dw_cargar_vtadetlote_af'
	Case 3 //Contactos
		td.tp1.dw1.DataObject = 'dw_mnt_vtadetlote_cnt'
		dw_ext.DataObject = 'dw_cargar_vtadetlote_cnt'
	//RBT - Nuevos Clientes SGA	
	Case 4 //Clientes
		td.tp1.dw1.DataObject = 'dw_mnt_vtadetlote_cli'
		dw_ext.DataObject = 'dw_cargar_vtadetlote_cli'
End Choose
end event

type dw_maestro from w_md_std`dw_maestro within w_carga_lote
integer y = 164
integer width = 3150
integer height = 728
string dataobject = "dw_mnt_vtatablote"
end type

event dw_maestro::ue_retrieve;return this.retrieve(ii_tipo)
end event

type td from w_md_std`td within w_carga_lote
integer y = 900
end type

type tp1 from w_md_std`tp1 within td
string text = "Detalle"
end type

type dw1 from w_md_std`dw1 within tp1
string dataobject = "dw_mnt_vtadetlote"
end type

event dw1::ue_retrieve;long ll_row
long ll_id

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ll_id = dw_maestro.GetItemNumber(ll_row,'idlote')
	return this.retrieve(ll_id)
else
	return 0
end if
end event

event dw1::ue_valida_dato;call super::ue_valida_dato;st_par lst_par_out

choose case as_columna
	case 'desc_nompvc'
			lst_par_out.titulo = 'Buscar Ciudades'
			OpenWithParm(w_lov_provincia,lst_par_out)
			lst_par_out = message.powerobjectparm
			if isvalid(lst_par_out) then
				object.codpvc[al_row] = lst_par_out.parstring1
				object.codest[al_row] = lst_par_out.parstring2
				object.codpai[al_row] = lst_par_out.parstring3
				object.desc_nompvc[al_row] = lst_par_out.parstring4				
			end if
end choose
return 1
end event

type sle_1 from singlelineedit within w_carga_lote
integer x = 46
integer y = 44
integer width = 1408
integer height = 84
integer taborder = 70
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

type cb_1 from commandbutton within w_carga_lote
integer x = 1486
integer y = 44
integer width = 174
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;//RBT - Nuevos Clientes SGA
string ls_pathname, ls_filename
long ll_rc, ll_row, ll_idlote, ll_count
int ll_i
oleobject loo_excel, lo_sheet

//Se limpia
dw_ext.trigger event ue_ini_dw()
dw_ext.clear()
DECLARE P_INS_LOTE PROCEDURE FOR PQ_VTALOTE.P_INS_VTATABLOTE_MKT(:ii_tipo, :ls_pathname);

if getFileOpenName("Seleccionar Archivo", ls_pathname, ls_filename, "XLS","Excel Files(*.xlsx),*.xlsx,Excel 97/2003 Files(*.xls),*.xls") < 1 then return

if ls_filename = "" then return
sle_1.Text = ls_pathname
parent.title = parent.title +' - '+ sle_1.Text

loo_excel = create OLEObject
loo_excel.connecttonewobject( "excel.Application")
loo_excel.visible = false
loo_excel.workbooks.open(ls_pathname)
lo_sheet = loo_excel.application.ActiveSheet

//Se desprotege la hoja para que no arroje error
lo_sheet.unprotect()
loo_excel.activeCell.CurrentRegion.Select()
loo_excel.Selection.Copy()

//Se copia a partir de la 2da fila, la primera corresponde a la cabecera
ll_rc = dw_ext.importclipboard(2)
clipboard('')
loo_excel.workbooks.close()
loo_excel.Disconnectobject( )
Destroy loo_excel

//Validamos la carga. Si no carga registros, informa
if ll_rc < 0 then
	messagebox('Aviso','Error. No se han cargado registros. Revise el archivo de carga e intente nuevamente')
	return
end if

//Insertamos
EXECUTE P_INS_LOTE;
if SQLCA.SQLCode < 0 then
	GOTO Error_DB
End If

FETCH P_INS_LOTE INTO :ll_idlote;
if SQLCA.SQLCode < 0 then
	GOTO Error_DB
End If

if dw_ext.rowcount() > 0 then
	for ll_i=1 to dw_ext.rowcount( )
		dw_ext.SetItem(ll_i, 'idlote', ll_idlote)
		dw_ext.SetItem(ll_i, 'estado', 1)
	next
	if dw_ext.trigger event ue_guardar(false) then
		commit;
		if sqlca.sqlcode = 0 then
			dw_ext.uf_resetupdate( )
			//cb_procesar.enabled = true
			messagebox(gsnomapl,'Archivo cargado listo para procesar.')
		else
			messagebox(gsnomapl,string(error.number)+'-'+error.text)
		end if
	else
		rollback;
	end if
end if

IF DW_EXT.TRIGGER EVENT UE_GUARDAR(FALSE) = FALSE THEN
	GOTO Error_DB
END IF

//Actualizamos el total del LOTE
ll_count = dw_ext.RowCount()
UPDATE VTATABLOTE
   SET CANTCAR = :ll_count
 WHERE IDLOTE = :ll_idlote;
//

COMMIT;

CLOSE P_INS_LOTE;
SetPointer(Arrow!)
sle_1.Text = ''
	messagebox('Aviso','Lote cargado correctamente: ID = ' + String(ll_idlote))
Trigger Event ue_cargar()
Return

ERROR_DB:
SetPointer(Arrow!)
f_msg_sqlerr(sqlca,true)
CLOSE P_INS_LOTE;
end event

type cb_2 from commandbutton within w_carga_lote
boolean visible = false
integer x = 1719
integer y = 36
integer width = 343
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cargar"
end type

event clicked;wf_cargar_lote()
end event

type dw_ext from uo_dw_std within w_carga_lote
boolean visible = false
integer x = 1801
integer y = 620
integer width = 2190
integer height = 780
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_cargar_vtadetlote"
end type

type cb_3 from commandbutton within w_carga_lote
integer x = 2107
integer y = 36
integer width = 343
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;wf_procesar_lote()
end event

type cb_4 from commandbutton within w_carga_lote
integer x = 2496
integer y = 36
integer width = 343
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;wf_anular_lote()
end event

type gb_1 from groupbox within w_carga_lote
integer x = 14
integer y = -8
integer width = 1678
integer height = 156
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "File"
end type

