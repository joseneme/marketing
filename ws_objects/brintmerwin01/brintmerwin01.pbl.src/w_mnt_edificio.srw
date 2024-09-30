$PBExportHeader$w_mnt_edificio.srw
$PBExportComments$Ventana de Mantenimiento: Edificios
forward
global type w_mnt_edificio from w_md_std
end type
type tp2 from userobject within td
end type
type dw_sucursal_x_edificio from uo_dw_std within tp2
end type
type tp2 from userobject within td
dw_sucursal_x_edificio dw_sucursal_x_edificio
end type
end forward

global type w_mnt_edificio from w_md_std
integer width = 3657
integer height = 2636
string title = "Agregar Edificio"
windowstate windowstate = normal!
boolean center = true
end type
global w_mnt_edificio w_mnt_edificio

type variables
// childs en direcciones_alternativas
datawindowchild idwc_tipviap_tp1, idwc_codubi_tp1


end variables

on w_mnt_edificio.create
int iCurrent
call super::create
end on

on w_mnt_edificio.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;dw_maestro.enabled = true 

//DWChild
td.tp1.dw1.getchild('tipviap',idwc_tipviap_tp1)
idwc_tipviap_tp1.SetTransObject(SQLCA)
dw_maestro.uf_set_hijo(td.tp2.dw_sucursal_x_edificio) 
idwc_tipviap_tp1.retrieve()

CHOOSE CASE ii_tipo
	CASE 1
		td.tp1.enabled = false
		td.tp2.enabled = false
		if gsPais='BRA' then
			//inmueble
			dw_maestro.object.tipviap.Background.mode = 1
			dw_maestro.object.tipviap.protect = 1
			dw_maestro.object.numvia.Background.mode = 1
			dw_maestro.object.numvia.protect = 1
			dw_maestro.object.nomurb.Background.mode = 1
			dw_maestro.object.nomurb.protect = 1
			dw_maestro.object.codubi.Background.mode = 1
			dw_maestro.object.codubi.protect = 1
			dw_maestro.object.codpos.Background.mode = 1
			dw_maestro.object.codpos.protect = 1
			dw_maestro.object.nomvia.Background.mode = 1
			dw_maestro.object.nomvia.protect = 1
			dw_maestro.object.complemento.Background.mode = 1
			dw_maestro.object.complemento.protect = 1
		end if
//	case 2
	case 3
		td.tp1.enabled = true
		td.tp2.enabled = true
	case else
		td.tp1.enabled = true
		td.tp2.enabled = true
		if gsPais='BRA' then
			//inmueble
			dw_maestro.object.tipviap.Background.mode = 1
			dw_maestro.object.tipviap.protect = 1
			dw_maestro.object.numvia.Background.mode = 1
			dw_maestro.object.numvia.protect = 1
			dw_maestro.object.nomurb.Background.mode = 1
			dw_maestro.object.nomurb.protect = 1
			dw_maestro.object.codubi.Background.mode = 1
			dw_maestro.object.codubi.protect = 1
			dw_maestro.object.codpos.Background.mode = 1
			dw_maestro.object.codpos.protect = 1
			dw_maestro.object.nomvia.Background.mode = 1
			dw_maestro.object.nomvia.protect = 1
			dw_maestro.object.complemento.Background.mode = 1
			dw_maestro.object.complemento.protect = 1
		end if	
END CHOOSE

if gsPais='PER' then
	dw_maestro.object.t_operador1.text = 'Internet'
	dw_maestro.object.t_operador2.text = 'Datos'
	dw_maestro.object.t_operador3.text = 'Voz'
end if	
end event

event resize;call super::resize;td.tp2.dw_sucursal_x_edificio.trigger event ue_resize(td.width,td.Height)
end event

event ue_permisos;call super::ue_permisos;CHOOSE CASE ii_tipo
	case 2
		td.tp1.dw1.guardar = true
		td.tp1.dw1.insertar = true
		td.tp1.dw1.borrar = true
		td.tp2.dw_sucursal_x_edificio.guardar = true
		td.tp2.dw_sucursal_x_edificio.insertar = true
		td.tp2.dw_sucursal_x_edificio.borrar = true
	case 3
		td.tp1.dw1.guardar = false
		td.tp1.dw1.insertar = false
		td.tp1.dw1.borrar = false
		td.tp2.dw_sucursal_x_edificio.guardar = false
		td.tp2.dw_sucursal_x_edificio.insertar = false
		td.tp2.dw_sucursal_x_edificio.borrar = false
