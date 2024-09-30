HA$PBExportHeader$w_mnt_fichacliente.srw
$PBExportComments$Ventana Mantenimiento Maestro Detalle STD
forward
global type w_mnt_fichacliente from w_md_std
end type
type tp2 from userobject within td
end type
type dw2 from uo_dw_std within tp2
end type
type tp2 from userobject within td
dw2 dw2
end type
type tp3 from userobject within td
end type
type dw3 from uo_dw_std within tp3
end type
type tp3 from userobject within td
dw3 dw3
end type
type tp4 from userobject within td
end type
type dw4 from uo_dw_std within tp4
end type
type tp4 from userobject within td
dw4 dw4
end type
type tp5 from userobject within td
end type
type dw5 from uo_dw_std within tp5
end type
type tp5 from userobject within td
dw5 dw5
end type
type tp6 from userobject within td
end type
type dw6 from uo_dw_std within tp6
end type
type tp6 from userobject within td
dw6 dw6
end type
type tp7 from userobject within td
end type
type dw7 from uo_dw_std within tp7
end type
type tp7 from userobject within td
dw7 dw7
end type
type tp8 from userobject within td
end type
type dw8 from uo_dw_std within tp8
end type
type tp8 from userobject within td
dw8 dw8
end type
type tp9 from userobject within td
end type
type dw9 from uo_dw_std within tp9
end type
type tp9 from userobject within td
dw9 dw9
end type
end forward

global type w_mnt_fichacliente from w_md_std
integer width = 3438
integer height = 2360
string title = "Ficha de Clientes"
boolean querymode = false
end type
global w_mnt_fichacliente w_mnt_fichacliente

type variables
long il_idficha = 0
string is_codcli = ""
string is_nomcli = ""
end variables

on w_mnt_fichacliente.create
int iCurrent
call super::create
end on

on w_mnt_fichacliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;dw_maestro.uf_set_hijo(td.tp2.dw2)
dw_maestro.uf_set_hijo(td.tp3.dw3)
dw_maestro.uf_set_hijo(td.tp4.dw4)
dw_maestro.uf_set_hijo(td.tp5.dw5)
dw_maestro.uf_set_hijo(td.tp6.dw6)
dw_maestro.uf_set_hijo(td.tp7.dw7)
dw_maestro.uf_set_hijo(td.tp8.dw8)   
dw_maestro.uf_set_hijo(td.tp9.dw9)   



end event

event resize;call super::resize;td.tp2.dw2.height = td.tp1.dw1.height
td.tp3.dw3.height = td.tp1.dw1.height
td.tp4.dw4.height = td.tp1.dw1.height
td.tp5.dw5.height = td.tp1.dw1.height
td.tp6.dw6.height = td.tp1.dw1.height
td.tp7.dw7.height = td.tp1.dw1.height
td.tp8.dw8.height = td.tp1.dw1.height
td.tp9.dw9.height = td.tp1.dw1.height

td.tp2.dw2.width = td.tp1.dw1.width
td.tp3.dw3.width = td.tp1.dw1.width
td.tp4.dw4.width = td.tp1.dw1.width
td.tp5.dw5.width = td.tp1.dw1.width
td.tp6.dw6.width = td.tp1.dw1.width
td.tp7.dw7.width = td.tp1.dw1.width
td.tp8.dw8.width = td.tp1.dw1.width  
td.tp9.dw9.width   = td.tp1.dw1.width  
end event

event ue_postopen;dw_maestro.setfocus()
m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)
dw_maestro.trigger event ue_ini_dw()
is_codcli = ist_par.parstring1
il_idficha = ist_par.parlong1


if ii_tipo = 1 then
	dw_maestro.trigger event ue_insertar()
	this.post event ue_permisos()
	this.post event ue_permisos_menu()
	if gsPais = 'PER' then
		dw_maestro.setitem(1,"codcli",ist_par.parstring1)
		dw_maestro.SetItem(1,'nomcli',ist_par.parstring2)
	end if
else
	this.post event ue_cargar()
