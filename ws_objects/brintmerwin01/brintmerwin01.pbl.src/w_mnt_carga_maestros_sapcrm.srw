$PBExportHeader$w_mnt_carga_maestros_sapcrm.srw
forward
global type w_mnt_carga_maestros_sapcrm from w_mnt_std
end type
type cb_2 from commandbutton within w_mnt_carga_maestros_sapcrm
end type
type dw_cliente_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_contacto_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_ubicacion_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_empleado_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_relaciones_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_atrib_cliente_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_atrib_contacto_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_medcom_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_medcom_sapcrm_movil from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_medcom_sapcrm_fax from datawindow within w_mnt_carga_maestros_sapcrm
end type
type dw_medcom_sapcrm_email from datawindow within w_mnt_carga_maestros_sapcrm
end type
end forward

global type w_mnt_carga_maestros_sapcrm from w_mnt_std
integer width = 1984
integer height = 2000
string title = "Carga datos maestros a SAPCRM"
string menuname = ""
boolean minbox = false
boolean maxbox = false
cb_2 cb_2
dw_cliente_sapcrm dw_cliente_sapcrm
dw_contacto_sapcrm dw_contacto_sapcrm
dw_ubicacion_sapcrm dw_ubicacion_sapcrm
dw_empleado_sapcrm dw_empleado_sapcrm
dw_relaciones_sapcrm dw_relaciones_sapcrm
dw_atrib_cliente_sapcrm dw_atrib_cliente_sapcrm
dw_atrib_contacto_sapcrm dw_atrib_contacto_sapcrm
dw_medcom_sapcrm dw_medcom_sapcrm
dw_medcom_sapcrm_movil dw_medcom_sapcrm_movil
dw_medcom_sapcrm_fax dw_medcom_sapcrm_fax
dw_medcom_sapcrm_email dw_medcom_sapcrm_email
end type
global w_mnt_carga_maestros_sapcrm w_mnt_carga_maestros_sapcrm

type variables
string ls_path
end variables

on w_mnt_carga_maestros_sapcrm.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_cliente_sapcrm=create dw_cliente_sapcrm
this.dw_contacto_sapcrm=create dw_contacto_sapcrm
this.dw_ubicacion_sapcrm=create dw_ubicacion_sapcrm
this.dw_empleado_sapcrm=create dw_empleado_sapcrm
this.dw_relaciones_sapcrm=create dw_relaciones_sapcrm
this.dw_atrib_cliente_sapcrm=create dw_atrib_cliente_sapcrm
this.dw_atrib_contacto_sapcrm=create dw_atrib_contacto_sapcrm
this.dw_medcom_sapcrm=create dw_medcom_sapcrm
this.dw_medcom_sapcrm_movil=create dw_medcom_sapcrm_movil
this.dw_medcom_sapcrm_fax=create dw_medcom_sapcrm_fax
this.dw_medcom_sapcrm_email=create dw_medcom_sapcrm_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_cliente_sapcrm
this.Control[iCurrent+3]=this.dw_contacto_sapcrm
this.Control[iCurrent+4]=this.dw_ubicacion_sapcrm
this.Control[iCurrent+5]=this.dw_empleado_sapcrm
this.Control[iCurrent+6]=this.dw_relaciones_sapcrm
this.Control[iCurrent+7]=this.dw_atrib_cliente_sapcrm
this.Control[iCurrent+8]=this.dw_atrib_contacto_sapcrm
this.Control[iCurrent+9]=this.dw_medcom_sapcrm
this.Control[iCurrent+10]=this.dw_medcom_sapcrm_movil
this.Control[iCurrent+11]=this.dw_medcom_sapcrm_fax
this.Control[iCurrent+12]=this.dw_medcom_sapcrm_email
end on

on w_mnt_carga_maestros_sapcrm.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.dw_cliente_sapcrm)
destroy(this.dw_contacto_sapcrm)
destroy(this.dw_ubicacion_sapcrm)
destroy(this.dw_empleado_sapcrm)
destroy(this.dw_relaciones_sapcrm)
destroy(this.dw_atrib_cliente_sapcrm)
destroy(this.dw_atrib_contacto_sapcrm)
destroy(this.dw_medcom_sapcrm)
destroy(this.dw_medcom_sapcrm_movil)
destroy(this.dw_medcom_sapcrm_fax)
destroy(this.dw_medcom_sapcrm_email)
end on

