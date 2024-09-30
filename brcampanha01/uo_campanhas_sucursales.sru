HA$PBExportHeader$uo_campanhas_sucursales.sru
forward
global type uo_campanhas_sucursales from uo_comun_campanhas
end type
end forward

global type uo_campanhas_sucursales from uo_comun_campanhas
integer width = 3717
integer height = 1592
end type
global uo_campanhas_sucursales uo_campanhas_sucursales

on uo_campanhas_sucursales.create
call super::create
end on

on uo_campanhas_sucursales.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_sucursales
end type

event cb_2::clicked;call super::clicked;dw_1.insertrow(0) 
end event

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_sucursales
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

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_sucursales
integer y = 864
integer width = 3639
integer height = 644
string dataobject = "dw_sucursal_vtatab"
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_sucursales
integer width = 3643
integer height = 600
string dataobject = "dw_sucursal"
end type

event dw_1::clicked;call super::clicked;integer li, li_total, li_find
string ls_codsuc, ls_find
//Sucursal en base
li_total = dw_2.RowCount()

if row > 0  then
	//selecciona el Codsuc a comparar
	this.SelectRow(0, false)
	this.SelectRow(row, TRUE)
	// si hay Codsuc en base para comparar
	if li_total > 0 then
		dw_2.SelectRow(0, false)
		//Almacena el Codsuc
		ls_codsuc = this.object.codsuc[row]
		//Busca el Codsuc seleccionado en base
		ls_find = "codsuc = '" + ls_codsuc + "'"
		li_find = dw_2.Find(ls_find, 1, li_total)
		//Selecciona el Codsuc que est$$HEX2$$e1002000$$ENDHEX$$en base
		dw_2.SelectRow(li_find, true)
		dw_2.scrolltorow(li_find)
	end if
end if

end event

