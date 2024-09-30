HA$PBExportHeader$w_filtrar_cliente_stpar.srw
$PBExportComments$Filtro de Consulta~r~nContacto~r~nCriterios: codigo del cliente, nombre del cliente, codigo del contacto, nombre del contacto
forward
global type w_filtrar_cliente_stpar from w_filtrar_cliente
end type
end forward

global type w_filtrar_cliente_stpar from w_filtrar_cliente
end type
global w_filtrar_cliente_stpar w_filtrar_cliente_stpar

on w_filtrar_cliente_stpar.create
call super::create
end on

on w_filtrar_cliente_stpar.destroy
call super::destroy
end on

type cbx_cliente_nombre from w_filtrar_cliente`cbx_cliente_nombre within w_filtrar_cliente_stpar
end type

type sle_cliente_nombre from w_filtrar_cliente`sle_cliente_nombre within w_filtrar_cliente_stpar
end type

type sle_documento from w_filtrar_cliente`sle_documento within w_filtrar_cliente_stpar
end type

type sle_cliente from w_filtrar_cliente`sle_cliente within w_filtrar_cliente_stpar
end type

type cbx_documento from w_filtrar_cliente`cbx_documento within w_filtrar_cliente_stpar
end type

type cbx_cliente from w_filtrar_cliente`cbx_cliente within w_filtrar_cliente_stpar
end type

type cb_2 from w_filtrar_cliente`cb_2 within w_filtrar_cliente_stpar
end type

event cb_2::clicked;st_par lst_par 
lst_par.parstring1 = '***'
lst_par.parstring2 = '***'
lst_par.parstring3 = '***'
closewithreturn(parent,lst_par)
end event

type cb_1 from w_filtrar_cliente`cb_1 within w_filtrar_cliente_stpar
end type

event cb_1::clicked;st_par lst_par
if cbx_cliente.checked and sle_cliente.text<>''					  then lst_par.parstring1 = sle_cliente.text 		 else	lst_par.parstring1 = '*'
if cbx_cliente_nombre.checked and sle_cliente_nombre.text<>'' then lst_par.parstring2 = sle_cliente_nombre.text else	lst_par.parstring2 = '*'
if cbx_documento.checked and sle_documento.text<>'' 			  then lst_par.parstring3 = sle_documento.text		 else	lst_par.parstring3 = '*'
if (lst_par.parstring1 + lst_par.parstring2 + lst_par.parstring3) = '***' then
	integer li_resp
	li_resp = MessageBox ( parent.title, "Desea mostrar todos los registros?" , question! , yesnocancel!, 1)
	if li_resp <> 1 then return 0
end if

closewithreturn (parent,lst_par)
end event

