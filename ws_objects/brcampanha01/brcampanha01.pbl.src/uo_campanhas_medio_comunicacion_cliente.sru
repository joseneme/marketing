$PBExportHeader$uo_campanhas_medio_comunicacion_cliente.sru
forward
global type uo_campanhas_medio_comunicacion_cliente from uo_comun_campanhas
end type
end forward

global type uo_campanhas_medio_comunicacion_cliente from uo_comun_campanhas
integer width = 3424
integer height = 2532
event ue_nuevo ( )
event ue_grabar ( )
end type
global uo_campanhas_medio_comunicacion_cliente uo_campanhas_medio_comunicacion_cliente

type variables
st_par ist_par2
end variables

on uo_campanhas_medio_comunicacion_cliente.create
call super::create
end on

on uo_campanhas_medio_comunicacion_cliente.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_medio_comunicacion_cliente
end type

event cb_2::clicked;call super::clicked;parent.event ue_nuevo()

integer li_find
li_find = dw_1.rowcount() +1

dw_1.SelectRow(li_find, true)
dw_1.scrolltorow(li_find)

end event

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_medio_comunicacion_cliente
end type

event cb_1::clicked;call super::clicked;
dw_1.update()

if sqlca.sqlcode = -1 then
	messagebox("Error", sqlca.sqlErrtext) 
	Rollback;
else 
	commit;
	 messagebox( "Mensaje", "Se actualizo los campos con exito")
end if
end event

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_medio_comunicacion_cliente
integer x = 32
integer y = 1308
integer width = 3369
integer height = 1208
string dataobject = "d_tel_mnt_gen_medio_clientes_vtatab"
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_medio_comunicacion_cliente
event ue_menu_grabar ( )
integer width = 3351
integer height = 1076
string dataobject = "d_tel_mnt_gen_medio_clientes"
end type

event dw_1::clicked;call super::clicked;integer li, li_total, li_find
string ls_idmedcom, ls_find
//Medios de Comunicación del Cliente en base
li_total = dw_2.RowCount()

if row > 0  then
	//selecciona el MedCom a comparar
	this.SelectRow(0, false)
	this.SelectRow(row, TRUE)
	// si hay MedCom en base para comparar
	if li_total > 0 then
		dw_2.SelectRow(0, false)
		//Almacena el idmedcom
		ls_idmedcom = this.object.idmedcom[row]
		//Busca el MedCom seleccionado en base
		ls_find = "idmedcom = '" + ls_idmedcom + "'"
		li_find = dw_2.Find(ls_find, 1, li_total)
		//Selecciona el MedCom que está en base
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

