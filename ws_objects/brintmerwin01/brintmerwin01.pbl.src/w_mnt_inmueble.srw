$PBExportHeader$w_mnt_inmueble.srw
$PBExportComments$Ventana de Mantenimiento y Consulta: Inmuebles
forward
global type w_mnt_inmueble from w_mnt_std
end type
end forward

global type w_mnt_inmueble from w_mnt_std
integer width = 2633
integer height = 932
windowstate windowstate = normal!
boolean center = true
end type
global w_mnt_inmueble w_mnt_inmueble

type variables
boolean ib_fin_retrieve=false
end variables

on w_mnt_inmueble.create
call super::create
end on

on w_mnt_inmueble.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;dw_maestro.enabled = true 

CHOOSE CASE ii_tipo
	case 2,3
		dw_maestro.seleccionar = true
		dw_maestro.vscrollbar = true
		dw_maestro.hscrollbar = true
		this.windowstate = maximized!
	case 5
		dw_maestro.enabled = false
END CHOOSE
end event

event ue_postopen;dw_maestro.setfocus()
m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)
dw_maestro.trigger event ue_ini_dw()
if ii_tipo = 1 or ii_tipo=6 then //Nueva Solicitud
	dw_maestro.trigger event ue_insertar()
	this.post event ue_permisos()
	this.post event ue_permisos_menu()
else
	this.post event ue_cargar()
	this.post event ue_permisos()
	this.post event ue_permisos_menu()
end if


end event

event ue_permisos_menu;call super::ue_permisos_menu;m_mnt_std.m_archivo.m_abrir.enabled = false
CHOOSE CASE ii_tipo
	CASE 1,4,6 
		m_mnt_std.m_archivo.m_grabar.enabled = true
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = false
		m_mnt_std.m_archivo.m_exportar.enabled = false
		m_mnt_std.m_archivo.m_imprimir.enabled = false
	case 2,3
		m_mnt_std.m_archivo.m_buscar.enabled = true
		m_mnt_std.m_archivo.m_refrescar.enabled = true
		m_mnt_std.m_archivo.m_exportar.enabled = true
		m_mnt_std.m_archivo.m_imprimir.enabled = true
	case else
		m_mnt_std.m_archivo.m_grabar.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = true
		m_mnt_std.m_archivo.m_exportar.enabled = false
		m_mnt_std.m_archivo.m_imprimir.enabled = false
END CHOOSE
m_mnt_std.m_archivo.m_borrar.enabled = false

m_mnt_std.m_funciones.enabled = false
m_mnt_std.m_funciones.m_filtrar.enabled = false
m_mnt_std.m_funciones.m_ordenar.enabled = false
m_mnt_std.m_funciones.m_insertar_detalle.enabled = false
m_mnt_std.m_funciones.m_suprimir_detalle.enabled = false

end event

event ue_menu_refrescar;dw_maestro.triggerevent("ue_retrieve")
end event

event closequery;if dw_maestro.trigger event ue_guardar(true) then
	st_inmueble lst_inmueble
	if dw_maestro.getrow() > 0 then
			lst_inmueble.idinmueble = dw_maestro.getitemnumber(dw_maestro.getrow(),'idinmueble')
			lst_inmueble.nombre = dw_maestro.getitemstring(dw_maestro.getrow(),'nombre')
			lst_inmueble.tipviap = dw_maestro.getitemstring(dw_maestro.getrow(),'tipviap')
			lst_inmueble.nomvia  = dw_maestro.getitemstring(dw_maestro.getrow(),'nomvia')	
			lst_inmueble.numvia = dw_maestro.getitemstring(dw_maestro.getrow(),'numvia')
			lst_inmueble.complemento = dw_maestro.getitemstring(dw_maestro.getrow(),'complemento')
			lst_inmueble.codubi = dw_maestro.getitemstring(dw_maestro.getrow(),'codubi')
			lst_inmueble.codpos = dw_maestro.getitemstring(dw_maestro.getrow(),'codpos')
			lst_inmueble.flag = true 
	end if
	closewithreturn(this,lst_inmueble)
	return 0