//	this.post event ue_permisos()
//	this.post event ue_permisos_menu()
	CHOOSE CASE ii_tipo
		CASE 2
		CASE 3
			dw_maestro.enabled=false
			td.tp1.dw1.enabled=false
			td.tp2.dw2.enabled=false
			td.tp3.dw3.enabled=false
			td.tp4.dw4.enabled=false
			td.tp5.dw5.enabled=false
			td.tp6.dw6.enabled=false
			td.tp7.dw7.enabled=false
			td.tp8.dw8.enabled=false
			td.tp9.dw9.enabled=false			
	END CHOOSE
end if   
end event

event ue_menu_imprimir;window w_ventana
// se llama al procedimiento respectivo
string ls_codcli
long ll_numfic
integer lifila
st_par str_parm

SetNull(ls_codcli)
SetNull(ll_numfic)

// se verifica la fila en que se esta actualmente

lifila = dw_maestro.GetRow()

if lifila = 0 or lifila = -1 then
	messagebox("Informacion", "No existen datos a mostrar")
	return // ocurrio un error	 
end if	

ls_codcli	=	dw_maestro.getitemstring(dw_maestro.getrow(),'codcli')
ll_numfic		=	dw_maestro.getitemnumber(dw_maestro.getrow(),'idficha')
		
if isnull(ls_codcli) or isnull(ll_numfic)  then 
	messagebox("Informacion", "No existen datos a mostrar")
	return  
end if	
		
str_parm.parstring1  = ls_codcli
str_parm.parlong1 = ll_numfic

OpenSheetWithparm (w_ventana, str_parm, "w_imprimir_ficha_cliente", Parentwindow(), 1, Original!)
//openwithparm(w_imprimir_ficha_cliente,str_parm)










end event

event ue_menu_grabar;string ls_codcli, ls_codect, ls_idestneg
setnull(ls_codcli)
setnull(ls_codect)
setnull(ls_idestneg)

ls_codcli	=	dw_maestro.getitemstring(dw_maestro.getrow(),'codcli')
// se guarda nombre por contacto empleado
// is_nomcli
ls_codect =   dw_maestro.getitemstring(dw_maestro.getrow(),'codect')
ls_idestneg = dw_maestro.getitemstring(dw_maestro.getrow(),'idestneg')

if isnull(ls_codcli) or isnull(ls_codect) or  isnull(ls_idestneg) then 
	messagebox("Informacion", "Cod de cliente o estado de negocio no especificados")
	return  
end if	

CALL SUPER::ue_menu_grabar
// se recupera la informacion de los hijos
td.tp1.dw1.retrieve(il_idficha, '01')
td.tp2.dw2.retrieve(il_idficha, '02')
td.tp3.dw3.retrieve(il_idficha, '03')
td.tp4.dw4.retrieve(il_idficha, '04')
td.tp5.dw5.retrieve(il_idficha, '05')
td.tp6.dw6.retrieve(il_idficha, '06')
td.tp7.dw7.retrieve(is_codcli)
td.tp8.dw8.retrieve(is_codcli)
td.tp9.dw9.retrieve(is_codcli)



end event

event ue_menu_nuevo;call super::ue_menu_nuevo;il_idficha = 0
is_codcli = ""
is_nomcli = ""

// se blanquea a los datawindows
td.tp1.dw1.triggerevent("ue_ini_dw")
td.tp2.dw2.triggerevent("ue_ini_dw")
td.tp3.dw3.triggerevent("ue_ini_dw")
td.tp4.dw4.triggerevent("ue_ini_dw")
td.tp5.dw5.triggerevent("ue_ini_dw")
td.tp6.dw6.triggerevent("ue_ini_dw")
td.tp7.dw7.triggerevent("ue_ini_dw")
td.tp8.dw8.triggerevent("ue_ini_dw")
td.tp9.dw9.triggerevent("ue_ini_dw")
end event

