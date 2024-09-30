$PBExportHeader$w_mnt_factibilidad_gis_wimax.srw
forward
global type w_mnt_factibilidad_gis_wimax from w_mnt_std
end type
type dw_fil_sef from uo_dw_fil within w_mnt_factibilidad_gis_wimax
end type
type cb_1 from commandbutton within w_mnt_factibilidad_gis_wimax
end type
type cb_2 from commandbutton within w_mnt_factibilidad_gis_wimax
end type
end forward

global type w_mnt_factibilidad_gis_wimax from w_mnt_std
boolean guardar = false
boolean querymode = false
event ue_mnt_pricing ( )
event ue_menu_validar_carga ( )
event ue_menu_procesar_carga ( )
dw_fil_sef dw_fil_sef
cb_1 cb_1
cb_2 cb_2
end type
global w_mnt_factibilidad_gis_wimax w_mnt_factibilidad_gis_wimax

type variables
decimal{0} ide_descuento
string titulo
end variables

event ue_mnt_pricing();long ll_flgpricing
string ls_numslc, ls_tipsrv
string ls_grupo
st_par lst_par
//w_mnt_pricing_numpto w_ventana1
window w_ventana

ls_numslc = dw_maestro.getitemString(dw_maestro.getrow(),'numslc')
ls_tipsrv = dw_maestro.object.tipsrv[dw_maestro.getrow()]

if isnull(ls_numslc) then return

select vtatabusugru.codgru
  into :ls_grupo
  from vtatabusugru
 where vtatabusugru.name = user;
 
select vtatabgru.pordes
 into :ide_descuento
 from  vtatabgru
 where vtatabgru.codgru = :ls_grupo ;
 
if IsNull(ide_descuento) then ide_descuento = 0

lst_par.parstring1 = ls_numslc
lst_par.parstring2 = ls_tipsrv
lst_par.parlong1 = ide_descuento

if ii_tipo = 5 then  // Aprobar Pricing
   lst_par.updwprop = true
	lst_par.guardar  = true
	lst_par.nuevo    = false	
	lst_par.borrar   = false	
	lst_par.insertar = false
	lst_par.suprimir = false	
	lst_par.tipo     = ii_tipo
	lst_par.titulo   = "Aprobación de Solicitud por Pricing"	
//	openwithparm(w_ventana1,lst_par)
	OpenSheetWithParm(w_ventana, lst_par, "w_mnt_pricing_numpto", Parentwindow(), 1, Original!)
end if
end event

event ue_menu_validar_carga();st_par lst_par_in,lst_par_out
string ls_grupo_carga

ls_grupo_carga =dw_maestro.getitemstring(dw_maestro.getrow(),'GRUPO_CARGA')

DECLARE P_verifica_info PROCEDURE FOR PQ_FACTIBILIDAD_GIS_WIMAX.P_verifica_info(:ls_grupo_carga);

EXECUTE P_verifica_info;

dw_maestro.retrieve()
end event

event ue_menu_procesar_carga();st_par lst_par_in,lst_par_out
string ls_grupo_carga

ls_grupo_carga =dw_maestro.getitemstring(dw_maestro.getrow(),'GRUPO_CARGA')

DECLARE P_PROCESA_CARGA PROCEDURE FOR PQ_FACTIBILIDAD_GIS_WIMAX.P_PROCESA_CARGA(:ls_grupo_carga);

EXECUTE P_PROCESA_CARGA;

dw_maestro.retrieve()
end event

on w_mnt_factibilidad_gis_wimax.create
int iCurrent
call super::create
this.dw_fil_sef=create dw_fil_sef
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_fil_sef
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_mnt_factibilidad_gis_wimax.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_fil_sef)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event ue_postopen;dw_fil_sef.uf_ini(sqlca)
dw_fil_sef.uf_getsql()//dw_maestro.trigger event ue_ini_dw()
m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)

dw_fil_sef.setfocus()

this.post event ue_permisos()
this.post event ue_permisos_menu()
end event

event ue_menu_buscar;if dw_fil_sef.visible then
	ib_menu_buscar = true
	dw_maestro.trigger event ue_refrescar(true)
	dw_fil_sef.visible=false