END CHOOSE

end event

event ue_permisos_menu;CHOOSE CASE ii_tipo
	CASE 1
		m_mnt_std.m_archivo.m_abrir.enabled = false
		m_mnt_std.m_archivo.m_borrar.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = false
		m_mnt_std.m_archivo.m_imprimir.enabled = false
		m_mnt_std.m_archivo.m_exportar.enabled = false
		
		m_mnt_std.m_funciones.enabled = false
		m_mnt_std.m_funciones.m_filtrar.enabled = false
		m_mnt_std.m_funciones.m_ordenar.enabled = false
	CASE 2
		m_mnt_std.m_archivo.m_abrir.enabled = false
		m_mnt_std.m_archivo.m_borrar.enabled = false
		m_mnt_std.m_archivo.m_nuevo.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = false
		m_mnt_std.m_archivo.m_imprimir.enabled = false
		m_mnt_std.m_archivo.m_exportar.enabled = false
		
		m_mnt_std.m_funciones.enabled = true
		m_mnt_std.m_funciones.m_insertar_detalle.enabled = true
		m_mnt_std.m_funciones.m_suprimir_detalle.enabled = true
		m_mnt_std.m_funciones.m_filtrar.enabled = false
		m_mnt_std.m_funciones.m_ordenar.enabled = false
	CASE 3
		m_mnt_std.m_archivo.m_abrir.enabled = false
		m_mnt_std.m_archivo.m_borrar.enabled = false
		m_mnt_std.m_archivo.m_grabar.enabled = false
		m_mnt_std.m_archivo.m_nuevo.enabled = false
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = false
		m_mnt_std.m_archivo.m_imprimir.enabled = true
		m_mnt_std.m_archivo.m_exportar.enabled = true
		
		m_mnt_std.m_funciones.enabled = false
		m_mnt_std.m_funciones.m_insertar_detalle.enabled = false
		m_mnt_std.m_funciones.m_suprimir_detalle.enabled = false
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
		//if gsPais='BRA' then
		//	dw_maestro.setitem(1,"codzona",0)
		//end if
		this.post event ue_permisos()
		this.post event ue_permisos_menu()
	case 2
		if gsPais='BRA' then
			dw_maestro.object.codubi.tabsequence = 0
			dw_maestro.object.tipviap.tabsequence = 0
			dw_maestro.object.nomvia.tabsequence = 0
			dw_maestro.object.codpos.tabsequence = 0
			dw_maestro.object.numvia.tabsequence = 0
		end if
		this.post event ue_cargar()
		this.post event ue_permisos()
		this.post event ue_permisos_menu()
	CASE 3
		dw_maestro.enabled = false
		this.post event ue_cargar()
		this.post event ue_permisos()
		this.post event ue_permisos_menu()
END CHOOSE

end event

event ue_menu_refrescar;dw_maestro.triggerevent("ue_retrieve")
end event