type dw_maestro from w_md_std`dw_maestro within w_mnt_fichacliente
integer x = 46
integer width = 2971
integer height = 828
integer taborder = 10
string dataobject = "d_mnt_ficha"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
boolean borrar = false
boolean seleccionar = false
end type

event dw_maestro::ue_retrieve;retrieve(il_idficha)
return 0




end event

event dw_maestro::ue_update_post;call super::ue_update_post;long ll_valor   
string ls_key    
if getrow() < 1 then return false
if IsNull(object.idficha[getrow()]) /*or object.idficha[getrow()] = ''*/ then
	SELECT MAX((idficha))	
  	INTO :ll_valor
  	FROM vtatabficha;
	if SQLCA.SQLCode < 0 then
		MessageBox(title, error_guardar)
		return false
	end if 
	il_idficha = ll_valor
	object.idficha[1] = il_idficha
	AcceptText()
end if

// se hace el retrieve de la cabecera
triggerevent('ue_retrieve')

// td.tp7.dw7.retrieve(is_codcli)
// td.tp8.dw8.retrieve(is_codcli)

return true
end event

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;string ls_codect
st_par lst_par_in

choose case as_columna
	case 'codcli'
		openwithparm(w_lov_fichaclientes, lst_par_in)
		lst_par_in = message.powerobjectparm
		if isvalid(lst_par_in) then
			// se inserta el codigo del cliente
			IF LEN(TRIM(lst_par_in.parstring1)) <> 0 THEN			
				is_codcli = lst_par_in.parstring1
				is_nomcli = lst_par_in.parstring2
				this.setitem(al_row,'codcli',lst_par_in.parstring1)
				this.setitem(al_row,'nomcli',lst_par_in.parstring2)
				select codect into :ls_codect from vtatabcli where codcli = :lst_par_in.parstring1;
				this.setitem(al_row,'codect', ls_codect)
			END IF		
		END IF
end choose
return 0
end event

type td from w_md_std`td within w_mnt_fichacliente
integer x = 46
integer y = 816
integer width = 2971
integer height = 1168
integer taborder = 20
boolean multiline = true
boolean raggedright = false
tp2 tp2
tp3 tp3
tp4 tp4
tp5 tp5
tp6 tp6
tp7 tp7
tp8 tp8
tp9 tp9
end type

on td.create
this.tp2=create tp2
this.tp3=create tp3
this.tp4=create tp4
this.tp5=create tp5
this.tp6=create tp6
this.tp7=create tp7
this.tp8=create tp8
this.tp9=create tp9
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tp2
this.Control[iCurrent+2]=this.tp3
this.Control[iCurrent+3]=this.tp4
this.Control[iCurrent+4]=this.tp5
this.Control[iCurrent+5]=this.tp6
this.Control[iCurrent+6]=this.tp7
this.Control[iCurrent+7]=this.tp8
this.Control[iCurrent+8]=this.tp9
end on

on td.destroy
call super::destroy
destroy(this.tp2)
destroy(this.tp3)
destroy(this.tp4)
destroy(this.tp5)
destroy(this.tp6)
destroy(this.tp7)
destroy(this.tp8)
destroy(this.tp9)
end on

type tp1 from w_md_std`tp1 within td
integer y = 304
integer width = 2935
integer height = 848
string text = "Princ. Productos"
string picturename = "EditObject!"
end type

type dw1 from w_md_std`dw1 within tp1
integer x = 5
integer y = 0
integer width = 2903
integer height = 940
string dataobject = "d_mnt_detalleficha_productos"
boolean hsplitscroll = false
boolean seleccionar = false
end type

event dw1::ue_retrieve;dw1.triggerevent("ue_ini_dw")
return retrieve(il_idficha, '01')    
end event

event type boolean dw1::ue_update_pre_row(long row);object.idficha[row] = il_idficha  
return true
end event

event dw1::ue_update_post;triggerevent('ue_retrieve')
return true
end event

event dw1::rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

type tp2 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Princ. Diferenciaci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditObject!"
long picturemaskcolor = 536870912
dw2 dw2
end type

on tp2.create
this.dw2=create dw2
this.Control[]={this.dw2}
end on

