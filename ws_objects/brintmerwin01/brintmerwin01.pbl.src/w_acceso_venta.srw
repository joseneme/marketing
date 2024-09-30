$PBExportHeader$w_acceso_venta.srw
forward
global type w_acceso_venta from w_md_std
end type
end forward

global type w_acceso_venta from w_md_std
end type
global w_acceso_venta w_acceso_venta

on w_acceso_venta.create
call super::create
end on

on w_acceso_venta.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_md_std`dw_maestro within w_acceso_venta
integer height = 628
string dataobject = "d_acceso_venta"
end type

event dw_maestro::ue_retrieve;return this.retrieve()
end event

type td from w_md_std`td within w_acceso_venta
integer y = 772
end type

type tp1 from w_md_std`tp1 within td
string text = "Detalle Acceso x Usuario"
end type

type dw1 from w_md_std`dw1 within tp1
string dataobject = "d_accesoxusuario"
end type

event dw1::ue_insertar_fila;long ll_row
long ln_idacceso

ll_row = dw_maestro.getrow()
if ll_row<=0 then return 0
ln_idacceso = dw_maestro.getitemnumber(ll_row, 'idacceso')
if isnull(ln_idacceso) then
	messagebox('Aviso','Grabe primero el Acceso Venta')
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
	ln_idacceso = dw_maestro.GetItemNumber(ll_row,'idacceso')
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
	ln_idacceso = dw_maestro.getitemnumber(ll_row,'idacceso')	
	if l_status = NewModified!	then		
		this.setitem(row,'idacceso', ln_idacceso)
	end if
	return true
else
	return false
end if


end event