type dw_maestro from w_md_std`dw_maestro within w_mnt_edificio
integer width = 3598
integer height = 1388
string dataobject = "dw_ff_edificio"
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
	SQL_FILTRO = " and codigo = " + string(ist_par.parlong1)
	td.tp1.dw1.postevent("ue_retrieve")
	td.tp2.dw_sucursal_x_edificio.postevent("ue_retrieve")
else
	if isnull(dw_maestro.getitemnumber(dw_maestro.getrow(),"codigo")) then
		return 0
	else
		SQL_FILTRO = " and codigo = " + string(dw_maestro.getitemnumber(dw_maestro.getrow(),"codigo"))
	end if
end if	
ll_filas = this.retrieve()
return ll_filas



end event

event dw_maestro::ue_update_pre_row;long ll_row_maestro
ll_row_maestro = dw_maestro.getrow()
if f_dw_modify(dw_maestro) then
	if isnull(dw_maestro.getitemnumber(ll_row_maestro, "inmueble")) then
		messageBox ("Error al grabar los datos","campo 'Inmueble' vacío")
		return false
	end if
	if isnull(dw_maestro.getitemstring(ll_row_maestro, "codubi")) then
		messageBox ("Error al grabar los datos","campo 'Distrito' vacío")
		return false
	end if
	if dw_maestro.getitemdatetime(ll_row_maestro, "fecini")>=dw_maestro.getitemdatetime(ll_row_maestro, "fecfin") then
		messageBox ("Error al grabar los datos","La fecha de Vigencia Inicial no puede ser~n mayor a la fecha de Vigencia Final.")
		return false
	end if
//	if not isnull(dw_maestro.getitemstring(ll_row_maestro, "telefono_adm")) and not isnumber(dw_maestro.getitemstring(ll_row_maestro, "telefono_adm")) then
//		messageBox ("Error al grabar los datos","El telefono del Administrador solo acepta números.")
//		return false
//	end if
	if not isnull(dw_maestro.getitemnumber(ll_row_maestro, "codigo")) then
		long ll_asignado
		ll_asignado = f_int_inmueble_asignado_edificio( dw_maestro.getitemnumber(ll_row_maestro, "codigo"), &
																		dw_maestro.getitemnumber(ll_row_maestro, "inmueble"))
		if ll_asignado>0 then
			messageBox ("Error al grabar los datos","La dirección indicada ya pertenece a otro edificio.")
			return false
		end if
	end if
	// esta condicion debe ser la ultima
	if isnull(dw_maestro.getitemnumber(ll_row_maestro, "codigo")) then
		string ls_fila
		ls_fila = f_correlativo_siguiente("EDIFICIO")
		dw_maestro.setitem(ll_row_maestro,'codigo',long(ls_fila))
	end if
	return true
else
	return true
end if

end event

event dw_maestro::clicked;call super::clicked;st_inmueble lst_inmueble
if dwo.name='p_buscar' and row>0 then
	if (gsPais='PER' or gsPais='CHI') then
		// SGA PERU - JFMA - 20030318
		lst_inmueble.idinmueble	= this.GetitemNUMBER(row,"inmueble")
		lst_inmueble.tipviap		= this.GetitemSTRING(row,"tipviap")
		lst_inmueble.nomvia		= this.GetitemSTRING(row,"nomvia")
		lst_inmueble.numvia		= this.GetitemSTRING(row,"numvia")
		lst_inmueble.complemento= this.GetitemSTRING(row,"complemento")
		lst_inmueble.codubi		= this.GetitemSTRING(row,"codubi")
		lst_inmueble.codpos		= this.GetitemSTRING(row,"codpos")
		lst_inmueble.distrito_desc = this.GetitemSTRING(row,"distrito_desc")
		lst_inmueble.nomurb		= this.GetitemSTRING(row,"nomurb")
		// 20030318
		if gsPais = 'CHI' then 
			openwithparm(w_hd_buscar_inmueble_chi, lst_inmueble)
		else
			openwithparm(w_hd_buscar_inmueble, lst_inmueble)
		end if
	elseif gsPais='BRA' then
		open(w_buscar_inmueble_with_add)
	end if
	lst_inmueble=message.powerobjectparm
	if isvalid(lst_inmueble) then
		dw_maestro.setitem(row,"inmueble",lst_inmueble.idinmueble)
		dw_maestro.setitem(row,"tipviap",lst_inmueble.tipviap)
		dw_maestro.setitem(row,"nomvia",lst_inmueble.nomvia)
		dw_maestro.setitem(row,"numvia",lst_inmueble.numvia)
		dw_maestro.setitem(row,"complemento",lst_inmueble.complemento)
		dw_maestro.setitem(row,"codubi",lst_inmueble.codubi)
		dw_maestro.setitem(row,"codpos",lst_inmueble.codpos)
		dw_maestro.setitem(row,"distrito_desc",lst_inmueble.distrito_desc)
		dw_maestro.setitem(row,"nomurb",lst_inmueble.nomurb)
	end if
end if

end event

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;string ls_columna
st_inmueble lst_inmueble

if gsPais='PER' then
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
end if
return 0
end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;if gsPais = 'PER' then
	dw_maestro.setitem(al_row, 'comp_int','Int.')
elseif gsPais = 'BRA' then
	dw_maestro.setitem(al_row, 'comp_int','Compl.')
end if
end event

type td from w_md_std`td within w_mnt_edificio
integer y = 1504
integer height = 936
tp2 tp2
end type

on td.create
this.tp2=create tp2
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tp2
end on

on td.destroy
call super::destroy
destroy(this.tp2)
end on

event td::clicked;call super::clicked;if ii_tipo=1 then
	if ISNULL(dw_maestro.getitemnumber(dw_maestro.GETROW(),'codigo')) or dw_maestro.getitemnumber(dw_maestro.GETROW(),'codigo')<=0 then
		messagebox('Alerta!','Debe grabar primero el Edificio')
		dw_maestro.setfocus()
	else
		if not td.tp1.enabled then
			td.tp1.enabled = true
			td.tp2.enabled = false
		end if
	end if