end if
return 1


end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_inmueble
integer width = 2560
integer height = 604
string dataobject = "dw_ff_inmueble"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean seleccionar = false
end type

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;string ls_columna
st_inmueble lst_inmueble

CHOOSE CASE as_columna
	CASE 'codubi'
			open(w_buscar_ubicacion)
			lst_inmueble = message.powerobjectparm
			if isvalid(lst_inmueble) then
				dw_maestro.setitem(al_row,"codubi", lst_inmueble.codubi)
				dw_maestro.setitem(al_row,"codpos", lst_inmueble.codpos)
				dw_maestro.setitem(al_row,"distrito_desc", lst_inmueble.distrito_desc)
			end if
END CHOOSE

return 0
end event

event dw_maestro::ue_retrieve;long ll_filas, ll_factual
ll_factual = dw_maestro.getrow()
CHOOSE CASE ii_tipo
	case 1, 6
		if isnull(dw_maestro.getitemnumber(ll_factual,"idinmueble")) then
			return 0
		else
			SQL_FILTRO = " where idinmueble = " + string(dw_maestro.getitemnumber(ll_factual,"idinmueble"))
		end if
	CASE 2,3
		open(w_filtrar_inmueble)
		SQL_FILTRO = message.stringparm
	case 4,5
		SQL_FILTRO = " where idinmueble = '" + string(ist_par.parlong1) + "' "
END CHOOSE
ll_filas = this.retrieve()
return ll_filas

end event

event dw_maestro::ue_update_pre_row;call super::ue_update_pre_row;long ll_row_maestro
ll_row_maestro = dw_maestro.getrow()
if f_dw_modify(dw_maestro) then
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "nombre")) then
		messageBox ("Error al grabar los datos","campo 'Nombre Inmueble' vacío")
		return false
   end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "tipviap")) then
		messageBox ("Error al grabar los datos","campo 'Tipo Vía' vacío")
		return false
   end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "nomvia")) or &
		dw_maestro.getitemstring(ll_row_maestro, "nomvia") = '' then
		messageBox ("Error al grabar los datos","campo 'Nombre Vía' vacío")
		return false
   end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "numvia")) or &
		dw_maestro.getitemstring(ll_row_maestro, "numvia") = '' then
		messageBox ("Error al grabar los datos","campo 'Número' vacío")
		return false
   end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "codpos")) or &
		dw_maestro.getitemstring(ll_row_maestro, "codpos") = '' then
		messageBox ("Error al grabar los datos","campo 'Código Postal' vacío")
		return false
	end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "complemento")) then
		messageBox ("Error al grabar los datos","campo 'Complemento' vacío")
		return false
	end if				
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "codubi")) then
		messageBox ("Error al grabar los datos","campo 'Ubicación' vacío")
		return false
   end if
end if
return true
end event

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
w_mnt_inmueble iw_mnt_inmueble
long ll_idsolicitud
st_par lst_par
if row < 1 then return
ll_idsolicitud=this.getitemnumber(row,'idinmueble')
CHOOSE CASE ii_tipo
	case 1,4,5,6
		return
	CASE 2
		lst_par.updwprop = true
		lst_par.guardar = true
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Mantenimiento de Inmuebles"
		lst_par.dw_maestro = 'dw_ff_inmueble'
		lst_par.tipo = 4
		lst_par.parlong1 = ll_idsolicitud
	CASE 3
		lst_par.updwprop = false
		lst_par.guardar = false
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Consultar Inmuebles"
		lst_par.dw_maestro = 'dw_ff_inmueble'
		lst_par.tipo = 5
		lst_par.parlong1 = ll_idsolicitud
END CHOOSE

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_inmueble", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_inmueble, lst_par)

end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;this.Setitem(al_row, "nomvia","")
if gsPais = 'PER' then
	this.setitem(al_row, 'comp_int','Interior')
elseif gsPais = 'BRA' then
	this.setitem(al_row, 'comp_int','Complemento')
end if

end event

