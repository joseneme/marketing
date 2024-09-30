HA$PBExportHeader$w_imprimir_ficha_cliente.srw
forward
global type w_imprimir_ficha_cliente from w_visor_comun
end type
end forward

global type w_imprimir_ficha_cliente from w_visor_comun
end type
global w_imprimir_ficha_cliente w_imprimir_ficha_cliente

on w_imprimir_ficha_cliente.create
call super::create
end on

on w_imprimir_ficha_cliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;st_par lst_par
string ls_codcli
long ll_numfic

lst_par = message.powerobjectparm

if not isvalid(lst_par) then return

// capturando los datos
ls_codcli = lst_par.parstring1
ll_numfic = lst_par.parlong1

// dw_report.dataobject="abc"			
dw_maestro.dataobject="d_mnt_reporte_ficha"
dw_maestro.settransobject(sqlca)
dw_maestro.retrieve(ls_codcli,ll_numfic)	








end event

type dw_maestro from w_visor_comun`dw_maestro within w_imprimir_ficha_cliente
end type