event closequery;//
end event

event ue_postopen;call super::ue_postopen;dw_cliente_sapcrm.settransobject(sqlca)
dw_contacto_sapcrm.settransobject(sqlca)
dw_ubicacion_sapcrm.settransobject(sqlca)
dw_empleado_sapcrm.settransobject(sqlca)
dw_relaciones_sapcrm.settransobject(sqlca)
dw_medcom_sapcrm.settransobject(sqlca)
dw_medcom_sapcrm_movil.settransobject(sqlca)
dw_medcom_sapcrm_fax.settransobject(sqlca)
dw_medcom_sapcrm_email.settransobject(sqlca)
dw_atrib_cliente_sapcrm.settransobject(sqlca)
dw_atrib_contacto_sapcrm.settransobject(sqlca)
end event

event ue_cargar;call super::ue_cargar;dw_maestro.object.filtro[dw_maestro.getrow()] = 1
dw_maestro.Object.codcli.Background.Color= string(rgb(192,192,192))
dw_maestro.Object.codcli.Protect='1'
end event

event timer;call super::timer;
//hpb_1.position = hpb_1.position + 10 
end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_carga_maestros_sapcrm
integer width = 1934
integer height = 1748
string dataobject = "d_mnt_carga_maestros_sapcrm"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_maestro::rowfocuschanged;//
end event

event dw_maestro::rowfocuschanging;//
end event

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;st_cliente lst_cliente
choose case as_columna
		case 'codcli'
			st_par lst_par_in
			openwithparm(w_lov_cliente_gral, lst_par_in)
			lst_Cliente=message.powerobjectparm
			if isvalid(lst_cliente) then
				//ini sapcrm
//				boolean lb_corporativo_sap
//				lb_corporativo_sap = f_valida_corporativo_sapcrm(lst_cliente.codcli)
//				
//				if lb_corporativo_sap then
//					f_msg('Cliente Corporativo, debe gestionarse a través de SAPCRM')
//					return 0
//				end if;
				//fin sapcrm
				
				dw_maestro.setitem(al_row,"codcli",lst_cliente.codcli)
				dw_maestro.setitem(al_row,'nomcli', lst_cliente.nomcli)
				//dw_maestro.setitem(al_row,'ntdide', lst_cliente.ntdide)
				//dw_maestro.setitem(al_row,'tipdide', lst_cliente.tipdide)
			end if
end choose			
return 0
end event

event dw_maestro::buttonclicked;call super::buttonclicked;string ls_file
int li_rc

if dwo.name = 'b_ruta' then
ls_path = 'C: '

li_rc = GetFolder( "my targets", ls_path )

IF li_rc = 1 Then

	dw_maestro.object.ruta[row] = ls_path

End If

end if

end event

event dw_maestro::itemchanged;call super::itemchanged;string ls_codcli_null
if dwo.name = 'filtro' then
	setnull(ls_codcli_null)
	if data = '1' then
		this.object.codcli[row] = ls_codcli_null
		this.object.nomcli[row] = ls_codcli_null
		this.Object.codcli.Protect='1'
		this.Object.codcli.Background.Color= string(rgb(192,192,192))
	else
		this.Object.codcli.Protect='0'
		this.Object.codcli.Background.Color= string(rgb(255,255,255))
	end if
end if
end event

type cb_2 from commandbutton within w_mnt_carga_maestros_sapcrm
integer x = 1591
integer y = 1764
integer width = 343
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar"
end type

event clicked;string ls_parametro
string ls_ic_cliente,ls_ic_contacto,ls_ic_ubicacion,ls_ic_empleado,ls_relaciones,ls_atrib_cliente
string ls_atrib_contacto,ls_medcom_tel,ls_medcom_telmov,ls_medcom_fax,ls_medcom_email
long al_cod_error, al_seq_carga
string as_des_error
string ls_codcli,ls_ruta
string ls_archivo_cli,ls_archivo_ubi,ls_archivo_cnt,ls_archivo_emp, ls_archivo_rel, ls_archivo_tel,ls_archivo_telmov,ls_archivo_fax,ls_archivo_email
long ll_retrieve, ll_save

declare p_Carga_Maestros_Sapcrm procedure for Pq_Mkt_Sapcrm.p_Carga_Maestros_Sapcrm(:ls_codcli,:ls_parametro);

