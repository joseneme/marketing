HA$PBExportHeader$w_mnt_mkt_usudmps.srw
$PBExportComments$Ventana Mantenimiento simple STD
forward
global type w_mnt_mkt_usudmps from w_base
end type
type dw_maestro from uo_dw_std within w_mnt_mkt_usudmps
end type
end forward

global type w_mnt_mkt_usudmps from w_base
integer width = 2981
integer height = 1484
string menuname = "m_mnt_std"
event ue_cargar ( )
event ue_ini_dw ( )
event ue_menu_borrar ( )
event ue_menu_buscar ( )
event ue_menu_cerrar ( )
event ue_menu_configurar_dw ( )
event ue_menu_grabar ( )
event ue_menu_imprimir ( )
event ue_menu_insertar_detalle ( )
event ue_menu_nuevo ( )
event ue_menu_refrescar ( )
event ue_menu_suprimir_detalle ( )
event ue_permisos ( )
event ue_permisos_menu ( )
event ue_postopen pbm_custom06
event ue_preopen ( )
dw_maestro dw_maestro
end type
global w_mnt_mkt_usudmps w_mnt_mkt_usudmps

type variables
protected:
int ii_pos_x = 15, ii_pos_y = 80
int ii_tipo = 0
st_par ist_par
boolean ib_menu_buscar = true

public:
// permisos
boolean nuevo = false
boolean guardar = true
boolean insertar = true
boolean borrar = true
boolean suprimir = true
boolean querymode = true
end variables

event ue_cargar();long ll_numfil

ll_numfil = dw_maestro.trigger event ue_cargar()
this.setmicrohelp('N$$HEX1$$fa00$$ENDHEX$$mero de registros: '+string(ll_numfil))
end event

event ue_ini_dw();dw_maestro.trigger event ue_ini_dw()

end event

event ue_menu_borrar();if not this.borrar then
	f_msg('No se puede borrar en la ventana.')
	return
end if
dw_maestro.trigger event ue_borrar()
end event

event ue_menu_buscar();ib_menu_buscar = true
dw_maestro.trigger event ue_refrescar(true)

end event

event ue_menu_cerrar();try
	close(this)
catch (runtimeerror e)
	MessageBox(e.RoutineName,e.Text)
end try

end event

event ue_menu_configurar_dw();//Permite configurar las columnas del dw maestro
dw_maestro.trigger event ue_configurar_dw()
end event

event ue_menu_grabar();if not this.guardar then
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

end event

event ue_menu_imprimir();OpenWithParm(w_dw_print_options, dw_maestro)
If Message.DoubleParm = -1 Then 
	Return
else
	dw_maestro.Print(True)
end if

	

end event

event ue_menu_insertar_detalle();if not this.insertar then
	f_msg('No se puede insertar en la ventana.')
	return
end if
// Pending for solution
//dw_maestro.trigger event ue_insertar()
end event

event ue_menu_nuevo();if not this.nuevo then
	f_msg('No se puede insertar en la ventana.')
else
	dw_maestro.trigger event ue_insertar()
end if
end event

event ue_menu_refrescar();ib_menu_buscar = false
dw_maestro.trigger event ue_refrescar(true)

end event

event ue_menu_suprimir_detalle();if not this.suprimir then
	f_msg('No se puede borrar en la ventana.')
	return
end if
// Pending for solution
//dw_maestro.trigger event ue_borrar()

end event

event ue_permisos();// Aca se pueden setear propiedades de la ventana segun otros parametros
if ist_par.updwprop then 
	if ist_par.guardar then
		this.guardar = ist_par.guardar
		this.nuevo = ist_par.nuevo
		this.borrar = ist_par.borrar
		this.insertar = ist_par.insertar
		this.suprimir = ist_par.suprimir
	else
		this.guardar = false
		this.nuevo = false
		this.insertar = false
		this.borrar = false
		this.suprimir = false
	end if	
end if

if not ist_par.guardar then
	dw_maestro.uf_upd_permisos(false,1)
else
	if not ist_par.insertar then
		dw_maestro.uf_upd_permisos(false,2)
	end if
	if not ist_par.suprimir then
		dw_maestro.uf_upd_permisos(false,3)
	end if
end if
end event

event ue_permisos_menu();
dw_maestro.guardar = this.guardar
dw_maestro.insertar = this.nuevo
dw_maestro.borrar = this.borrar

// Se actualiza la apariencia del menu
m_mnt_std lmenu
lmenu = this.menuid

if not isvalid(lmenu) then return
if isnull(lmenu) then return

