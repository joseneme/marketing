$PBExportHeader$w_buscar_direccion_cli.srw
forward
global type w_buscar_direccion_cli from w_lov_buscar
end type
end forward

global type w_buscar_direccion_cli from w_lov_buscar
integer height = 1128
string title = "Buscar Dirección"
boolean center = true
end type
global w_buscar_direccion_cli w_buscar_direccion_cli

on w_buscar_direccion_cli.create
call super::create
end on

on w_buscar_direccion_cli.destroy
call super::destroy
end on

event ue_seleccion;call super::ue_seleccion;st_par lst_par

lst_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'tipviap')
lst_par.parstring2 = dw_maestro.getitemstring(dw_maestro.getrow(),'nomvia')
lst_par.parstring3 = dw_maestro.getitemstring(dw_maestro.getrow(),'numvia')
lst_par.parstring4 = dw_maestro.getitemstring(dw_maestro.getrow(),'interior')
lst_par.parstring5 = dw_maestro.getitemstring(dw_maestro.getrow(),'nomdst')
lst_par.parstring6 = dw_maestro.getitemstring(dw_maestro.getrow(),'codubi')
lst_par.parstring7 = dw_maestro.getitemstring(dw_maestro.getrow(),'nompvc')
lst_par.parstring8 = dw_maestro.getitemstring(dw_maestro.getrow(),'nomest')


closewithreturn(this,lst_par)
end event

event open;call super::open;sle_buscar.setfocus()
sle_buscar.SelectText(1, Len(sle_buscar.Text))
this.post event ue_cargar() 

end event

type cb_buscar from w_lov_buscar`cb_buscar within w_buscar_direccion_cli
boolean visible = false
integer y = 56
end type

type sle_buscar from w_lov_buscar`sle_buscar within w_buscar_direccion_cli
boolean visible = false
integer y = 64
end type

type cb_4 from w_lov_buscar`cb_4 within w_buscar_direccion_cli
boolean visible = false
end type

type cb_3 from w_lov_buscar`cb_3 within w_buscar_direccion_cli
boolean visible = false
end type

type cb_2 from w_lov_buscar`cb_2 within w_buscar_direccion_cli
boolean visible = false
end type

type cb_1 from w_lov_buscar`cb_1 within w_buscar_direccion_cli
boolean visible = false
end type

type dw_maestro from w_lov_buscar`dw_maestro within w_buscar_direccion_cli
integer y = 108
string dataobject = "d_buscar_direccion_completa_cli"
end type

event dw_maestro::ue_retrieve;return this.retrieve(ist_par.parstring1)




end event

