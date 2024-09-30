$PBExportHeader$w_filtro_pais_estado_provincia.srw
$PBExportComments$Filtro de Reporte~r~nEdificios~r~nLista de edificios
forward
global type w_filtro_pais_estado_provincia from w_fil_std
end type
end forward

global type w_filtro_pais_estado_provincia from w_fil_std
integer width = 1655
integer height = 432
end type
global w_filtro_pais_estado_provincia w_filtro_pais_estado_provincia

on w_filtro_pais_estado_provincia.create
call super::create
end on

on w_filtro_pais_estado_provincia.destroy
call super::destroy
end on

event ue_grabar;call super::ue_grabar;dw.AcceptText()

ist_par.parboolean1 = wf_flag('f_pais')
ist_par.parboolean2 = wf_flag('f_estado')
ist_par.parboolean3 = wf_flag('f_provincia')
ist_par.parstring1 = dw.getitemstring(1,'pais')
ist_par.parstring2 = dw.getitemstring(1,'estado')
ist_par.parstring3 = dw.getitemstring(1,'provincia')
ist_par.valido = true
end event

type cb_2 from w_fil_std`cb_2 within w_filtro_pais_estado_provincia
integer x = 1271
integer y = 176
end type

type cb_1 from w_fil_std`cb_1 within w_filtro_pais_estado_provincia
integer x = 1271
integer y = 60
end type

type dw from w_fil_std`dw within w_filtro_pais_estado_provincia
integer width = 1234
integer height = 316
string dataobject = "dw_ex_filtro_provincia"
boolean border = false
borderstyle borderstyle = stylebox!
end type

