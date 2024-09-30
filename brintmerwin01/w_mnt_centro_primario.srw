HA$PBExportHeader$w_mnt_centro_primario.srw
forward
global type w_mnt_centro_primario from w_md_std
end type
end forward

global type w_mnt_centro_primario from w_md_std
end type
global w_mnt_centro_primario w_mnt_centro_primario

on w_mnt_centro_primario.create
call super::create
end on

on w_mnt_centro_primario.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_md_std`dw_maestro within w_mnt_centro_primario
integer width = 2231
integer height = 672
string dataobject = "d_mnt_centro_primario"
end type

event dw_maestro::ue_retrieve;return this.retrieve()
end event

type td from w_md_std`td within w_mnt_centro_primario
integer y = 708
end type

type tp1 from w_md_std`tp1 within td
string text = "Detalle Acceso x Usuario"
end type

type dw1 from w_md_std`dw1 within tp1
string dataobject = "d_mnt_centroxprovincia"
end type

event dw1::ue_insertar_fila;long ll_row
long ln_idacceso

ll_row = dw_maestro.getrow()
if ll_row<=0 then return 0
ln_idacceso = dw_maestro.getitemnumber(ll_row, 'idcentro')
if isnull(ln_idacceso) then
	messagebox('Aviso','Grabe primero el Centro Primario')
	return 0
end if
// inserta una fila en el dw
ll_row = this.insertrow(0)
this.trigger event dynamic ue_valores_iniciales(ll_row)
return ll_row
end event

event dw1::ue_retrieve;long ll_row
long ln_idacceso

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ln_idacceso = dw_maestro.GetItemNumber(ll_row,'idcentro')
	return this.retrieve(ln_idacceso)
else
	return 0
end if
end event

event dw1::ue_update_pre_row;DWItemStatus l_status
long ll_row
long ln_idacceso

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	l_status = this.getitemstatus(row,0,primary!)	
	ln_idacceso = dw_maestro.getitemnumber(ll_row,'idcentro')	
	if l_status = NewModified!	then		
		this.setitem(row,'idcentro', ln_idacceso)
	end if
	return true
else
	return false
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

