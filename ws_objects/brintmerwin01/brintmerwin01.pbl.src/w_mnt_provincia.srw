$PBExportHeader$w_mnt_provincia.srw
forward
global type w_mnt_provincia from w_md_std
end type
end forward

global type w_mnt_provincia from w_md_std
integer width = 2487
boolean resizable = false
windowstate windowstate = normal!
boolean center = true
boolean borrar = false
boolean suprimir = false
end type
global w_mnt_provincia w_mnt_provincia

on w_mnt_provincia.create
call super::create
end on

on w_mnt_provincia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;CHOOSE CASE ii_tipo
	CASE 1
		td.tp1.enabled = false
	case else
		dw_maestro.object.codpai.protect = 1
		dw_maestro.object.codest.protect = 1
		dw_maestro.object.codpai.background.mode = 1
		dw_maestro.object.codest.background.mode = 1
END CHOOSE

end event

event ue_menu_refrescar;dw_maestro.triggerevent("ue_retrieve")
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
//		m_mnt_std.m_funciones.m_insertar_detalle.enabled = true
	CASE else
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

type dw_maestro from w_md_std`dw_maestro within w_mnt_provincia
integer width = 2409
integer height = 484
string dataobject = "dw_ff_provincia"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean borrar = false
boolean seleccionar = false
end type

event dw_maestro::ue_update_pre_row;call super::ue_update_pre_row;if f_dw_modify(dw_maestro) then
	if isnull(dw_maestro.getitemstring(row, "nompvc")) or trim(dw_maestro.getitemstring(row, "nompvc"))=''  then
		messageBox ("Error al grabar los datos","Campo 'Provincia' vacío.")
		return false
	end if
//	if isnull(dw_maestro.getitemstring(row, "abrev")) or trim(dw_maestro.getitemstring(row, "abrev"))='' then
//		messageBox ("Error al grabar los datos","Campo 'Abreviatura' vacío.")
//		return false
//	end if
	// esta condicion debe ser la ultima
	if isnull(dw_maestro.getitemstring(row, "codpvc")) then
		string ls_fila
		ls_fila = f_correlativo_siguiente("VTATABPVC")
		dw_maestro.setitem(row,'CODPVC',ls_fila)
	end if
	if ls_fila='-1' or ls_fila='-2' then return false
	return true
else
	return true
end if
end event

event dw_maestro::ue_retrieve;long ll_filas
if ii_tipo<>1 then
	SQL_FILTRO = "  and vtatabpvc.codpai = '" + ist_par.parstring3 + &
					 "' and vtatabpvc.codest = '" + ist_par.parstring2 + &
					 "' and codpvc = '" + ist_par.parstring1 + "'"
	td.tp1.dw1.postevent("ue_retrieve")
else
	if isnull(dw_maestro.getitemstring(dw_maestro.getrow(),"codpvc")) then
		return 0
	else
		SQL_FILTRO = "  and vtatabpvc.codpai = '" + dw_maestro.getitemstring(dw_maestro.getrow(),"codpai") + &
					 	 "' and vtatabpvc.codest = '" + dw_maestro.getitemstring(dw_maestro.getrow(),"codest") + &
					 	 "' and codpvc = '" + dw_maestro.getitemstring(dw_maestro.getrow(),"codpvc")  + "'"
	end if
end if	
ll_filas = this.retrieve()
return ll_filas
end event

event dw_maestro::clicked;call super::clicked;st_par lst_par
if dwo.name='p_buscar' and row>0 then
	lst_par.parstring3	= this.GetitemSTRING(row,"nompai")
	lst_par.parstring4	= this.GetitemSTRING(row,"nomest")
	openwithparm(w_buscar_pais_estado, lst_par)
	lst_par=message.powerobjectparm
	if isvalid(lst_par) then
		dw_maestro.setitem(row,"codpai",lst_par.parstring1)
		dw_maestro.setitem(row,"codest",lst_par.parstring2)
		dw_maestro.setitem(row,"nompai",lst_par.parstring3)
		dw_maestro.setitem(row,"nomest",lst_par.parstring4)
	end if
end if
end event

type td from w_md_std`td within w_mnt_provincia
integer y = 592
integer width = 2409
integer height = 1064
end type

event td::clicked;call super::clicked;string ls_pais
ls_pais = dw_maestro.getitemstring(dw_maestro.getrow(), 'codpvc')
if isnull(ls_pais) or trim(ls_pais)='' then
	td.tp1.enabled = false
else
	td.tp1.enabled = true
end if
	
end event

type tp1 from w_md_std`tp1 within td
integer width = 2373
integer height = 944
string text = "Distritos"
end type

type dw1 from w_md_std`dw1 within tp1
integer x = 0
integer y = 4
integer width = 2373
integer height = 936
string dataobject = "dw_gr_distrito"
boolean hscrollbar = false
boolean hsplitscroll = false
end type

event dw1::ue_retrieve;call super::ue_retrieve;if dw_maestro.GETROW()>0 then
	SQL_FILTRO = " where codpvc = '" + dw_maestro.getitemstring(dw_maestro.GETROW(),'codpvc') + &
					 "' and codest = '" + dw_maestro.getitemstring(dw_maestro.GETROW(),'codest') + &
					 "' and codpai = '" + dw_maestro.getitemstring(dw_maestro.GETROW(),'codpai') + "'"
	if not isnull(dw_maestro.getitemstring(dw_maestro.GETROW(),'codpvc')) then
		td.tp1.dw1.retrieve()
	end if
end if
return 0 
end event

event dw1::ue_valores_iniciales;setitem(al_row, 'codpai', dw_maestro.getitemstring(1, 'codpai'))
setitem(al_row, 'codest', dw_maestro.getitemstring(1, 'codest'))
setitem(al_row, 'codpvc', dw_maestro.getitemstring(1, 'codpvc'))
setitem(al_row, 'coddst', '000')
end event

event dw1::ue_update_pre_row;call super::ue_update_pre_row;if f_dw_modify(dw_maestro) then
	if isnull(dw_maestro.getitemstring(row, "nomdst")) or &
		trim(dw_maestro.getitemstring(row, "nomdst"))=''  then
		messageBox ("Error al grabar los datos","Campo 'Distrito' vacío.")
		return false
	end if
	if isnull(dw_maestro.getitemstring(row, "codpos")) or &
		trim(dw_maestro.getitemstring(row, "codpos"))='' then
		messageBox ("Error al grabar los datos","Campo 'CEP' vacío.")
		return false
	end if
else
	return true
end if
end event