dw_maestro.accepttext()
setpointer(hourglass!)
ls_ic_cliente = string(dw_maestro.object.ic_cliente[dw_maestro.getrow()])
ls_ic_contacto = string(dw_maestro.object.ic_contacto[dw_maestro.getrow()])
ls_ic_ubicacion = string(dw_maestro.object.ic_ubicacion[dw_maestro.getrow()])
ls_ic_empleado = string(dw_maestro.object.ic_empleado[dw_maestro.getrow()])
ls_relaciones = string(dw_maestro.object.relaciones[dw_maestro.getrow()])
ls_atrib_cliente = string(dw_maestro.object.atrib_cliente[dw_maestro.getrow()])
ls_atrib_contacto = string(dw_maestro.object.atrib_contacto[dw_maestro.getrow()])
ls_medcom_tel = string(dw_maestro.object.medcom_tel[dw_maestro.getrow()])
ls_medcom_telmov = string(dw_maestro.object.medcom_telmov[dw_maestro.getrow()])
ls_medcom_fax = string(dw_maestro.object.medcom_fax[dw_maestro.getrow()])
ls_medcom_email = string(dw_maestro.object.medcom_email[dw_maestro.getrow()])

ls_parametro = ls_ic_cliente + ls_ic_contacto + ls_ic_ubicacion + ls_ic_empleado + ls_relaciones & 
+ ls_atrib_cliente + ls_atrib_contacto+ls_medcom_tel+ls_medcom_telmov+ls_medcom_fax+ls_medcom_email

ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])

if isnull(ls_ruta) or len(ls_ruta) = 0 then
	Messagebox("Error" ,"Debe seleccionar una ruta de almacenamiento", stopsign!)			
	return	
end if

if dw_maestro.object.filtro[dw_maestro.getrow()] =1 then
	setnull(ls_codcli)

else
	ls_codcli = trim(dw_maestro.object.codcli[dw_maestro.getrow()])
	if isnull(ls_codcli) or len(trim(ls_codcli))=0 then
		Messagebox("Error" ,"Debe seleccionar un cliente", stopsign!)			
		return
	end if
	
end if

execute p_Carga_Maestros_Sapcrm;

if SQLCA.SQLCode < 0 then
		f_msg_sqlerr(sqlca,true)			
		close p_Carga_Maestros_Sapcrm;        
		return
else

	fetch p_Carga_Maestros_Sapcrm into :al_seq_carga,:al_cod_error,:as_des_error;
	close p_Carga_Maestros_Sapcrm;

	if al_cod_error<> 0 then
		Messagebox("Error" ,as_des_error, stopsign!)			
		rollback;

		close p_Carga_Maestros_Sapcrm;        
		return;
	end if;
	
	commit;
end if;

if ls_ic_cliente ='1' then
//	ls_path = ls_ruta
//	ls_path = ls_path + '\'
//	ls_archivo_cli = 'MIGCLI'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_cli
//	
//	dw_cliente_sapcrm.retrieve(al_seq_carga)
//	if dw_cliente_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_cli)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_cli)		
//	end if;
	datastore lds_datastore1
	lds_datastore1 = CREATE datastore
	lds_datastore1.DataObject = "d_carga_cliente_sapcrm"
	lds_datastore1.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_cli = 'MIGCLI'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_cli
	
	ll_retrieve = lds_datastore1.retrieve(al_seq_carga)
	ll_save = lds_datastore1.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_cli)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_cli)		
	end if
end if;


if ls_ic_contacto ='1' then
//	ls_path = ls_ruta
//	ls_path = ls_path + '\'
//	ls_archivo_cnt = 'MIGCNT'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_cnt
//	
//	dw_contacto_sapcrm.retrieve(al_seq_carga)
//	if dw_contacto_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_cnt)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_cnt)		
//	end if
		
	datastore lds_datastore2
	lds_datastore2 = CREATE datastore
	lds_datastore2.DataObject = "d_carga_contacto_sapcrm"
	lds_datastore2.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_cnt = 'MIGCNT'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_cnt
	
	ll_retrieve = lds_datastore2.retrieve(al_seq_carga)
	ll_save = lds_datastore2.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_cnt)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_cnt)		
	end if

end if;

