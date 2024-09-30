$PBExportHeader$uo_campanhas_medio_comunicacion_contacto.sru
forward
global type uo_campanhas_medio_comunicacion_contacto from uo_comun_campanhas
end type
end forward

global type uo_campanhas_medio_comunicacion_contacto from uo_comun_campanhas
integer width = 2085
integer height = 896
event ue_nuevo2 ( )
end type
global uo_campanhas_medio_comunicacion_contacto uo_campanhas_medio_comunicacion_contacto

type variables
st_par ist_par2
String is_nomcli, is_codcnt
Integer ii_instancia

end variables

on uo_campanhas_medio_comunicacion_contacto.create
call super::create
end on

on uo_campanhas_medio_comunicacion_contacto.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_medio_comunicacion_contacto
integer taborder = 30
end type

event cb_2::clicked;call super::clicked;
w_contacto_medio_temp.event ue_nuevo2()


end event

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_medio_comunicacion_contacto
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

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_medio_comunicacion_contacto
boolean visible = false
integer taborder = 40
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_medio_comunicacion_contacto
integer width = 2043
integer taborder = 20
string dataobject = "d_tel_mnt_gen_medio_contacto"
end type

event dw_1::ue_insertar;call super::ue_insertar;//
//parent.event ue_nuevo()
//
//integer li_find
//li_find = dw_1.rowcount() +1
//dw_1.SelectRow(li_find, true)
//dw_1.scrolltorow(li_find)
end event