on tp2.destroy
destroy(this.dw2)
end on

type dw2 from uo_dw_std within tp2
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 10
string dataobject = "d_mnt_detalleficha_diferenciacion"
boolean seleccionar = false
boolean auto_ordenar = false
end type

event ue_retrieve;dw2.triggerevent("ue_ini_dw")
return retrieve(il_idficha, '02')
end event

event type boolean ue_update_pre_row(long row);call super::ue_update_pre_row;object.idficha[row] = il_idficha
return true     
end event

event ue_update_post;triggerevent('ue_retrieve')
return true
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

type tp3 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Competidores"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditObject!"
long picturemaskcolor = 536870912
dw3 dw3
end type

on tp3.create
this.dw3=create dw3
this.Control[]={this.dw3}
end on

on tp3.destroy
destroy(this.dw3)
end on

type dw3 from uo_dw_std within tp3
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 10
string dataobject = "d_mnt_detalleficha_competidores"
boolean hsplitscroll = false
boolean seleccionar = false
end type

event ue_retrieve;dw3.triggerevent("ue_ini_dw")
return retrieve(il_idficha, '03')
end event

event type boolean ue_update_pre_row(long row);call super::ue_update_pre_row;object.idficha[row] = il_idficha
return true
end event

event type boolean ue_update_post();call super::ue_update_post;triggerevent('ue_retrieve')
return true
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

type tp4 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Objetivos / Retos"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditObject!"
long picturemaskcolor = 536870912
dw4 dw4
end type

on tp4.create
this.dw4=create dw4
this.Control[]={this.dw4}
end on

on tp4.destroy
destroy(this.dw4)
end on

type dw4 from uo_dw_std within tp4
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 10
string dataobject = "d_mnt_detalleficha_objetivos"
boolean seleccionar = false
end type

event ue_retrieve;dw4.triggerevent("ue_ini_dw")
return retrieve(il_idficha, '04') 



end event

event type boolean ue_update_pre_row(long row);call super::ue_update_pre_row;object.idficha[row] = il_idficha
return true
end event

event type boolean ue_update_post();call super::ue_update_post;triggerevent('ue_retrieve')
return true
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown


	

end event

type tp5 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Planes / Proyectos"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditObject!"
long picturemaskcolor = 536870912
dw5 dw5
end type

on tp5.create
this.dw5=create dw5
this.Control[]={this.dw5}
end on

on tp5.destroy
destroy(this.dw5)
end on

type dw5 from uo_dw_std within tp5
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 10
string dataobject = "d_mnt_detalleficha_planes"
boolean seleccionar = false
end type

event ue_retrieve;dw5.triggerevent("ue_ini_dw")
return retrieve(il_idficha, '05')   
end event

event type boolean ue_update_pre_row(long row);call super::ue_update_pre_row;
object.idficha[row] = il_idficha
return true
end event

event type boolean ue_update_post();call super::ue_update_post;triggerevent('ue_retrieve')
return true
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

type tp6 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Necesidad de Negocio"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "EditObject!"
long picturemaskcolor = 536870912
dw6 dw6
end type

on tp6.create
this.dw6=create dw6
this.Control[]={this.dw6}
end on

on tp6.destroy
destroy(this.dw6)
end on

type dw6 from uo_dw_std within tp6
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 10
string dataobject = "d_mnt_detalleficha_necesidades"
boolean seleccionar = false
end type

event ue_retrieve;return retrieve(il_idficha, '06')           
end event

event type boolean ue_update_pre_row(long row);call super::ue_update_pre_row;object.idficha[row] = il_idficha
return true
end event

event type boolean ue_update_post();call super::ue_update_post;triggerevent('ue_retrieve')
return true
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

type tp7 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Gastos en Telecomunicaciones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "FormatDollar!"
long picturemaskcolor = 536870912
dw7 dw7
end type

on tp7.create
this.dw7=create dw7
this.Control[]={this.dw7}
end on

on tp7.destroy
destroy(this.dw7)
end on