if ls_ic_ubicacion ='1' then
//	ls_path = ls_ruta
//	ls_path = ls_path + '\'
//	ls_archivo_ubi = 'MIGUBI'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_ubi
//	
//	dw_ubicacion_sapcrm.retrieve(al_seq_carga)
//	if dw_ubicacion_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_ubi)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_ubi)		
//	end if

	datastore lds_datastore3
	lds_datastore3 = CREATE datastore
	lds_datastore3.DataObject = "d_carga_ubicacion_sapcrm"
	lds_datastore3.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_ubi = 'MIGUBI'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_ubi
	
	ll_retrieve = lds_datastore3.retrieve(al_seq_carga)
	ll_save = lds_datastore3.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_ubi)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_ubi)		
	end if
	
end if;

if ls_ic_empleado ='1' then
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_emp = 'MIGEMP'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_emp
//	
//	dw_empleado_sapcrm.retrieve(al_seq_carga)
//	if dw_empleado_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_emp)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_emp)		
//	end if

	datastore lds_datastore4
	lds_datastore4 = CREATE datastore
	lds_datastore4.DataObject = "d_carga_empleado_sapcrm"
	lds_datastore4.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_emp = 'MIGEMP'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_emp
	
	ll_retrieve = lds_datastore4.retrieve(al_seq_carga)
	ll_save = lds_datastore4.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_emp)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_emp)		
	end if
	
end if;

if ls_relaciones ='1' then
	//d_carga_relaciones_sapcrm
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_rel = 'MIGREL'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_rel
//	
//	dw_relaciones_sapcrm.retrieve(al_seq_carga)
//	if dw_relaciones_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
//	end if
	datastore lds_datastore5
	lds_datastore5 = CREATE datastore
	lds_datastore5.DataObject = "d_carga_relaciones_sapcrm"
	lds_datastore5.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_rel = 'MIGREL'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_rel
	
	ll_retrieve = lds_datastore5.retrieve(al_seq_carga)
	ll_save = lds_datastore5.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
	end if
	
end if;

//atributo cliente
if ls_atrib_cliente = '1' then
	//d_carga_atcliente_sapcrm
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_rel = 'MIGACL'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_rel
//	
//	dw_atrib_cliente_sapcrm.retrieve(al_seq_carga)
//	if dw_atrib_cliente_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
//	end if	
	datastore lds_datastore6
	lds_datastore6 = CREATE datastore
	lds_datastore6.DataObject = "d_carga_atcliente_sapcrm"
	lds_datastore6.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_rel = 'MIGACL'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_rel
	
	ll_retrieve = lds_datastore6.retrieve(al_seq_carga)
	ll_save = lds_datastore6.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
	end if
end if

//atributo contacto
if ls_atrib_contacto ='1' then
	//d_carga_atcontacto_sapcrm
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_rel = 'MIGACN'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_rel
//	
//	dw_atrib_contacto_sapcrm.retrieve(al_seq_carga)
//	if dw_atrib_contacto_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
//	end if		
	datastore lds_datastore7
	lds_datastore7 = CREATE datastore
	lds_datastore7.DataObject = "d_carga_atcontacto_sapcrm"
	lds_datastore7.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_rel = 'MIGACN'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_rel
	
	ll_retrieve = lds_datastore7.retrieve(al_seq_carga)
	ll_save = lds_datastore7.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_rel)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_rel)		
	end if
	
end if

//telefono
if ls_medcom_tel ='1' then
	//d_carga_medcom_sapcrm
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_tel = 'MIGTEL'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_tel
//	
//	dw_medcom_sapcrm.retrieve('T',al_seq_carga)
//	if dw_medcom_sapcrm.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_tel)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_tel)		
//	end if
	datastore lds_datastore8
	lds_datastore8 = CREATE datastore
	lds_datastore8.DataObject = "d_carga_medcom_sapcrm"
	lds_datastore8.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_tel = 'MIGTEL'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_tel
	
	ll_retrieve = lds_datastore8.retrieve('T',al_seq_carga)
	ll_save = lds_datastore8.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_tel)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_tel)		
	end if
	
end if;

//telefono movil
if ls_medcom_telmov ='1' then
	//d_carga_medcom_sapcrm_movil
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_telmov = 'MIGTEM'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_telmov
//	
//	dw_medcom_sapcrm_movil.retrieve('M',al_seq_carga)
//	if dw_medcom_sapcrm_movil.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_telmov)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_telmov)		
//	end if
	datastore lds_datastore9
	lds_datastore9 = CREATE datastore
	lds_datastore9.DataObject = "d_carga_medcom_sapcrm_movil"
	lds_datastore9.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_telmov = 'MIGTEM'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_telmov
	
	ll_retrieve = lds_datastore9.retrieve('M',al_seq_carga)
	ll_save = lds_datastore9.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_telmov)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_telmov)		
	end if
