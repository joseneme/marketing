HA$PBExportHeader$uo_campanhas_clientes.sru
forward
global type uo_campanhas_clientes from uo_comun_campanhas
end type
end forward

global type uo_campanhas_clientes from uo_comun_campanhas
integer width = 3479
integer height = 2832
event ue_preopen ( )
end type
global uo_campanhas_clientes uo_campanhas_clientes

type variables

end variables

on uo_campanhas_clientes.create
call super::create
end on

on uo_campanhas_clientes.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_clientes
boolean visible = false
end type

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_clientes
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

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_clientes
integer x = 32
integer y = 1376
integer width = 3415
integer height = 1144
string dataobject = "d_tel_mnt_gen_clientes_vtatabcli"
boolean seleccionar = false
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_clientes
integer width = 3410
integer height = 1152
string dataobject = "d_tel_mnt_gen_clientes"
boolean seleccionar = false
end type

event dw_1::ue_valida_dato;call super::ue_valida_dato;CHOOSE CASE as_columna
	CASE 'codubi'
		
			st_par lst_par_in, lst_par_out	
	
			lst_par_in.parstring1 = trim(dw_1.getitemstring(al_row,"codcli"))
	
	      openwithparm(w_buscar_direccion_cli, lst_par_in)

	      lst_par_out=message.powerobjectparm
		
		if isvalid(lst_par_out) then
				
				dw_1.setitem(al_row,"nomdst",lst_par_out.parstring5)
				dw_1.setitem(al_row,"codubi",lst_par_out.parstring6)		
				dw_1.setitem(al_row,"nompvc",lst_par_out.parstring7)
    			dw_1.setitem(al_row,"nomest",lst_par_out.parstring8)
		end if
	
END CHOOSE
return 0
end event