else
	dw_fil_sef.visible=true
	dw_fil_sef.setfocus()
end if
end event

event close;//dw_fil_sef.uf_save()
end event

event open;call super::open;//dw_fil_sef.setfocus()
//
//m_mnt_renovacion.m_funciones.m_renovacauto.visible=false
//m_mnt_renovacion.m_funciones.m_casillacorreo.visible=false
//m_mnt_renovacion.m_funciones.m_modpreciospricing.visible=false	
//	
//CHOOSE CASE ii_tipo
//CASE 5
//	m_mnt_renovacion.m_funciones.m_renovacauto.visible=false
//	m_mnt_renovacion.m_funciones.m_casillacorreo.visible=false
//	m_mnt_renovacion.m_funciones.m_modpreciospricing.visible=true
//END CHOOSE
//
//if (gsPais = 'BRA') then
//	m_mnt_renovacion.m_funciones.m_renovacauto.visible=false
//	m_mnt_renovacion.m_funciones.m_casillacorreo.visible=false
//	m_mnt_renovacion.m_funciones.m_modpreciospricing.visible=false	
//end if
//
end event

event ue_menu_grabar;string ls_bts, ls_rut, ls_codsuc, ls_cobertura_los
long ll_bw1

ls_bts= dw_maestro.getitemstring(dw_maestro.getrow(),'bts')
ls_rut= dw_maestro.getitemstring(dw_maestro.getrow(),'rut')
ls_codsuc= dw_maestro.getitemstring(dw_maestro.getrow(),'codsuc')
ls_cobertura_los= dw_maestro.getitemstring(dw_maestro.getrow(),'cobertura_los')
ll_bw1= dw_maestro.getitemnumber(dw_maestro.getrow(),'bw1')

if isnull(ls_rut) then
messagebox('Advertencia','Faltan ingresar datos del RUT')
return
end if

if isnull(ls_codsuc) then
messagebox('Advertencia','Faltan ingresar datos de la Sucursal')
return
end if

if isnull(ls_bts) then
messagebox('Advertencia','Faltan ingresar datos de la BTS')
return
end if

if isnull(ls_cobertura_los) then
messagebox('Advertencia','Faltan ingresar datos de la CoberturaLos')
return
end if

if isnull(ll_bw1) then
messagebox('Advertencia','Faltan ingresar datos del BW')
return
end if


if not this.guardar then
	f_msg('Esta ventana es de solo lectura.')
	return
end if
if dw_maestro.trigger event ue_guardar(false) then
	commit;
	if SQLCA.sqlcode = 0 then
		dw_maestro.uf_resetupdate()
		f_msg('Se grabaron los datos.')
	else
		f_msg_sqlerr(sqlca,true)
	end if
else
	rollback;
end if




this.TriggerEvent("ue_menu_refrescar")	
end event

event ue_menu_cerrar;//
//messagebox('','')

close(this)
end event

event closequery;
dw_maestro.uf_resetupdate()
//f_msg('Se grabaron los datos.')
return 0



end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_factibilidad_gis_wimax
integer x = 14
integer y = 156
string dataobject = "d_mnt_factibilidad_gis_wimax"
end type

event dw_maestro::ue_update_pre_row;call super::ue_update_pre_row;return true
end event

event dw_maestro::ue_retrieve;SQL_FILTRO = dw_fil_sef.uf_getsql()

return retrieve()
end event

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;dwobject dwo_data
st_par lst_par , lst_par_out
string ls_rut, ls_codcli, ls_dsccli, ls_nomvia, ls_numvia, ls_tipovia, ls_ubisuc, ls_nomdst, ls_nompvc
long ll_row , ll_cantidad , i , j= 1