end if;

//fax
if ls_medcom_fax ='1' then
	//d_carga_medcom_sapcrm_fax
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_fax = 'MIGFAX'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_fax
//	
//	dw_medcom_sapcrm_fax.retrieve('F',al_seq_carga)
//	if dw_medcom_sapcrm_fax.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_fax)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_fax)		
//	end if
	datastore lds_datastore10
	lds_datastore10 = CREATE datastore
	lds_datastore10.DataObject = "d_carga_medcom_sapcrm_fax"
	lds_datastore10.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_fax = 'MIGFAX'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_fax
	
	ll_retrieve = lds_datastore10.retrieve('F',al_seq_carga)
	ll_save = lds_datastore10.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_fax)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_fax)		
	end if
end if;

//email
if ls_medcom_email ='1' then
	//d_carga_medcom_sapcrm_email
//	ls_path = ls_ruta	
//	ls_path = ls_path + '\'
//	ls_archivo_email = 'MIGMAIL'+string(al_seq_carga,'000000')+'.txt'
//	ls_path = ls_path + ls_archivo_email
//	
//	dw_medcom_sapcrm_email.retrieve('E',al_seq_carga)
//	if dw_medcom_sapcrm_email.SaveAsFormattedText(ls_path, EncodingANSI! , "|","") = 1 then
//		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_email)
//	else
//         messagebox('Error','Error al grabar el archivo ' + ls_archivo_email)		
//	end if
	datastore lds_datastore11
	lds_datastore11 = CREATE datastore
	lds_datastore11.DataObject = "d_carga_medcom_sapcrm_email"
	lds_datastore11.SetTransObject (SQLCA)
	
	setpointer(hourglass!)
	
	ls_ruta = trim(dw_maestro.object.ruta[dw_maestro.getrow()])
	
	ls_path = ls_ruta
	ls_path = ls_path + '\'
	ls_archivo_email = 'MIGMAIL'+string(al_seq_carga,'000000')+'.txt'
	ls_path = ls_path + ls_archivo_email
	
	ll_retrieve = lds_datastore11.retrieve('E',al_seq_carga)
	ll_save = lds_datastore11.SaveAs(ls_path, text!, false) 
	
	if ll_save = 1 then
		messagebox('Aviso','El archivo se grabó con el nombre ' + ls_archivo_email)
	else
		messagebox('Error','Error al grabar el archivo ' + ls_archivo_email)		
	end if
end if;

end event

type dw_cliente_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 48
integer width = 782
integer height = 116
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_cliente_sapcrm"
boolean livescroll = true
end type

type dw_contacto_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 184
integer width = 782
integer height = 116
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_contacto_sapcrm"
boolean livescroll = true
end type

type dw_ubicacion_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 320
integer width = 782
integer height = 116
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_ubicacion_sapcrm"
boolean livescroll = true
end type

type dw_empleado_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 456
integer width = 782
integer height = 116
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_empleado_sapcrm"
boolean livescroll = true
end type

type dw_relaciones_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 592
integer width = 782
integer height = 116
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_relaciones_sapcrm"
boolean livescroll = true
end type

type dw_atrib_cliente_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 728
integer width = 782
integer height = 116
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_atcliente_sapcrm"
boolean livescroll = true
end type

type dw_atrib_contacto_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 1984
integer y = 864
integer width = 777
integer height = 140
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_atcontacto_sapcrm"
boolean livescroll = true
end type

type dw_medcom_sapcrm from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 2002
integer y = 1200
integer width = 782
integer height = 116
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_medcom_sapcrm"
boolean livescroll = true
end type

type dw_medcom_sapcrm_movil from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 2002
integer y = 1332
integer width = 782
integer height = 116
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_medcom_sapcrm_movil"
boolean livescroll = true
end type

type dw_medcom_sapcrm_fax from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 2002
integer y = 1464
integer width = 782
integer height = 116
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_medcom_sapcrm_fax"
boolean livescroll = true
end type

type dw_medcom_sapcrm_email from datawindow within w_mnt_carga_maestros_sapcrm
boolean visible = false
integer x = 2002
integer y = 1596
integer width = 782
integer height = 116
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_carga_medcom_sapcrm_email"
boolean livescroll = true
end type

