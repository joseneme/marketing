$PBExportHeader$w_lov_fichaclientes.srw
forward
global type w_lov_fichaclientes from w_lov_cliente
end type
type st_2 from statictext within w_lov_fichaclientes
end type
type sle_codcliente from singlelineedit within w_lov_fichaclientes
end type
end forward

global type w_lov_fichaclientes from w_lov_cliente
integer width = 3488
integer height = 1380
st_2 st_2
sle_codcliente sle_codcliente
end type
global w_lov_fichaclientes w_lov_fichaclientes

type variables
string is_codcliente
string is_descliente
end variables

on w_lov_fichaclientes.create
int iCurrent
call super::create
this.st_2=create st_2
this.sle_codcliente=create sle_codcliente
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.sle_codcliente
end on

on w_lov_fichaclientes.destroy
call super::destroy
destroy(this.st_2)
destroy(this.sle_codcliente)
end on

event open;call super::open;SetNull(is_codcliente)
SetNull(is_descliente)

sle_codcliente.setfocus()

end event

event ue_seleccion;// se valida  si se tiene acceso al ejecutivo
string ls_codect, ls_codusu
integer li_cantidad  = 0

ls_codect = dw_maestro.getitemstring(dw_maestro.getrow(),'vtatabect_codect')
ls_codusu = dw_maestro.getitemstring(dw_maestro.getrow(),'vtatabect_codusu')

li_cantidad = 0


SELECT count(*) INTO :li_cantidad
FROM
VTATABECT, VTATABUSUECT
WHERE
( VTATABECT.CODECT = VTATABUSUECT.CODECT ) and  
( VTATABUSUECT.USUARIO = user)  and
(VTATABECT.CODECT = :ls_codect);

// validacion permisos clientes
if li_cantidad = 0 then
	messagebox("Aviso","Usuario no tiene permiso para el ejecutivo seleccionado")
	return
end if	
st_par lst_par
string ls_codigo

lst_par.parstring1 = dw_maestro.getitemstring(dw_maestro.getrow(),'vtatabcli_codcli')
lst_par.parstring2 = dw_maestro.getitemstring(dw_maestro.getrow(),'vtatabcli_nomcli')
// validacion si el cliente tiene al menos una ficha
// por el momento no se manjea versiones de ficha

integer li_can_ficha = 0
integer li_idficha

SETNULL(li_idficha)

SELECT IDFICHA
INTO :li_idficha
FROM 
VTATABFICHA
WHERE
CODCLI = :lst_par.parstring1;

IF NOT ISNULL(li_idficha) THEN
	messagebox("Aviso","Usuario ya tiene ficha ~n Nro de Ficha :" + string(li_idficha))
	lst_par.parstring1 = ""
	lst_par.parstring2 = ""
	lst_par.parstring3 = ""
	return	
END IF	


setnull ( ls_codigo )
lst_par.parstring3 = ls_codigo
closewithreturn(this,lst_par)






end event

type cb_buscar from w_lov_cliente`cb_buscar within w_lov_fichaclientes
integer taborder = 30
end type

event cb_buscar::clicked;is_codcliente = trim(sle_codcliente.text)
is_descliente = trim(sle_buscar.text)

if len(is_codcliente) = 0 then SetNull(is_codcliente)
if len(is_descliente) = 0 then SetNull(is_descliente)

IF isnull(is_codcliente) and isnull(is_descliente) THEN
	if messagebox('Confirme','Desea listar todos los clientes',question!,yesno!,2) = 2 then 
			sle_buscar.setfocus()
			return
	end if		
END IF

if not isnull(is_codcliente) then
	is_codcliente = '%' + is_codcliente + '%' 
end if 

if not isnull(is_descliente) then
	is_descliente = '%' + is_descliente + '%' 
end if 

parent.post event ue_cargar()
sle_buscar.setfocus()
sle_buscar.SelectText(1, Len(sle_buscar.Text))	
	
	




end event

type sle_buscar from w_lov_cliente`sle_buscar within w_lov_fichaclientes
integer taborder = 20
end type

type cb_4 from w_lov_cliente`cb_4 within w_lov_fichaclientes
integer x = 2130
integer y = 8
integer taborder = 0
end type

type cb_3 from w_lov_cliente`cb_3 within w_lov_fichaclientes
integer x = 1902
integer y = 8
integer taborder = 0
end type

type cb_2 from w_lov_cliente`cb_2 within w_lov_fichaclientes
boolean visible = false
integer x = 2373
integer y = 0
integer width = 265
integer taborder = 0
end type

type cb_1 from w_lov_cliente`cb_1 within w_lov_fichaclientes
boolean visible = false
integer x = 1746
integer y = 0
integer taborder = 0
end type

type dw_maestro from w_lov_cliente`dw_maestro within w_lov_fichaclientes
integer x = 18
integer y = 272
integer width = 3319
integer taborder = 50
string dataobject = "d_lov_clientes_buscar"
end type

event dw_maestro::ue_retrieve;this.settransobject(sqlca)
this.retrieve(is_codcliente,is_descliente)
return 1 
end event

type cb_5 from w_lov_cliente`cb_5 within w_lov_fichaclientes
boolean visible = false
integer x = 1618
integer y = 28
integer taborder = 0
end type

type dw_int from w_lov_cliente`dw_int within w_lov_fichaclientes
integer x = 14
integer y = 272
integer taborder = 40
string dataobject = ""
end type

type st_1 from w_lov_cliente`st_1 within w_lov_fichaclientes
end type

type st_2 from statictext within w_lov_fichaclientes
integer x = 41
integer y = 60
integer width = 238
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo"
boolean focusrectangle = false
end type

type sle_codcliente from singlelineedit within w_lov_fichaclientes
integer x = 315
integer y = 40
integer width = 384
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