type dw7 from uo_dw_std within tp7
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 40
string dataobject = "d_gen_proveedor_servicio"
end type

event ue_update_post;call super::ue_update_post;dw7.triggerevent("ue_ini_dw")
triggerevent('ue_retrieve')
return true
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;this.setitem(al_row,'codcli',is_codcli)
end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

event ue_retrieve;return retrieve(is_codcli)

end event

type tp8 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Ingresos, Empleados y PC~'s"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom073!"
long picturemaskcolor = 536870912
dw8 dw8
end type

on tp8.create
this.dw8=create dw8
this.Control[]={this.dw8}
end on

on tp8.destroy
destroy(this.dw8)
end on

type dw8 from uo_dw_std within tp8
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_gr_cliente_ingreso_anual"
end type

event ue_update_post;call super::ue_update_post;triggerevent('ue_retrieve')
return true


end event

event ue_retrieve;return retrieve(is_codcli)







end event

event rbuttondown;if il_idficha = 0 then 
	return
end if

// se llama al padre
CALL SUPER::rbuttondown
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;int ls_anno
select to_char(sysdate,'yyyy') 
into :ls_anno
from dual; 
this.setitem(al_row,'anno',ls_anno)

if is_codcli<>"" then
	this.setitem(al_row,"codcli",is_codcli)
end if
end event

type tp9 from userobject within td
integer x = 18
integer y = 304
integer width = 2935
integer height = 848
long backcolor = 79741120
string text = "Contactos Empleados"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom076!"
long picturemaskcolor = 536870912
dw9 dw9
end type

on tp9.create
this.dw9=create dw9
this.Control[]={this.dw9}
end on

on tp9.destroy
destroy(this.dw9)
end on

type dw9 from uo_dw_std within tp9
integer x = 5
integer width = 2903
integer height = 940
integer taborder = 20
string dataobject = "dw_gr_contacto_marketing"
end type

event rbuttondown;if il_idficha = 0 then 
	return
end if
//this.insertar = true
// se llama al padre
CALL SUPER::rbuttondown
end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow < 1 Or currentrow > this.RowCount() Then 
	return;
End If
end event

event doubleclicked;call super::doubleclicked;window w_ventana
w_mnt_contacto_cliente iw_mnt_contacto_cliente
string ls_codcnt
int var_tipo
st_par lst_par
if row < 1 then return
ls_codcnt=this.getitemstring(row,'codcnt')

// Modo de Acceso
choose case ii_tipo
	case 2
		var_tipo = ii_tipo
	case else
		var_tipo = 3
end choose 

// Por el momento no se controla las versiones de paises
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = false	
lst_par.borrar = false	
lst_par.insertar = false	
lst_par.suprimir = false
lst_par.titulo = "Mantenimiento de Contactos de Cliente"
lst_par.tipo = var_tipo
lst_par.parstring1 = ls_codcnt
lst_par.parstring2 = is_nomcli
lst_par.dw_detalle = 'dw_medio_comunicacion_contacto'
lst_par.dw_detalle2 = 'dw_contactoxsucursal'
lst_par.dw_maestro = 'dw_contactocliente_per'

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_contacto_cliente", Parentwindow(), 1, Original!)
//openwithparm(iw_mnt_contacto_cliente, lst_par)
end event

event ue_insertar;window w_ventana
st_par lst_par

lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = true	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.parstring1 = ""
lst_par.parstring2 = is_nomcli
lst_par.parstring3 = is_codcli

lst_par.dw_detalle = 'dw_medio_comunicacion_contacto'
lst_par.dw_detalle2 = 'dw_contactoxsucursal'
lst_par.tipo = 1
lst_par.titulo = 'Nuevo Contacto'
lst_par.dw_maestro = 'dw_contactocliente_per'

OpenSheetWithparm (w_ventana, lst_par, "w_mnt_contacto_cliente", Parentwindow(), 1, Original!)
//openwithparm(w_mnt_contacto_cliente, lst_par)
end event

event ue_retrieve;return retrieve(is_codcli)
end event