ll_row = dw_maestro.getrow()
choose case as_columna
		
		case 'rut'
			ist_par.valido     = false
			OpenWithParm(w_lov_clienteslc_nef,ist_par)
			lst_par = message.PowerObjectParm
			If lst_par.valido then				
				object.rut[al_row] = lst_par.parstring4
				object.nom_clte[al_row] = lst_par.parstring2	
		   end if
			AcceptText()	
				
		case 'codsuc'
		   ls_rut=dw_maestro.object.rut[ll_row]

			select codcli, nomcli into :ls_codcli, :ls_dsccli
			from vtatabcli where ntdide=:ls_rut;
			
			ist_par.parstring1 = ls_codcli
			ist_par.parstring2 = ls_dsccli
			ist_par.tipo = 0
			ist_par.valido     = false
			OpenWithParm(w_bus_sucursal,ist_par)
			lst_par = message.PowerObjectParm
			If lst_par.valido then
				object.direccion[al_row]  = lst_par.parstring6
            object.codsuc[al_row] = lst_par.parstring4
				
				select v.ubisuc, v.nomvia, v.numvia, (select p.abrvia from pertipvia p where p.codvia=v.tipviap ) into :ls_ubisuc, :ls_nomvia, :ls_numvia, :ls_tipovia 
				from vtasuccli v where codsuc= :lst_par.parstring4;
				
				select nomdst, nompvc into :ls_nomdst, :ls_nompvc from v_ubicaciones where codubi=:ls_ubisuc;
				
				object.calle[al_row] = ls_nomvia
				object.numero[al_row] = ls_numvia				
				object.abrvia[al_row] = ls_tipovia
				object.comuna[al_row] = ls_nomdst
				object.ciudad[al_row] = ls_nompvc
		   end if
			AcceptText()
			
		case 'bts'
			//MI 20070522
			ist_par.parstring3 = dw_maestro.object.codsuc[al_row]
			
			If Isnull(ist_par.parstring3) or ist_par.parstring3 = '' then
				messagebox('Aviso','Primero debe elegir la sucursal.')
				return 0
			Else
				ist_par.valido = false
				OpenWithParm(w_lov_btswimax,ist_par)
				lst_par = message.PowerObjectParm
	
				If lst_par.valido then				
					object.bts[al_row] = lst_par.parstring1
					object.cobertura_los[al_row] = lst_par.parstring2
					object.nro_bts[al_row] = lst_par.parlong1	
				end if
			
				AcceptText()
			End If
end choose
return 0

end event

event dw_maestro::ue_refrescar;//if this.trigger event ue_guardar(ab_preguntar) then
//	commit;
//	if SQLCA.sqlcode = 0 then
//		uf_resetupdate()
//		if ib_std_modificado then
//			f_msg('Se grabaron los datos.')
//		end if
//		this.trigger event ue_ini_dw()
//		this.trigger event ue_cargar()			
//	else
//		f_msg_sqlerr(sqlca,true)
//	end if
//else
//	rollback;	
//end if
	
	
	uf_resetupdate()
	this.trigger event ue_ini_dw()
	this.trigger event ue_cargar()		
end event

type dw_fil_sef from uo_dw_fil within w_mnt_factibilidad_gis_wimax
event ue_keydown pbm_dwnkey
integer x = 466
integer y = 492
integer width = 2007
integer height = 340
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Filtros"
string dataobject = "d_fil_grupocarga_fact_gis_wimax"
boolean controlmenu = true
boolean ib_ini = false
end type

event ue_keydown;if keydown(keyenter!) then
	event ue_menu_buscar()
end if
end event

event ue_getsql;accepttext()
is_sql = ""

if uf_flag('f_estsolfac') then
	is_sql = is_sql + " and grupo_carga = '" + string(object.estsolfac[1])+"'"
end if

return is_sql
end event

event buttonclicked;call super::buttonclicked;choose case dwo.name
	case 'b_aceptar'
		event ue_menu_buscar()
	case 'b_cancelar'
	dw_fil_sef.enabled = false
	dw_fil_sef.visible = false
end choose
end event

type cb_1 from commandbutton within w_mnt_factibilidad_gis_wimax
integer x = 41
integer y = 24
integer width = 503
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validar Información"
end type

event clicked;parent.triggerevent("ue_menu_validar_carga")
end event

type cb_2 from commandbutton within w_mnt_factibilidad_gis_wimax
integer x = 585
integer y = 24
integer width = 503
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;parent.triggerevent("ue_menu_procesar_carga")
end event

