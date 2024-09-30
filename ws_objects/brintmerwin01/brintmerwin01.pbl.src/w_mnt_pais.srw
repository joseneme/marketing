$PBExportHeader$w_mnt_pais.srw
forward
global type w_mnt_pais from w_md_std
end type
end forward

global type w_mnt_pais from w_md_std
integer width = 2350
integer height = 2132
windowstate windowstate = normal!
boolean center = true
boolean borrar = false
boolean suprimir = false
end type
global w_mnt_pais w_mnt_pais

on w_mnt_pais.create
call super::create
end on

on w_mnt_pais.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;CHOOSE CASE ii_tipo
	CASE 1
		td.tp1.enabled = false
END CHOOSE

end event

event ue_menu_refrescar;dw_maestro.triggerevent("ue_retrieve")
end event

event ue_permisos;call super::ue_permisos;//CHOOSE CASE ii_tipo
//	case 2
//		td.tp1.dw1.guardar = true
//		td.tp1.dw1.insertar = true
//		td.tp1.dw1.borrar = true
//	case 3
//		td.tp1.dw1.guardar = false
//		td.tp1.dw1.insertar = false
//		td.tp1.dw1.borrar = false
//END CHOOSE
end event

event ue_permisos_menu;CHOOSE CASE ii_tipo
	CASE 1
		m_mnt_std.m_archivo.m_abrir.enabled = false
		m_mnt_std.m_archivo.m_borrar.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
//		m_mnt_std.m_archivo.m_refrescar.enabled = false
//		m_mnt_std.m_funciones.enabled = false
		m_mnt_std.m_funciones.m_filtrar.enabled = false
		m_mnt_std.m_funciones.m_ordenar.enabled = false
	CASE 2
//		m_mnt_std.m_archivo.m_abrir.enabled = false
//		m_mnt_std.m_archivo.m_borrar.enabled = false
//		m_mnt_std.m_archivo.m_nuevo.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
//		m_mnt_std.m_archivo.m_refrescar.enabled = false
//		
//		m_mnt_std.m_funciones.enabled = true
		m_mnt_std.m_funciones.m_insertar_detalle.enabled = true
//		m_mnt_std.m_funciones.m_suprimir_detalle.enabled = true
		m_mnt_std.m_funciones.m_filtrar.enabled = false
		m_mnt_std.m_funciones.m_ordenar.enabled = false
END CHOOSE

end event

event ue_postopen;dw_maestro.setfocus()
m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)
dw_maestro.trigger event ue_ini_dw()
CHOOSE CASE ii_tipo
	CASE 1 //Nueva Solicitud
		dw_maestro.trigger event ue_insertar()
		this.post event ue_permisos()
		this.post event ue_permisos_menu()
	case 2
		this.post event ue_cargar()
		this.post event ue_permisos()
		this.post event ue_permisos_menu()
END CHOOSE

end event

type dw_maestro from w_md_std`dw_maestro within w_mnt_pais
integer width = 2290
integer height = 580
string dataobject = "dw_ff_pais"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean borrar = false
boolean seleccionar = false
end type

event dw_maestro::ue_retrieve;long ll_filas
if ii_tipo<>1 then
	SQL_FILTRO = " where codpai = " + string(ist_par.parstring1)
	td.tp1.dw1.postevent("ue_retrieve")
else
	if isnull(dw_maestro.getitemstring(dw_maestro.getrow(),"codpai")) then
		return 0
	else
		SQL_FILTRO = " where codpai = " + string(dw_maestro.getitemstring(dw_maestro.getrow(),"codpai"))
	end if
end if	
ll_filas = this.retrieve()
return ll_filas
end event

event dw_maestro::ue_update_pre_row;if f_dw_modify(dw_maestro) then
	if isnull(dw_maestro.getitemstring(row, "nompai")) or trim(dw_maestro.getitemstring(row, "nompai"))=''  then
		messageBox ("Error al grabar los datos","Campo 'Nombre' vacío.")
		return false
	end if
	if isnull(dw_maestro.getitemstring(row, "abrev")) or trim(dw_maestro.getitemstring(row, "abrev"))='' then
		messageBox ("Error al grabar los datos","Campo 'Abreviatura' vacío.")
		return false
	end if
	// esta condicion debe ser la ultima
	if isnull(dw_maestro.getitemstring(row, "codpai")) then
		string ls_fila
		ls_fila = f_correlativo_siguiente("VTATABPAI")
		dw_maestro.setitem(row,'CODPAI',ls_fila)
	end if
	if ls_fila='-1' or ls_fila='-2' then return false
	return true
else
	return true
end if
end event

type td from w_md_std`td within w_mnt_pais
integer y = 708
integer width = 2290
integer height = 1232
end type

event td::clicked;call super::clicked;string ls_pais
ls_pais = dw_maestro.getitemstring(dw_maestro.getrow(), 'codpai')
if isnull(ls_pais) or trim(ls_pais)='' then
	td.tp1.enabled = false
else
	td.tp1.enabled = true
end if
	
end event

type tp1 from w_md_std`tp1 within td
integer width = 2254
integer height = 1112
string text = "Estados"
end type

type dw1 from w_md_std`dw1 within tp1
integer x = 0
integer width = 2245
integer height = 1104
string dataobject = "dw_gr_estado"
boolean hscrollbar = false
boolean hsplitscroll = false
end type

event dw1::ue_retrieve;call super::ue_retrieve;if dw_maestro.GETROW()>0 then
	SQL_FILTRO = " where codpai = " + dw_maestro.getitemstring(dw_maestro.GETROW(),'codpai')
	if not isnull(dw_maestro.getitemstring(dw_maestro.GETROW(),'codpai')) then
		td.tp1.dw1.retrieve()
	end if
end if
return 0 
end event

event dw1::ue_valores_iniciales;call super::ue_valores_iniciales;setitem(al_row, 'codpai', dw_maestro.getitemstring(1, 'codpai'))
end event