end if
end event

type tp1 from w_md_std`tp1 within td
integer height = 816
string text = "Direcciones Alternativas"
end type

type dw1 from w_md_std`dw1 within tp1
integer y = 28
integer height = 744
string dataobject = "dw_gr_direccion_alternativa_edificio"
end type

event dw1::ue_retrieve;if ii_tipo<>1 then
	if dw_maestro.GETROW()>0 then
		td.tp1.dw1.setfilter("codigo = " + string(dw_maestro.getitemnumber(dw_maestro.GETROW(),'codigo')) )
		td.tp1.dw1.filter()
		td.tp1.dw1.retrieve()
		td.tp2.dw_sucursal_x_edificio.retrieve(dw_maestro.getitemnumber(dw_maestro.GETROW(),'codigo'))
	end if
end if
return 0 
end event

event dw1::ue_valores_iniciales;call super::ue_valores_iniciales;	this.setitem(al_row,'codigo',dw_maestro.getitemnumber(dw_maestro.getrow(),'codigo'))

end event

event dw1::ue_valida_dato;call super::ue_valida_dato;CHOOSE CASE as_columna
	CASE 'idinmueble'
			st_inmueble lst_inmueble
			if gsPais='PER' then
			// SGA PERU - JFMA - 20030318
				lst_inmueble.idinmueble	= this.GetitemNUMBER(al_row,"idinmueble")
				lst_inmueble.tipviap		= this.GetitemSTRING(al_row,"tipviap")
				lst_inmueble.nomvia		= this.GetitemSTRING(al_row,"nomvia")
				lst_inmueble.numvia		= this.GetitemSTRING(al_row,"numvia")
				lst_inmueble.complemento= this.GetitemSTRING(al_row,"complemento")
				lst_inmueble.codubi		= this.GetitemSTRING(al_row,"codubi")
//				lst_inmueble.codpos		= this.GetitemSTRING(al_row,"codpos")
				lst_inmueble.distrito_desc = this.GetitemSTRING(al_row,"distrito_desc")
				lst_inmueble.nomurb		= this.GetitemSTRING(al_row,"nomurb")
			// 20030318
				openwithparm(w_buscar_inmueble_with_add_peru, lst_inmueble)
			elseif gsPais='BRA' then
				open(w_buscar_inmueble_with_add)
			end if
			lst_inmueble=message.powerobjectparm
			if isvalid(lst_inmueble) then
				this.setitem(al_row,"idinmueble",lst_inmueble.idinmueble)
				this.setitem(al_row,"nombre",lst_inmueble.nombre)
				this.setitem(al_row,"tipviap",lst_inmueble.tipviap)
				this.setitem(al_row,"nomvia",lst_inmueble.nomvia)
				this.setitem(al_row,"numvia",lst_inmueble.numvia)
				this.setitem(al_row,"complemento",lst_inmueble.complemento)
				this.setitem(al_row,"codubi",lst_inmueble.codubi)
				this.setitem(al_row,"distrito_desc",lst_inmueble.distrito_desc)
				this.setitem(al_row,"nomurb",lst_inmueble.nomurb)
			end if
END CHOOSE
return 0
end event

event dw1::ue_update_pre;call super::ue_update_pre;long ll_filas, i, j
ll_filas = rowcount()

for i=1 to ll_filas - 1
	for j=i+1 to ll_filas
		if getitemnumber(i,'idinmueble')=getitemnumber(j,'idinmueble') then
			messagebox('Direcciones Alternativas','No puede asignar la misma Dirección mas de 1 vez.')
			return false
		end if
	next
next
return true
end event

type tp2 from userobject within td
integer x = 18
integer y = 104
integer width = 2565
integer height = 816
long backcolor = 79741120
string text = "Sucursales"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_sucursal_x_edificio dw_sucursal_x_edificio
end type

on tp2.create
this.dw_sucursal_x_edificio=create dw_sucursal_x_edificio
this.Control[]={this.dw_sucursal_x_edificio}
end on

on tp2.destroy
destroy(this.dw_sucursal_x_edificio)
end on

type dw_sucursal_x_edificio from uo_dw_std within tp2
integer x = 9
integer y = 20
integer width = 2523
integer height = 760
integer taborder = 50
string dataobject = "dw_gr_sucursal_x_edificio"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event rbuttondown;//override
end event

