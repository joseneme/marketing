$PBExportHeader$uo_campanhas_proveedores.sru
forward
global type uo_campanhas_proveedores from uo_comun_campanhas
end type
end forward

global type uo_campanhas_proveedores from uo_comun_campanhas
integer width = 3374
integer height = 2536
event ue_nuevo ( )
end type
global uo_campanhas_proveedores uo_campanhas_proveedores

on uo_campanhas_proveedores.create
call super::create
end on

on uo_campanhas_proveedores.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_proveedores
end type

event cb_2::clicked;call super::clicked;parent.event ue_nuevo()

integer li_find
li_find = dw_1.rowcount() + 1

dw_1.SelectRow(li_find, true)
dw_1.scrolltorow(li_find)
end event

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_proveedores
end type

event cb_1::clicked;call super::clicked;dw_1.update()

if sqlca.sqlcode = -1 then
	messagebox("Error", sqlca.sqlErrtext)
	Rollback;
else 
	commit;
	 messagebox( "Mensaje", "Se actualizo los campos con exito")
end if
end event

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_proveedores
integer y = 1192
integer width = 3264
integer height = 1308
string dataobject = "d_tel_mnt_gen_proveedor_servicio_vtatab"
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_proveedores
integer width = 3273
integer height = 972
string dataobject = "d_tel_mnt_gen_proveedor_servicio"
end type

event dw_1::clicked;call super::clicked;integer li, li_total, li_find
string ls_idoperador, ls_find
//Proveedores del Cliente en base 
li_total = dw_2.RowCount()

if row > 0  then
	//selecciona el Idoperador a comparar
	this.SelectRow(0, false)
	this.SelectRow(row, TRUE)
	// si hay Idoperador en base para comparar
	if li_total > 0 then
		dw_2.SelectRow(0, false)
		//Almacena el Idoperador
		ls_idoperador = this.object.idoperador[row]
		//Busca el Idoperador seleccionado en base
		ls_find = " idoperador = '" + ls_idoperador + "'"
		li_find = dw_2.Find(ls_find, 1, li_total)
		//Selecciona el Idoperador que está en base
		dw_2.SelectRow(li_find, true)
		dw_2.scrolltorow(li_find)
	end if
end if
end event

event dw_1::ue_insertar;
parent.event ue_nuevo()

integer li_find
li_find = dw_1.rowcount() +1
dw_1.SelectRow(li_find, true)
dw_1.scrolltorow(li_find)
end event