lmenu.m_archivo.m_grabar.enabled = true
lmenu.m_archivo.m_borrar.enabled = true
lmenu.m_archivo.m_borrar.toolbaritemvisible = true
lmenu.m_archivo.m_borrar.visible = true
lmenu.m_archivo.m_nuevo.enabled = true
lmenu.m_archivo.m_nuevo.visible = true
lmenu.m_archivo.m_nuevo.ToolbarItemVisible = true
lmenu.m_funciones.m_insertar_detalle.enabled = true
lmenu.m_funciones.m_insertar_detalle.visible = true
lmenu.m_funciones.m_insertar_detalle.toolbarItemVisible = true
lmenu.m_funciones.m_suprimir_detalle.enabled = true
lmenu.m_funciones.m_suprimir_detalle.visible = true
lmenu.m_funciones.m_suprimir_detalle.toolbarItemVisible = true
lmenu.m_funciones.m_sep_insertar_suprimir.Visible = true



if not this.guardar then
	lmenu.m_archivo.m_grabar.enabled = false
end if

if not this.borrar then
	lmenu.m_archivo.m_borrar.enabled = false
	lmenu.m_archivo.m_borrar.toolbaritemvisible = false
	lmenu.m_archivo.m_borrar.visible = false
end if

if not this.nuevo then
	lmenu.m_archivo.m_nuevo.enabled = false
	lmenu.m_archivo.m_nuevo.visible = false
	lmenu.m_archivo.m_nuevo.ToolbarItemVisible = false
end if

if not this.insertar then
	lmenu.m_funciones.m_insertar_detalle.enabled = false
	lmenu.m_funciones.m_insertar_detalle.visible = false
	lmenu.m_funciones.m_insertar_detalle.toolbarItemVisible = false
end if

if not this.suprimir then
	lmenu.m_funciones.m_suprimir_detalle.enabled = false
	lmenu.m_funciones.m_suprimir_detalle.visible = false
	lmenu.m_funciones.m_suprimir_detalle.toolbarItemVisible = false
end if

if not this.suprimir and not this.insertar then
	lmenu.m_funciones.m_sep_insertar_suprimir.Visible = false
end if

end event

event ue_postopen;dw_maestro.trigger event ue_ini_dw()
m_mnt_std lmenu1
lmenu1 = this.menuid
if not isnull(lmenu1) and isvalid(lmenu1) then
	lmenu1.uf_set_dw(dw_maestro)
end if

this.post event ue_cargar()
this.post event ue_permisos()
this.post event ue_permisos_menu()



end event

on w_mnt_mkt_usudmps.create
int iCurrent
call super::create
if this.MenuName = "m_mnt_std" then this.MenuID = create m_mnt_std
this.dw_maestro=create dw_maestro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_maestro
end on

on w_mnt_mkt_usudmps.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_maestro)
end on

event closequery;call super::closequery;if dw_maestro.trigger event ue_guardar(true) then
	commit;
	if SQLCA.sqlcode = 0 then
		dw_maestro.uf_resetupdate()
		//f_msg('Se grabaron los datos.')
		return 0
	else
		f_msg_sqlerr(sqlca,true)
		return 1
	end if
else
	rollback;	
	return 1
end if



end event

event open;call super::open;ist_par = message.powerobjectparm

if isnull(ist_par) or not isvalid(ist_par) then
	close(this)
end if

ii_tipo = ist_par.tipo

//Logica de fillrowcolor
if ist_par.setupdw then
	dw_maestro.fillrowcolor = ist_par.fillrowcolor
end if

if trim(ist_par.titulo) <> '' then
	this.title = ist_par.titulo
end if

if trim(ist_par.dw_maestro) <> '' then
	dw_maestro.dataobject = ist_par.dw_maestro
end if

trigger event ue_preopen()
this.postevent("ue_postopen")



end event

event resize;call super::resize;dw_maestro.trigger event ue_resize(newwidth,NewHeight)
end event

type dw_maestro from uo_dw_std within w_mnt_mkt_usudmps
integer x = 32
integer y = 32
integer width = 2427
integer height = 1076
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_mnt_mkt_usudmps"
end type

event ue_retrieve;call super::ue_retrieve;try
	long ll_1
	ll_1 = this.retrieve()
	return ll_1
catch (runtimeerror e)
	MessageBox(e.RoutineName,e.Text)
end try


end event

event ue_valida_dato;call super::ue_valida_dato;dwobject dwo_data
st_par lst_par_in,lst_par_out
long ll_row, ll_iddet, ll_null
string ls_codtip

setnull(ll_null)

ll_row = dw_maestro.getrow()
choose case as_columna
	case 'usuario'
		
						
			 openwithparm(w_bus_direcciones, lst_par_in)
			lst_par_out = message.powerobjectparm	
			
			if isvalid(lst_par_out) then
		  		this.setitem(al_row,'usuario',lst_par_out.parstring1)
				this.setitem(al_row,'mail',lst_par_out.parstring2)

			end if
			
	 
		
end choose

return 0
end event

