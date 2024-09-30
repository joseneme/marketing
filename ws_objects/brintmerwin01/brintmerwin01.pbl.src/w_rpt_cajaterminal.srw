$PBExportHeader$w_rpt_cajaterminal.srw
forward
global type w_rpt_cajaterminal from w_visor_comun
end type
end forward

global type w_rpt_cajaterminal from w_visor_comun
end type
global w_rpt_cajaterminal w_rpt_cajaterminal

on w_rpt_cajaterminal.create
call super::create
end on

on w_rpt_cajaterminal.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_postopen;datawindow ldw_par
string ls_xxx
dw_maestro.reset()
dw_maestro.settransobject(SQLCA)

// Dependiendo del tipo de reporte se ejecuta automaticamente un retrieve
// tipo = 0 significa que el codigo se ejecuta en un hijo
if ii_tipo <> 0 then
	CHOOSE CASE ii_tipo
	CASE 1	//Reporte sin parametros
		ls_xxx=ist_par.parstring6 
		dw_maestro.setSQLSelect(ls_xxx)
		dw_maestro.retrieve()
	END CHOOSE
end if

end event

type dw_maestro from w_visor_comun`dw_maestro within w_rpt_cajaterminal
end type

